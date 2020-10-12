---
layout: page
permalink: /openocd/download/
title: DEPRECATED > How to download the GNU MCU Eclipse OpenOCD?
author: Liviu Ionescu

date: 2015-09-16 20:39:00 +0300

redirect-url: https://xpack.github.io/openocd/install/

---

## Deprecation notice

In mid-2019, the OpenOCD binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new home page is:

* [https://xpack.github.io/openocd/](https://xpack.github.io/openocd/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

## GitHub Releases

All versions of the GNU MCU Eclipse OpenOCD are available via the [GitHub Releases](https://github.com/gnu-mcu-eclipse/openocd/releases) page. For details how to reach it, see the [Downloads]({{ site.baseurl }}/downloads/) page.

![OpenOCD Releases]({{ site.baseurl }}/assets/images/2015/github-gae-openocd-releases.png)

## Windows, GNU/Linux, macOS

All major platforms are supported. However releases might not include binaries for all platforms, so navigate to the most recent release which includes support for your platform and download the desired binaries.

## 64/32-bit

If running on a modern 64-bit system, it is highly recommended to download the 64-bit version, since running 32-bit applications on 64-bit systems sometimes fails due to some missing libraries.

For Windows the recommendation stands even stronger, to reduce the risk of 32-bit DLL rebases.

Note: For macOS only the 64-bit Intel binaries are available, and it is recommended to use a recent system.
