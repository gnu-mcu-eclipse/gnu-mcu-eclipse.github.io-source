---
layout: page
title: The 2015 OpenOCD Change Log
permalink: /openocd/change-log/

date: 2015-09-04 17:02:00 +0300

---

Entries in this file are in reverse chronological order.

## 2018

### 2018-10-16

- v0.10.0-9-20181016 released
- update to master from Oct 16th, 2018
- update to RISC-V from Sep 18th, 2018
- revert some of the RISC-V patches in the common files

### 2018-06-19

- update to latest RISC-V commits, including semihosting

### 2018-06-12

- use separate README-*.md files
- update to latest commits, which include new semihosting (OpenOCD June 6th, RISC-V June 12th)

### 2018-05-12

- v0.10.0-8-20180512 released
- use new build scripts based on XBB
- update to latest commits (OpenOCD April 27th, RISC-V May 8th)

### 2018-01-23

- v0.10.0-7-20180123 released
- move semihosting code to separate files
- use them in RISC-V and ARM
- add 'arm semihosting_resexit enable' to allow exit() to return

### 2018-01-12

- v0.10.0-6-20180112 released
- update to master from Dec 20
- update to riscv from Dec 29
- remove the patch to hide the CSRs, the new version displays only a limited number of them.
- remove the `remote_bitbang.c` patch, since it compiles ok on mingw-w64
- the SiFive board scripts were upstreamed to the RISC-V fork

## 2017

### 2017-11-10

- v0.10.0-5-20171110-dev released
- update to master from Oct 2
- update to riscv from Nov 4
- target.c & riscv/riscv-0[13].c: hide the 4096 CSRs from `monitor reg`
- update the SiFive board script files
- revert the risc-v changes in `remote_bitbang.c`, since they break the build on mingw-w64

### 2017-10-04

- v0.10.0-4-20171004-*-dev released
- update to master from Aug 10
- update to riscv fom Oct 2
- gdb_server.c: workaround to gdb errors; disable passing errors back to gdb since this risc-v change breaks other targets.

### 2017-08-25

- v0.10.0-3-20170826-*-dev released
- merge RISC-V tag v20170818
- server.c: fix clang warning in getsockname()

### 2017-06-22

- v0.10.0-2-20170622-1535-dev released
- merge RISC-V tag v20170621 

### 2017-06-12

- use #if BUILD_RISCV == 1, --enable-riscv
- configure.ac: add --enable-branding

### 2017-06-11

- update jimtcl to 0.77

### 2017-06-08

- v0.10.0-1-20170607-2132-dev released
- merge RISC-V code
- rename to gnu-mcu-eclipse
- rename 60-openocd.rules

### 2017-06-04

- merge master

### 2017-01-24

- v0.10.0-20170124* released (stable)
- merge original 0.10.0, override local relative path processing

## 2016

### 2016-10-28

- v0.10.0-20161028*-dev released

### 2016-10-20

- **[Issue:[#2](https://github.com/gnu-mcu-eclipse/openocd/issues/2)]** nsi file: add InstallDir; silent install should honour /D

### 2016-10-17

- merge current master into gnuarmeclipse-dev

### 2016-01-10

- v0.10.0-20160110*-dev released

## 2015

### 2015-10-28

- v0.10.0-20151028*-dev released

### 2015-05-19

- v0.9.0-20150519*-dev released
- remove `@raggedright` from openocd.texi
- update VERSON files for 0.9.0
- merge 0.9.0 into gnuarmeclipse-dev
- merge gnuarmeclipse-dev into gnuarmeclipse

### 2015-05-11

- greeting cosmetics: bit-\>bits
- build INFO updated
- configure: libftdi compile only test
- nsis: include all gnuarmeclipse/\* files

### 2015-04-28

- remove libwinpthread from win build

### 2015-03-24

- v0.9.0-20150324*-dev released
- v0.8.0-20150324* released
- NSIS script fixed to prevent removing the keys

### 2015-03-20

- v0.9.0-20150320*-dev released
- v0.8.0-20150320* released
- submodule update after pull/checkout

### 2015-03-18

- updated for 0.9.0-dev

### 2015-01-31

- v0.8.0-20150131* released

### 2015-01-29

- osx build: cmake pkg-config fixed with a patch

### 2015-01-28

- win build: 32/64-bit, libusb0 from sources

### 2015-01-19

- v0.8.0-20150119* released

### 2015-01-16

- osx build refined; dylib relative to executable

### 2015-01-12

- add "GNU MCU Eclipse" to greeting.
- use argv[0] even on non windows

### 2015-01-10

- create gnuarmeclipse branch
