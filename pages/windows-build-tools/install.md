---
layout: page
title: How to install the Windows Build Tools?
permalink: /windows-build-tools/install/

author: Liviu Ionescu

date: 2015-09-04 12:00:00 +0300

redirect-url: https://xpack.github.io/windows-build-tools/install/

---

## Overview

If your development platform is Windows, you need to install two 
additional command line programs, `make` and `rm`, required by the 
Eclipse external builder.

Unfortunately, most current toolchains do not provide these two 
programs in their windows distribution.

On macOS and GNU/Linux these programs are part of the standard 
distributions, either directly or in separate Developer packages, 
so the following steps do not apply.

## The xPack install 

This method uses the portable tool [xpm](https://www.npmjs.com/package/xpm), 
the **xPack Package Manager**, and can be used on Windows, macOS and GNU/Linux.

```console
$ xpm install --global @gnu-mcu-eclipse/windows-build-tools
```

This will always install the latest available version, in the central 
xPacks repository, which is a platform dependent folder:

* Windows: `%APPDATA%\xPacks` (`C:\Users\ilg\AppData\Roaming\xPacks`)

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

### Download the archive

The Windows versions of **GNU MCU Eclipse Windows Build Tools** are packed 
as ZIP files. Go to the 
[GitHub Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases) 
page and download the latest version named like:

- `gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win64.zip`
- `gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win32.zip`

Select the `-win64` file for Windows x64 machines and the `-win32` file for Windows x32 machines.

Unpack the archive and copy it into the `%userprofile%\AppData\Roaming\GNU MCU Eclipse` (for example `C:\Users\ilg\AppData\Roaming\GNU MCU Eclipse`) folder.

Note: although perfectly possible to install the build tools in any folder, 
it is highly recommended to use this path, since by default the plug-in 
searches for the executable in this location.

Note: For manual installs, the recommended install location is different from
the xPack install folder.

### Check version

Check if the tool is functional; go to the folder where you installed the tools and run `make --version`.

```console
C:\Users\ilg\AppData\Roaming\GNU MCU Eclipse\Build Tools\2.10-20180103-1919\bin>make --version
GNU Make 4.1
Built for i686-w64-mingw32
Copyright (C) 1988-2014 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

## User or system path

> **DO NOT update the user or system path!**

As recommended when installing the toolchain, it is also recommended to keep this settings outside the user or system path. Microsoft did not provide these programs in their distribution, and it is better to keep it that way, when you need them just explicitly update the build path to use them.

## Uninstall

The binaries are distributed as portable archives, that do not need to run a setup and do not require an uninstall.

## The echo command

The package also contains an executable for the `echo` command. It is not mandatory for the build to succeed, but it is recommended to have it in the build path, to avoid an annoying CDT bug, that triggers an error during the first build of a new project, claiming that _Program "gcc" not found in PATH_.
