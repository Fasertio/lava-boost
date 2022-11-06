#!/bin/bash
# Query insertion script.
#
# Takes one argument, the project name
# That json file must contain all of the following
#
# name         name for project, usually the name of the software (binutils-2.25, openssh-2.1, etc)
# directory    directory in which src-2-src query injection will occur -- should be somewhere on the nas
# tarfile      path to software tar file
# configure    how to configure the software (./configure plus arguments) (will just use /bin/true if not present)
# make         how to make the software (make might have args or might have FOO=bar required precursors)
# install      how to install the software (note that configure will be run with --prefix ...lava-install)
#
# script proceeds to untar the software, run btrace on it to extract a compile_commands.json file,
# which contains all information needed to compile every file in the project.
# then, the script runs lavaTool using that compile_commands.json file, on every source file,
# adding extra source code to perform taint queries.  At the time of this writing, the taint
# queries were for every argument of every fn call, injected both before and after the call.
# Also, the return value of the fn is queried.  Oh, and lavaTool also injects "queries" that
# indicate when a potential attack point has been encountered.  At the time of this writing,
# that includes calls to memcpy and malloc.
#
# After lavaTool has transformed this source, it exits.  You should now try to make the project
# and deal with any complaints (often src-to-src breaks the code a little). Once you have a working
# version of the compiled exec with queries you will need to log on to a 64-bit machine
# and run the bug_mining.py script (which uses PANDA to trace taint).
#

# Load lava-functions and vars
. `dirname $0`/funcs.sh

tick
version="2.0.0"
HO = "ho"

USAGE() {
    echo "$1 version $version"
    echo "Usage: $1 [ATP_Type] JSONfile"
}

set -e # Exit on error
#set -x # Debug mode

if [ $# -lt 1 ]; then
    USAGE $0
elif [ $# -lt 2 ]; then
  echo "No ATP_Type specified.  Defaulting to all."
  ATP_TYPE=""
  json="$(readlink -f $1)"
elif [ $# -eq 2 ]; then
  ATP_TYPE="-$1"
  json="$(readlink -f $2)"
else
    USAGE $0
  exit 1
fi

lava="$(dirname $(dirname $(readlink -f $0)))"
project_name="$1"
. `dirname $0`/vars.sh

progress "queries" 0  "Entering $directory/$name."
mkdir -p "$directory/$name"
cd "$directory/$name"

progress "queries" 0  "Untarring $tarfile..."
source=$(tar tf "$tarfile" | head -n 1 | cut -d / -f 1)

if [ -e "$source" ]; then
  progress "queries" 0  "Deleting $directory/$name/$source..."
  rm -rf "$directory/$name/$source"
fi
tar xf "$tarfile"

progress "queries" 0  "Entering $source."
cd "$source"

progress "queries" 0  "Creating git repo."
rm -rf .git || true #Remove any existing git repo
git init
git config user.name LAVA
git config user.email "nobody@nowhere"
git add -A .
git commit -m 'Unmodified source.'

progress "queries" 0  "Configuring..."
mkdir -p lava-install
#modificato aggiungendo il CC= (probabilmente è per il -e)
if [ "$HO" = "ho" ]; then
    if [ -e "$configure_cmd" ]; then
        CC=/llvm-3.6.2/Release/bin/clang CXX=/llvm-3.6.2/Release/bin/clang++ CFLAGS="-O0 -m32 -DHAVE_CONFIG_H -g -gdwarf-2 -I. -I.. -I../include -I./src/" $configure_cmd --prefix=$(pwd)/lava-install
    fi
    progress "queries" 0 "Preprocessing Source code..."
    cat ${lava}/makefile.fixup >> Makefile && \
    make lava_preprocess
else
    $configure_cmd --prefix=$(pwd)/lava-install
fi

progress "queries" 0  "Making with btrace..."
# Delete any pre-existing btrace.log (could be in archive by mistake)
rm -f btrace.log
ORIGIN_IFS=$IFS
IFS='&&'
read -ra MAKES <<< $makecmd
for i in ${MAKES[@]}; do
    IFS=' '
    read -ra ARGS <<< $i
    if [ "$HO" = "ho"]; then
        echo "$lava/tools_ho/btrace/sw-btrace ${ARGS[@]}"
        $lava/tools_ho/btrace/sw-btrace ${ARGS[@]}
        IFS='&&'
    else
        echo "$lava/tools/btrace/sw-btrace ${ARGS[@]}"
        $lava/tools/btrace/sw-btrace ${ARGS[@]}
        IFS='&&'
    fi    
done
IFS=$ORIGIN_IFS


progress "queries" 0  "Installing..."
bash -c $install


# figure out where llvm is
if ["$HO" = "ho"]; then
    llvm_src=$(grep LLVM_SRC_PATH $lava/tools_ho/lavaTool/config.mak | cut -d' ' -f3)
else
    llvm_src=$(grep LLVM_SRC_PATH $lava/tools/lavaTool/config.mak | cut -d' ' -f3)
fi

progress "queries" 0  "Creating compile_commands.json..."
# Delete any pre-existing compile commands.json (could be in archive by mistake)
rm -f compile_commands.json

if ["$HO" = "ho"]; then
    $lava/tools_ho/btrace/sw-btrace-to-compiledb $llvm_src/Release/lib/clang/3.6.2/include
else
    $lava/tools/btrace/sw-btrace-to-compiledb $llvm_src/Release/lib/clang/3.6.2/include
fi

if [ -e "$directory/$name/extra_compile_commands.json" ]; then
    sed -i '$d' compile_commands.json
    echo "," >> compile_commands.json
    tail -n +$((2)) "$directory/$name/extra_compile_commands.json" >> compile_commands.json
fi
git add compile_commands.json
git commit -m 'Add compile_commands.json.'

cd ..

if ["$HO" = "ho"]; then
    c_files=$(python3 $lava/tools_ho/lavaTool/get_c_files.py $source)
else
    c_files=$(python3 $lava/tools/lavaTool/get_c_files.py $source)
fi
c_dirs=$(for i in $c_files; do dirname $i; done | sort | uniq)

progress "queries" 0  "Copying include files..."
for i in $c_dirs; do
  echo "   $i"
  if [ -d $i ]; then
    if ["$HO" = "ho"]; then
        cp $lava/tools_ho/include/*.h $i/
    else
        cp $lava/tools/include/*.h $i/
    fi
  
  fi
done


# Run another clang tool that provides information about functions,
# i.e., which have only prototypes, which have bodies.  
progress "queries" 0 "Figure out functions" 

if [ "$HO" = "ho" ]; then
    for this_c_file in $c_files; do
        $lava/tools_ho/install/bin/lavaFnTool $this_c_file
    done
else
    for this_c_file in $c_files; do
        $lava/tools/install/bin/lavaFnTool $this_c_file
    done
fi

#progress "queries" 0  "Initialize variables..."
#for i in $c_files; do
#    $lava/src_clang/build/lavaTool -action=init \
#    -p="$source/compile_commands.json" \
#    -src-prefix=$(readlink -f "$source") \
#    $i
#done

# TODO: This should probably be just for dataflow
# but we still need it for non-dataflow targets, otherwise we inject into
# va_args functions and everything breask

# Analyze that output and figure out
fnfiles=$(echo $c_files | sed 's/\.c/\.c\.fn/g')
fninstr=$directory/$name/fninstr

echo "Creating fninstr [$fninstr]"
echo -e "\twith command: \"python3 $lava/scripts/fninstr.py -d -o $fninstr $fnfiles\""
python3 $lava/scripts/fninstr.py -d -o $fninstr $fnfiles

if [[ ! -z "$df_fn_blacklist" ]]; then
    cmd=$(echo "sed -i /${df_fn_blacklist}/d $fninstr")
    echo "Removing blacklisted functions with regex: $df_fn_blacklist"
    $cmd
fi

if [ "$dataflow" = "true" ]; then
    # Insert queries with DF - could merge this with the else if logic below instead of duplicating
    # TODO: Just make lavaTool load dataflow from project.json instead of passing as CLI arg.
    # Since it's okay to pass the whitelist either way
    progress "queries" 0  "Inserting queries for dataflow"
    if [ "$HO" = "ho" ]; then
        for i in $c_files; do
            $lava/tools_ho/install/bin/lavaTool -action=query \
            -lava-db="$directory/$name/lavadb" \
            -p="$directory/$name/$source/compile_commands.json" \
            -arg_dataflow \
            -lava-wl="$fninstr" \
            -src-prefix=$(readlink -f "$source") \
            $ATP_TYPE \
            -db="$db" \
            $i
        done
    else
        for i in $c_files; do
            $lava/tools/install/bin/lavaTool -action=query \
            -lava-db="$directory/$name/lavadb" \
            -p="$directory/$name/$source/compile_commands.json" \
            -arg_dataflow \
            -lava-wl="$fninstr" \
            -src-prefix=$(readlink -f "$source") \
            $ATP_TYPE \
            -db="$db" \
            $i
        done
    fi
else
    progress "queries" 0  "Inserting queries..."
    # TODO: remove lava-wl here, unless we're using it to limit where we inject
    
    if ["$HO" = "ho" ]; then
        for i in $c_files; do
            $lava/tools_ho/install/bin/lavaTool -action=query \
            -lava-db="$directory/$name/lavadb" \
            -lava-wl="$fninstr" \
            -p="$source/compile_commands.json" \
            -src-prefix=$(readlink -f "$source") \
            $ATP_TYPE \
            -db="$db" \
            $i
        done
    else
        for i in $c_files; do
            $lava/tools/install/bin/lavaTool -action=query \
            -lava-db="$directory/$name/lavadb" \
            -lava-wl="$fninstr" \
            -p="$source/compile_commands.json" \
            -src-prefix=$(readlink -f "$source") \
            $ATP_TYPE \
            -db="$db" \
            $i
        done
    fi

fi

# Do we need to explicitly apply replacements in the root source directory
# This causes clang-apply-replacements to segfault when run a 2nd time
#pushd "$directory/$name/$source"
#$llvm_src/Release/bin/clang-apply-replacements .
#popd

for i in $c_dirs; do
    echo "Applying replacements to $i"
    pushd $i
    $llvm_src/Release/bin/clang-apply-replacements .
    popd
done

# Ensure every c file was modified
# Alternatively, we could just check that at least one file was modified
for this_c_file in $c_files; do
    if ! grep -q "pirate_mark_lava.h" $this_c_file; then
        echo "FATAL ERROR: LAVA queries missing from source files!"
        exit 1
    fi
done

progress "queries" 0  "Done inserting queries. Time to make and run actuate.py on a 64-BIT machine!"

tock
echo "add queries complete $time_diff seconds"

