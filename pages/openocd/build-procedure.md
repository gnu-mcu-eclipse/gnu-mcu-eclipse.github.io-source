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
REPOSITORY          TAG                   IMAGE ID            CREATED             SIZE
ilegeul/debian      9-gnu-mcu-eclipse     ff8a853cf6cb        4 days ago          3.2GB
ilegeul/debian32    9-gnu-mcu-eclipse     a22ccdf38f1f        4 days ago          3.2GB
ilegeul/debian32    9                     7348339e67f5        4 days ago          116MB
debian              9                     a2ff708b7413        2 weeks ago         100MB
hello-world         latest                1815c82652c0        3 weeks ago         1.84kB
```

## Rebuild the Docker images

If the download speed is limited, probably it is faster to rebuild the images locally. For this see the `build-images` command:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh build-images
```

## Development

When preparing official release, follow the following steps.

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
$ caffeinate bash
$ exec bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

About half an hour later, the output of the build script is a set of 5 files in the output folder:

```console
$ ls -l deploy
total 41992
drwxr-xr-x  8 ilg  staff      272 Aug 26 12:57 debian32
drwxr-xr-x  8 ilg  staff      272 Aug 26 12:45 debian64
-rw-r--r--  1 ilg  staff        1 Aug 26 13:03 empty.sha
-rw-r--r--  1 ilg  staff  2782562 Aug 26 12:57 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-debian32.tgz
-rw-r--r--  1 ilg  staff      130 Aug 26 12:57 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-debian32.tgz.sha
-rw-r--r--  1 ilg  staff  2727918 Aug 26 12:46 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-debian64.tgz
-rw-r--r--  1 ilg  staff      130 Aug 26 12:46 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-debian64.tgz.sha
-rw-r--r--  1 ilg  staff  2552555 Aug 26 12:42 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-osx.pkg
-rw-r--r--  1 ilg  staff      125 Aug 26 12:42 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-osx.pkg.sha
-rw-r--r--  1 ilg  staff  2522421 Aug 26 12:42 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-osx.tgz
-rw-r--r--  1 ilg  staff      125 Aug 26 12:42 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-osx.tgz.sha
-rw-r--r--  1 ilg  staff  2334787 Aug 26 13:03 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win32-setup.exe
-rw-r--r--  1 ilg  staff      133 Aug 26 13:03 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win32-setup.exe.sha
-rw-r--r--  1 ilg  staff  3058854 Aug 26 13:03 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win32.zip
-rw-r--r--  1 ilg  staff      127 Aug 26 13:03 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win32.zip.sha
-rw-r--r--  1 ilg  staff  2369301 Aug 26 12:53 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win64-setup.exe
-rw-r--r--  1 ilg  staff      133 Aug 26 12:53 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win64-setup.exe.sha
-rw-r--r--  1 ilg  staff  3096610 Aug 26 12:53 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win64.zip
-rw-r--r--  1 ilg  staff      127 Aug 26 12:53 gnu-mcu-eclipse-openocd-0.10.0-3-20170826-0939-dev-win64.zip.sha
drwxr-xr-x  8 ilg  staff      272 Aug 26 12:42 osx
drwxr-xr-x  8 ilg  staff      272 Aug 26 13:03 win32
drwxr-xr-x  8 ilg  staff      272 Aug 26 12:52 win64
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

In addition to the Debian 9 binaries, if necessary, the script can be used to build binaries for any Linux distribution.

For such cases, simply start the script without any platform option:

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh
```
It is the responsibility of the user to meet all the prerequisites.

## Install hierarchy

The procedure to install GNU MCU Eclipse OpenOCD is platform specific, but relatively straight forward (a Windows setup, an macOS install or a TGZ archive on GNU/Linux). The setup/install asks no special questions, and the defaults are generally ok for most installations.

After install, this package should create structure like this (only the first two depth levels are shown):

```console
$ tree -L 2 /Applications/GNU\ MCU\ Eclipse/OpenOCD
/Applications/GNU\ MCU\ Eclipse/OpenOCD
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

To uninstall OpenOCD from a Windows machine, use the `uninstall.exe` program.

On macOS and GNU/Linux, the GNU MCU Eclipse OpenOCD install folder is self-contained and removing it is enough for completely removing the application.

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

## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/openocd-build/blob/master/scripts/build.sh).
