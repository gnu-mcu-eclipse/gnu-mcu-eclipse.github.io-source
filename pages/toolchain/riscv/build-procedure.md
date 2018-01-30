---
layout: page
title: How to build the RISC-V Embedded GCC binaries?
permalink: /toolchain/riscv/build-procedure/

date: 2017-07-06 20:55:00 +0300

---

The latest version of the build script is a single run, multi-platform build, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages at once.

The script was developed on macOS, but it should also run on any recent GNU/Linux distribution (just that in this case it cannot generate the macOS package).

## Prerequisites

The prerequisites are common to all binary builds. Please follow the instructions in the separate [Prerequisites for building binaries]({{ site.baseurl }}/developer/build-binaries-prerequisites/) page and return when ready.

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build) Git repo, including submodules. 

```console
$ rm -rf ~/Downloads/riscv-none-gcc-build.git
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build.git \
  ~/Downloads/riscv-none-gcc-build.git
```

## Check the script

The script creates a temporary build `Work/riscv-none-gcc` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER_PATH` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```console
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh preload-images
```

The result should look similar to:

```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ilegeul/centos32    6-xbb-v1            f695dd6cb46e        2 weeks ago         2.92GB
ilegeul/centos      6-xbb-v1            294dd5ee82f3        2 weeks ago         3.09GB
hello-world         latest              f2a91732366c        2 months ago        1.85kB
bash-3.2$```

## Development

### Update git repos

The GNU MCU Eclipse RISC-V GCC is following closely the official [RISC-V releases](https://github.com/riscv/riscv-gnu-toolchain/releases).

The procedure is to first merge the remote branches to the local branches.

Currently, the following branches are used

* `riscv-gcc-7.2.0`
* `riscv-newlib-2.5.0`
* `riscv-binutils-2.29`

The GNU MCU Eclipse branches have similar names, but suffixed with `-gme`.

After merging the remote branches, merge the result into the `-gme` branch.

### Prepare release

By default, the build script uses tagged commits and downloads the corresponding archives.

While preparing the release it is important to be able to use live Git versions. For this, 

* update the commit ids to the desired ones 
* commit and push
* start the build script and pass `--use-gits`

```console
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh --use-gits
```

When the result is acceptable, commit all repos and tag all with the same tag (like `v7.2.0-1-20171109`):

* the [gnu-mcu-eclipse/riscv-gcc](https://github.com/gnu-mcu-eclipse/riscv-gcc) project
* the [gnu-mcu-eclipse/riscv-binutils-gdb](https://github.com/gnu-mcu-eclipse/riscv-binutils-gdb) project
* the [gnu-mcu-eclipse/riscv-newlib](https://github.com/gnu-mcu-eclipse/riscv-newlib) project

## Update the script 

In the [gnu-mcu-eclipse/riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build), update the `scripts/build.sh` to refer to the latest version number (`RELEASE_VERSION`), but without the initial `v`.

For major releases, Check if the library sources (gmp, mpfr, mpc, isl) did change and possibly update them.

In the riscv-none-gcc-build project, update `RELEASE_VERSION` 

Update `gnu-mcu-eclipse/info` files:

* `CHANGES.txt` (add release)
* `INFO.md` (update references to commits)
* `VERSION`
* commit and push (without push, the inner clone uses an older version)

## Build all distribution files

Before starting a multi-platform build, check if Docker is started.

```console
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh --all
```

On macOS, to prevent entering sleep, use:

```console
$ caffeinate bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh --all
```

Many, many hours later, the output of the build script is a set of 5 files and their SHA signatures in the `deploy` folder:

```console
$ ls -l deploy
total 784400
-rw-r--r--  1 ilg  staff  75726500 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.tgz
-rw-r--r--  1 ilg  staff       127 Jul  5 14:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1143-osx.tgz.sha
-rw-r--r--  1 ilg  staff  52436506 Jul  5 21:39 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-centos64.tgz
-rw-r--r--  1 ilg  staff       132 Jul  5 21:39 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-centos64.tgz.sha
-rw-r--r--  1 ilg  staff  53128553 Jul  6 01:23 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64.zip
-rw-r--r--  1 ilg  staff       129 Jul  6 01:23 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170705-1528-win64.zip.sha
-rw-r--r--  1 ilg  staff  51726488 Jul  7 04:52 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-centos32.tgz
-rw-r--r--  1 ilg  staff       132 Jul  7 04:52 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-centos32.tgz.sha
-rw-r--r--  1 ilg  staff  43378400 Jul  7 06:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32.zip
-rw-r--r--  1 ilg  staff       129 Jul  7 06:44 gnu-mcu-eclipse-riscv-none-gcc-7.1.1-2-20170706-2356-win32.zip.sha
```

## Subsequent runs

### Separate platform specific builds

Instead of `--all`, you can use any combination of:

```
--win32 --win64 --linux32 --linux64 --osx
```

Please note that, due to the specifics of the GCC build process, the Windows build requires the corresponding Debian build, so `--win32` alone is equivalent to `--linux32 --win32` and `--win64` alone is equivalent to `--linux64 --win64`.

### clean

To remove most build files, use:

```console
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```console
$ bash ~/Downloads/riscv-none-gcc-build.git/scripts/build.sh cleanall
```

## Install hierarchy

The procedure to install GNU MCU Eclipse RISC-V Embedded GCC is platform specific, but relatively straight forward (a .zip archive or setup on Windows, a .tgz archive or install on macOS, a .tgz archive on GNU/Linux). The setup/install asks no special questions, and the defaults are generally ok for most installations.

After install, this package should create structure like this (only the first two depth levels are shown):

```console
$ tree -L 2 /Users/ilg/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/
/Users/ilg/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/
├── README.md
├── bin
│   ├── riscv-none-embed-addr2line
│   ├── riscv-none-embed-ar
│   ├── riscv-none-embed-as
│   ├── riscv-none-embed-c++
│   ├── riscv-none-embed-c++filt
│   ├── riscv-none-embed-cpp
│   ├── riscv-none-embed-elfedit
│   ├── riscv-none-embed-g++
│   ├── riscv-none-embed-gcc
│   ├── riscv-none-embed-gcc-7.1.1
│   ├── riscv-none-embed-gcc-ar
│   ├── riscv-none-embed-gcc-nm
│   ├── riscv-none-embed-gcc-ranlib
│   ├── riscv-none-embed-gcov
│   ├── riscv-none-embed-gcov-dump
│   ├── riscv-none-embed-gcov-tool
│   ├── riscv-none-embed-gdb
│   ├── riscv-none-embed-gprof
│   ├── riscv-none-embed-ld
│   ├── riscv-none-embed-ld.bfd
│   ├── riscv-none-embed-nm
│   ├── riscv-none-embed-objcopy
│   ├── riscv-none-embed-objdump
│   ├── riscv-none-embed-ranlib
│   ├── riscv-none-embed-readelf
│   ├── riscv-none-embed-run
│   ├── riscv-none-embed-size
│   ├── riscv-none-embed-strings
│   └── riscv-none-embed-strip
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
│   └── libriscv-none-embed-sim.a
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
├── riscv-none-embed
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

The binaries are distributed as portable archives, that do not need to run a setup and do not require an uninstall.

## Test

A simple test is performed by the script at the end, by launching the executable to check if all shared/dynamic libraries are correctly used.

For a true test you need to first install the package and then run the program form the final location. For example on macOS the output should look like:

```console
$ ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/7.1.1-1-20170702-0625/bin/riscv-none-embed-gcc --version
riscv-none-embed-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.1.1 20170509
```

## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/blob/master/scripts/build.sh).
