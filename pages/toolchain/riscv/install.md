---
layout: page
permalink: /toolchain/riscv/install/
title: How to install the RISC-V toolchain?
author: Liviu Ionescu

date: 2015-09-11 22:49:00 +0300

version-id: 7.2.0-1
version-date: 20171109-1926

---

## Overview

The Eclipse RISC-V build plug-in is highly configurable in terms of toolchain executable names and location, so you can use any 32/64-bits RISC-V GNU toolchain you prefer, but, for better results, the recommended toolchain for **bare metal** target applications is [**GNU MCU Eclipse RISC-V Embedded GCC**](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/). This toolchain closely follows the official [RISC-V distribution](https://github.com/riscv/riscv-gcc) maintained by [SiFive](https://www.sifive.com).


## Target vs host platform

Please note the distinction between the **target platform** and the **host/development platform**.

* the **target** platform defines the environment where the application will be executed, and in general can be either a bare metal (the application sits directly on the hardware and has intimate control of it), and applications that sit on top of an operating system, usually a distribution of GNU/Linux optimised for embedded environments
* the **host/development** platform is the platform where the development tools are executed, usually as cross compilers, and can be, in our case, any platform that supports Eclipse, for example Windows, macOS, GNU/Linux, etc.

> Note: Be sure you select the proper toolchain for the target platform, otherwise builds will not succeed, or the generated applications will fail to run. **Do not** try to use the RISC-V Embedded GCC to build GNU/Linux applications, because the executables will not run on anything than bare metal, and **do not try to use the Linux toolchains for bare metal applications**.

The installation details described below assume the selection of the GNU MCU Eclipse RISC-V Embedded GCC toolchain. For other toolchains, please follow the specific installation instructions.

## riscv64-unknown-elf-gcc

After installing the toolchain, you'll end up with lots of programs prefixed by `riscv-none-embed-`. For those used to the RISC-V original toolchains, there is no `riscv64-` or `riscv32-` prefix since it is actually not needed, the toolchain produces both 32/64-bits binaries, based on `-march` and `-mabi`.

Be sure you **do** select carefully the proper release file to  match the 32/64-bits platform you are using. 

## Download

Due to portability reasons, the GNU MCU Eclipse plug-ins distributions **do not** include any toolchain binaries, but they can be downloaded from [GNU MCU Eclipse RISC-V Embedded GCC](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases).

![RISC-V Releases]({{ site.baseurl }}/assets/images/2017/riscv-releases.png)

## Windows

For Windows, the RISC-V Embedded GCC toolchain is released in two versions: 

* a portable archive that can be installed in any location
* a Windows setup that can install the binaries in the standard system location

Our preferred method is to install the binaries in the user home folder, but your mileage may vary.

### Portable archive

To install the archive, the steps are:

* download the latest `gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-*-win*.zip` file for your platform; if you are using a modern 64-bits machine, use the `*-win64.zip` file, otherwise the `*-win32.zip` (however, the 32-bits toolchain executables also run on 64-bits platforms);
* open the archive in the file explorer
* extract the `GNU MCU Eclipse` folder in `%userprofile%\AppData\Local`

According to Microsoft, this is the recommended location for installing user specific packages, and the GNU MCU Eclipse plug-ins can automatically identify the toolchain if installed in this location.

In addition, the GNU MCU Eclipse plug-ins also check the following locations (POSIX paths):

```
${user.home}/AppData/Local/GNU MCU Eclipse/RISC-V Embedded GCC;\
${user.home}/opt/GNU MCU Eclipse/RISC-V Embedded GCC;\
${user.home}/opt/gnu-mcu-eclipse/riscv-none-gcc;\
${user.home}/local/GNU MCU Eclipse/RISC-V Embedded GCC;\
${user.home}/local/gnu-mcu-eclipse/riscv-none-gcc;\
C:/opt/GNU MCU Eclipse/RISC-V Embedded GCC;\
C:/opt/gnu-mcu-eclipse/riscv-none-gcc;\
C:/Program Files/GNU MCU Eclipse/RISC-V Embedded GCC;\
C:/Program Files (x86)/GNU MCU Eclipse/RISC-V Embedded GCC;\
D:/Program Files/GNU MCU Eclipse/RISC-V Embedded GCC;\
D:/Program Files (x86)/GNU MCU Eclipse/RISC-V Embedded GCC
```

It is recommended to use one of these locations, since the plug-ins will automatically set the default toolchain path to the most recently installed toolchain found in these folders.

### Setup

If you decide to install the toolchain in a system location, you can use the common setup procedure:

* download the latest `gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-{{ page.version-date }}-win*-setup.exe` file for your platform; if you are using a modern 64-bits machine, use the `*-win64-setup.exe` file, otherwise use the `*-win32-setup.exe` (however, the 32-bits toolchain executables also run on 64-bits platforms);
* locate the file (usually in the `...\Downloads\`  folder) and double click it to start the installer
* authenticate with the administrative password, to allow the installer write in system locations
* select the desired language
* confirm that you want to install the toolchain

  ![MS_admin]({{ site.baseurl }}/assets/images/2017/riscv-setup.png)

* accept the terms of the license agreement
* accept the destination folder, usually a version specific sub-folder of `C:\Program Files\GNU MCU Eclipse\RISC-V Embedded GCC`

  > Note: It is highly recommended to **do not change the install path**.

  ![The destination folder]({{ site.baseurl }}/assets/images/2017/riscv-setup-folder.png)

* wait a few moments for the installer to copy all files
* test if the compiler is functional; use the actual install path:

  ```console
C:\>"C:\Program Files\GNU MCU Eclipse\RISC-V Embedded GCC\{{ page.version-id }}-{{ page.version-date }}\bin\riscv-none-embed-gcc.exe" --version
riscv-none-embed-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits)
```

The complete toolchain documentation is available in the `...\share\doc\pdf\` folder.

If you'll ever need to remove the toolchain, there is an **uninstall.exe** program available in the toolchain root folder.

For Windows, the next step would be to install the [build tools (make & rm)]({{ site.baseurl }}/windows-build-tools/).

## macOS

For macOS, the RISC-V Embedded GCC toolchain is released in two versions: 

* a portable archive that can be installed in any location
* an installable package that can install the binaries in the standard system location 

Our preferred method is to install the binaries in the user home folder, but your mileage may vary.

### Portable archive

To install the archive, the steps are:

* download the latest macOS tarball file (for example `gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-{{ page.version-date }}-osx.tgz`)
* locate the file (usually in the `${HOME}/Downloads` folder)
* decide on a location to install the toolchain; the recommended folder is `${HOME}/opt/`

  > Note: It is highly recommended to use this path, since the GNU MCU Eclipse plug-ins can automatically identify the toolchain if installed in this location.

  In addition, the GNU MCU Eclipse plug-ins also check the following locations:

  ```
${user.home}/opt/gnu-mcu-eclipse/riscv-none-gcc:\
${user.home}/local/gnu-mcu-eclipse/riscv-none-gcc:\
/usr/opt/gnu-mcu-eclipse/riscv-none-gcc:\
/usr/local/gnu-mcu-eclipse/riscv-none-gcc:\
/opt/gnu-mcu-eclipse/riscv-none-gcc:\
/Applications/GNU MCU Eclipse/RISC-V Embedded GCC
```

* unpack the archive in the destination folder
* the result should be a folder like `${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}`

  ```console
$ mkdir -p ${HOME}/opt
$ cd ${HOME}/opt
$ tar xf ~/Downloads/gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-{{ page.version-date }}-osx.tgz
$ chmod -R -w ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}
```

* test if the compiler is functional; use the actual install path:

  ```console
$ ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}/bin/riscv-none-embed-gcc --version
riscv-none-embed-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits)
```

### Install package

For those preferring to install the toolchain in the system location, there is also an install package (`.pkg`).

Run the install as usual.

![Install the RISC-V GCC package]({{ site.baseurl }}/assets/images/2017/riscv-mac-installer.png)

The package is installed in:

* `/Applications/GNU MCU Eclipse/RISC-V Embedded GCC/*`

To check if the compiler starts, use:

```console
$ /Applications/GNU\ ARM\ Eclipse/RISC-V\ Embedded\ GCC/{{ page.version-id }}-{{ page.version-date }}/bin/riscv-none-embed-gcc --version
riscv-none-embed-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits)
```

> **DO NOT add the toolchain path to the user or system path!**

The complete toolchain documentation is available in the `.../share/doc/pdf/` folder.

If you'll ever need to remove the toolchain, only remove the `riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}` folder, there are no other components stored in any system folders.

## GNU/Linux

For GNU/Linux, the RISC-V Embedded GCC toolchain is released as a portable archive, that can be installed in any location.

The following steps were performed on **Ubuntu 16.04 LTSx64** (please adjust them accordingly for other distributions):

* download the latest `gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-*-debian*.tgz` file for your platform; if you are using a modern 64-bits machine, use the `*-debian64.zip` file, otherwise use the `*-debian32.zip` (however, with some extra care to install the 32-bits libraries, the 32-bits toolchain executables can also run on 64-bits platforms);
* locate the file (usually in the `${HOME}/Downloads/` folder)
* decide on a location to install the toolchain; the recommended folder is `${HOME}/opt/`
* unpack the archive in the destination folder

  > Note: It is highly recommended to use this path, since the GNU MCU Eclipse plug-ins can automatically identify the toolchain if installed in this location.

  In addition, the GNU MCU Eclipse plug-ins also check the following locations:

  ```
  ${user.home}/opt/gnu-mcu-eclipse/riscv-none-gcc:\
  ${user.home}/local/gnu-mcu-eclipse/riscv-none-gcc:\
  /usr/opt/gnu-mcu-eclipse/riscv-none-gcc:\
  /usr/local/gnu-mcu-eclipse/riscv-none-gcc:\
  /opt/gnu-mcu-eclipse/riscv-none-gcc
  ```

* unpack the archive in the destination folder
* the result should be a folder like `${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}`

  ```console
$ mkdir -p ${HOME}/opt
$ cd ${HOME}/opt
$ tar xf ~/Downloads/gnu-mcu-eclipse-riscv-none-gcc-{{ page.version-id }}-{{ page.version-date }}-debian64.tgz
$ chmod -R -w ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}
```

* test if the compiler is functional; use the actual install path:

  ```console
$ ${HOME}/opt/gnu-mcu-eclipse/riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}/bin/riscv-none-embed-gcc --version
riscv-none-embed-gcc (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits)
```

> **DO NOT add the toolchain path to the user or system path!**

The complete toolchain documentation is available in the `.../share/doc/pdf/` folder.

If you'll ever need to remove the toolchain, only remove the `riscv-none-gcc/{{ page.version-id }}-{{ page.version-date }}` folder, there are no other components stored in any system folders.

## Toolchain path

To be sure you did not miss this recommendation, here it is again:

> **DO NOT add the toolchain path to the user or system path!**

If there would be only one single version of one single toolchain in existence, then it wouldn't be a problem, but as soon as you start real world applications, you will face at least the need to keep multiple versions of the same toolchain installed, if not multiple toolchains, and this is when your trouble starts.

The GNU MCU Eclipse plug-in has an advanced [toolchain path management]({{ site.baseurl }}/toolchain/path/) (presented in more detail in the separate page). Use it!

## Documentation

The GNU MCU Eclipse RISC-V Embedded GCC includes the standard documentation, in html, info, man and pdf format. 

The documentation is located in the `share/doc` folder, for example the pdf files are:

```console
$ tree share/doc/pdf
share/doc/pdf
├── annotate.pdf
├── as.pdf
├── bfd.pdf
├── binutils.pdf
├── gcc
│   ├── cpp.pdf
│   ├── cppinternals.pdf
│   ├── gcc.pdf
│   ├── gccinstall.pdf
│   └── gccint.pdf
├── gdb.pdf
├── gprof.pdf
├── ld.pdf
├── libc.pdf
├── libiberty.pdf
├── libm.pdf
├── porting.pdf
├── refcard.pdf
└── stabs.pdf

1 directory, 18 files
```

