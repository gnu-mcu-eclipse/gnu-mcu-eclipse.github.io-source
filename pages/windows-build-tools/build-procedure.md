---
layout: page
title: How to build the Windows Build Tools binaries?
permalink: /windows-build-tools/build-procedure/

author: Liviu Ionescu

date: 2015-09-04 17:02:00 +0300

---

The latest version of the build script is a single run, multi-platform build, generating the Windows 32, Windows 64 distribution packages at once.

The script was developed on macOS, but it also runs on any recent GNU/Linux distribution.

## Prerequisites

The prerequisites are common to all binary builds. Please follow the instructions in the separate [Prerequisites for building binaries]({{ site.baseurl }}/developer/build-binaries-prerequisites/) page and return when ready.

## Download the build scripts repo

The build script is available from GitHub and can be [viewed online](https://github.com/gnu-mcu-eclipse/windows-build-tools/blob/master/scripts/build.sh).

To download it, clone the [gnu-mcu-eclipse/windows-build-tools](https://github.com/gnu-mcu-eclipse/windows-build-tools) Git repo. 

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/windows-build-tools.git \
  ~/Downloads/windows-build-tools.git
```

## Check the script

The script creates a temporary build `Work/openocd` folder in the user home. Although not recommended, if for any reasons you need to change this, you can redefine `WORK_FOLDER` variable before invoking the script.

## Preload the Docker images

Docker does not require to explicitly download new images, but does this automatically at first use.

However, since the images used for this build are relatively large, it is recommended to load them explicitly before starting the build:

```console
$ bash ~/Downloads/windows-build-tools.git/scripts/build.sh preload-images
```

The result should look similar to:

```console
$ docker images
REPOSITORY                  TAG                   IMAGE ID            CREATED             SIZE
ilegeul/centos32            6-xbb-tex-v1          84e5da687232        3 days ago          4.52GB
ilegeul/centos              6-xbb-tex-v1          4e96fda659ab        3 days ago          4.71GB
hello-world                 latest                1815c82652c0        6 months ago        1.84kB
```

## Development

When preparing official release, follow the following steps.

* check the [MSYS2](http://sourceforge.net/projects/msys2/files/REPOS/MSYS2/Sources/) for the latest make source archive
* check [BusyBox](https://github.com/rmyorston/busybox-w32) for the latest commit

### Prepare release

Update `gnu-mcu-eclipse/info` files:

* `CHANGES.txt` (add release, scan the log)
* `INFO.md` (update references to commits)
* `VERSION`

In the `build.sh` script:

* update the `MAKE_VERSION`
* update the commit id `BUSYBOX_COMMIT`
* commit and push (without push, the inner clone uses an older version)

## Build all distribution files

Before starting a multi-platform build, check if Docker is started.

```console
$ bash ~/Downloads/windows-build-tools.git/scripts/build.sh --all
```

On macOS, to prevent entering sleep, use:

```console
$ caffeinate bash ~/Downloads/windows-build-tools.git/scripts/build.sh --all
```

After a few good minutes, the output of the build script is a set of files in the output folder:

```console
$ ls -l deploy 
total 6600
-rw-r--r--   1 ilg  staff        1 Jan  3 21:26 empty.sha
-rw-r--r--   1 ilg  staff  1577768 Jan  3 21:26 gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win32.zip
-rw-r--r--   1 ilg  staff      123 Jan  3 21:26 gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win32.zip.sha
-rw-r--r--@  1 ilg  staff  1782202 Jan  3 21:23 gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win64.zip
-rw-r--r--   1 ilg  staff      123 Jan  3 21:23 gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win64.zip.sha
drwxr-xr-x  13 ilg  staff      416 Jan  3 21:23 win32
drwxr-xr-x  13 ilg  staff      416 Jan  3 21:20 win64
```

## Subsequent runs

### Separate platform specific builds

Instead of `--all`, you can use any combination of:

```
--win32 --win64
```

### clean

To remove most build files, use:

```console
$ bash ~/Downloads/windows-build-tools.git/scripts/build.sh clean
```

To also remove the repository and the output files, use:

```console
$ bash ~/Downloads/windows-build-tools.git/scripts/build.sh cleanall
```


## Install hierarchy

The procedure to install the GNU MCU Eclipse Build Tools is simple. The setup asks no special questions, and the defaults are generally ok for most installations.

After install, this package should create structure like this (only the first two depth levels are shown):

```console
$ tree -L 2 Build\ Tools/2.10-20180103-1919/
├── COPYING
├── INFO.txt
├── bin
│   ├── busybox.exe
│   ├── echo.exe
│   ├── libiconv-2.dll
│   ├── libintl-8.dll
│   ├── make.exe
│   ├── rm.exe
│   └── sh.exe
├── gnuarmeclipse
│   ├── BUILD.txt
│   ├── CHANGES.txt
│   ├── build-build-tools.sh
│   ├── build-helper.sh
│   └── config.log
└── license
    ├── busybox
    └── make-4.1

5 directories, 14 files
```

No other files are installed in any system folders or other locations.

## Uninstall

The binaries are distributed as portable archives, that do not need to run a setup and do not require an uninstall.

## More build details

The script is quite complex, and an attempt to explain its functionality would require some effort. For the final authoritative details, please refer to the comments available in the [script](https://github.com/gnu-mcu-eclipse/build-scripts/blob/master/scripts/build-windows-build-tools.sh).
