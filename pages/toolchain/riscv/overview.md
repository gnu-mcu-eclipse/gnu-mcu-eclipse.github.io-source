---
layout: page
permalink: /toolchain/riscv/
title: DEPRECATED > The RISC-V Embedded GCC
author: Liviu Ionescu

date: 2017-07-06 22:58:00 +0300

---

## Deprecation notice

In mid-2019, the RISC-V toolchain binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new page is:

* [https://xpack.github.io/riscv-none-embed-gcc/](https://xpack.github.io/riscv-none-embed-gcc/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

## Overview

The [**GNU MCU Eclipse RISC-V Embedded GCC**](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/) is an elaborated binary distribution that follows the official [RISC-V distribution](https://github.com/riscv/riscv-gcc) maintained by [SiFive](https://www.sifive.com).

## riscv64-unknown-elf-gcc?

Actually the long question is `riscv64-unknown-elf-gcc` vs `riscv32-unknown-elf-gcc`?

With lots of architectures and systems supported, GCC recommends prefixing the binaries with a unique tuple:

```
<arch>-<vendor>-<os>-<libc/abi>-
```

The current RISC-V prefixes for the Linux toolchains are `riscv64-unknown-linux-gnu-` and `riscv32-unknown-linux-gnu-` and for the non-Linux toolchains are `riscv64-unknown-elf-` and `riscv32-unknown-elf-`.

Well, don't be confused by this unfortunate names. The **64** or **32** prefix attached to the architecture does not mean that the toolchain runs on 64-bit or 32-bit platforms only. It does not mean either that the compiler produces 64-bit or 32-bit RISC-V binaries. Actually, the compilers produce both 32/64-bit binaries, based on `-march` and `-mabi`. The only difference are defaults, when the compiler are invoked without the `-march` and `-mabi` explicitly set on the command line.

The **unknown** part of the tuple also does not bring any useful information. If it refers to the OS, it could have been easily skipped. Not to mention that for bare metal toolchains, **none** would have been a shorter and more usual name.

## riscv-none-embed-gcc

So, giving away the confusing parts, a more appropriate prefix for the multilib toolchain dedicated for bare-metal embedded applications would have been:

```
riscv-none-embed-
```

To reduce confusion, and to differentiate from the `riscv64-unknown-elf-gcc` which is tightly coupled with a  `libgloss` implemented with kernel traps, the **GNU MCU Eclipse RISC-V Embedded GCC** toolchain, starting with the [7.2.0-1-20171109 release](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/tag/v7.2.0-1-20171109) adopted this name.

## `-march` and `-mabi`

The RISC-V design is not a single architecture, but a family of architectures, with optional components, identified by letters.

RISC-V ISA strings begin with either RV32I, RV32E, RV64I, or RV128I indicating the supported address space size in bits for the base integer ISA.

* RV32I: A load-store ISA with 32, 32-bit general-purpose integer registers. 
* RV32E: An embedded flavor of RV32I with only 16 integer registers. 
* RV64I: A 64-bit flavor of RV32I where the general-purpose integer registers are 64-bit wide. 

In addition to these base ISAs, a handful of extensions have been 
specified. The extensions that have both been specified and are supported by the toolchain are: 

* M - Integer Multiplication and Division 
* A - Atomics
* F - Single-Precision Floating-Point 
* D - Double-Precision Floating-Point
* C - 16-bit Compressed Instructions 

* G - General, a shortcut to IMAFD

RISC-V ISA strings are defined by appending the supported extensions to the 
base ISA in the order listed above. For example, the RISC-V ISA with 32, 
32-bit integer registers and the instructions to for multiplication would 
be denoted as "RV32IM". Users can control the set of instructions that GCC 
uses when generating assembly code by passing the lower-case ISA string to 
the `-march` GCC option: for example `-march=rv32im`. 

For more details, please see [The RISC-V Instruction Set Manual, Volume I: User-Level ISA, Document Version 2.2](https://riscv.org/specifications/).

In addition to controlling the instructions available to GCC during code 
generating (which defines the set of implementations the generated code 
will run on), users can select from various ABIs to target (which defines 
the calling convention and layout of objects in memory). Objects and 
libraries may only be linked together if they follow the same ABI. 

RISC-V defines two integer ABIs and three floating-point ABIs, which 
together are treated as a single ABI string. The integer ABIs follow the 
standard ABI naming scheme: 

* `ilp32`: "int", "long", and pointers are all 32-bit long. "long long" is 
a 64-bit type, "char" is 8-bit, and "short" is 16-bit. 
* `lp64`: "long" and pointers are 64-bit long, while "int" is a 32-bit type. 
The other types remain the same as ilp32. 

while the floating-point ABIs are a RISC-V specific addition: 

* "" (the empty string): No floating-point arguments are passed in registers. 
* `f`: 32-bit and smaller floating-point arguments are passed in registers. 
This ABI requires the F extension, as without F there are no 
floating-point registers. 
* `d`: 64-bit and smaller floating-point arguments are passed in registers. 
This ABI requires the D extension. 

Just like ISA strings, ABI strings are concatenated together and passed via 
the `-mabi` argument to GCC. For example: 

* `-march=rv32imafdc -mabi=ilp32d`: Hardware floating-point instructions can 
be generated and floating-point arguments are passed in registers. This 
is like the `-mfloat-abi=hard` option to ARM's GCC. 
* `-march=rv32imac -mabi=ilp32`: No floating-point instructions can be 
generated and no floating-point arguments are passed in registers. This 
is like the `-mfloat-abi=soft` argument to ARM's GCC. 
* `-march=rv32imafdc -mabi=ilp32`: Hardware floating-point instructions can 
be generated, but no floating-point arguments will be passed in 
registers. This is like the `-mfloat-abi=softfp` argument to ARM's GCC, 
and is usually used when interfacing with soft-float binaries on a 
hard-float system. 
* `-march=rv32imac -mabi=ilp32d`: Illegal, as the ABI requires floating-point 
arguments are passed in registers but the ISA defines no floating-point 
registers to pass them in. 

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
