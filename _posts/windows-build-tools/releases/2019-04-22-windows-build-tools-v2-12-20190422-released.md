---
layout: post
title:  GNU MCU Eclipse Windows Build Tools v2.12 20190422 released
download_url: https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/tag/v2.12-20190422/

author: Liviu Ionescu

date:   2019-04-22 18:55:00 +0300

categories:
  - releases
  - windows-build-tools

tags:
  - windows
  - build
  - make
  - rm
  - mkdir
  - busybox

---

Version 2.12 20190422 is a maintenance release of the GNU MCU Eclipse Windows Build Tools.

[Binary files »]({{ page.download_url }})

## Content

The GNU MCU Eclipse Build Tools v2.12 package includes the **version 4.2.1 of GNU make** (built from MSYS2 source files), and version **1.31.0-git of BusyBox**, which provides a convenient implementation for `sh`/`rm`/`echo`/`mkdir`.

## Changes

Both the make and BusyBox sources were upgraded to the latest available.

## Known problems

* none so far

## Binaries

Only binaries for **Windows** are provided.

They were built with mingw-w64, and run on any reasonably 
recent **i686** and **x86_64** Windows machines.

Instructions on how to install the binaries are available in the 
[How to install the Windows Build Tools?]({{ site.baseurl }}/windows-build-tools/install/)
page.

The build tools are also available as an 
[xPack](https://www.npmjs.com/package/@gnu-mcu-eclipse/windows-build-tools) 
and can be conveniently installed with 
[`xpm`](https://www.npmjs.com/package/xpm):

```console
$ xpm install --global @gnu-mcu-eclipse/windows-build-tools
```

This installs the latest available version.

For better control and repeatability, the build scripts use Docker containers; 
all files required during builds are available as a separate 
[gnu-mcu-eclipse/windows-build-tools](https://github.com/gnu-mcu-eclipse/windows-build-tools)
project. 

## Checksums

The SHA-256 hashes for the files are:

```console
fb4c6a3a3a93f7ac5dbd88879b782b9b1c31c4b51273dc6c8c4299c23b3c4d98 
gnu-mcu-eclipse-windows-build-tools-2.12-20190422-1053-win32.zip

a8fd184310ffb5bf91660fd09f5b230675ef121deb03722c49562edf4d03318f 
gnu-mcu-eclipse-windows-build-tools-2.12-20190422-1053-win64.zip
```
