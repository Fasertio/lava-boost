<img src="https://github.com/Fasertio/lava-boost/blob/master/lava_boost.png" width=50% height=50%>

# LAVA Boost: Large Scale Automated Vulnerability Addition with steroids

Upgrade for the LAVA tool, including ARM architecture support, Use After Free and Heap Overflow vulnerabilities. In addition, Python is ported to the version 3 and the Ubuntu machine is ported to 21.04.

## What is LAVA?

Evaluating and improving bug-finding tools is currently difficult due to
a shortage of ground truth corpora (i.e., software that has known bugs
with triggering inputs). LAVA attempts to solve this problem by
automatically injecting bugs into software. Every LAVA bug is
accompanied by an input that triggers it whereas normal inputs are
extremely unlikely to do so. These vulnerabilities are synthetic but, we
argue, still realistic, in the sense that they are embedded deep within
programs and are triggered by real inputs. Our work forms the basis of
an approach for generating large ground-truth vulnerability corpora on
demand, enabling rigorous tool evaluation and providing a high-quality
target for tool developers.

LAVA is the product of a collaboration between MIT Lincoln Laboratory,
NYU, and Northeastern University.

# Quick Start

Clone the repo on a Ubuntu 21.04 machine then run `python3 setup.py`

Next, run `init-host.py` to generate a `host.json`.
This file is used by LAVA to store settings specific
to your machine. You can edit these settings as necessary, but the default
values should work.

Project configurations are located in the `target_configs` directory, where
every configuration is located at `target_configs/projectname/projectname.json`.
Paths specified within these configuration files are relative to values set
in your `host.json` file.

Finally, you can run `./scripts/lava.sh` to actually inject bugs
into a program. Just provide the name of a project that is in the
`target_configs` directory, for example:

```
./scripts/lava.sh toy
```

You should now have a buggy copy of toy!

If you want to inject bugs into a new target, you will likely need to make some
modifications. Check out [How-to-Lava](docs/how-to-lava.md) for guidance.

# Documentation
Check out the [docs](docs/) folder to get started.


# Current Status
## Version 3.0.0

Expected results from test suite:
```
Project       RESET    CLEAN    ADD      MAKE     TAINT    INJECT   COMP
blecho        PASS     PASS     PASS     PASS     PASS     PASS     PASS
libyaml       PASS     PASS     PASS     PASS     PASS     PASS     PASS
file          PASS     PASS     PASS     PASS     PASS     PASS     PASS
toy           PASS     PASS     PASS     PASS     PASS     PASS     PASS
pcre2         PASS     PASS     PASS     PASS     PASS     PASS     PASS
jq            PASS     PASS     PASS     PASS     PASS     PASS     PASS
grep          PASS     PASS     PASS     PASS     PASS     FAIL
libjpeg       PASS     PASS     PASS     PASS     FAIL
tinyexpr      PASS     PASS     PASS     PASS     FAIL
duktape       PASS     PASS     PASS     FAIL
gzip          FAIL
```

# Authors

LAVA is the result of several years of development by many people; a
partial (alphabetical) list of contributors is below:

* Andy Davis
* Brendan Dolan-Gavitt
* Andrew Fasano
* Zhenghao Hu
* Patrick Hulin
* Amy Jiang
* Engin Kirda
* Tim Leek
* Andrea Mambretti
* Wil Robertson
* Aaron Sedlacek
* Rahul Sridhar
* Frederick Ulrich
* Ryan Whelan

The Boost LAVA is created by:

* Daniel Simonini
* Luca Ruggeri
