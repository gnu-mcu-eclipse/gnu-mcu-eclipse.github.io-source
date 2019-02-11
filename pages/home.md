---
layout: main
permalink: /
title: GNU ARM → GNU MCU Eclipse!
author: Liviu Ionescu

date: 2015-09-07 18:31:00 +0300

---

![RISC-V logo]({{ site.baseurl }}/assets/images/2017/riscv-64x64.png){:class="right-align-image"}Starting with Eclipse plug-ins v4.x, the project was enhanced with support for [RISC-V](https://riscv.org) devices, thus the new **MCU** name, more appropriate for a multi-platform project. For more details, see the [RISC-V Corner]({{ site.baseurl }}/arch/riscv/) and [RISC-V GCC]({{ site.baseurl }}/toolchain/riscv/) page.

**GNU MCU Eclipse** is an open source project that includes a family of Eclipse plug-ins and tools for multi-platform embedded ARM and RISC-V development, based on GNU toolchains. This project is hosted on [GitHub](https://github.com/gnu-mcu-eclipse). The former project was hosted on [GitHub](https://github.com/gnuarmeclipse) and [SourceForge](http://sourceforge.net/projects/gnuarmeclipse/).

## The GNU MCU Eclipse plug-ins

![RISC-V logo]({{ site.baseurl }}/assets/images/2017/gme-64.png){:class="right-align-image"}These plug-ins provide Eclipse CDT (C/C++ Development Tooling) extensions for GNU embedded toolchains like [GNU Tools for ARM Embedded Processors](https://developer.arm.com/open-source/gnu-toolchain/gnu-arm-embedded-toolchain), **Linaro**, [GNU MCU Eclipse RISC-V Embedded GCC]({{ site.baseurl }}/toolchain/riscv/), etc.

In short, the GNU MCU Eclipse plug-ins allow to create, build, debug and in general to **manage ARM & RISC-V projects** (executables and static/shared libraries, in both 32 and 64-bit versions) with the Eclipse framework (currently tested up to Eclipse 4.10 2018-12). The plug-ins run on Windows, macOS and GNU/Linux. For more details please visit the [Features]({{ site.baseurl }}/plugins/features/) page.

![Create new STM32F4 C++ project]({{ site.baseurl }}/assets/images/2017/intro-new-riscv-project.png)

## Additional tools

Apart from the main Eclipse plug-ins, this project also includes several additional tools, distributed as separate packages.

* **GNU MCU Eclipse RISC-V Embedded GCC**

  The **GNU MCU Eclipse RISC-V Embedded GCC** subproject is a new distribution of the bare metal version of [RISC-V GCC](https://github.com/riscv/riscv-gcc), maintained by [SiFive](https://www.sifive.com). Binaries for Windows, macOS and GNU/Linux are available.

* **GNU MCU Eclipse Windows Build Tools**

  The **GNU MCU Eclipse Windows Build Tools** subproject includes the additional tools required to perform builds on Windows (**make** & **rm**).

* **GNU MCU Eclipse OpenOCD**

  The **GNU MCU Eclipse OpenOCD** subproject is a new distribution of [OpenOCD](http://openocd.org/), customised for a better/more convenient integration with the **GNU ARM OpenOCD Debugging** plug-in. It also includes the code from the [RISC-V OpenCOD](https://github.com/riscv/riscv-openocd) project, required to support debugging for the RISC-V devices. Binaries for Windows, macOS and GNU/Linux are available.

* **GNU MCU Eclipse QEMU**

  The **GNU MCU Eclipse QEMU** subproject is a fork of [QEMU](http://wiki.qemu.org/Main_Page) (an open source machine emulator), intended to provide support for Cortex-M emulation in GNU MCU Eclipse. Binaries for Windows, macOS and GNU/Linux are available.

  ![The STM32F4-Discovery 4 LEDs]({{ site.baseurl }}/assets/images/2015/stm32f4-discovery-leds.png)

## Let us know if you enjoyed it!

We definitely enjoyed working on the project! If you successfully 
installed **GNU MCU Eclipse** and enjoyed using it, please let us know; 
here are some advices:

* the best way to praise us would be to **donate** - if you want to speed 
  up development and future versions to include more and more great 
  features, please consider donating; any contribution, small or 
  generous, will be highly appreciated;
* **star** the project using the 
  [GitHub Stars](https://github.com/gnu-mcu-eclipse/eclipse-plugins/stargazers);
* **follow** the project on [Twitter](https://twitter.com/gnu_mcu_eclipse), to
  get notifications on new releases;
* **like** the project on [Facebook](https://www.facebook.com/gnu-mcu-eclipse).

Thank you,

Liviu Ionescu
