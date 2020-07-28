---
layout: page
permalink: /developer/change-log/
title: The 2020 GNU MCU Eclipse Plug-ins Change Log
author: Liviu Ionescu

date: 2020-01-27 12:57:00 +0200

---

Entries in this file are in reverse chronological order.

## 2020

### 2020-07-28

* version 5.1.1-202007271621 released

```
repository/feature:
ilg.gnumcueclipse.codered.feature_1.1.2.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper.feature_1.2.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.4.1.202007271621.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.202007271621.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.7.1.202007271621.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.9.1.202007271621.jar
ilg.gnumcueclipse.packs.feature_2.4.2.202007271621.jar
ilg.gnumcueclipse.templates.ad.feature_1.3.1.202007271621.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.5.1.202007271621.jar
ilg.gnumcueclipse.templates.freescale.feature_2.3.1.202007271621.jar
ilg.gnumcueclipse.templates.sifive.feature_1.4.1.202007271621.jar
ilg.gnumcueclipse.templates.stm.feature_2.7.1.202007271621.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.202007271621.jar
ilg.gnumcueclipse.core_5.1.1.202007271621.jar
ilg.gnumcueclipse.debug.core_1.2.2.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper_1.2.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.4.1.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.202007271621.jar
ilg.gnumcueclipse.debug.gdbjtag_4.2.1.202007271621.jar
ilg.gnumcueclipse.debug.packs_1.1.2.202007271621.jar
ilg.gnumcueclipse.doc.user_1.1.2.202007271621.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.7.1.202007271621.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.9.1.202007271621.jar
ilg.gnumcueclipse.managedbuild.cross_1.3.2.202007271621.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.4.202007271621.jar
ilg.gnumcueclipse.packs.core_2.4.2.202007271621.jar
ilg.gnumcueclipse.packs.data_2.4.2.202007271621.jar
ilg.gnumcueclipse.packs.ui_1.4.2.202007271621.jar
ilg.gnumcueclipse.packs_1.4.2.202007271621.jar
ilg.gnumcueclipse.templates.ad_1.3.1.202007271621.jar
ilg.gnumcueclipse.templates.core_2.6.3.202007271621.jar
ilg.gnumcueclipse.templates.cortexm_1.5.1.202007271621.jar
ilg.gnumcueclipse.templates.freescale.pe_1.3.1.202007271621.jar
ilg.gnumcueclipse.templates.freescale_2.3.1.202007271621.jar
ilg.gnumcueclipse.templates.sifive_1.4.1.202007271621.jar
ilg.gnumcueclipse.templates.stm_2.7.1.202007271621.jar
```

- 2020-07-27 * 7c4ca998 - README: update min deps
- 2020-07-27 * 81e76616 - jenkins/builds-upload.sh: more verbose, use UPDATES_DEST
- 2020-07-27 * 38c7c8f8 - update SiFive submodule to latest
- 2020-07-25 * 114db6f7 - Merge branch 'master' of https://github.com/eclipse-embed-cdt/eclipse-plugins
- 2020-07-25 * 73bac2b9 - #391 Releng: clean up the respository manifests (#392)
- 2020-07-25 * 41e6b14d - jenkins/ReADME: update make-pre-release
- 2020-07-25 * 17ab5e6c - [#390] remove trailing space from bundle.vendor
- 2020-07-25 * 5b873fc4 - [#385]: p2 url updated to https://download.eclipse.org/embed-cdt/updates/neon
- 2020-07-25 * 19d6ee2d - jenkins/README: add publish details
- 2020-07-24 * 5c93d3a1 - jenkins/README:  fix typo
- 2020-07-24 * 305a6f8a - Merge branch 'develop'
- 2020-07-24 * 9b7d33af - jenkins/builds-upload.sh: bring SNAPSHOT back
- 2020-07-24 * 03a12c21 - jenkins/builds-upload.sh: add ls -lL
- 2020-07-24 * b29641a2 - jenkins/builds-upload.sh: reorder, single archive
- 2020-07-24 * 3fda193b - jenkins/builds-upload.sh
- 2020-07-24 * a6999b5f - jenkins/builds-upload.sh: try separate steps
- 2020-07-24 * 5533cbff - jenkins/build-upload.sh: try multiple cd
- 2020-07-24 * caa97f1d - jenkins/builds-upload.sh: try to diagnose
- 2020-07-24 * eb503643 - jenkins/builds-upload.sh: try without subshell
- 2020-07-24 * ca7bc86c - jenkins/builds-upload.sh: add ls -l
- 2020-07-24 * 6b65072c - jenkins/builds-upload.sh: add version to archive name
- 2020-07-24 * bee1a623 - jenkins/builds-upload.sh: verbose bash
- 2020-07-24 * 6f68b504 - jenkins/builds-upload.sh: try multi-line ssh
- 2020-07-24 * 1aa7e5a0 - add scripts/jenkins/README.md
- 2020-07-24 * d475e0a6 - README: update badge to /builds/
- 2020-07-24 * 1b717764 - builds-upload.sh: fix multi-command line
- 2020-07-24 * 3d07aab4 - builds-upload.sh: explicit DOWNLOAD_ROOT
- 2020-07-24 * 5fd72261 - scripts/jenkins: update path to builds-upload.sh
- 2020-07-24 * d560d0e6 - scripts/jenkins: fix build-upload.sh
- 2020-07-24 * 4b00b593 - reorganise scripts
- 2020-07-21 * ffce0361 - [#389] Reorganise ToolchainDefinitions with abstract common part
- 2020-07-21 * 300bb385 - [#388] Add the new xPack folders to existing search paths
- 2020-07-21 * 41b640d8 - [#387] Add new xPack GCC { Arm | RISC-V } toolchains
- 2020-07-21 * 63bb55e9 - [#386] Ensure the toolchain hash is returned as unsigned
- 2020-07-17 * ac7159ff - [#382] Auto-discover xPacks in XPACKS_SYSTEM_FOLDER
- 2020-07-17 * d33d8f9e - [#383] xPack version selection fails
- 2020-07-17 * 36536416 - [#381] - auto-discover manually installed xPacks in XPACK_REPO_PATH
- 2020-07-17 * 92b1949e - versions: managedbuild.cross: 1.3.2
- 2020-07-17 * 0ab70b9e - [#380] Add support for @xpack-dev-tools/windows-build-tools
- 2020-04-29 * bf3724e7 - templates: add LICENSE for small files and README.txt notices.
- 2020-04-18 * 5e0a0f1b - [releng] Rename nigtly to simply builds (#378)
- 2020-04-17 * d2fde997 - [releng] Add Jenkins build support and signing
- 2020-04-08 * 25d001d0 - upgrade to jackson-* 2.9.9
- 2020-04-08 * e4fcbdd1 - upgrade to antlr-runtime-3.5.2.jar
- 2020-04-08 * bd08d147 - upgrade to ST4-4.0.8.jar
- 2020-04-07 * 10ea5217 - update urls to eclipse-embed-cdt
- 2020-04-07 * 57ace56d - [#376] Use HTTPS for Maven build
- 2020-04-07 * 07bf9781 - version: packs 2.4.2
- 2020-04-07 * 9861c14d - [#373] rework other redirects
- 2020-04-07 * 58ef5b91 - [#373] process redirects for index
- 2020-04-07 * 2a52b2ac - [#373] update Keil index to https
- 2020-03-23 * a439d718 - add create-template-ilg-cq.sh
- 2020-03-23 * ac1263a7 - scripts/create-initial-cq: add semver note
- 2020-03-10 * 702fff6d - add create-initial-cq.sh
- 2020-02-11 * e8bbf759 - [#376] Use HTTPS for Maven build

### 2020-01-27

* version 4.7.2-202001271018 released

```
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper.feature_1.2.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.4.1.202001271018.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.202001271018.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.7.1.202001271018.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.9.1.202001271018.jar
ilg.gnumcueclipse.packs.feature_2.4.2.202001271018.jar
ilg.gnumcueclipse.templates.ad.feature_1.3.1.202001271018.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.5.1.202001271018.jar
ilg.gnumcueclipse.templates.freescale.feature_2.3.1.202001271018.jar
ilg.gnumcueclipse.templates.sifive.feature_1.4.1.202001271018.jar
ilg.gnumcueclipse.templates.stm.feature_2.7.1.202001271018.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.202001271018.jar
ilg.gnumcueclipse.core_4.7.2.202001271018.jar
ilg.gnumcueclipse.debug.core_1.2.2.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.jumper_1.2.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.4.1.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.202001271018.jar
ilg.gnumcueclipse.debug.gdbjtag_4.2.1.202001271018.jar
ilg.gnumcueclipse.debug.packs_1.1.2.202001271018.jar
ilg.gnumcueclipse.doc.user_1.1.2.202001271018.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.7.1.202001271018.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.9.1.202001271018.jar
ilg.gnumcueclipse.managedbuild.cross_1.3.1.202001271018.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.4.202001271018.jar
ilg.gnumcueclipse.packs.core_2.4.2.202001271018.jar
ilg.gnumcueclipse.packs.data_2.4.2.202001271018.jar
ilg.gnumcueclipse.packs.ui_1.4.2.202001271018.jar
ilg.gnumcueclipse.packs_1.4.2.202001271018.jar
ilg.gnumcueclipse.templates.ad_1.3.1.202001271018.jar
ilg.gnumcueclipse.templates.core_2.6.3.202001271018.jar
ilg.gnumcueclipse.templates.cortexm_1.5.1.202001271018.jar
ilg.gnumcueclipse.templates.freescale.pe_1.3.1.202001271018.jar
ilg.gnumcueclipse.templates.freescale_2.3.1.202001271018.jar
ilg.gnumcueclipse.templates.sifive_1.4.1.202001271018.jar
ilg.gnumcueclipse.templates.stm_2.7.1.202001271018.jar
```

### 2020-01-23

* 33b6ea41 - version 4.7.2,  packs 2.4.2
* 69478ced - [#373] rework other redirects
* 4a6e7df8 - [#373] process redirects for index
* 97dd134b - [#373] update Keil index to https

## 2019

See [2019]({{ site.baseurl }}/developer/change-log/2019/).

## 2018

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
