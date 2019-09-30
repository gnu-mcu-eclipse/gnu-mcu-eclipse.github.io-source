---
layout: page
permalink: /install/
title: How to install GNU MCU Eclipse?
author: Liviu Ionescu

date: 2015-09-16 20:56:00 +0300

---

## Overview

For more flexibility and upgradeability, GNU MCU Eclipse is not packed
as a all-inclusive suite to be installed in a single step. However,
the separate steps are relatively easy to perform, and installing
the plug-ins and the tools can be successfully completed even by
non-experienced users.

> Note for beginners: If performed for the first time, it is
recommended to follow the steps **by the book** and avoid
_poetic licenses_, since they might lead to tricky situations
and subtle functional problems.

The recommended sequence is described below.

## xpm - the xPack Manager

`xpm` is a new tool, currently under development, intended to manage
software packages (xPacks), including to install binary distributions.
It is built on top of [Node.js](https://nodejs.org/) and is highly
portable; the install steps are described in the xpm 
[install page](https://xpack.github.io/xpm/install/).

> Warning for GNU/Linux users: your distribution may already have
a `node` binary installed; if
it is not >= 8.x, `xpm` will complain and do not start; anyway, we strongly
recommend to avoid the distribution binary and install at least
the LTS package from Node.js.

> Warning for Windows users: binary packages are .zip files containing
.exe files; some aggressive antivirus programs may quarantine those
files, or even modify the content of the archives, thus changing the
checksum and thus preventing the packages to be installed; either
configure or temporarily disable the antivirus if necessary.

Currently `xpm` is not mandatory, but it is a useful addition since
it provides a convenient way to install and later upgrade the ARM
and RISC-V toolchains, OpenOCD, QEMU and the Windows Build Tools.

## xPack Dev Tools

In mid-2019, the main binary tools were moved from the GNU MCU Eclipse
project to xPack project, and all new releases are available via the
`@xpack-dev-tools` scope.

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

## Toolchain(s)

This is generally mandatory, since most platforms do not come by default
with an embedded GCC toolchain (ARM or RISC-V).

Please follow the steps in the 
[ARM Toolchain install](https://xpack.github.io/arm-none-eabi-gcc/install/) or
[RISC-V Toolchain install](https://xpack.github.io/riscv-none-embed-gcc/install/) page.

For ARM, the easy install method is:

```console
$ xpm install --global @xpack-dev-tools/arm-none-eabi-gcc@latest
```

For RISC-V, the easy install method is:

```console
$ xpm install --global @xpack-dev-tools/riscv-none-embed-gcc@latest
```

## Windows Build Tools

This step is Windows specific, and it is highly recommended to use the
GNU MCU Eclipse Windows Build Tools, and avoid other `make.exe` programs,
even if they apparently work, since subtle differences in path processing
exists between different versions of `make`.

Please follow the steps in the
[How to install the Windows Build Tools]({{ site.baseurl }}/windows-build-tools/install/) page.

The easy install method is:

```console
$ xpm install --global @gnu-mcu-eclipse/windows-build-tools
```

POSIX platforms generally include `make` in the system distribution,
or might require to install some developer packages (for example on
macOS you need to install the Xcode Command Line Tools).

## SEGGER J-Link

SEGGER J-Link is the recommended debugger and, if available, please
follow the steps in the
[How to install the SEGGER J-Link]({{ site.baseurl }}/debug/jlink/install) page.

## OpenOCD

For the unfortunate developers who do not have a J-Link available,
the alternative is to follow the steps in the
[How to install the OpenOCD binaries](https://xpack.github.io/openocd/install/) page.

The easy install method is:

```console
$ xpm install --global @xpack-dev-tools/openocd@latest
```

OpenOCD might be needed when using development boards with integrated
debuggers, like STM32F4-DISCOVERY boards, although the recommended
solution is to prepare a
[custom cable]({{ site.baseurl }}/developer/j-link-stm32-boards)
and connect them to J-Link.

OpenOCD is also needed when using RISC-V boards with integrated debuggers.

## QEMU

QEMU is a hardware emulator that can be successfully used to run
simple _blinky_ applications, and the default tutorial requires
QEMU, so it is highly recommended to install it.

The easy install method is:

```console
$ xpm install --global @xpack-dev-tools/qemu-arm@latest
```

For more details, please follow the steps in the
[How to install the QEMU binaries](https://xpack.github.io/qemu-arm/install/) page.

## Jumper Virtual Lab

[Jumper Virtual lab](https://jumper.io) is an emulator that provides a
fast and easy way to execute firmware files on a virtual device running
on the development machine. Jumper's Eclipse plug-in uses the debug
framework provided by the GNU MCU Eclipse plug-ins.

To install the Jumper Virtual Lab, use the following links:

* [Create an account](https://vlab.jumper.io)
* [How to install](https://docs.jumper.io/docs/install.html)

_Jumper Virtual lab_ is a product of Jumper Labs Ltd, a third party
company not directly related to GNU MCU Eclipse. For questions and
further info, please contact Jumper Labs via their support channels.

## Java

As a prerequisite for Eclipse, Java is required.

Java is no longer a very _hot_ technology, so it is generally not available
by default on most platforms and requires separate installation.

More details are available in the 
[How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

## Eclipse & CDT

Eclipse is the development platform where the GNU MCU Eclipse plug-ins run.
Generally it is not available by default on most platforms and requires
separate installation.

The simple way is to download **GNU MCU Eclipse IDE for C/C++ Developers**
from [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/)
and you get at once both Eclipse CDT and the MCU plug-ins.

If you prefer the manual way, be sure you install the
**Eclipse IDE for C/C++ Developers**, not other package, since otherwise
you'll have to manually install CDT.

More details are available in the
[How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

> Note: on GNU/Linux be sure you manually install the Eclipse;
**DO NOT** try to install it via the Synaptics package manager, or
similar, since usually you get an older version and the CDT plug-ins
are not included.

## Plug-ins

Once the Java & Eclipse are functional, please proceed with plug-ins
install, as explains in the
[How to install the GNU MCU Eclipse plug-ins]({{ site.baseurl }}/plugins/install/) page.

## Workspace preferences

It is highly recommended that this step be performed after creating
each and any Eclipse workspace; for this please follow the steps in the
[Workspace preferences]({{ site.baseurl }}/eclipse/workspace/preferences) page.

## CMSIS packages

To assist the debugger in finding the peripheral registers definitions,
please check the
[The CMSIS Packs manager]({{ site.baseurl }}/plugins/packs-manager/)
page, and install the CMSIS packs for the family of devices used by your
projects.
