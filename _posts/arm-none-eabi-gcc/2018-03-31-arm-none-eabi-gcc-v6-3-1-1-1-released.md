---
layout: post
title:  GNU MCU Eclipse ARM Embedded GCC v6.3.1-1.1 20180331 released
download_url: https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/tag/v6.3.1-1.1/

author: Liviu Ionescu

date:   2018-03-31 12:00:00 +0300

categories:
  - releases
  - arm
  - arm-none-eabi-gcc

---

Version v6.3.1-1.1 20180331 is the first release of **GNU MCU Eclipse ARM Embedded GCC**.

[Binary files »]({{ page.download_url }})

## Compliance

This release follows the official [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm)  **6-2017-q2-update** release from June 28, 2017 and it is based on the `gcc-arm-none-eabi-6-2017-q2-update-src.tar.bz2` source invariant.

## Binaries

Binaries for **Windows**, **macOS** and **GNU/Linux** are provided.

The GNU/Linux binaries were built on two CentOS 6 Docker images (32/64-bits), and run on any distribution based on CentOS 6 or later.

The macOS binary was built on a macOS 10.10.5 and must run on any newer macOS system.

The Windows binaries were built with mingw-w64, and run on any reasonably recent **i686** and **x86_64** Windows machines.

Instructions on how to install the binaries are available in the [How to install the ARM toolchain?](https://gnu-mcu-eclipse.github.io/toolchain/arm/install/) page.

The toolchain is also available as an [xPack](https://www.npmjs.com/package/@gnu-mcu-eclipse/arm-none-eabi-gcc) and can be conveniently installed with [`xpm`](https://www.npmjs.com/package/xpm):

```console
$ xpm install @gnu-mcu-eclipse/arm-none-eabi-gcc --global
```

This installs the latest available version.

For better control and repeatability, the build scripts use Docker containers; all files required during builds are available as a separate [gnu-mcu-eclipse/arm-none-eabi-gcc-build](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build) project. 

## Known problems

* none

## Checksums

The SHA-256 hashes for the files are:

```console
2f94b75db7510a254e596a9d3d92d517e18021e587b5d08014f7fdd475275c24 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-centos32.tar.bz2

3c761b2f2016ff8c88ad72f101d5facf9a35f074347a9918a5b6de1dd8c7aec4 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-centos32.tar.xz

7c137c311832e17faae5b281114a0525ef0adb449a3744446a7dfe83e22dd9a4 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-centos64.tar.bz2

6a7f9f64eb5cba9b156c9e305e06bff1e88283f1e79d6f23b56dfe6c12023fa6 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-centos64.tar.xz

2fbf053b5f2cb4764d8c2db5b5613bf79008de2a6f85cf889af07e0e0b3abbf3 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-osx.tar.bz2

60c1fc43627b69439ca3cbfc21d613e333da4655246935ff8ddce3c71b094be5 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-osx.tar.xz

ad23df4fde3cc0153e910e459e5fada5b9b1d4a73d9651b96e21d0be73f8a7e6 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-win32.zip

37cdad0da139808f62146be9f1860a87883c8a5ec1afb6822db4e7c8dba25f35 
?gnu-mcu-eclipse-arm-none-eabi-gcc-6.3.1-1.1-20180331-0618-win64.zip

```
