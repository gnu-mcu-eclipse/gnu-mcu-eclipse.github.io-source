---
layout: page
permalink: /developer/change-log/
title: The 2019 GNU MCU Eclipse Plug-ins Change Log
author: Liviu Ionescu

date: 2019-01-01 18:57:00 +0300

---

Entries in this file are in reverse chronological order.

## 2019

### 2019-11-06

* version 4.7.1.201911052135 released

```
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper.feature_1.2.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.4.1.201911052135.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201911052135.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.7.1.201911052135.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.9.1.201911052135.jar
ilg.gnumcueclipse.packs.feature_2.4.1.201911052135.jar
ilg.gnumcueclipse.templates.ad.feature_1.3.1.201911052135.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.5.1.201911052135.jar
ilg.gnumcueclipse.templates.freescale.feature_2.3.1.201911052135.jar
ilg.gnumcueclipse.templates.sifive.feature_1.4.1.201911052135.jar
ilg.gnumcueclipse.templates.stm.feature_2.7.1.201911052135.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201911052135.jar
ilg.gnumcueclipse.core_4.7.1.201911052135.jar
ilg.gnumcueclipse.debug.core_1.2.2.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper_1.2.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.4.1.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201911052135.jar
ilg.gnumcueclipse.debug.gdbjtag_4.2.1.201911052135.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201911052135.jar
ilg.gnumcueclipse.doc.user_1.1.2.201911052135.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.7.1.201911052135.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.9.1.201911052135.jar
ilg.gnumcueclipse.managedbuild.cross_1.3.1.201911052135.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.4.201911052135.jar
ilg.gnumcueclipse.packs.core_2.4.1.201911052135.jar
ilg.gnumcueclipse.packs.data_2.4.1.201911052135.jar
ilg.gnumcueclipse.packs.ui_1.4.2.201911052135.jar
ilg.gnumcueclipse.packs_1.4.2.201911052135.jar
ilg.gnumcueclipse.templates.ad_1.3.1.201911052135.jar
ilg.gnumcueclipse.templates.core_2.6.3.201911052135.jar
ilg.gnumcueclipse.templates.cortexm_1.5.1.201911052135.jar
ilg.gnumcueclipse.templates.freescale.pe_1.3.1.201911052135.jar
ilg.gnumcueclipse.templates.freescale_2.3.1.201911052135.jar
ilg.gnumcueclipse.templates.sifive_1.4.1.201911052135.jar
ilg.gnumcueclipse.templates.stm_2.7.1.201911052135.jar
```

### 2019-11-05

* 78817670 - more canonical paths
* b1915b84 - fix exception in getCanonicalPath()
* dbed6da4 - version: packs.ui 1.4.2
* 23d7ae8f - Use file.getCanonicalPath()
* 08b6b2d2 - versions: core 4.7.1, packs: 1.4.2, packs.core: 2.4.1, packs.data: 2.4.1
* c2bc99ce - [#364] optimise packs update by caching sizes

### 2019-09-23

* version 4.6.1.201909231407 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper.feature_1.2.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.4.1.201909231407.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201909231407.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.7.1.201909231407.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.9.1.201909231407.jar
ilg.gnumcueclipse.packs.feature_2.3.1.201909231407.jar
ilg.gnumcueclipse.templates.ad.feature_1.3.1.201909231407.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.5.1.201909231407.jar
ilg.gnumcueclipse.templates.freescale.feature_2.3.1.201909231407.jar
ilg.gnumcueclipse.templates.sifive.feature_1.4.1.201909231407.jar
ilg.gnumcueclipse.templates.stm.feature_2.7.1.201909231407.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201909231407.jar
ilg.gnumcueclipse.core_4.6.1.201909231407.jar
ilg.gnumcueclipse.debug.core_1.2.2.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper_1.2.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.4.1.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201909231407.jar
ilg.gnumcueclipse.debug.gdbjtag_4.2.1.201909231407.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201909231407.jar
ilg.gnumcueclipse.doc.user_1.1.2.201909231407.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.7.1.201909231407.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.9.1.201909231407.jar
ilg.gnumcueclipse.managedbuild.cross_1.3.1.201909231407.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.4.201909231407.jar
ilg.gnumcueclipse.packs.core_2.3.1.201909231407.jar
ilg.gnumcueclipse.packs.data_2.3.1.201909231407.jar
ilg.gnumcueclipse.packs.ui_1.4.1.201909231407.jar
ilg.gnumcueclipse.packs_1.4.1.201909231407.jar
ilg.gnumcueclipse.templates.ad_1.3.1.201909231407.jar
ilg.gnumcueclipse.templates.core_2.6.3.201909231407.jar
ilg.gnumcueclipse.templates.cortexm_1.5.1.201909231407.jar
ilg.gnumcueclipse.templates.freescale.pe_1.3.1.201909231407.jar
ilg.gnumcueclipse.templates.freescale_2.3.1.201909231407.jar
ilg.gnumcueclipse.templates.sifive_1.4.1.201909231407.jar
ilg.gnumcueclipse.templates.stm_2.7.1.201909231407.jar
```

### 2019-09-21

* 903b4537 - [#361] Update CMSIS Packs to v1.6.0 specs
* 60359ef5 - [#362] Show version date in Packs View
* a90aeb0f - [#335] Getting package size fixed.

### 2019-09-20

* 8ec5bb80 - versions update for 4.6.1
* 7ee535e6 - [#360] Optimise packs Refresh All actions

### 2019-09-15

* 6a0db69a - SvdClusterDMNode.java: add @Override to getBigAddressOffset()
* 7342e6d4 - [#336] fix cluster increment

### 2019-09-13

* 56a0152d - cross.arm: make family & architecture options explicit
* 69ec486e - [#359] Add support for TrustZon (--mcmse)

### 2019-09-12

* e6de2688 - [#347] Fix libraries with spaces in names

### 2019-09-11

* 94409173 - [#358] update -std= for GCC 9
* 4345cd17 - [#357]: Change the CMSIS Packs default location
* c02670dc - core/XpackUtils.java: add getRepoBasePath()
* d82c096a - version packs.core: 2.3.1
* 142eee35 - [#341] create Packages in the right location, not the default one

### 2019-09-10

* 874992be - scripts/README.md: mention .bash_profile
* 22bd0c77 - [#346] fix xPack version field width
* 8410a731 - [#343] fix typo in SvdUtils ('t' for tera)
* 0eff481e - [#340] remove validator from J-Link IP address field

### 2019-09-09

* 2b053de3 - [#338] update -mcpu & -march to GCC 8.x (add cortex-r52)

### 2019-09-08

* 4417b1d8 - versions update for 4.6.1
* 69090d90 - [#355] no longer pass -Wabi in templates
* e38e35b7 - versions update for 4.6.1
* c424f652 - [#351] add support for multiple xpack names

### 2019-09-06

* 10bbbdb8 - start work on version 4.6.1

### 2019-01-01

* version 4.5.1.201901011632 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.3.4.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper.feature_1.1.1.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.3.3.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.3.3.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.3.3.201901011632.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201901011632.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.6.4.201901011632.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.8.2.201901011632.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201901011632.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201901011632.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.4.201901011632.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201901011632.jar
ilg.gnumcueclipse.templates.sifive.feature_1.3.2.201901011632.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.5.201901011632.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201901011632.jar
ilg.gnumcueclipse.core_4.5.1.201901011632.jar
ilg.gnumcueclipse.debug.core_1.2.2.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.3.4.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper_1.1.1.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.3.3.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.3.3.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.3.3.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201901011632.jar
ilg.gnumcueclipse.debug.gdbjtag_4.1.2.201901011632.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201901011632.jar
ilg.gnumcueclipse.doc.user_1.1.2.201901011632.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.6.4.201901011632.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.8.2.201901011632.jar
ilg.gnumcueclipse.managedbuild.cross_1.2.3.201901011632.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.4.201901011632.jar
ilg.gnumcueclipse.packs.core_2.2.2.201901011632.jar
ilg.gnumcueclipse.packs.data_2.2.2.201901011632.jar
ilg.gnumcueclipse.packs.ui_1.3.2.201901011632.jar
ilg.gnumcueclipse.packs_1.3.1.201901011632.jar
ilg.gnumcueclipse.templates.ad_1.2.1.201901011632.jar
ilg.gnumcueclipse.templates.core_2.6.3.201901011632.jar
ilg.gnumcueclipse.templates.cortexm_1.4.4.201901011632.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201901011632.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201901011632.jar
ilg.gnumcueclipse.templates.sifive_1.3.2.201901011632.jar
ilg.gnumcueclipse.templates.stm_2.6.5.201901011632.jar
```

* 096806f5 - [#323] RISC-V deprecate -mplt -mdiv -mfdiv

## 2018

### 2018-12-16

* 7991d53d - version 4.5.1
* 63e10ba1 - Fixed pyOCD debugger tab error messages. (#332)
* bd7bb313 - Fix how pyocd path is resolved in TabDebugger. (#330)
* 31f6c7d5 - [pyOCD] Scheduling update job when board is selected. (#305)
* 7b75050c - Fix pyOCD target override handling. (#329)
  
### 2018-10-17

* 13ffd0d3 - Enabling c++17 option for compiler (#322)

See [2018]({{ site.baseurl }}/developer/change-log/2018/).

## 2017

See [2017]({{ site.baseurl }}/developer/change-log/2017/).

## 2016

See [2016]({{ site.baseurl }}/developer/change-log/2016/).

## 2015

See [2015]({{ site.baseurl }}/developer/change-log/2015/).

## 2014

See [2014]({{ site.baseurl }}/developer/change-log/2014/).

## 2013

See [2013]({{ site.baseurl }}/developer/change-log/2013/).

