---
layout: page
title: How to build the ARM Embedded GCC binaries?
permalink: /toolchain/arm/build-procedure/

date: 2018-02-16 13:35:00 +0300

---

The GNU MCU Eclipse ARM Embedded GCC build scripts provide a single tool to create multi-platform binaries, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages.

The script was developed on macOS, but it also runs on any recent GNU/Linux distribution.

## Prerequisites

The prerequisites are common to all binary builds. Please follow the instructions in the separate [Prerequisites for building binaries]({{ site.baseurl }}/developer/build-binaries-prerequisites-xbb/) page and return when ready.

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/arm-none-eabi-gcc-build](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build) Git repo, including submodules. 

```console
$ rm -rf ~/Downloads/arm-none-eabi-gcc-build.git
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build.git \
  ~/Downloads/arm-none-eabi-gcc-build.git
```

## Check the script

The script creates a temporary build `Work/arm-none-eabi-gcc-${version}` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER_PATH` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```console
$ bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh preload-images
```

The result should look similar to:

```console
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ilegeul/centos32    6-xbb-v1            f695dd6cb46e        2 weeks ago         2.92GB
ilegeul/centos      6-xbb-v1            294dd5ee82f3        2 weeks ago         3.09GB
hello-world         latest              f2a91732366c        2 months ago        1.85kB
```

## Update git repos

The GNU MCU Eclipse ARM Embedded GCC distribution follows the official [ARM](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm) distributions, and it is planned to make a new release after each future ARM release.

Currently the build procedure uses the _Source Invariant_ archive and the configure options are the same as in the ARM build scripts.

## Prepare release

To prepare a new release, first determine the GCC version (like `7.2.1`) and update the `scripts/VERSION` file. The fourth digit is the number of the ARM release of the same GCC version, and the fifth digit is the GNU MCU Eclipse release number.

Add a new set of definitions in the `scripts/container-build.sh`, with the versions of various components.

Update the `CHANGES.txt` file.

## Build

Although it is perfectly possible to build all binaries in a single step on a macOS system, due to Docker specifics, it is faster to build the GNU/Linux and Windows binaries on a GNU/Linux system and the macOS binary separately.

### Build the GNU/Linux and Windows binaries

The current platform for GNU/Linux and Windows production builds is an Ubuntu 17.10 VirtualBox image running on a macMini with 16 GB of RAM and a fast SSD.

Before starting a multi-platform build, check if Docker is started:

```console
$ docker info
```

To build all distribution files:

```console
$ bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh --all
```

Many hours later, the output of the build script is a set of 4 files and their SHA signatures, created in the `deploy` folder:

```console
$ ls -l deploy
... TBD
```

### Build the macOS binary

The current platform for macOS production builds is a macOS 10.10.5 VirtualBox image running on a macMini with 16 GB of RAM and a fast SSD.

To build the macOS binaries:

```console
$ caffeinate bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh --osx --date YYYYmmdd-HHMM
```

For consistency reasons, the date should be the same as the GNU/Linux and Windows builds.

Several hours later, the output of the build script is a compressed archive and its SHA signature, created in the `deploy` folder:

```console
$ ls -l deploy
total 784400
... TBD
```

## Subsequent runs

### Separate platform specific builds

Instead of `--all`, you can use any combination of:

```
--win32 --win64 --linux32 --linux64
```

Please note that, due to the specifics of the GCC build process, the Windows build requires the corresponding GNU/Linux build, so `--win32` alone is equivalent to `--linux32 --win32` and `--win64` alone is equivalent to `--linux64 --win64`.

### clean

To remove most build files, use:

```console
$ bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```console
$ bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh cleanall
```

### --develop

For performance reasons, the actual build folders are internal to each Docker run, and are not persistent. This has the disadvantage that interrupted builds cannot be resumed.

For development builds, it is possible to define the build folders in the host file system, and resume an interrupted build.

### --debug

For development builds, it is also possible to create everything with `-g -O0` and be able to run debug sessions.

## Install hierarchy

The procedure to install GNU MCU Eclipse ARM Embedded GCC is platform specific, but relatively straight forward (a .zip archive on Windows, a compressed tar archive on macOS and GNU/Linux).

After install, this package should create structure like this (only the first two depth levels are shown):

```console
$ tree -L 2 /Users/ilg/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/7.1.1-1-20170702-0625/
... TBD
```

No other files are installed in any system folders or other locations.

## Uninstall

The binaries are distributed as portable archives, that do not need to run a setup and do not require an uninstall.

## Test

A simple test is performed by the script at the end, by launching the executable to check if all shared/dynamic libraries are correctly used.

For a true test you need to first install the package and then run the program form the final location. For example on macOS the output should look like:

```console
$ ${HOME}/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/7.1.1-1-20170702-0625/bin/arm-none-eabi-gcc --version
arm-none-eabi-gcc (GNU MCU Eclipse ARM Embedded GCC, 64-bits) 7.1.1 20170509
```

## More build details

The build process is split into several scripts. The main script is `container-build.sh` and includes several other scripts. The whole process is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [build project](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build/).
