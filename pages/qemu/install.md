---
layout: page
title: How to install the QEMU binaries?
permalink: /qemu/install/

date: 2015-09-04 17:03:00 +0300

---

## Overview

The **GNU MCU Eclipse QEMU** is a fork of the public open-source 
[QEMU](https://www.qemu.org) project, customised for more support of 
Cortex-M cores, and a better integration with the 
**GNU MCU QEMU Debugging** plug-in.

## The xPack install 

This method uses the portable tool [xpm](https://www.npmjs.com/package/xpm), 
the **xPack Package Manager**, and can be used on Windows, macOS and GNU/Linux.

```console
$ xpm install --global @gnu-mcu-eclipse/qemu
```

This will always install the latest available version, in the central 
xPacks repository, which is a platform dependent folder:

* Windows: `%APPDATA%\xPacks` (like `C:\Users\ilg\AppData\Roaming\xPacks`)
* macOS: `${HOME}/Library/xPacks`
* GNU/Linux: `${HOME}/opt/xPacks`

Note: This location is configurable using the environment variable 
`XPACKS_REPO_FOLDER`; for more details please check the 
[xpm folders](https://xpack.github.io/xpm/files/folders/) page.

The actual binaries are extracted from the distribution archive in a 
folder named `.content`, located in the versioned xPack folder. On some
platforms, dotted files are hidden by default, so the file explorer might
require additional settings to make them visible.

> Windows antivirus warning: aggressive antiviruses may prevent
  xpm to install binary xPacks; see [FAQ]({{ site.baseurl }}/support/faq/)

## Manual install

The all platforms, **GNU MCU Eclipse QEMU** is released as a portable 
archive that can be installed in any location.

The archives can be downloaded from 
[GitHub Releases](https://github.com/gnu-mcu-eclipse/qemu/releases) page.

![The QEMU Releases page]({{ site.baseurl }}/assets/images/2019/github-qemu-release.png)

### Windows

The Windows versions of **GNU MCU Eclipse QEMU** are packed as ZIP files. 
Download the latest version named like:

- `gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win32.zip`
- `gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win64.zip`

Select the `-win64` file for Windows x64 machines and the `-win32` file 
for Windows x32 machines.

Unpack the archive and copy it into the 
`%userprofile%\AppData\Roaming\GNU MCU Eclipse` (for example 
`C:\Users\ilg\AppData\Roaming\GNU MCU Eclipse`) folder; according 
to Microsoft, `AppData\Roaming` is the recommended location for installing 
user specific packages;

> Note: although perfectly possible to install QEMU in any folder, it 
is highly recommended to use this path, since by default the plug-in 
searches for the executable in this location.

The result is a structure like:

![QEMU Windows folders layout]({{ site.baseurl }}/assets/images/2019/windows-qemu-install-folders.png)

To check if QEMU starts, use the following command:

```console
C:\Users\ilg>"C:\Users\ilg\AppData\Roaming\GNU MCU Eclipse\QEMU\2.8.0-4-20190211-0633\bin\qemu-system-gnuarmeclipse.exe" --version
GNU MCU Eclipse 64-bits QEMU emulator version 2.8.0-4 (v2.8.0-3-20180523-6-gee07085299-dirty)
Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers
```

#### Drivers

For usual Cortex-M emulation, there are no special drivers required.

### macOS

The macOS version of **GNU MCU Eclipse QEMU** is packed as a TGZ archive. 
Download the latest version named like:

-  `gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-macos.tgz`

To install QEMU, unpack the archive and copy it to 
`/${HOME}/opt/gnu-mcu-eclipse/qemu/${version}`:

```console
$ mkdir -p ${HOME}/opt
$ cd ${HOME}/opt
$ tar xvf ~/Downloads/gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-macos.tgz
$ chmod -R -w gnu-mcu-eclipse/qemu/2.8.0-4-20190211-0633
```

> Note: although perfectly possible to install QEMU in any folder, it is 
highly recommended to use this path, since by default the plug-in searches 
for the executable in this location.

To check if QEMU starts, use:

```console
$ ${HOME}/opt/gnu-mcu-eclipse/qemu/2.8.0-4-20190211-0633/bin/qemu-system-gnuarmeclipse --version
GNU MCU Eclipse 64-bits QEMU emulator version 2.8.0-4 (v2.8.0-3-20180523-6-gee07085299-dirty)
Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers
```

### GNU/Linux

The GNU/Linux versions of **GNU MCU Eclipse QEMU** are packed as TGZ 
archives. Download the latest version named like:

- `gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-centos32.tgz`
- `gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-centos64.tgz`

As the name implies, these are CentOS `tar.gz` archives, but can be 
executed on most recent GNU/Linux distributions (they were tested on 
Debian, Ubuntu, Manjaro, SuSE and Fedora). Select the `-centos64` file 
for 64-bit machines and the `-centos32` file for 32-bit machines.

To install QEMU, unpack the archive and copy it to  `/${HOME}/opt/gnu-mcu-eclipse/qemu/${version}`:

```console
$ mkdir -p ${HOME}/opt
$ cd ${HOME}/opt
$ tar xvf ~/Downloads/gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-centos64.tgz
$ chmod -R -w gnu-mcu-eclipse/qemu/2.8.0-4-20190211-0633
```

> Note: although perfectly possible to install QEMU in any folder, it is 
highly recommended to use this path, since by default the plug-in searches 
for the executable in this location.

To check if QEMU starts and is recent, use:

```console
$ ${HOME}/opt/gnu-mcu-eclipse/qemu/2.8.0-4-20190211-0633/bin/qemu-system-gnuarmeclipse --version
GNU MCU Eclipse 64-bits QEMU emulator version 2.8.0-4 (v2.8.0-3-20180523-6-gee07085299-dirty)
Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers
```

#### UDEV & Drivers

For usual Cortex-M emulation, there are no special UDEV definitions or 
drivers required.

## QEMU Debugging plug-ins

The QEMU debugging **plug-ins are not included** in these packages, and 
need to be installed [as usual]({{ site.baseurl }}/plugins/install/). 
Be sure that the **GNU MCU C/C++ QEMU Debugging** plug-ins are selected.

![Install the QEMU plug-ins]({{ site.baseurl }}/assets/images/2019/install-new-software-updates-qemu.png)

## Update QEMU path

Right after installing QEMU, or updating to a new version, it is necessary 
to inform Eclipse where the binaries were installed. If QEMU was installed 
in the default location, Eclipse has a mechanism to autodetect the most 
recent version, but this mechanism sometimes fails, and manual path 
setting is necessary.

To set the path, first exit Eclipse, and start it again, to allow the 
autodetect mechanism to give it a try:

* in the _Eclipse_ menu, go to **(Window →) Preferences** → **MCU** → 
**Global QEMU Path** (or **Workspace QEMU Path**)

  ![The QEMU preferences page]({{ site.baseurl }}/assets/images/2018/qemu-preferences.png)

* click the **Restore Defaults** button

For more details please refer to the 
[QEMU plug-in]({{ site.baseurl }}/debug/qemu/#define-the-qemufolder-location) 
page, where the entire procedure is explained.

