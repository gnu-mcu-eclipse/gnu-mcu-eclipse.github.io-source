---
layout: page
title: DEPRECATED > How to build the ARM Embedded GCC binaries?
permalink: /toolchain/arm/build-procedure/

date: 2018-02-16 13:35:00 +0300

---

## Deprecation notice

In mid-2019, the ARM toolchain binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new home page is:

* [https://xpack.github.io/arm-none-eabi-gcc/](https://xpack.github.io/arm-none-eabi-gcc/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

The GNU MCU Eclipse ARM Embedded GCC build scripts provide a single tool to create multi-platform binaries, generating the Windows 32, Windows 64, GNU/Linux 32, GNU/Linux 64 and macOS distribution packages.

The script was developed on macOS, but it also runs on any recent GNU/Linux distribution.

## How to build?

For the final authoritative details, please refer to the separate [arm-none-eabi-gcc-build](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build/) project.
