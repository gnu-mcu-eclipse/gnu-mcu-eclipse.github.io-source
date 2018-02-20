---
layout: page
permalink: /install/
title: How to install GNU MCU Eclipse?
author: Liviu Ionescu

date: 2015-09-16 20:56:00 +0300

---

## Overview

For more flexibility and upgradeability, GNU MCU Eclipse is not packed as a all-inclusive suite to be installed in a single step. However, the separate steps are relatively easy to perform, and installing the plug-ins and the tools can be successfully completed even by non-experienced users.

> Note for beginners: If performed for the first time, it is recommended to follow the steps **by the book** and avoid _poetic licenses_, since they might lead to tricky situations and subtle functional problems.

The recommended sequence is described below.

## xpm - the xPack Manager

`xpm` is a new tool, currently under development, intended to manage software packages (xPacks) including to install binary distributions.

Currently `xpm` is not mandatory, but it is a useful addition since it provides a convenient way to install and later update the RISC-V toolchain, OpenOCD and the Windows Build Tools.

`xpm` is built on top of [node.js](https://nodejs.org/) and is highly portable; the install steps are described in the [xpm](https://www.npmjs.com/package/xpm) page.

## Toolchain(s)

This is generally a mandatory step for all platforms, since most platforms do not come by default with an embedded GCC toolchain (ARM or RISC-V).

Please follow the steps in the [ARM Toolchain install]({{ site.baseurl }}/toolchain/arm/install) or [RISC-V Toolchain install]({{ site.baseurl }}/toolchain/riscv/install) page.

For RISC-V, the shortcut is:

```console
$ xpm install @gnu-mcu-eclipse/riscv-none-gcc --global
```

## Windows Build Tools

This step is Windows specific, and it is highly recommended to use the GNU MCU Eclipse Windows Build Tools, and avoid other `make.exe` programs, even if they apparently work, since subtle differences in path processing exists between different versions of `make`.

Please follow the steps in the [How to install the Windows Build Tools]({{ site.baseurl }}/windows-build-tools/install/) page.

The shortcut is:

```console
$ xpm install @gnu-mcu-eclipse/windows-build-tools --global
```

POSIX platforms generally include `make` in the system distribution, or might require to install some developer packages (for example on macOS you need to install the Xcode Command Line Tools).

## SEGGER J-Link

SEGGER J-Link is the recommended debugger and, if available, please follow the steps in the [How to install the SEGGER J-Link]({{ site.baseurl }}/debug/jlink/install) page.

## OpenOCD

For the unfortunate developers who do not have a J-Link available, the alternative is to follow the steps in the [How to install the OpenOCD binaries]({{ site.baseurl }}/openocd/install) page.

```console
$ xpm install @gnu-mcu-eclipse/openocd --global
```

OpenOCD might be needed when using development boards with integrated debuggers, like STM32F4-DISCOVERY boards, although the recommended solution is to prepare a [custom cable]({{ site.baseurl }}/developer/j-link-stm32-boards) and connect them to J-Link.

OpenOCD is also needed when using RISC-V boards with integrated debuggers.

## QEMU

QEMU is a hardware emulator that can be successfully used to run simple _blinky_ applications, and the default tutorial requires QEMU, so it is highly recommended to install it.

Please follow the steps in the [How to install the QEMU binaries]({{ site.baseurl }}/qemu/install/) page.

## Java

As a prerequisite for Eclipse, Java is required.

Java is no longer a very _hot_ technology, so it is generally not available by default on most platforms and requires separate installation.

More details are available in the [How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

## Eclipse & CDT

Eclipse is the development platform where the GNU MCU Eclipse plug-ins run. Generally it is not available by default on most platforms and requires separate installation.

The simple way is to download **GNU MCU Eclipse IDE for C/C++ Developers** from [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/) and you get at once both Eclipse CDT and the MCU plug-ins.

If you prefer the manual way, be sure you install the **Eclipse IDE for C/C++ Developers**, not other package, since otherwise you'll have to manually install CDT.

More details are available in the [How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

> Note: on GNU/Linux be sure you manually install the Eclipse; **DO NOT** try to install it via the Synaptics package manager, or similar, since usually you get an older version and the CDT plug-ins are not included.

## Plug-ins

Once the Java & Eclipse are functional, please proceed with plug-ins install, as explains in the  [How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

## Workspace preferences

As the last install step, but actually a step to be performed after creating each and any Eclipse workspace, it is highly recommended to follow the steps in the [Workspace preferences]({{ site.baseurl }}/eclipse/workspace/preferences) page.
