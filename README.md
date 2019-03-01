# premake_experiments

[![Build Status](https://travis-ci.org/d-led/premake_experiments.svg?branch=master)](https://travis-ci.org/d-led/premake_experiments)

## Experiments

- post-build action sequence
- cross-platform copying of resource files

```txt
$ ./test.sh
origin is /home/travis/build/d-led/premake_experiments
os is: linux
source root is: /home/travis/build/d-led/premake_experiments
Building configurations...
Running action 'gmake'...
Done (17ms).
now in /home/travis/build/d-led/premake_experiments
make: Entering directory '/home/travis/build/d-led/premake_experiments/build/linux/gmake'
Cleaning test
make: Leaving directory '/home/travis/build/d-led/premake_experiments/build/linux/gmake'
make: Entering directory '/home/travis/build/d-led/premake_experiments/build/linux/gmake'
==== Building test (debug) ====
Creating ../../../obj/linux/test/Debug
test.cpp
Creating ../../../bin/linux/test/Debug
Linking test
Copying the resource file to the target dir
cp -rf ../../../res/linux/data.txt ../../../bin/linux/test/Debug
../../../bin/linux/test/Debug/test
starting ../../../bin/linux/test/Debug/test
data: this is linux
```
