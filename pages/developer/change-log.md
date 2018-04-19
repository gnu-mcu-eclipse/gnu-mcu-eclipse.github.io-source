---
layout: page
permalink: /developer/change-log/
title: The 2018 GNU MCU Eclipse Plug-ins Change Log
author: Liviu Ionescu

date: 2018-01-09 16:17:00 +0300

---

Entries in this file are in reverse chronological order.

## 2018

### 2018-04-19

* version 4.3.3.201804191501 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.3.2.201804191501.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201804191501.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.6.2.201804191501.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.8.1.201804191501.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201804191501.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201804191501.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201804191501.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201804191501.jar
ilg.gnumcueclipse.templates.sifive.feature_1.3.2.201804191501.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.4.201804191501.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201804191501.jar
ilg.gnumcueclipse.core_4.3.3.201804191501.jar
ilg.gnumcueclipse.debug.core_1.2.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201804191501.jar
ilg.gnumcueclipse.debug.gdbjtag_4.1.2.201804191501.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201804191501.jar
ilg.gnumcueclipse.doc.user_1.1.2.201804191501.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.6.2.201804191501.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.8.1.201804191501.jar
ilg.gnumcueclipse.managedbuild.cross_1.2.2.201804191501.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.3.201804191501.jar
ilg.gnumcueclipse.packs.core_2.2.2.201804191501.jar
ilg.gnumcueclipse.packs.data_2.2.2.201804191501.jar
ilg.gnumcueclipse.packs.ui_1.3.2.201804191501.jar
ilg.gnumcueclipse.packs_1.3.1.201804191501.jar
ilg.gnumcueclipse.templates.ad_1.2.1.201804191501.jar
ilg.gnumcueclipse.templates.core_2.6.1.201804191501.jar
ilg.gnumcueclipse.templates.cortexm_1.4.3.201804191501.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201804191501.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201804191501.jar
ilg.gnumcueclipse.templates.sifive_1.3.2.201804191501.jar
ilg.gnumcueclipse.templates.stm_2.6.4.201804191501.jar
```

* 6a2ff4bb - template.sifive: version 1.3.2
* af56536e - template.sifive: update submodules

### 2018-04-05 

* The 4.3.3.201804051758 pre-release is now available for testing from http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test.
* 18dc1668 - bump versions for 4.3.3
* a7998a04 - [#291] managedbuild.cross: hide the Toolchains tab
* 551ccdbd - [#290] managedbuild.cross: hide the Devices tab

### 2018-04-04 

* 64faeb6f - [#289] cross.*: store the toolchain ID in .cproject
* 6f848b30 - [#288] add GME ARM GCC with xPack logic
* b073b07e - [#270] add -isystem to includes

### 2018-04-03 

* 46c1c8cb - [#287] silence FileNotFoundException for package.json
* 8ccfb981 - [#286] fix SVD file type identification
* b0eeae27 - [#280] gdbjtag.*: Display why the buttons are disabled
* 02116eb7 - [#281] cross.riscv: add -mstrict-align as combo
* 87234216 - [#281] cross.riscv: deprecate -mtune=generic
* f9bc2e29 - [#281] cross.riscv: add -mtune=size
* 73607556 - [#283] gdbjtag.jlink: use JLinkGDBServerCLExe
* 6f4e8894 - [#285] Add Ignore All button during Packs update

### 2018-02-28 

* 38834006 - README: fix gnu-mxu-eclipse urls
* 921c90b8 - README: use local CONTRIBUTING.md
* 77620a83 - README: add open collective links
* d4722004 - README: update install, add package

### 2018-01-30 

* 82c1badd - bump version riscv 2.8.1
* 3d0445f8 - [#275] cross.riscv: add ilp32e
* 9a1246ac - remove riscv.repository
* fe58d97b - bump versions: packs.core & data 2.2.2, gdbjtag 4.1.2
* d20efb34 - [#278] packs: fix NLS warnings
* ddd4c26f - [#278] packs: fix periph view for cmsis

### 2018-01-25

* version 4.3.2.201801250917 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.3.1.201801250917.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201801250917.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.6.1.201801250917.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.7.1.201801250917.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201801250917.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201801250917.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201801250917.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201801250917.jar
ilg.gnumcueclipse.templates.sifive.feature_1.3.1.201801250917.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.4.201801250917.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201801250917.jar
ilg.gnumcueclipse.core_4.3.2.201801250917.jar
ilg.gnumcueclipse.debug.core_1.2.2.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.3.1.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201801250917.jar
ilg.gnumcueclipse.debug.gdbjtag_4.1.1.201801250917.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201801250917.jar
ilg.gnumcueclipse.doc.user_1.1.2.201801250917.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.6.1.201801250917.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.7.1.201801250917.jar
ilg.gnumcueclipse.managedbuild.cross_1.2.1.201801250917.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.2.201801250917.jar
ilg.gnumcueclipse.packs.core_2.2.1.201801250917.jar
ilg.gnumcueclipse.packs.data_2.2.1.201801250917.jar
ilg.gnumcueclipse.packs.ui_1.3.1.201801250917.jar
ilg.gnumcueclipse.packs_1.3.1.201801250917.jar
ilg.gnumcueclipse.templates.ad_1.2.1.201801250917.jar
ilg.gnumcueclipse.templates.core_2.6.1.201801250917.jar
ilg.gnumcueclipse.templates.cortexm_1.4.3.201801250917.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201801250917.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201801250917.jar
ilg.gnumcueclipse.templates.sifive_1.3.1.201801250917.jar
ilg.gnumcueclipse.templates.stm_2.6.4.201801250917.jar
```

* 94db2cc2 - templates.sifive: remove 'Experimental' notice from feature name

### 2018-01-24 

* 24e5483c - templates.sifive: remove 'Experimental' notice
* 4fd4b8c3 - [#274] templates.sifive: exclude unused device files
* c34596ed - [#273] templates.sifive: add full semihosting selection
* 732cc8f7 - templates.sifive: add jlink launcher

### 2018-01-20 

* 0d1b5b36 - sifive: 1.3.1
* 030ede61 - stm: 2.6.4
* 9a280313 - version 4.3.2
* bf87b5d9 - [#269] stm: F7 template, add PLLR field

### 2018-01-16 

* e1a50f1b - [#268] Add semihosting trace in the SiFive template

### 2018-01-15 

* f3c588bf - add semihosting xPack


### 2018-01-10 

* version 4.3.1-201801092051 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201801092051.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.3.1.201801092051.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.3.1.201801092051.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.3.1.201801092051.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.3.1.201801092051.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201801092051.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.6.1.201801092051.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.7.1.201801092051.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201801092051.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201801092051.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201801092051.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201801092051.jar
ilg.gnumcueclipse.templates.sifive.feature_1.2.1.201801092051.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.3.201801092051.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201801092051.jar			
ilg.gnumcueclipse.core_4.3.1.201801092051.jar				
ilg.gnumcueclipse.debug.core_1.2.2.201801092051.jar			
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.3.1.201801092051.jar		
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.3.1.201801092051.jar		
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.3.1.201801092051.jar		
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.3.1.201801092051.jar		
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201801092051.jar		
ilg.gnumcueclipse.debug.gdbjtag_4.1.1.201801092051.jar			
ilg.gnumcueclipse.debug.packs_1.1.2.201801092051.jar			
ilg.gnumcueclipse.doc.user_1.1.2.201801092051.jar			
ilg.gnumcueclipse.managedbuild.cross.arm_2.6.1.201801092051.jar		
ilg.gnumcueclipse.managedbuild.cross.riscv_2.7.1.201801092051.jar	
ilg.gnumcueclipse.managedbuild.cross_1.2.1.201801092051.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.2.201801092051.jar
ilg.gnumcueclipse.packs.core_2.2.1.201801092051.jar
ilg.gnumcueclipse.packs.data_2.2.1.201801092051.jar
ilg.gnumcueclipse.packs.ui_1.3.1.201801092051.jar
ilg.gnumcueclipse.packs_1.3.1.201801092051.jar
ilg.gnumcueclipse.templates.ad_1.2.1.201801092051.jar
ilg.gnumcueclipse.templates.core_2.6.1.201801092051.jar
ilg.gnumcueclipse.templates.cortexm_1.4.3.201801092051.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201801092051.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201801092051.jar
ilg.gnumcueclipse.templates.sifive_1.2.1.201801092051.jar
ilg.gnumcueclipse.templates.stm_2.6.3.201801092051.jar
```

### 2018-01-09 

* 2c0344c4 - riscv.repository: fix category used by template
* 32269235 - [#267] remove useless deps to cross.arm & packs.ui
* e1cf47a4 - codered: fix factory ID
* 38b8ba55 - versions 4.3.1
* 849d80d5 - [#266] Prefix preferences & properties with MCU

### 2018-01-08 

* [#264] extend default search paths to xpacks
* [#265] add a new xPack button

### 2018-01-05 

* [#262] The MCU properties pages GME visibility
* add /AppData/Roaming to the Windows discovery path
* [#250] templates.sifive: fix select description
* [#254] riscv: template, add non-run warning

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

