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
[INFO] Building GNU MCU Eclipse plug-ins root 4.3.3-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ ilg.gnumcueclipse.plugins ---
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] GNU MCU Eclipse core ............................... SUCCESS [  2.589 s]
[INFO] GNU MCU Eclipse debug core ......................... SUCCESS [  0.329 s]
[INFO] GNU MCU Eclipse packages core ...................... SUCCESS [  0.503 s]
[INFO] GNU MCU Eclipse managed build common code .......... SUCCESS [  0.489 s]
[INFO] GNU MCU Eclipse packages data ...................... SUCCESS [  0.656 s]
[INFO] GNU MCU Eclipse managed build packs ................ SUCCESS [  0.421 s]
[INFO] GNU MCU Eclipse packages ........................... SUCCESS [  0.320 s]
[INFO] GNU MCU Eclipse packages UI ........................ SUCCESS [  0.604 s]
[INFO] GNU MCU Eclipse debug packs ........................ SUCCESS [  0.270 s]
[INFO] GNU MCU Eclipse packages feature ................... SUCCESS [  0.177 s]
[INFO] GNU MCU Eclipse GDB debug .......................... SUCCESS [  1.276 s]
[INFO] GNU MCU Eclipse J-Link debug ....................... SUCCESS [  0.761 s]
[INFO] GNU MCU Eclipse debugger Restart button ............ SUCCESS [  0.282 s]
[INFO] GNU MCU Eclipse J-Link debug feature ............... SUCCESS [  0.108 s]
[INFO] GNU MCU Eclipse OpenOCD debug ...................... SUCCESS [  0.539 s]
[INFO] GNU MCU Eclipse OpenOCD debug feature .............. SUCCESS [  0.104 s]
[INFO] GNU MCU Eclipse PyOCD debug ........................ SUCCESS [  0.856 s]
[INFO] GNU MCU Eclipse PyOCD debug feature ................ SUCCESS [  0.116 s]
[INFO] GNU MCU Eclipse QEMU debug ......................... SUCCESS [  0.601 s]
[INFO] GNU MCU Eclipse QEMU debug feature ................. SUCCESS [  0.088 s]
[INFO] GNU MCU Eclipse CodeRed perspective ................ SUCCESS [  0.256 s]
[INFO] GNU MCU Eclipse CodeRed perspective feature ........ SUCCESS [  0.060 s]
[INFO] GNU MCU Eclipse documentation ...................... SUCCESS [  0.059 s]
[INFO] GNU MCU Eclipse documentation feature .............. SUCCESS [  0.060 s]
[INFO] GNU MCU Eclipse ARM managed build code ............. SUCCESS [  0.525 s]
[INFO] GNU MCU Eclipse ARM managed build feature .......... SUCCESS [  0.128 s]
[INFO] GNU MCU Eclipse RISC-V managed build code .......... SUCCESS [  0.437 s]
[INFO] GNU MCU Eclipse RISC-V managed build feature ....... SUCCESS [  0.102 s]
[INFO] GNU MCU Eclipse templates core ..................... SUCCESS [  0.398 s]
[INFO] GNU MCU Eclipse STM32Fx templates .................. SUCCESS [  1.719 s]
[INFO] GNU MCU Eclipse STM32Fx templates feature .......... SUCCESS [  0.069 s]
[INFO] GNU MCU Eclipse Freescale Kinetis templates ........ SUCCESS [  0.328 s]
[INFO] GNU MCU Eclipse Freescale PEx template ............. SUCCESS [  0.274 s]
[INFO] GNU MCU Eclipse Freescale templates feature ........ SUCCESS [  0.072 s]
[INFO] GNU MCU Eclipse SiFive template .................... SUCCESS [  0.381 s]
[INFO] GNU MCU Eclipse SiFive template feature ............ SUCCESS [  0.066 s]
[INFO] GNU MCU Eclipse Cortex-M template .................. SUCCESS [  0.260 s]
[INFO] GNU MCU Eclipse Cortex-M template feature .......... SUCCESS [  0.068 s]
[INFO] GNU MCU Eclipse ADuCM template ..................... SUCCESS [  0.359 s]
[INFO] GNU MCU Eclipse ADuCM template feature ............. SUCCESS [  0.070 s]
[INFO] GNU MCU Eclipse repository ......................... SUCCESS [  5.419 s]
[INFO] GNU MCU Eclipse plug-ins root ...................... SUCCESS [  0.001 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 45.645 s
[INFO] Finished at: 2018-04-19T18:02:13+03:00
[INFO] Final Memory: 161M/1508M
[INFO] ------------------------------------------------------------------------
```

The result is a p2 repository:

* `repositories/ilg.gnumcueclipse.repository/target/repository`

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
