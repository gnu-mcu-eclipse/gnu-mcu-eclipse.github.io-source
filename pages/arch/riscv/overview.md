---
layout: page
title: The RISC-V corner
permalink: /arch/riscv/

date: 2017-07-07 19:46:00 +0300

---

## What is RISC-V?

![RISC-V logo]({{ site.baseurl }}/assets/images/2017/riscv-64x64.png){:class="right-align-image"}RISC-V (pronounced "risk-five") is an open instruction set architecture (ISA) based on established reduced instruction set computing (RISC) principles.

![SiFive logo]({{ site.baseurl }}/assets/images/2017/sifive-logo-v1-64.png){:class="right-align-image"}RISC-V is governed by the non-profit RISC-V foundation and it’s member companies after being originally developed at the University of California, Berkeley. SiFive, a significant contributor to the RISC-V foundation, manufactured the first commercially available RISC-V SoC, the Freedom E310.

## License

In contrast to most ISAs, the RISC-V ISA can be freely used for any purpose, permitting anyone to design, manufacture and sell RISC-V chips and software. The RISC-V authors aim to provide several CPU designs freely available under a [BSD license](https://en.wikipedia.org/wiki/BSD_license).

## Chips & boards

The GNU MCU Eclipse currently supports the following devices:

* SiFive Freedom E310, RV32IMAC, a 32-bit embedded processor
* SiFive E31 Coreplex, RV32IMAC, a Verilog synthesised 32-bit embedded processor
* SiFive E51 Coreplex, RV64IMAC, a a Verilog synthesised 64-bit embedded processor

The following boards are supported:

* SiFive HiFive1, an Arduino-compatible development kit featuring the Freedom E310

![HiFive1]({{ site.baseurl }}/assets/images/2017/hifive1-top-view.png)

* Xilinx/Digilent [Artix-7 35T Arty FPGA Evaluation Kit](https://www.xilinx.com/products/boards-and-kits/arty.html), a board capable of running the synthesised E31/E51 devices.

## Tips & tricks

* [Programmer]({{ site.baseurl }}/arch/riscv/programmer/) - programmer info
* [Flashing the Arty boards]({{ site.baseurl }}/arch/riscv/arty-reflash/) - a solution to reprogram the Arty board without Xilinx Vivado
* [Arty JTAG adapter]({{ site.baseurl }}/arch/riscv/arty-jtag-adapter/) - a solution to connect a standard JTAG ribon cable to an Arty board
* [FTDI JTAG drivers]({{ site.baseurl }}/arch/riscv/ftdi-jtag-drivers/) - workaround to reconfigure the FTDI as JTAG programmer

## Links

* [RISC-V specs & tools](https://riscv.org/specifications/)
* [SiFive Software Development Tools](https://www.sifive.com/products/tools/)

Manuals

* [The RISC-V Instruction Set Manual, Volume I: User-Level ISA, Document Version 2.2](https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf) (read [online](https://riscv.org/wp-content/plugins/pdf-viewer/stable/web/viewer.html?file=https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf#page=1&zoom=auto,-16,798))
* [The RISC-V Instruction Set Manual, Volume II: Privileged Architecture, Version1.10](https://content.riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf) (read [online](https://riscv.org/wp-content/plugins/pdf-viewer/stable/web/viewer.html?file=https://content.riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf#page=2&zoom=auto,-16,772))
* [Arty Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/arty/reference-manual)

## Downloads

* [GNU MCU Eclipse IDE for C/C++ Developers](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases)
* [GNU MCU Eclipse plug-ins](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases)
* [GNU MCU Eclipse RISC-V Embedded GCC](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases)
* [GNU MCU Eclipse OpenOCD](https://github.com/gnu-mcu-eclipse/openocd/releases)
* [GNU MCU Eclipse Windows Build Tools](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases)

