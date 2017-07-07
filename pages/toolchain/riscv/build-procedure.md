---
layout: page
title: How to build the RISC-V Embedded GCC binaries?
permalink: /toolchain/riscv/build-procedure/

date: 2017-07-06 20:55:00 +0300

---

The latest version of the build script is a single run, multi-platform build, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages at once.

The script was developed on macOS, but it should also run on any recent GNU/Linux distribution (just that in this case it cannot generate the macOS package).

## Prerequisites

The prerequisites are common to all binary builds. Please follow the instructions in the separate [Prerequisites for building binaries]({{ site.baseurl }}/developer/build-binaries-prerequisites) page and return when ready.

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build) Git repo, including submodules. 

```
$ rm -rf ~/Downloads/riscv-none-gcc-build.git
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build.git \
  ~/Downloads/riscv-none-gcc-build.git
```

## Check the script

The script creates a temporary build `Work/riscv-none-gcc` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER_PATH` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```bash
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh preload-images
```

The result should look similar to:

```bash
$ docker images
REPOSITORY          TAG                   IMAGE ID            CREATED             SIZE
ilegeul/debian      9-gnu-mcu-eclipse     ff8a853cf6cb        4 days ago          3.2GB
ilegeul/debian32    9-gnu-mcu-eclipse     a22ccdf38f1f        4 days ago          3.2GB
ilegeul/debian32    9                     7348339e67f5        4 days ago          116MB
debian              9                     a2ff708b7413        2 weeks ago         100MB
hello-world         latest                1815c82652c0        3 weeks ago         1.84kB
```

## Rebuild the Docker images

If the download speed is limited, probably it is faster to rebuild the images locally. For this see the `build-images` command:

```bash
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh build-images
```

## Build all distribution files

```
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh --all
```

On macOS, to prevent entering sleep, use:

```
$ caffeinate bash
$ exec bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh --all
```

Many, many hours later, the output of the build script is a set of 8 files and their SHA signatures in the `deploy` folder:

```
$ ls -l deploy
total 784400
-rw-r--r--  1 ilg  staff  75678450 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.pkg
-rw-r--r--  1 ilg  staff       127 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.pkg.sha
-rw-r--r--  1 ilg  staff  75726500 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.tgz
-rw-r--r--  1 ilg  staff       127 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.tgz.sha
-rw-r--r--  1 ilg  staff  52436506 Jul  5 21:39 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-debian64.tgz
-rw-r--r--  1 ilg  staff       132 Jul  5 21:39 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-debian64.tgz.sha
-rw-r--r--  1 ilg  staff  27642907 Jul  6 01:25 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64-setup.exe
-rw-r--r--  1 ilg  staff       135 Jul  6 01:25 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64-setup.exe.sha
-rw-r--r--  1 ilg  staff  53128553 Jul  6 01:23 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64.zip
-rw-r--r--  1 ilg  staff       129 Jul  6 01:23 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64.zip.sha
-rw-r--r--  1 ilg  staff  51726488 Jul  7 04:52 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-debian32.tgz
-rw-r--r--  1 ilg  staff       132 Jul  7 04:52 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-debian32.tgz.sha
-rw-r--r--  1 ilg  staff  21844885 Jul  7 06:46 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32-setup.exe
-rw-r--r--  1 ilg  staff       135 Jul  7 06:46 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32-setup.exe.sha
-rw-r--r--  1 ilg  staff  43378400 Jul  7 06:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32.zip
-rw-r--r--  1 ilg  staff       129 Jul  7 06:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32.zip.sha
```

## Subsequent runs

### Separate platform specific builds

Instead of `--all`, you can use any combination of:

```
--win32 --win64 --debian32 --debian64 --osx
```

Please note that, due to the specifics of the GCC build process, the Windows build requires the corresponding Debian build, so `--win32` alone is equivalent to `--debian32 --win32` and `--win64` alone is equivalent to `--debian64 --win64`.

### clean

To remove most build files, use:

```bash
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```bash
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh cleanall
```

## Install hierarchy

The procedure to install GNU MCU Eclipse RISC-V Embedded GCC is platform specific, but relatively straight forward (a .zip archive or setup on Windows, a .tgz archive or install on macOS, a .tgz archive on GNU/Linux). The setup/install asks no special questions, and the defaults are generally ok for most installations.

After install, this package should create structure like this (only the first two depth levels are shown):

```
$ tree -L 2 /Users/ilg/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/
/Users/ilg/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/
├── README.md
├── bin
│   ├── riscv64-unknown-elf-addr2line
│   ├── riscv64-unknown-elf-ar
│   ├── riscv64-unknown-elf-as
│   ├── riscv64-unknown-elf-c++
│   ├── riscv64-unknown-elf-c++filt
│   ├── riscv64-unknown-elf-cpp
│   ├── riscv64-unknown-elf-elfedit
│   ├── riscv64-unknown-elf-g++
│   ├── riscv64-unknown-elf-gcc
│   ├── riscv64-unknown-elf-gcc-7.1.1
│   ├── riscv64-unknown-elf-gcc-ar
│   ├── riscv64-unknown-elf-gcc-nm
│   ├── riscv64-unknown-elf-gcc-ranlib
│   ├── riscv64-unknown-elf-gcov
│   ├── riscv64-unknown-elf-gcov-dump
│   ├── riscv64-unknown-elf-gcov-tool
│   ├── riscv64-unknown-elf-gdb
│   ├── riscv64-unknown-elf-gprof
│   ├── riscv64-unknown-elf-ld
│   ├── riscv64-unknown-elf-ld.bfd
│   ├── riscv64-unknown-elf-nm
│   ├── riscv64-unknown-elf-objcopy
│   ├── riscv64-unknown-elf-objdump
│   ├── riscv64-unknown-elf-ranlib
│   ├── riscv64-unknown-elf-readelf
│   ├── riscv64-unknown-elf-run
│   ├── riscv64-unknown-elf-size
│   ├── riscv64-unknown-elf-strings
│   └── riscv64-unknown-elf-strip
├── gnu-mcu-eclipse
│   ├── BUILD.md
│   ├── CHANGES.txt
│   ├── binutils-configure-output.txt
│   ├── build-helper.sh
│   ├── build.sh
│   ├── gcc-configure-output.txt
│   └── newlib-configure-output.txt
├── include
│   └── gdb
├── lib
│   ├── gcc
│   ├── libcc1.0.so
│   ├── libcc1.la
│   ├── libcc1.so
│   └── libriscv64-unknown-elf-sim.a
├── libexec
│   └── gcc
├── licenses
│   ├── binutils-gdb
│   ├── gcc
│   ├── gmp-6.1.0
│   ├── isl-0.16.1
│   ├── mpc-1.0.3
│   ├── mpfr-3.1.4
│   └── newlib
├── riscv64-unknown-elf
│   ├── bin
│   ├── include
│   └── lib
└── share
    ├── doc
    ├── gcc-7.1.1
    └── gdb

24 directories, 41 files
```

No other files are installed in any system folders or other locations.

## Uninstall

To uninstall RISC-V Embedded GCC from a Windows machine, use the `uninstall.exe` program.

On macOS and GNU/Linux, the GNU MCU Eclipse RISC-V Embedded GCC install folder is self-contained and removing it is enough for completely removing the application.

## Test

A simple test is performed by the script at the end, by launching the executable to check if all shared/dynamic libraries are correctly used.

For a true test you need to first install the package and then run the program form the final location. For example on macOS the output should look like:

```
$ ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/bin/riscv64-unknown-elf-gcc --version
riscv64-unknown-elf-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.1.1 20170509
```

## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/blob/master/scripts/build.sh).
