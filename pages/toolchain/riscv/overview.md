---
layout: page
permalink: /toolchain/riscv/
title: The RISC-V Embedded GCC
author: Liviu Ionescu

date: 2017-07-06 22:58:00 +0300

---

## Overview

The [**GNU MCU Eclipse RISC-V Embdedded GCC**](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/) is an elaborated binary distribution that closely follows the official [RISC-V distribution](https://github.com/riscv/riscv-gcc) maintained by [SiFive](https://www.sifive.com).

## riscv64-unknown-elf-gcc vs riscv32-unknown-elf-gcc


With lots of architectures and systems supported, GCC recommends prefixing the binaries with a unique tuple:

```
<arch>-<vendor>-<os>-<libc/abi>-
```

The current RISC-V prefixes for the bare metal toolchains are `riscv64-unknown-elf-` and `riscv32-unknown-elf-`.

Well, don't be confused by this unfortunate names. The **64** or **32** attached to the architecture does not mean that the toolchain runs on 64-bits or 32-bits platforms only. It does not mean either that the compiler produces 64-bits or 32-bits RISC-V binaries. Actually, the compilers produce both 32/64-bits binaries, based on `-march` and `-mabi`. The only difference are defaults, when the compiler are invoked without the `-march` and `-mabi` explicitly set on the command line.

The **unknown** part of the tuple also does not bring any useful information. If it referes to the vendor, it could have been easily skipped. If it refers to the OS, or to the lack of it, being a bare metal toolchain, **none** would have been a shorter and more usual name.

So, giving away the confusing parts, a more apropriate prefix for the multilib toolchain would have been:

```
riscv-none-newlib-
```

or even the shorter:

```
risc-none-
```

Hopefully, someday RISC-V will revise the toolchain naming scheme, and correct this confusion.

## `-march` and `-mabi`

The RISC-V design is not a single architecture, but a family of architectures, with optional components, identified by letters.

RISC-V ISA strings begin with either RV32I, RV32E, RV64I, or RV128I indicating the supported address space size in bits for the base integer ISA.

Standard General-Purpose ISA

* I - Integer
* M - Integer Multiplication and Division 
* A - Atomics
* F - Single-Precision Floating-Point 
* D - Double-Precision Floating-Point
* G - General, a shortcut to IMAFD

Standard User-Level Extensions

* Q - Quad-Precision Floating-Point 
* L - Decimal Floating-Point
* C - 16-bit Compressed Instructions 
* B - Bit Manipulation
* J - Dynamic Languages 
* T - Transactional Memory 
* P - Packed-SIMD Extensions 
* V - Vector Extensions 
* N - User-Level Interrupts

For more details, please see [The RISC-V Instruction Set Manual, Volume I: User-Level ISA, Document Version 2.2](https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf).

Not all these extendsions are yet defined or implemented by the compiler; the `-march` supports only:

* rv32i[m][a][f[d]]
* rv32g 
* rv64i[m][a][f[d]]
* rv64g 

The RISC-V supported application binary interfaces (`-mabi`) are:

* ilp32 (32-bits, soft-float)
* ilp32f (32-bits with single-precision in registers and double in memory, niche use only)
* ilp32d (32-bits, hard-float)
* lp64 (64-bits long and pointers, soft-float)
* lp64f (64-bits long and pointers, with single-precision in registers and double in memory, niche use only)
* lp64d (64-bits long and pointers, hard-float).

The GNU MCU Eclipse RISC-V plug-in supports all current options, and reserves some for near future use.

![RISC-V plug-in tool settings]({{ site.baseurl }}/assets/images/2017/riscv-tool-settings.png)

However, please be aware that not all possible combinations have libraries available.

## Multiple libraries

Due to the large number of architectures and ABIs defined for RISC-V, not all possible combinations are actually available.

The current list is:

```
march=rv32i/mabi=ilp32
march=rv32im/mabi=ilp32
march=rv32iac/mabi=ilp32
march=rv32imac/mabi=ilp32
march=rv32imafc/mabi=ilp32f
march=rv64imac/mabi=lp64
march=rv64imafdc/mabi=lp64d
```

(the actual list is defined in this [file](https://github.com/riscv/riscv-gcc/blob/riscv-next/gcc/config/riscv/t-elf-multilib)).

## More user pages

* [How to install?]({{ site.baseurl }}/toolchain/riscv/install/)
* [Releases]({{ site.baseurl }}/toolchain/riscv/releases/)
* [Change log]({{ site.baseurl }}/toolchain/riscv/change-log/)
* [Support]({{ site.baseurl }}/toolchain/riscv/support/)

## More developer pages

* [How to build?]({{ site.baseurl }}/toolchain/riscv/build-procedure/)
* [How to publish?]({{ site.baseurl }}/toolchain/riscv/publish-procedure/)
