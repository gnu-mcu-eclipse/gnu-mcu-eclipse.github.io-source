---
layout: page
permalink: /developer/change-log/2017/
title: The 2017 GNU MCU Eclipse Plug-ins Change Log
author: Liviu Ionescu

date: 2017-02-24 09:55:00 +0300

---

Entries in this file are in reverse chronological order.

## 2017

### 2017-12-29 

* SvdUtils: silently ignore missing package.json
* [#260] DebugUtils.resolveAll substitute project_loc

### 2017-12-28 

* [#259] fix Windows CR LF issue

### 2017-12-27 

* core/EclipseUtils: add getProjectFromConfiguration
* core/JsonUtils: add get() with default
* managedbuild.packs: explicit 'Used by debug'
* packs.data: add xcdl & xpack utils
* packs.core: add json support & js objects
* (multi) add Devices tab for Xcdl projects
* cross.*.feature: add ref to managedbuild.packs
* packs.core: DurationMonitor with public start/stop
* debug.gdbjtag: time SVD parsing
* debug.gdbjtag: move SVD Path to debug launch
* gdbjtag.*: add TabSvd
* gdbjtag.{jlink,pyocd,qemu} fix openocd message
* debug.gdbjtag: improve SVD Path messages
* debug.gdbjtag: add log line for missing SVD Path


### 2017-12-09 

* core: fix PacksStorage
* core: add JsonUtils
* core: clean PacksStorage
* packs.core: add PackTypes
* debug.gdbjtag: automatically identify xsvd

### 2017-12-08 

* packs.core: Node.getChildren() add doc
* packs.core: Xsvd process 'enumerations' (plural)
* debug.gdbjtag: SvdField process 'enumerations'
* debug.gdbjtag: clean PeripheralsService code


### 2017-12-06 

* core: CProjectPacksStorage prefix with CMSIS_
* debug.gdbjtag: fix finding enum default as value 0

### 2017-12-04 

* debug.gdbjtag: field repetitions functional

### 2017-12-02 

* debug.gdbjtag: peripheral viewer order by addr
* packs.core: XsvdGenericParser, add enums
* debug.gdbjtag: implement repetitions and enums

### 2017-11-28 

* debug.gdbjtag: [#249] rename Tcl

### 2017-11-24 

* move classes to packs.core
* packs.data: reformat comments
* version 4.3.1
* packs.core: Leaf properties trimmed
* packs.core & debug.gdbjtag: arrays & repetitions

### 2017-11-23 

* debug.gdbjtag & core.data: add pack type
* debug.gdbjtag & core.data: NAME_ DESCRIPTION_
* packs.core: add KEY_ & [gs]etKeyName()
* debug.gdbjtag: show reset values for fields
* packs.core: Json parser add group nodes
* debug.gdbjtag & core.data: consistent getName()
* debug.gdbjtag & core.data: reformat comments
* debug.gdbjtag: show r,w,rw in tooltips
* debug.gdbjtag(): assert in SvdRegisterDMNode

### 2017-11-22 

* core: add json-simple-1.1.1.jar
* packs.core: add Json & Xsvd parsers to tree
* debug.gdbjtag: SvdObjectDMNode cached name & $KEY
* debug.gdbjtag: parse xsvd too
* debug.gdbjtag: PeripheralService cleanup

### 2017-11-20

* debug.gdbjtag: add SVD Path property to MCU
* debug.gdbjtag: PeripheralService with custom SVD
* debug.gdbjtag: svd key includes debug/release

### 2017-11-10

* version 4.2.1-201711101735 released

```console
repository/features:
ilg.gnumcueclipse.codered.feature_1.1.2.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.2.1.201711101735.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201711101735.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.5.2.201711101735.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.6.1.201711101735.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201711101735.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201711101735.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201711101735.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201711101735.jar
ilg.gnumcueclipse.templates.sifive.feature_1.1.1.201711101735.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.3.201711101735.jar

repository/plugins:
ilg.gnumcueclipse.codered_1.1.2.201711101735.jar
ilg.gnumcueclipse.core_4.2.1.201711101735.jar
ilg.gnumcueclipse.debug.core_1.2.2.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.2.1.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201711101735.jar
ilg.gnumcueclipse.debug.gdbjtag_3.2.3.201711101735.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201711101735.jar
ilg.gnumcueclipse.doc.user_1.1.2.201711101735.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.5.2.201711101735.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.6.1.201711101735.jar
ilg.gnumcueclipse.managedbuild.cross_1.1.2.201711101735.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.2.201711101735.jar
ilg.gnumcueclipse.packs.core_1.1.4.201711101735.jar
ilg.gnumcueclipse.packs.data_1.3.2.201711101735.jar
ilg.gnumcueclipse.packs.ui_1.2.5.201711101735.jar
ilg.gnumcueclipse.packs_1.2.5.201711101735.jar
ilg.gnumcueclipse.templates.ad_1.2.1.201711101735.jar
ilg.gnumcueclipse.templates.core_2.6.1.201711101735.jar
ilg.gnumcueclipse.templates.cortexm_1.4.3.201711101735.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201711101735.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201711101735.jar
ilg.gnumcueclipse.templates.sifive_1.1.1.201711101735.jar
ilg.gnumcueclipse.templates.stm_2.6.3.201711101735.jar
```

* [#249] gdbjtag.openocd: configurable TCL port
* update SiFive template code to v0.1.1

### 2017-11-05

* [#242] gdbjtag.*: validate telnet port;  also server executable, gdb port, client executable
* [#246] gdbjtag.*: substitute dynamic variables too;  add Actual client executable
* gdbjtag.*: show Actual executable

### 2017-11-04

* cross.riscv: add riscv-none-embed-

### 2017-10-20

* [#241] packs: add connect & read timeout

### 2017-09-25

* [#223] - refactor of checkServer
* [#240] - cross.riscv: add linux & rtems toolchains

### 2017-07-19

* [#223] - fix bundle blurbs to reflect bundle name
* [#222] - fix double -fno-common options
* [#224] - gdbjtag.openocd: do not wait for the echo

### 2017-07-14

* add SiFive preliminary template

### 2017-07-13

* add **Start GDB session** to OpenOCD GUI, to allow multiple GDB instances attached to the same OpenCOD


### 2017-07-11

* version 4.1.1.201707111115 released

```console
features:
ilg.gnumcueclipse.codered.feature_1.1.2.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.1.5.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.1.5.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.1.4.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.1.5.201707111115.jar
ilg.gnumcueclipse.doc.user.feature_1.1.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.5.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.5.2.201707111115.jar
ilg.gnumcueclipse.packs.feature_2.2.2.201707111115.jar
ilg.gnumcueclipse.templates.ad.feature_1.1.5.201707111115.jar
ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201707111115.jar
ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201707111115.jar
ilg.gnumcueclipse.templates.stm.feature_2.6.3.201707111115.jar

plugins:
ilg.gnumcueclipse.codered_1.1.2.201707111115.jar
ilg.gnumcueclipse.core_4.1.1.201707111115.jar
ilg.gnumcueclipse.debug.core_1.2.2.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.jlink_4.1.5.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.openocd_4.1.5.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.1.4.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.qemu_3.1.5.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201707111115.jar
ilg.gnumcueclipse.debug.gdbjtag_3.2.2.201707111115.jar
ilg.gnumcueclipse.debug.packs_1.1.2.201707111115.jar
ilg.gnumcueclipse.doc.user_1.1.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.cross.arm_2.5.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.cross.riscv_2.5.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.cross_1.1.2.201707111115.jar
ilg.gnumcueclipse.managedbuild.packs_1.3.2.201707111115.jar
ilg.gnumcueclipse.packs.core_1.1.4.201707111115.jar
ilg.gnumcueclipse.packs.data_1.3.2.201707111115.jar
ilg.gnumcueclipse.packs.ui_1.2.5.201707111115.jar
ilg.gnumcueclipse.packs_1.2.5.201707111115.jar
ilg.gnumcueclipse.templates.ad_1.1.5.201707111115.jar
ilg.gnumcueclipse.templates.core_2.5.7.201707111115.jar
ilg.gnumcueclipse.templates.cortexm_1.4.3.201707111115.jar
ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201707111115.jar
ilg.gnumcueclipse.templates.freescale_2.2.9.201707111115.jar
ilg.gnumcueclipse.templates.stm_2.6.3.201707111115.jar
```

* p2.inf: gnu-mcu-eclipse.netlify.com

### 2017-06-29 

* rebrand url http://gnu-mcu-eclipse.github.io
* update url to http://gnu-mcu-eclipse.netlify.com

### 2017-06-12 

* refurbish all path discovery code
* gdbjtag: common code to discover Installpath
* mbs.cross: common code to discover toolchain
* openocd: search path includes "bin"
* preferences.ini: update search paths

### 2017-06-11 

* mbs.cross: process build tools path centrally
* cross.arm: rework the path search
* cross.riscv: remove build tools path, done centrally
* cross.riscv: rework the path search
* cross.arm: group preference classes
* cross: DefaultPreferences cleanups
* gdbjtag.*: create package .preferences
* core: reorganise packages .preferences & .ui

### 2017-06-09 

* dynamic variables: quote strings for '\' for '$'
* gdbjtag.*: fix TabMain deprecation warning

### 2017-06-08 

* persistent preferences: fix npe
* [#207] dynamic variables: fix regexp

### 2017-06-02 

* core: add Default & Persistent preferences
* gdbjtag.*: refurbish preferences & properties
* mbs.cross.*: refurbish preferences & properties
* fix references to Activator

### 2017-06-01 

* openocd: add actual executable & links
* mbs.cross,arm,riscv: fix build tools processing
* core: remove unused global field editors

### 2017-05-31 

* core: field editors pick preferences if empty
* core: add global field editors
* openocd/preferences: add install.folder & co.
* openocd: switch to dynamic variables
* openocd: rename Workspace OpenOCD Path
* core: add common MCU preferences & properties
* core/EclipseUtils: add getProjectByLaunchConfig
* core: fix message for MCU preferences page
* openocd: separate global/workspace/project configs
* mbs.cross: move arm & riscv prefs & props

### 2017-05-30 

* core: DirectoryNotStrict use getString()
* core: setVariableValue() more verbose
* scripts/publish-updates.sh: update path to repos
* core: field editors: also use persistent store
* category.xml: consistent artefact feature names

### 2017-05-29 

* maven cleanups in repositories
* project names: give up the '-', use '.'

### 2017-05-28 

* cleanups in maven configuration

### 2017-05-27 

* create bundles, features, repos folders

### 2017-05-26 

* cross.arm & riscv: fix toolchain path discovery
* more verbose debug
* cross.arm & riscv: simplify toolchain search path
* publish-updates.sh: no more SourceForge
* windows toolchain path simplified too much
* gdbjtag.*: check & update preferences
* gdbjtag.*: make verbose messages specific
* core/Discoverer: increase trace verbosity

### 2017-05-25 

* add debug.options with all options enabled
* logos: add gme-*.png files

### 2017-05-23 

* mbs.cross: make secondary bool options invisible
* mbs.riscv: isa fp text: RVFD, RVFDQ (multiletters)
* cross.riscv: add more enablements to -march/-mabi

### 2017-05-22 

* mbs.cross: all common xml definitions extracted
* riscv-repo: add debug & codered features

### 2017-05-20 

* suppress some warnings
* core & debug.gdbjtag: fix non-API warnings
* core/semver: silence some warnings
* cross.[arm|riscv]: contenttype.contentTypes
* packs.ui, cross.riscv: fix static use warnings
* fix import warnings
* gdbjtag: fix super() call warning
* mbs.cross: extract common arm/riscv classes
* mbs.cross: extract common plugin.xml defs
* mbs.riscv/template: remove semi-hosting notice

### 2017-05-19 

* p2.inf & about.properties: update repo url
* scripts to publish to v4-neon-updates*
* comment out remover feature
* fix deprecated ViewerSorter
* fix cleanupLaunchLocal() deprecation warning
* remove any project setting related to Java 1.7
* debug/jlink: fix startup problem
* debug/openocd,pyocd,qemu: add deprecated names
* packs: build.properties output... fixed

### 2017-05-17 

* raise API Baseline to 9.2.1 and Java to 1.8
* update version for dependencies to Neon.3
* add GNU ARM Eclipse remover, as simple plug-in
* add GNU ARM Eclipse removers
* redo GNU MCU Eclipse branding

### 2017-05-16 

* risc-v target options reordered

### 2017-05-15

* MAJOR: rebrand to GNU MCU
* versions: increase patch to mark rebranding

### 2017-05-12 

* add managedbuild.cross 1.1.1
* mbs.riscv: use MCU properties & preferences
* mbs.arm: use MCU properties & preferences
* mcu.mbs.cross: add preferences package
* mcu.mbs.cross.riscv: use common preferences
* gnuarmeclipse.mbs.cross: use common paths
* rename ilg.gnumcueclipse.managedbuld.cross.arm

### 2017-05-10 

* gnuarmeclipse-repository: add RISC-V mbs feature
* mbs.riscv: fix target options spelling
* mbs.riscv: optimize imports
* mbs.riscv: process options
* mbs.riscv: clean rdimon refs from templates
* mbs.riscv: temporarily disable -mmemcpy

### 2017-05-08 

* mbs.riscv: ToolchainDefinition riscv64-unknown-elf
* mbs.riscv: disable ARM options in UI
* mbs.riscv: Target options definitions

### 2017-05-04 

* riscv-repository: category name Cross C/C++ Dev
* mcu-repository: category name Cross C/C++ Dev
* riscv: inconsistent name, must be C/C++ Cross *
* arm: inconsistent name, must be C/C++ Cross *
* mbs.riscv: preliminary abi & architecture fields
* mbs.arm: fix debugg typo

### 2017-05-03 

* mbs.riscv: rename everything to use mcu.riscv
* mbs.riscv: preliminary toolchain defs
* mbs.arm: update toolchain & tools names
* mbs.arm: promote opt in the search path
* versions: mbs.arm 2.5.1, mbs.riscv 2.5.1
* pyocd: fix reference to livius.net
* pyocd: version 1.1.4

### 2017-05-02 

* add first riscv projects
* version 4.1.1
* Merge branch 'develop' into riscv
* update riscv projects to 4.1.1
* mbs.cross*-feature: add dependency to debug.core
* mbs.cross.riscv: templates mention RISC-V
* scripts: add riscv support


### 2017-04-25

* version 3.4.1.201704251808 released
  * features/ilg.gnuarmeclipse.codered_1.1.1.201704251808.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.4.201704251808.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.4.201704251808.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.3.201704251808.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.4.201704251808.jar
  * features/ilg.gnuarmeclipse.doc.user_1.1.1.201704251808.jar
  * features/ilg.gnuarmeclipse.managedbuild.cross_2.4.1.201704251808.jar
  * features/ilg.gnuarmeclipse.packs_2.2.2.201704251808.jar
  * features/ilg.gnuarmeclipse.templates.ad_1.1.4.201704251808.jar
  * features/ilg.gnuarmeclipse.templates.cortexm_1.4.2.201704251808.jar
  * features/ilg.gnuarmeclipse.templates.freescale_2.2.8.201704251808.jar
  * features/ilg.gnuarmeclipse.templates.stm_2.6.2.201704251808.jar
  * plugins/ilg.gnuarmeclipse.codered_1.1.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.core_3.4.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.core_1.2.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.3.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.restart_1.3.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag_3.2.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.debug.packs_1.1.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.doc.user_1.1.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.cross_2.4.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.packs_1.3.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.packs.core_1.1.3.201704251808.jar
  * plugins/ilg.gnuarmeclipse.packs.data_1.3.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.packs.ui_1.2.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.packs_1.2.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.ad_1.1.4.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.core_2.5.6.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.cortexm_1.4.2.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale.pe_1.2.1.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale_2.2.8.201704251808.jar
  * plugins/ilg.gnuarmeclipse.templates.stm_2.6.2.201704251808.jar

### 2017-04-24

* [#199] packs.data: parse index.pidx files, convert old index.idx to pidx internally
* packs.data: version 1.3.1
* [#200] packs.ui/PacksView: use semver, order versions by full semver
* packs.ui/update: explicit malformed index message
* [#153] templates.core: make raise() & kill() weak
* debug.gdbjtag: peripheralAddressOffset, PeripheralTreeVMNode.java: getPeripheralBigAddressOffset() cumulates this offset with parent peripheral offset
* debug.gdbjtag: register array address, PeripheralRegisterArrayVMNode.java no longer needs getBigAbsoluteAddress(), parent is good for all nodes
* [#150] debug.gdbjtag: cluster addressOffset, SvdClusterDMNode.java get offset from property
* [#144] gdbjtag.jlink: make windows scrolable
* gdbjtag.openocd,pyocd,qemu scrollable windows; same medicine as for jlink
* [#137] SAX line & column; print details for SAX parse error
* [#25] avoid multiple defs in devices/boards/books; use a Set instead of a list to collect installed packages
* version: gdbjtag 3.2.1, packs[.ui] 1.2.4

### 2017-04-23

* core/StringUtils: add compareSimpleVersion
* packs.ui/PacksView: compare numeric versions
* packs.ui: version 1.2.3
* ISSUE_TEMPLATE: fix typos, add reference to crypto extensions
* add UNUSED pack type for disabling repos

### 2017-04-04

* publish-updates.sh: publish to bintray

### 2017-04-03

* templates.*: explicit MIT license
* versions: templates.core 2.5.6, tempaltes.ad 1.1.4, templates.cortexm 1.4.2,
 templates.freescale 2.2.8, templates.stm 2.6.2

### 2017-03-24

* [#185] cross.mbs: mcu default back to m3
* versions: cross.mbs 2.4.1
* [#183] templates.cortexm: add m23, m33 to list
* versions: templates.cortexm 1.4.1

### 2017-02-26

* gdbjtag.*: add explicit tests for isWindows() when checking registry
* versions: jlink,openocd 4.1.4, qemu 3.1.4, pyocd 1.1.3
* publish-update.sh: compute SHA, relative archive foder

### 2017-02-25

* version 3.3.1-201702251311 released
  * features/ilg.gnuarmeclipse.codered_1.1.1.201702251311.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.3.201702251311.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.3.201702251311.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.2.201702251311.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.3.201702251311.jar
  * features/ilg.gnuarmeclipse.doc.user_1.1.1.201702251311.jar
  * features/ilg.gnuarmeclipse.managedbuild.cross_2.3.1.201702251311.jar
  * features/ilg.gnuarmeclipse.packs_2.2.2.201702251311.jar
  * features/ilg.gnuarmeclipse.templates.ad_1.1.3.201702251311.jar
  * features/ilg.gnuarmeclipse.templates.cortexm_1.3.1.201702251311.jar
  * features/ilg.gnuarmeclipse.templates.freescale_2.2.7.201702251311.jar
  * features/ilg.gnuarmeclipse.templates.stm_2.6.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.codered_1.1.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.core_3.3.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.core_1.2.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.2.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.restart_1.3.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag_3.1.2.201702251311.jar
  * plugins/ilg.gnuarmeclipse.debug.packs_1.1.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.doc.user_1.1.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.cross_2.3.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.packs_1.3.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.packs.core_1.1.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.packs.data_1.2.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.packs.ui_1.2.2.201702251311.jar
  * plugins/ilg.gnuarmeclipse.packs_1.2.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.ad_1.1.3.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.core_2.5.5.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.cortexm_1.3.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale.pe_1.2.1.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale_2.2.7.201702251311.jar
  * plugins/ilg.gnuarmeclipse.templates.stm_2.6.1.201702251311.jar

### 2017-02-24

* [[issue #177](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/177)] gdbjtag.jlink: acceppt ':' in IP field
* version: jlink 4.1.3
* [[issue #175](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/175)] mbs.cross: always show Hex in Print Size tool
* [[issue #174](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/174)] log external command for debug
* [[issue #173](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/173)] gdbjtag.openocd: start without server; do not check the config field if starting without server
* versions: pyocd 1.1.2, gdbjtag 3.1.2
* [[issue #182](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/182)] mbs.cross: default toolchain logic; use modified date

### 2017-02-22

* [[issue #181](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/181)] mbs.cross: avoid bug 512550
  - workaround for canFinish()
  - get the projectName even if the toolchain page was not entered

### 2017-02-20

* .classpath & prefs: refer to 1.7
* rename parent project as `gnuarmeclipse-parent`
* [[issue #180](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/180)] update march & mtune for GCC 6.2
  - deprecate armv2, armv2a, armv3, armv3m
  - add arch armv8.1-a, armv8.1-a+crc
  - add mcpu cortex-a17/a32/a35/a72
  - add mcpu cortex-m23/m33
  - add mcpu qdf24xx
* version: mbs.cross 2.3.1

### 2017-02-16

* add LICENSE file (EPL-1.0)
* [[issue #179](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/179)] add `${user.home}/opt` subfolders to the search path for toolchain, openocd and qemu. 
* versions: mbs.cross: 2.2.2, openocd 4.1.3

### 2017-02-04

* [[PR #176](https://github.com/gnu-mcu-eclipse/eclipse-plugins/pull/176)] pyOCD: fix target override combo in Debugger pane

### 2017-02-01

* README.md: add badges

### 2017-01-29

* reformat xml files using tabs

### 2017-01-27

* [[issue #170](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues/170)] gdbjtag.qemu: add  DeviceName callback in TabDebugger
* versions: core v3.3.1, gdbjtag.qemu 3.1.3

### 2017-01-14

* version 3.2.1-201701141320 released
  * features/ilg.gnuarmeclipse.codered_1.1.1.201701141320.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.2.201701141320.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.2.201701141320.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.1.201701141320.jar
  * features/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.2.201701141320.jar
  * features/ilg.gnuarmeclipse.doc.user_1.1.1.201701141320.jar
  * features/ilg.gnuarmeclipse.managedbuild.cross_2.2.1.201701141320.jar
  * features/ilg.gnuarmeclipse.packs_2.2.2.201701141320.jar
  * features/ilg.gnuarmeclipse.templates.ad_1.1.3.201701141320.jar
  * features/ilg.gnuarmeclipse.templates.cortexm_1.3.1.201701141320.jar
  * features/ilg.gnuarmeclipse.templates.freescale_2.2.7.201701141320.jar
  * features/ilg.gnuarmeclipse.templates.stm_2.6.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.codered_1.1.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.core_3.2.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.core_1.2.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.jlink_4.1.2.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.openocd_4.1.2.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.pyocd_1.1.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.qemu_3.1.2.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag.restart_1.3.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.gdbjtag_3.1.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.debug.packs_1.1.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.doc.user_1.1.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.cross_2.2.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.managedbuild.packs_1.3.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.packs.core_1.1.3.201701141320.jar
  * plugins/ilg.gnuarmeclipse.packs.data_1.2.3.201701141320.jar
  * plugins/ilg.gnuarmeclipse.packs.ui_1.2.2.201701141320.jar
  * plugins/ilg.gnuarmeclipse.packs_1.2.3.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.ad_1.1.3.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.core_2.5.5.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.cortexm_1.3.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale.pe_1.2.1.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.freescale_2.2.7.201701141320.jar
  * plugins/ilg.gnuarmeclipse.templates.stm_2.6.1.201701141320.jar
* mbs.cross: `-include` headers used by scanner (#164)
* mbs.cross: update `-march` & `-mtune`
  * arch: armv8-m.base, armv8-m.main, armv8-m.main+dsp
  * tune: cortex-a72, cortex-r8, exynos-m1, xgene1
* mbs.cross: rename Cross ARM GNU C/C++ Compiler/Linker
* mbs.cross: support cpp abi version 7,8,9
* mbs.cross: support dwarf-5
* mbs.cross: support up to c++1z

### 2017-01-11

* debug consoles: remove the `PROCESS_TYPE_CREATION_ATTR`; functional on Neon.2 

### 2017-01-09

* Merge pull request #109 from sukidog/fix_issue108
* Merge pull request #128 from johnmoule/issue125

## 2016

See [2016]({{ site.baseurl }}/developer/change-log/2016/).

## 2015

See [2015]({{ site.baseurl }}/developer/change-log/2015/).

## 2014

See [2014]({{ site.baseurl }}/developer/change-log/2014/).

## 2013

See [2013]({{ site.baseurl }}/developer/change-log/2013/).

