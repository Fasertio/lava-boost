FROM i386/debian:stretch
RUN echo deb http://archive.debian.org/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y sudo build-essential wget cmake gdb gawk mlocate \
            vim libc++-dev  g++-multilib g++ ninja-build \
            git jq bc python3  zsh libjsoncpp-dev \
            python3-pip python3-dev libpq-dev python3-numpy
RUN pip3 install colorama
RUN pip3 install argparse
RUN apt-get install -y python

ENV release 3.6.2
ENV llvm_version llvm-${release}

RUN wget http://llvm.org/releases/$release/$llvm_version.src.tar.xz
RUN tar -xJf $llvm_version.src.tar.xz


RUN ls
RUN cp -r $llvm_version.src $llvm_version
RUN rm -r $llvm_version.src
RUN cd $llvm_version

WORKDIR /$llvm_version/tools
ENV clang_version cfe-$release
RUN wget http://llvm.org/releases/$release/$clang_version.src.tar.xz
RUN tar -xJf $clang_version.src.tar.xz
RUN cp -r $clang_version.src clang
RUN rm -r $clang_version.src

WORKDIR /$llvm_version/tools/clang/tools
RUN wget http://llvm.org/releases/$release/clang-tools-extra-$release.src.tar.xz
RUN tar -xJf clang-tools-extra-$release.src.tar.xz
RUN cp -r clang-tools-extra-$release.src extra
RUN rm -r clang-tools-extra-$release.src

WORKDIR /$llvm_version
RUN ./configure --enable-optimized --disable-assertions --enable-targets=x86 --enable-shared --enable-pic --host=i486-linux-gnu --build=i486-linux-gnu
RUN mkdir /$llvm_version/build
RUN mkdir /$llvm_version/Release
WORKDIR /$llvm_version/build
RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/$llvm_version/Release -DLLVM_TARGETS_TO_BUILD=X86 \
              -DBUILD_SHARED_LIBS=true -DLLVM_ENABLE_ASSERTIONS=false -DLLVM_ENABLE_RTTI=true \
              -DLLVM_BUILD_32_BITS=true \
              -DLLVM_ENABLE_PIC=true -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGET_ARCH=i486-linux-gnu \
              -G "Ninja"
RUN ninja install

RUN apt-get install -y sudo clang llvm

WORKDIR /
RUN wget http://codesynthesis.com/download/odb/2.4/odb_2.4.0-1_i386.deb
RUN dpkg -i odb_2.4.0-1_i386.deb
RUN wget http://codesynthesis.com/download/odb/2.4/libodb-2.4.0.tar.gz
RUN tar xf libodb-2.4.0.tar.gz
WORKDIR /libodb-2.4.0
RUN ./configure --enable-shared && make -j $(nproc) && make install
WORKDIR /
RUN wget http://codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.gz
RUN tar xf libodb-pgsql-2.4.0.tar.gz
WORKDIR /libodb-pgsql-2.4.0
RUN ./configure --enable-shared && make -j $(nproc) && make install

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local-lib.conf
RUN ldconfig

# RUN pip3 install --upgrade
RUN pip3 install pyyaml
RUN pip3 install subprocess32 lockfile psycopg2 sqlalchemy pexpect psutil

RUN pip3 install pyyaml
RUN ln -s /usr/lib/libjsoncpp.so.0 /usr/lib/libjsoncpp.so.1
RUN updatedb

RUN echo "LLVM_DIR=/$llvm_version/Release/share/llvm/cmake" >> /etc/environment
RUN echo "LD_LIBRARY_PATH=/$llvm_version/Release/lib" >> /etc/environment
RUN echo "LIBRARY_PATH=/usr/local/lib" >> /etc/environment
RUN echo "PATH=$PATH:/$llvm_version/Release/bin" >> /etc/environment

RUN apt-get install -y sudo gdb gawk zlib1g-dev

# Set locale to C.UTF-8 instead of us_EN.UTF-8
RUN apt-get install -y locales
RUN locale-gen C.UTF-8
RUN locale -a
RUN update-locale LANG=C.UTF-8

# Having autoconf in the container will make building autotools packages easier
RUN apt-get install -y autoconf libtool m4 automake
RUN apt-get install -y lsb-release build-essential libssl-dev python
RUN apt-get install -y gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

