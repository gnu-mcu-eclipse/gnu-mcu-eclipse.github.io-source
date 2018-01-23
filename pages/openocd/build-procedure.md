---
layout: page
title: How to build the OpenOCD binaries?
permalink: /openocd/build-procedure/

date: 2015-09-04 17:02:00 +0300

---

The latest version of the build script is a single run, multi-platform build, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages at once.

The script was developed on macOS, but it also runs on any recent GNU/Linux distribution (just that in this case it cannot generate the macOS package).

## Prerequisites

The prerequisites are common to all binary builds. Please follow the instructions in the separate [Prerequisites for building binaries]({{ site.baseurl }}/developer/build-binaries-prerequisites/) page and return when ready.

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/openocd-build/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/openocd-build](https://github.com/gnu-mcu-eclipse/openocd-build) Git repo. 

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/openocd-build.git \
  ~/Downloads/openocd-build.git
```

## Check the script

The script creates a temporary build `Work/openocd` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh preload-images
```

The result should look similar to:

```console
$ docker images
REPOSITORY                  TAG                   IMAGE ID            CREATED             SIZE
ilegeul/centos32            6-xbb-v1              f695dd6cb46e        7 days ago          2.92GB
ilegeul/centos              6-xbb-v1              294dd5ee82f3        7 days ago          3.09GB
hello-world                 latest                1815c82652c0        6 months ago        1.84kB
```

## Development

When preparing official release, observe the following steps.

### Update git repos

The GNU MCU Eclipse OpenOCD is following closely the OpenOCD master and the official [RISC-V OpenOCD](https://github.com/riscv/riscv-openocd).

* into [gnu-mcu-eclipse/riscv-openocd](https://github.com/gnu-mcu-eclipse/riscv-openocd)
  * merge the [riscv/riscv-openocd](https://github.com/riscv/riscv-openocd) `riscv` branch into the local `riscv` branch
* into [gnu-mcu-eclipse/openocd](https://github.com/gnu-mcu-eclipse/openocd)
  * merge the [OpenOCD](http://repo.or.cz/openocd.git) `master` branch into the `gnu-mcu-eclipse-dev` branch
  * merge the [gnu-mcu-eclipse/riscv-openocd](https://github.com/gnu-mcu-eclipse/riscv-openocd) `riscv` branch into the `gnu-mcu-eclipse-dev` branch
* compare the `gnu-mcu-eclipse-dev` and `riscv` branches, add `#if BUILD_RISCV == 1` where needed

### Prepare release

Update `gnu-mcu-eclipse/info` files:

* `CHANGES.txt` (add release, scan the log)
* `INFO.md` (update references to commits)
* `VERSION`

In the `build.sh` script:

* update the commit id `OPENOCD_GIT_COMMIT` to the desired one
* commit and push (without push, the inner clone uses an older version)

## Build all distribution files

Before starting a multi-platform build, check if Docker is started.

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

On macOS, to prevent entering sleep, use:

```console
$ caffeinate bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

About half an hour later, the output of the build script is a set of 5 files in the output folder:

```console
$ ls -l deploy
total 31088
drwxr-xr-x  1 ilg  staff    16384 Jan  4 18:41 centos32
drwxr-xr-x  1 ilg  staff    16384 Jan  4 18:26 centos64
-rw-r--r--  1 ilg  staff        1 Jan  4 18:50 empty.sha
-rw-r--r--  1 ilg  staff  2495436 Jan  4 18:41 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-centos32.tgz
-rw-r--r--  1 ilg  staff      126 Jan  4 18:41 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-centos32.tgz.sha
-rw-r--r--  1 ilg  staff  2558621 Jan  4 18:26 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-centos64.tgz
-rw-r--r--  1 ilg  staff      126 Jan  4 18:26 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-centos64.tgz.sha
-rw-r--r--  1 ilg  staff  2669737 Jan  4 18:22 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-osx.tgz
-rw-r--r--  1 ilg  staff      121 Jan  4 18:22 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-osx.tgz.sha
-rw-r--r--  1 ilg  staff  3271104 Jan  4 18:50 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-win32.zip
-rw-r--r--  1 ilg  staff      123 Jan  4 18:50 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-win32.zip.sha
-rw-r--r--  1 ilg  staff  3377719 Jan  4 18:37 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-win64.zip
-rw-r--r--  1 ilg  staff      123 Jan  4 18:37 gnu-mcu-eclipse-openocd-0.10.0-6-20180104-1616-win64.zip.sha
drwxr-xr-x  1 ilg  staff    16384 Jan  4 18:21 osx
drwxr-xr-x  1 ilg  staff    16384 Jan  4 18:50 win32
drwxr-xr-x  1 ilg  staff    16384 Jan  4 18:37 win64
```

## Subsequent runs

### Separate platform specific builds

Instead of `--all`, you can use any combination of:

```
--win32 --win64 --linux32 --linux64 --osx
```

### clean

To remove most build files, use:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh cleanall
```

## Native builds

In addition to the CentOS binaries, if necessary, the script can be used to build binaries for any Linux distribution.

For such cases, simply start the script without any platform option:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh
```

It is the responsibility of the user to meet all the prerequisites.

## Install hierarchy

The procedure to install GNU MCU Eclipse OpenOCD is relatively straight forward and requires to unpack the archive.

After install, this package should create structure like this (only the first two depth levels are shown):

```console
$ tree -L 2 ${HOME}/opt/gnu-mcu-eclipse/openocd/0.10.0-5-20171110-1117
├── bin
│   └── openocd
├── doc
│   ├── openocd.html
│   └── openocd.pdf
├── info
│   ├── BUILD.txt
│   ├── INFO.txt
│   └── build-openocd-osx.sh
├── license
│   ├── hidapi
│   └── openocd
└── scripts
    ├── bitsbytes.tcl
    ├── board
    ├── chip
    ├── cpld
    ├── cpu
    ├── interface
    ├── mem_helper.tcl
    ├── memory.tcl
    ├── mmr_helpers.tcl
    ├── target
    ├── test
    └── tools

16 directories, 9 files
```

No other files are installed in any system folders or other locations.

## Uninstall

The binaries are distributed as portable archives, that do not need to run a setup and do not require an uninstall.

## Test

A simple test is performed by the script at the end, by launching the executable to check if all shared/dynamic libraries are correctly used.

For a true test you need to first install the package and then run the program form the final location. For example on macOS the output should look like:

```console
$ ${HOME}/opt/gnu-mcu-eclipse/openocd/0.10.0-3-20170826-0939-dev/bin/openocd --version
GNU MCU Eclipse 64-bits Open On-Chip Debugger 0.10.0+dev-00138-g96c70022 (2017-08-26-12:40)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
```

## Debug

To run debug sessions on macOS, it is necessary to build images that include the debugging info:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh --without-pdf --no-strip --debug
```

With Xcode, create a new Cross-platform, External Build System project. Select a folder below `xcode`.

In the External Build Tool Configuration, use the `build/osx/openocd` folder.

Add the `openocd.git` folder to the sources.


## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/openocd-build/blob/master/scripts/build.sh).
