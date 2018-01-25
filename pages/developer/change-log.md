---
layout: page
permalink: /developer/change-log/
title: The 2018 GNU MCU Eclipse Plug-ins Change Log
author: Liviu Ionescu

date: 2018-01-09 16:17:00 +0300

---

Entries in this file are in reverse chronological order.

## 2018

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

