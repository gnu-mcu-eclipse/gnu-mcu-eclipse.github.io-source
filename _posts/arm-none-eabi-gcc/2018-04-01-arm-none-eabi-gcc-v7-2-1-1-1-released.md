---
layout: post
title:  GNU MCU Eclipse ARM Embedded GCC v7.2.1-1.1 20180401 released
download_url: https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/tag/v7.2.1-1.1/

author: Liviu Ionescu

date:   2018-04-01 21:18:00 +0300

categories:
  - releases
  - arm
  - arm-none-eabi-gcc

---

Version v7.2.1-1.1 20180401 is a new release of **GNU MCU Eclipse ARM Embedded GCC**.

[Binary files »]({{ page.download_url }})

## Compliance

This release follows the official [GNU Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm)  **7-2017-q4-major** release from December 18, 2017 and it is based on the `gcc-arm-none-eabi-7-2017-q4-major-src.tar.bz2` source invariant.

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
d5a909d0261733ae172c74ec2d088151273565b12f0b0507418d1458f9b35f39 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-centos32.tar.bz2

4fe99c9122c7f2f84a998640d9b3d3d890a2ae47cbd5469813a3ad015e69bbd7 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-centos32.tar.xz

7c45437e87a12393743c7a6cdd39df9f0c920a90eb34c2839658b4b74249d97a 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-centos64.tar.bz2

ed6c727b859eed4fcb55aa14bdafd329f71b087877d2eb7438abfec2bb533227 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-centos64.tar.xz

449763551140da8ec6c1d0b7f48e3ccf6d41f7f872da5d18e9c5d01db40e684b 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-osx.tar.bz2

71a3108fe11bbce92e9648cd3cf0b9f7a046bd347f6c115f461975a8313e00c6 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-osx.tar.xz

578c4525187c498ec0b8255ac46d4177ed3b51b115cb6ca4cd379baa6b70db7a 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-win32.zip

fd9573d0b9e89d87b9bf7f237955bbeba206a93c6cecc2fc3996458798d7a05b 
?gnu-mcu-eclipse-arm-none-eabi-gcc-7.2.1-1.1-20180401-0515-win64.zip

```
