---
layout: page
title: DEPRECATED > How to build the RISC-V Embedded GCC binaries?
permalink: /toolchain/riscv/build-procedure/

date: 2017-07-06 20:55:00 +0300

---

## Deprecation notice

In mid-2019, the RISC-V toolchain binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new page is:

* [https://xpack.github.io/riscv-none-embed-gcc/](https://xpack.github.io/riscv-none-embed-gcc/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

The GNU MCU Eclipse RISC-V Embedded GCC build scripts provide a single tool 
to create multi-platform binaries, generating the Windows 32, Windows 64, 
GNU/Linux 32, GNU/Linux 64 and macOS distribution packages.

The script was developed on macOS, but it should also run on any recent 
GNU/Linux distribution (just that in this case it cannot generate the 
macOS package).

## How to build?

For the final authoritative details, please refer to the separate 
[riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/) 
project.
