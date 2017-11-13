---
layout: page
permalink: /developer/build-procedure/
title: How to build the plug-ins?
author: Liviu Ionescu

date: 2015-09-10 20:22:00 +0300

---

## Build the plug-ins

*   select the **gnumcueclipse-plugins** parent project
*   right click, select **Run As** → **Run configurations...** → **GME clean verify** (be sure you do not run the **install** goal, it'll pollute the cache)
*   wait a while for Maven to load all required modules

The result of a successful build looks like this:

```console
[INFO] ------------------------------------------------------------------------
[INFO] Building GNU MCU Eclipse plug-ins root 4.2.1-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ ilg.gnumcueclipse.plugins ---
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] GNU MCU Eclipse core ............................... SUCCESS [  4.101 s]
[INFO] GNU MCU Eclipse debug core ......................... SUCCESS [  0.422 s]
[INFO] GNU MCU Eclipse packages core ...................... SUCCESS [  0.621 s]
[INFO] GNU MCU Eclipse managed build common code .......... SUCCESS [  0.596 s]
[INFO] GNU MCU Eclipse ARM managed build code ............. SUCCESS [  0.810 s]
[INFO] GNU MCU Eclipse packages data ...................... SUCCESS [  0.826 s]
[INFO] GNU MCU Eclipse packages ........................... SUCCESS [  0.550 s]
[INFO] GNU MCU Eclipse packages UI ........................ SUCCESS [  0.921 s]
[INFO] GNU MCU Eclipse managed build packs ................ SUCCESS [  0.646 s]
[INFO] GNU MCU Eclipse debug packs ........................ SUCCESS [  0.464 s]
[INFO] GNU MCU Eclipse packages feature ................... SUCCESS [  0.300 s]
[INFO] GNU MCU Eclipse GDB debug .......................... SUCCESS [  1.762 s]
[INFO] GNU MCU Eclipse J-Link debug ....................... SUCCESS [  1.135 s]
[INFO] GNU MCU Eclipse debugger Restart button ............ SUCCESS [  0.507 s]
[INFO] GNU MCU Eclipse J-Link debug feature ............... SUCCESS [  0.164 s]
[INFO] GNU MCU Eclipse OpenOCD debug ...................... SUCCESS [  0.771 s]
[INFO] GNU MCU Eclipse OpenOCD debug feature .............. SUCCESS [  0.149 s]
[INFO] GNU MCU Eclipse PyOCD debug ........................ SUCCESS [  1.196 s]
[INFO] GNU MCU Eclipse PyOCD debug feature ................ SUCCESS [  0.133 s]
[INFO] GNU MCU Eclipse QEMU debug ......................... SUCCESS [  0.792 s]
[INFO] GNU MCU Eclipse QEMU debug feature ................. SUCCESS [  0.138 s]
[INFO] GNU MCU Eclipse CodeRed perspective ................ SUCCESS [  0.476 s]
[INFO] GNU MCU Eclipse CodeRed perspective feature ........ SUCCESS [  0.105 s]
[INFO] GNU MCU Eclipse documentation ...................... SUCCESS [  0.071 s]
[INFO] GNU MCU Eclipse documentation feature .............. SUCCESS [  0.071 s]
[INFO] GNU MCU Eclipse ARM managed build feature .......... SUCCESS [  0.118 s]
[INFO] GNU MCU Eclipse RISC-V managed build code .......... SUCCESS [  0.679 s]
[INFO] GNU MCU Eclipse RISC-V managed build feature ....... SUCCESS [  0.193 s]
[INFO] GNU MCU Eclipse templates core ..................... SUCCESS [  0.631 s]
[INFO] GNU MCU Eclipse STM32Fx templates .................. SUCCESS [  2.627 s]
[INFO] GNU MCU Eclipse STM32Fx templates feature .......... SUCCESS [  0.089 s]
[INFO] GNU MCU Eclipse Freescale Kinetis templates ........ SUCCESS [  0.491 s]
[INFO] GNU MCU Eclipse Freescale PEx template ............. SUCCESS [  0.365 s]
[INFO] GNU MCU Eclipse Freescale templates feature ........ SUCCESS [  0.121 s]
[INFO] GNU MCU Eclipse SiFive template .................... SUCCESS [  0.571 s]
[INFO] GNU MCU Eclipse SiFive template feature ............ SUCCESS [  0.092 s]
[INFO] GNU MCU Eclipse Cortex-M template .................. SUCCESS [  0.425 s]
[INFO] GNU MCU Eclipse Cortex-M template feature .......... SUCCESS [  0.098 s]
[INFO] GNU MCU Eclipse ADuCM template ..................... SUCCESS [  0.465 s]
[INFO] GNU MCU Eclipse ADuCM template feature ............. SUCCESS [  0.077 s]
[INFO] GNU MCU Eclipse repository ......................... SUCCESS [  7.358 s]
[INFO] GNU MCU Eclipse RISC-V repository .................. SUCCESS [  3.200 s]
[INFO] GNU MCU Eclipse plug-ins root ...................... SUCCESS [  0.002 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 01:15 min
[INFO] Finished at: 2017-11-13T20:01:33+02:00
[INFO] Final Memory: 171M/1483M
[INFO] ------------------------------------------------------------------------
```

The result are two p2 repositories:

* `repositories/ilg.gnumcueclipse.repository/target/repository`
* `repositories/ilg.gnumcueclipse.riscv.repository/target/repository`

## Build the packages

... mvn clean verify -Pepp.package.cpp

## Debug

To run a debug session using the GNU MCU Eclipse plug-ins:

-   **Run** → **Debug Configurations...**
  * double-click **Eclipse Application**
  * **Name:** `Eclipse GNU MCU Plug-ins`
  * Location: `${workspace_loc}/../runtime-e47`
  * Tab: **Plug-ins**
    * Launch with: **plug-ins selected below**; the Workspace list should include all `ilg.gnumcueclipse.*` plug-ins; the Target Platform list should include all Eclipse, not only CDT, plug-ins; if the Eclipse plug-ins are not in the list, then the Preferences → Plug-in Development -> Target Platform is not Running Platform, and must be changed. The alternative to use **all workspace and enabled plug-ins** might work in some configurations, and can also be used, but if dependencies are not met, manual selection is required.
    * click the **Validate Plug-ins** button; most probably the `org.apache.xmlrpc` plug-in will complain about `javax.xml.bind`; either install it, or disable the plug-in; validate again and disable a few more plug-ins (`org.eclipse.mylyn.bugzilla.core`, `org.eclipse.mylyn.bugzilla.ui`, `org.eclipse.mylyn.builds.ui`, `org.eclipse.mylyn.commons.xmlrpc`, `org.eclipse.mylyn.hudson.ui`).
  * click **Apply**
  * Tab: **Arguments**
    * Program arguments:
      * `-consoleLog`
      * `-debug "${workspace_loc}/../../eclipse-plugins.git/debug.options"` (`-debug "${workspace_loc}\..\..\eclipse-plugins.git\debug.options"` on Windows)
    * VM arguments:
      * `-ea` (to enable assertions)
      * `-Dorg.eclipse.swt.internal.carbon.smallFonts` (only on macOS)
      * `-Xdock:icon=../Resources/Eclipse.icns` (only on macOS)
    * enable **Use the -XstartOnFirstThread argument when launching with SWT**
  * click the **Apply** button
  * click the **Debug** button

Clear all errors in the **Problems** tab.

Be sure the target platform is the Running Platform, otherwise starting the debug session fails.

## Debug options

As seen before, the debug options are grouped in a file and passed to Eclipse using the `-debug <file>` option.

## Plug-ins cache

When starting debug sessions from within Eclipse, a copy of the run-time is kept under 

```
${workspace_loc}/.metadata/.plugins/org.eclipse.pde.core/Eclipse GNU MCU Plug-ins
```

For unknown reasons, some changes in the source code (like changing properties files) do not trigger a rebuild, and it is normally not possible to test these changes.

The workaround I found was to remove this folder, and Eclipse will recreate it before the next run.

## Debug with CDT sources

A more elaborated configuration is required when willing to run debug sessions using CDT source files from the Git repository, for example to debug issues inside CDT.

Clone the CDT repository:

```console
$ cd .../"GNU MCU Eclipse"
$ mkdir -p originals
$ git clone git://git.eclipse.org/gitroot/cdt/org.eclipse.cdt.git originals/org.eclipse.cdt.git
```

For regular tests, select the `CDT_9_2_1` tag.

Create a new working set named `CDT`.

* in the Package Explorer view, click the down pointing triangle, 
* select **Configure Working Sets...** 
  * click the **New...** button
  * fill in the **Working set name:** with `CDT`
  * click the **Finish** button
  * click the **OK** button
  
Import all CDT projects

* in the _Eclipse_ menu → **File** → **Import...** → **General** → **Existing Projects into Workspace**
* click the **Next >** button
* browse for the `org.eclipse.cdt.git` folder
* deselect some projects selected
* enable **Add projects(s) to working set** and enter CDT
* click the **Finish** button

Create a new debug configuration

* in the _Eclipse_ menu → **Run** → **Debug Configurations...**
* duplicate `Eclipse GNU MCU Plug-ins` into `Eclipse GNU MCU Plug-ins with CDT`
* in teh **Plug-ins** tab, click the **Add Working Sets..** button
  * select the `CDT` set
  * click the **OK** button
* using the **Validate Plug-ins** button, disable unwanted plug-ins (like all tests) until the validation passes
* click the **Apply** button
* click the **Debug** buton to start a debug session
