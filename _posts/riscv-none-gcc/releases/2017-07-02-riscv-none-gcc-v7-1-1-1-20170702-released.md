---
layout: post
title:  GNU MCU Eclipse RISC-V Embedded GCC v7.1.1-1-20170702-* released
download_url: https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/tag/v7.1.1-1-20170702-0625

author: Liviu Ionescu

date:   2017-07-06 22:38:00 +0300

categories:
  - releases
  - riscv-none-gcc

---

Version v7.1.1-1-20170702-0625 is the first **GNU MCU Eclipse RISC-V Embedded GCC** release. It includes binaries for Windows, macOS and GNU/Linux.

[Binary files »]({{ page.download_url }})

## Compliance

This release closely follows the official [RISC-V distribution](https://github.com/riscv/riscv-gcc) maintained by [SiFive](https://www.sifive.com).

The current version is based on project [riscv/riscv-gnu-toolchain](https://github.com/riscv/riscv-gnu-toolchain), tag v20170612 (commit [f5fae1c](https://github.com/riscv/riscv-gnu-toolchain/tree/f5fae1c27b2365da773816ddcd92f533867f28ec)) from June 12th, which depends on the following:

* the [riscv/riscv-gcc](https://github.com/riscv/riscv-gcc) project, commit [16210e6](https://github.com/riscv/riscv-gcc/commit/16210e6270e200cd4892a90ecef608906be3a130) from from May 15th, 2017
* the [riscv/riscv-binutils-gdb](https://github.com/riscv/riscv-binutils-gdb) project, commit [3f21b5c](https://github.com/riscv/riscv-binutils-gdb/commit/3f21b5c9675db61ef5462442b6a068d4a3da8aaf) from May 5th, 2017
* the [riscv/riscv-newlib](https://github.com/riscv/riscv-newlib) project, commit [ccd8a0a](https://github.com/riscv/riscv-newlib/commit/ccd8a0a4ffbbc00400892334eaf64a1616302b35) from May 2nd, 2017

## Changes

Compared to the original RISC-V version, there are no functional changes; the **same architecture and API options** are supported, and the **same combinations of libraries** (derived from newlib) are provided.

## newlib-nano

The only notable addition is support for **newlib-nano**, using the `--specs=nano.specs` option. For better results, this option must be added to both compile and link time (the next release of the GNU MCU Eclipse plug-ins will add support for this).

If no syscalls are needed, `--specs=nosys.specs` can be used at link time to provide empty implementations for the POSIX system calls.

The _nano_ versions of the libraries are compiled with `-Os -mcmodel=medlow`, while the regular versions are compiled with `-O2 -mcmodel=medany`.

## Documentation

Another addition compared to the SiFive distribution is the presence of the documentation, including the PDF manuals for all tools.

## Binaries

Binaries for **Windows**, **macOS** and **GNU/Linux** are provided. For Windows and macOS, separate installable and plain archives are provided. For Windows and GNU/Linux, both 32/64-bits binaries are provided.

Instructions on how to install them are available in the [How to install the RISC-V toolchain?](https://gnu-mcu-eclipse.github.io/toolchain/install-riscv/) page.

For better control and repetability, the build scripts use Docker containers; all files required during builds are available as a separate [gnu-mcu-eclipse/riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build) project. 

## Checksums

The SHA-256 hashes for the files are:

```
a723d8c6870d1808882ea2eaa630a8c60c5cb6bd25dc238091d2f9738298c44a ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-debian32.tgz

1d36d44221cde15572673019f76727883ce543a7d76d2e10f07ae1a901c07bbb ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-debian64.tgz

75e71fd37c3749cd892e020a4562c0c10535719e4bb573371d957fb8f16f790e ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-osx.pkg

7940417bc4fbd537b38866914b20375f89417ac0ba90399a2d2c510d0c802497 ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-osx.tgz

b082bedc09af08ca56e218dba87e8e69b3d100042bdbbe3821fd2ef72f33e9f0 ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-win32-setup.exe

7fbecec74060be8b4075bed6d2b0f201421614f53dd134ce7ffdd18df79dfce9 ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-win32.zip

 ba8fd7b53e2cad2092f39c105c3d4a734546c89f807df8e804dd6db40c23f7fc ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-win64-setup.exe

30a37efe5c5bfaf9def8d06249ff471c8d81d37e01d33caf4fff928c8cfe7670 ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-win64.zip
```