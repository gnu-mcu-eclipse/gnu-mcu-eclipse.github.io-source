---
layout: page
permalink: /downloads/
title: How to download the binary files?
author: Liviu Ionescu

date: 2015-09-10 19:54:00 +0300

---

## Quicklinks

If you know what this is all about, the download pages are:

* [GNU MCU Eclipse IDE for C/C++ Developers](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/)
* [GNU MCU Eclipse plug-ins](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/)
* [GNU MCU Eclipse Windows Build Tools](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/)
* [xPack GNU Arm Embedded GCC](https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/)
* [xPack GNU RISC-V Embedded GCC](https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/)
* [xPack OpenOCD](https://github.com/xpack-dev-tools/openocd-xpack/releases/)
* [xPack QEMU Arm](https://github.com/xpack-dev-tools/qemu-arm/releases/)

## Overview

During the various install or update steps, it will be necessary to access the binary files with the new releases.

There are two methods:

* **automatic** downloads, via the Eclipse update mechanism, to install and update the Eclipse plug-ins
* **manual** downloads, to install various tools (like OpenOCD/QEMU/Windows Build Tools/etc)

## Eclipse IDE for C/C++

The simplest way to install the plug-ins is to download **GNU MCU Eclipse IDE for C/C++ Developers** from [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/) and you get at once both Eclipse CDT and the MCU plug-ins.

## Eclipse Marketplace

The second option is to use the [Eclipse Marketplace](https://marketplace.eclipse.org/content/gnu-mcu-eclipse).

To access the Marketplace from within Eclipse, use the Eclipse menu **Help** → **Eclipse marketplace...** and search for **GNU MCU**.

## Eclipse update site

The Eclipse update site is currently hosted on Bintray, to make use of the wide network of mirror sites they provides. The public URL is:

- `http://gnu-mcu-eclipse.netlify.com/v4-neon-updates`

![GNU MCU Eclipse updates URL]({{ site.baseurl }}/assets/images/2015/install-new-software-updates-url.png)

## GitHub Releases pages

For all other manual downloads, the binary files are published as **GitHub Releases**, for each project.

For example, to access the QEMU binaries:

- go to the **xPack QEMU Arm** project at [xpack-dev-tools/qemu-arm](https://github.com/xpack-dev-tools/qemu-arm)
- be sure you are in the **Code** view; if not, select the right side `<>` code icon
- identify the [releases](https://github.com/xpack-dev-tools/qemu-arm/releases) link in the upper line:
  ![Code releases link]({{ site.baseurl }}/assets/images/2015/github-qemu-code-tab-releases.png)
- click the releases link; this will show the Releases view, with the **Latest release** at the top of the page:
  ![The Latest release view. ]({{ site.baseurl }}/assets/images/2015/github-qemu-code-tab-latest-release.png)
- in the left side the release is identified by the associated Git tag and commit ID
- the release description is usually a single phrase brief; for more details regarding the release, it is highly recommended to click the **Continue reading »** link and read the full release page
- the actual binary files are listed in the **Downloads** section; click the desired file and download it with the browser.

## Previous releases

As per the GitHub paradigm, each new release is identified by a unique Git tag, linked to a given Git commit, so **all previous releases are usually preserved**, and remain available mainly for archiving purposes.

## Partial releases

Sometimes tools releases include fixes affecting only a limited number of platforms; to save space, binaries for the platforms that did not include changes are not duplicated, and should be searched for and downloaded from previous releases. Scroll down the browser windows, possibly to the **Next** page and identify the release that provides the binaries for the desired platform.

![The Latest release view. ]({{ site.baseurl }}/assets/images/2015/github-qemu-code-tab-partial-release.png)

## Deprecated SourceForge files

The previous **Files** section in the **SourceForge** project is now deprecated and will be preserved only for archiving purposes; it will no longer be maintained and future releases will not be published there.

It is highly recommended to use only the **GitHub Releases** pages for all downloads.
