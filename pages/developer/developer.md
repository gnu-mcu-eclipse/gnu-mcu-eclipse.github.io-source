---
layout: page
permalink: /developer/
title: GNU MCU Eclipse Developer page
author: Liviu Ionescu

date: 2015-09-10 18:31:00 +0300

---

## Under the hood

### Runtime preferences

* [How Eclipse runtime preferences and defaults work]({{ site.baseurl }}/developer/eclipse/runtime-preferences)

pre v4

* [ilg.gnuarmeclipse.managedbuild.cross]({{ site.baseurl }}/developer/preferences/ilg.gnuarmeclipse.managedbuild.cross) persistent values & toolchain ids
* [ilg.gnuarmeclipse.debug.gdbjtag.jlink]({{ site.baseurl }}/developer/preferences/ilg.gnuarmeclipse.debug.gdbjtag.jlink) persistent values (workspace)
* [ilg.gnuarmeclipse.debug.gdbjtag.openocd]({{ site.baseurl }}/developer/preferences/ilg.gnuarmeclipse.debug.gdbjtag.openocd) persistent values (workspace)
* [ilg.gnuarmeclipse.debug.gdbjtag.qemu]({{ site.baseurl }}/developer/preferences/ilg.gnuarmeclipse.debug.gdbjtag.qemu) persistent values (workspace)

v4

* [ilg.gnumcueclipse.managedbuild.cross.riscv]({{ site.baseurl }}/developer/preferences/ilg.gnumcueclipse.managedbuild.cross.riscv) persistent values & toolchain ids
* [ilg.gnumcueclipse.debug.gdbjtag.jlink]({{ site.baseurl }}/developer/preferences/ilg.gnumcueclipse.debug.gdbjtag.jlink) persistent values (workspace)
* [ilg.gnumcueclipse.debug.gdbjtag.openocd]({{ site.baseurl }}/developer/preferences/ilg.gnumcueclipse.debug.gdbjtag.openocd) persistent values (workspace)
* [ilg.gnumcueclipse.debug.gdbjtag.qemu]({{ site.baseurl }}/developer/preferences/ilg.gnumcueclipse.debug.gdbjtag.qemu) persistent values (workspace)

### Debugging options

* [How Eclipse debugging options work]({{ site.baseurl }}/developer/eclipse/debugging-options)
* [Eclipse platform tracing facility](https://wiki.eclipse.org/FAQ_How_do_I_use_the_platform_debug_tracing_facility)

### GNU MCU Eclipse extension points

The GNU MCU Eclipse plug-ins define several custom extension points, to facilitate the integration with third-party plug-ins.

* [ilg.gnumcueclipse.debug.core.cprojectExtra]({{ site.baseurl }}/developer/extension/ilg.gnumcueclipse.debug.core.cprojectextra) (C Project Extra Data Manager)
* [ilg.gnumcueclipse.debug.core.svdPath]({{ site.baseurl }}/developer/extension/ilg.gnumcueclipse.debug.core.svdpath) (SVD Path Manager)

## Miscellaneous

* [Eclipse Development Tips & Tricks]({{ site.baseurl }}/developer/eclipse/tips-tricks)
* [PAD file]({{ site.baseurl }}/developer/pad-file)

## Issues

* [eclipse-plugins.git](https://github.com/gnu-mcu-eclipse/eclipse-plugins/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/eclipse-plugins.svg)](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/eclipse-plugins.svg)](https://github.com/gnu-mcu-eclipse/eclipse-plugins/pulls/) [![Build Status](https://travis-ci.org/gnu-mcu-eclipse/eclipse-plugins.svg?branch=develop)](https://travis-ci.org/gnu-mcu-eclipse/eclipse-plugins/) 
* [gnu-mcu-eclipse.github.io-source.git](https://github.com/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source.svg)](https://github.com/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source/issues/) [![GitHub pull](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source.svg)](https://github.com/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source/pulls/) [![Build Status](https://travis-ci.org/gnu-mcu-eclipse/eclipse-plugins.svg?branch=develop)](https://github.com/gnu-mcu-eclipse/gnu-mcu-eclipse.github.io-source/issues/) 
* [openocd.git](https://github.com/gnu-mcu-eclipse/openocd/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/openocd.svg)](https://github.com/gnu-mcu-eclipse/openocd/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/openocd.svg)](https://github.com/gnu-mcu-eclipse/openocd/pulls/)
* [openocd-build.git](https://github.com/gnu-mcu-eclipse/openocd-build/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/openocd-build.svg)](https://github.com/gnu-mcu-eclipse/openocd-build/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/openocd-build.svg)](https://github.com/gnu-mcu-eclipse/openocd-build/pulls/)
* [qemu.git](https://github.com/gnu-mcu-eclipse/qemu/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/qemu.svg)](https://github.com/gnu-mcu-eclipse/qemu/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/qemu.svg)](https://github.com/gnu-mcu-eclipse/qemu/pulls/)
* [qemu-build.git](https://github.com/gnu-mcu-eclipse/qemu-build/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/qemu-build.svg)](https://github.com/gnu-mcu-eclipse/qemu-build/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/qemu-build.svg)](https://github.com/gnu-mcu-eclipse/qemu-build/pulls/)
* [windows-build-tools.git](https://github.com/gnu-mcu-eclipse/windows-build-tools/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/windows-build-tools.svg)](https://github.com/gnu-mcu-eclipse/windows-build-tools/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/windows-build-tools.svg)](https://github.com/gnu-mcu-eclipse/windows-build-tools/pulls/)
* [riscv-none-gcc-build.git](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/) [![GitHub issues](https://img.shields.io/github/issues/gnu-mcu-eclipse/riscv-none-gcc-build.svg)](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/issues/) [![GitHub pulls](https://img.shields.io/github/issues-pr/gnu-mcu-eclipse/riscv-none-gcc-build.svg)](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build/pulls/)

(Badges from [shields.io](http://shields.io))

## Analytics

* [eclipse-plugins.git](https://github.com/gnu-mcu-eclipse/eclipse-plugins/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/eclipse-plugins/latest/total.svg)](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/eclipse-plugins/total.svg)](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/) [![Eclipse Marketplace](https://img.shields.io/eclipse-marketplace/dt/gnu-mcu-eclipse.svg?label=marketplace)](https://github.com/gnu-mcu-eclipse/eclipse-plugins/)
* [org.eclipse.epp.packages.git](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/org.eclipse.epp.packages/latest/total.svg)](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/org.eclipse.epp.packages/total.svg)](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/)
* [openocd.git](https://github.com/gnu-mcu-eclipse/openocd/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/openocd/latest/total.svg)](https://github.com/gnu-mcu-eclipse/openocd/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/openocd/total.svg)](https://github.com/gnu-mcu-eclipse/openocd/releases/)
* [qemu.git](https://github.com/gnu-mcu-eclipse/qemu/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/qemu/latest/total.svg)](https://github.com/gnu-mcu-eclipse/qemu/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/qemu/total.svg)](https://github.com/gnu-mcu-eclipse/qemu/releases/)
* [windows-build-tools.git](https://github.com/gnu-mcu-eclipse/windows-build-tools/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/windows-build-tools/latest/total.svg)](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/windows-build-tools/total.svg)](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/)
* [riscv-none-gcc.git](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/riscv-none-gcc/latest/total.svg)](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/) [![Github All Releases](https://img.shields.io/github/downloads/gnu-mcu-eclipse/riscv-none-gcc/total.svg)](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/)

## How to build

How to build the plug-ins from sources and publish them.

* [Prerequisites]({{ site.baseurl }}/developer/build-prerequisites)
* [How to build]({{ site.baseurl }}/developer/build-procedure)
* [How to publish]({{ site.baseurl }}/developer/publish-procedure)
* [Development environment]({{ site.baseurl }}/developer/development-environment)
* [Change log]({{ site.baseurl }}/developer/change-log) ([2014]({{ site.baseurl }}/developer/change-log/2014)) ([2013]({{ site.baseurl }}/developer/change-log/2013)) ([v0.5.x]({{ site.baseurl }}/developer/change-log/v05x))

## Hardware

* [J-Link and STM32 boards]({{ site.baseurl }}/developer/j-link-stm32-boards) (how to build a cable to connect the J-Link to STM32 DISCOVERY and NUCLEO boards)

## References

### Eclipse

*   [Eclipse.org Wiki](http://wiki.eclipse.org/Main_Page)
*   [Eclipse User Interface Guidelines](http://wiki.eclipse.org/User_Interface_Guidelines)
*   [SWT Widgets](http://www.eclipse.org/swt/widgets/)
*   [Eclipse Luna documentation](http://help.eclipse.org/luna/index.jsp)
*   [Introduction to Programming with DSF](http://help.eclipse.org/luna/topic/org.eclipse.cdt.doc.isv/guide/dsf/intro/dsf_programming_intro.html)
*   [CDT DSF debug](http://wiki.eclipse.org/CDT/cdt-debug-dsf-gdb-extensibility)

### Other

*   [ARM CMSIS](http://www.keil.com/pack/doc/cmsis/General/html/index.html)
*   [ARM Connected Community: ARM & Keil Tools](http://community.arm.com/groups/tools/blog)
*   [Google Groups: CMSIS](https://groups.google.com/forum/#!forum/cmsis)
*   [Forge site support \#6343 Project description not propagated to all tools](https://sourceforge.net/p/forge/site-support/6343/)

### Installers

*   [NSIS](https://sourceforge.net/projects/nsis/)
*   [Single Package](http://blogs.msdn.com/b/windows_installer_team/archive/2009/09/02/authoring-a-single-package-for-per-user-or-per-machine-installation-context-in-windows-7.aspx)


### References to GNU MCU Eclipse

- [Getting Started With STM32 Nucleo Development](http://www.amazon.com/Getting-Started-STM32-Nucleo-Development-ebook/dp/B00WBU4BPW)

### Sites for articles

* [ARMConnected Community](https://community.arm.com/welcome) - login, Create a new Blog Post, A place's blog, Software Development Tools, copy/paste markup from site, H2, update links, enter tags
* [Element14](http://www.element14.com/community/groups/gnu-arm-eclipse) - login, the Open Source Software; Write a blog post, copy/paste from ARM, load images, enter tags
* [EmbDev](https://embdev.net/user/login) - New Topic to [Forum: ARM programming with GCC/GNU tools](https://embdev.net/forum/arm-gcc); no pictures; underline headers (no BBCs)
* [EEVblog](http://www.eevblog.com/forum/login/) - [Microcontrollers & FPGAs](http://www.eevblog.com/forum/microcontrollers/); New topic, BBC codes (bold titles, image links to web article), Notify
* [Arduino](http://stm32duino.com/viewforum.php?f=41) - New Topic, copy/paste content from EEVblog; disable signature, enable notifications
* [STM32 MCUs Community](https://community.st.com/community/stm32-community) - Sign in to forum, New Discussion, copy/paste HTML from Arduino (a real mess)

BBC codes:
- `[img width=30]http:⁄⁄wiki.simplemachines.org/smf/images/1/19/Button_media.png[/img]`
- `[url=http://simplemachines.org]text or more BB Code[/url]`

## Releases

* [releases]({{ site.baseurl }}/developer/releases)
