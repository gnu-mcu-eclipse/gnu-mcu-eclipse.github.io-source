---
layout: page
title: DEPRECATED > The GNU MCU Eclipse OpenOCD
permalink: /openocd/

date: 2015-09-04 17:02:00 +0300

---

## Deprecation notice

In mid-2019, the OpenOCD binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new home page is:

* [https://xpack.github.io/openocd/](https://xpack.github.io/openocd/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

## Quicklinks

If you already know the general facts about OpenOCD, you can directly skip to:

* [Install]({{ site.baseurl }}/openocd/install)
* [Eclipse plug-in]({{ site.baseurl }}/debug/openocd)
* [Support](https://github.com/gnu-mcu-eclipse/openocd/issues/1)
* [How to build]({{ site.baseurl }}/openocd/build-procedure) (using Docker containers)
* [Change log]({{ site.baseurl }}/openocd/change-log)
* [Releases]({{ site.baseurl }}/openocd/releases)

## Overview

The **GNU MCU Eclipse OpenOCD** is a new distribution of [OpenOCD](http://openocd.org), customised for a better/more convenient integration with the **GNU ARM OpenOCD Debugging** plug-in.

## Benefits

For Windows and macOS users, the main advantage of using **GNU MCU Eclipse OpenOCD** is the convenient install/uninstall/upgrade procedure.

  * the Windows version is distributed as a setup wizard that handles all install details, including adding the proper keys to the windows registry, that can help the plug-in to automatically discover the OpenOCD location;

![The OpenOCD Windows setup wizard]({{ site.baseurl }}/assets/images/2015/openocd-setup-wizard.png)

  * the macOS version is distributed as a standard .pkg install package.
  

Although most GNU/Linux distributions already provide different versions, we also provide a Debian x64 version of OpenOCD, which, compared to the standard distribution, has the advantage that is a standalone package, that includes all required libraries and can be installed at any location.

## Compatibility

Although it was designed with the GNU MCU Eclipse plug-ins in mind, it can easily be used with any other debugging environment, being fully compatible with the original distribution.

Even more, the Windows version supports the same targets as the version distributed by Freddie Chopin. Similarly, the macOS and GNU/Linux versions support almost the same targets.

## Download

All **GNU MCU Eclipse OpenOCD** versions are available from the [GitHub Releases](https://github.com/gnu-mcu-eclipse/openocd/releases) page. Identify the **Latest release** entry and carefully read the release page.

![The OpenOCD Releases page]({{ site.baseurl }}/assets/images/2015/github-gae-openocd-releases.png)

## Install

The details of installing the **GNU MCU Eclipse OpenOCD** on various platforms are presented in a dedicated [Install]({{ site.baseurl }}/openocd/install) page.

Please note that the OpenOCD debugging **plug-ins are not included** in these packages, and need to be installed as usual.

## Updates

The current stable version of the **GNU MCU Eclipse OpenOCD** packages is 0.9.0. Future versions are planned to follow shortly after new original releases. Development versions based on the current repository content may be available from time to time; they can be identified by the **-dev** suffix used in the file names.

## Change log

The change log is available as a separate [Change log]({{ site.baseurl }}/openocd/change-log) page.

## Build details

For those interested on the procedure used to build these packages, please read the [How to build]({{ site.baseurl }}/openocd/build-procedure) page. However, the ultimate source for details are the build scripts themselves, all available from the [build-scripts Git](https://github.com/gnu-mcu-eclipse/build-scripts/tree/master/scripts).

## Releases

See [Releases]({{ site.baseurl }}/openocd/releases).
