---
layout: page
title: How to build the OpenOCD binaries?
permalink: /openocd/build-procedure/

date: 2015-09-04 17:02:00 +0300

---

The latest version of the build script is a single run, multi-platform build, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages at once.

The script was developed on macOS, but it also runs on any recent GNU/Linux distribution (just that in this case it cannot generate the macOS package).

## Prerequisites

The main trick that made the multi-platform build possible is [Docker](https://www.docker.com).

Containers based on three docker images are used, one packing MinGW-w64 in two Debian 9 (32/64-bits) containers. The more conservative Debian was preferred to generate the GNU/Linux versions, to avoid problems when attempting to run the executables on older versions.

### macOS

#### Install the Command Line Tools

The macOS compiler and other development tools are packed in a separate Xcode add-on. The best place to get it is from the [Developer](https://developer.apple.com/xcode/downloads/) site, although this might require enrolling to the developer program (free of charge).

It is also possible to install the Command Line Tools via a command line:

```bash
$ xcode-select --install
$ xcode-select -p
/Library/Developer/CommandLineTools
```

To test if the compiler is available, use:

```bash
$ gcc --version
Configured with: --prefix=/Library/Developer/CommandLineTools/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 8.1.0 (clang-802.0.42)
Target: x86_64-apple-darwin16.7.0
Thread model: posix
InstalledDir: /Library/Developer/CommandLineTools/usr/bin
```

#### Install a custom instance of Homebrew

The build process is quite complex, and requires tools not available in the standard Apple macOS distribution. These tools can be installed with Homebrew. To keep these tools separate, a custom instance of Homebrew is installed in `${HOME}/opt/homebrew/gme`. 

In a separate run, the **[MacTex](http://www.tug.org/mactex/)** tools are also installed in `${HOME}/opt/texlive`. Alternatively you can install MacTex in `/usr/local` using the official distribution, but this will add lots of programs to the system path, and this is a bad thing.

The entire process can be automated with two scripts, available from GitHub:

```
$ mkdir -p ${HOME}/opt
$ git clone https://github.com/ilg-ul/opt-install-scripts \
    ${HOME}/opt/install-scripts.git
$ bash ${HOME}/opt/install-scripts.git/install-homebrew-gme.sh
$ bash ${HOME}/opt/install-scripts.git/install-texlive.sh
```

The scripts run with user credentials, no `sudo` access is required. Please be aware that the TeX install takes quite some time.

#### Install Docker

On macOS, Docker can be installed by following the official [Install Docker on macOS](https://docs.docker.com/installation/mac/) instructions.

### GNU/Linux

#### Install Docker

For any GNU/Linux distribution, follow the [specific instructions](https://docs.docker.com/installation/#installation).

#### Configure Docker to run as a regular user

To allow docker to run as a regular user, you need to be a member of the `docker` group.

```
$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker
$ sudo service docker restart
```

To make these changes effective, logout and login.

The above are for Ubuntu and the Debian family. For other distributions, the last line may differ, for example for Arch Linux use:

```
$ systemctl restart docker
```

#### Install required packages

Since most of the build is performed inside the Docker containers, there are not many requirements for the host, and most of the time these programs are in the standard distribution (`curl`, `git`, `automake`, `patch`, `tar`, `unzip`).

The script checks for them; if the script fails, install them and re-run.

### Docker images

The Docker images are available from [Docker Hub](https://hub.docker.com/u/ilegeul/). They were build using the Dockerfiles available from [ilg-ul/docker on GitHub](https://github.com/ilg-ul/docker).

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/openocd-build/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/openocd-build](https://github.com/gnu-mcu-eclipse/openocd-build) Git repo. 

```
$ git clone https://github.com/gnu-mcu-eclipse/openocd-build.git \
  ~/Downloads/openocd-build.git
```

## Check the script

The script creates a temporary build `Work/openocd` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh preload-images
```

The result should look similar to:

```
$ docker images
REPOSITORY          TAG                   IMAGE ID            CREATED             SIZE
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ilegeul/debian      9-gnu-mcu-eclipse   ff8a853cf6cb        7 weeks ago         3.2GB
ilegeul/debian32    9-gnu-mcu-eclipse   a22ccdf38f1f        7 weeks ago         3.2GB
```

## Select the stable or the development branch

The repository has two branches; by default the development branch is used.

To select the stable branch, use:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh checkout-stable
```

To later switch back to the development branch, use:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh checkout-dev
```

To pull new commits from the repository, use:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh pull
```

## Build all distribution files

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

On macOS, to prevent entering sleep, use:

```
$ caffeinate bash 
$ exec bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

About half an hour later, the output of the build script is a set of 5 files in the output folder:

```
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
--win32 --win64 --debian32 --debian64 --osx
```

### clean

To remove most build files, use:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```
$ bash ~/Downloads/openocd-build.git/scripts/build.sh cleanall
```

## Install hierarchy

The procedure to install GNU MCU Eclipse OpenOCD is platform specific, but relatively straight forward (a Windows setup, an macOS install or a TGZ archive on GNU/Linux). The setup/install asks no special questions, and the defaults are generally ok for most installations.

After install, this package should create structure like this (only the first two depth levels are shown):

```
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

```
$ opt/gnu-mcu-eclipse/openocd/0.10.0-3-20170826-0939-dev/bin/openocd --version
GNU MCU Eclipse 64-bits Open On-Chip Debugger 0.10.0+dev-00138-g96c70022 (2017-08-26-12:40)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
```

## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/openocd-build/blob/master/scripts/build.sh).
