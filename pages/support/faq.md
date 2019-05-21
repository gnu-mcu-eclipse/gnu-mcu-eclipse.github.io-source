---
layout: page
permalink: /support/faq/
title: FAQ
author: Liviu Ionescu

date: 2015-09-11 20:28:00 +0300

---

<div style="clear: both;"></div>

## Why the **xPack...** button is not enabled?

> I correctly installed the `@gnu-mcu-eclipse/arm-none-eabi-gcc` xPack,
  but the **xPack...** button is still disabled and I cannot select the
  desired version.

This button is enabled only for the **GNU MCU Eclipse ARM Embedded GCC**
toolchain; check the toolchain name, you might have
selected a toolchain which has no xPacks available,
like the old **GNU ARM Embedded Toolchain**.

## xpm: integrity checksum failed

On Windows, binary packages are .zip archives containing .exe files; 
some aggressive antivirus programs may quarantine those files, or even 
modify the content of the archives, affecting the checksum and thus 
preventing the packages to be installed.

Errors may look like:

```
Downloading https://github.com/gnu-mcu-eclipse/qemu/releases/download/v2.8.0-4-20190211/gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win64.zip...
{ Error: sha256-p3CgzXJt4zi5g0kxQXlOpss3Xu5Yy+Zv8HXWXkUdg6g= integrity checksum failed when using sha256: wanted sha256-p3CgzXJt4zi5g0kxQXlOpss3Xu5Yy+Zv8HXWXkUdg6g= but got sha512-k1s9UW6Zb20llIuopUwbf3D38OP1F+Nkgf3wGWwsXPwoQfhuiR89+VF3Rrf7YF20fN3tG4/3jZSC3apiHbQ6NA== sha256-ABnfxLMtY8E5KqJkrtIlPB4ML7CSFvjizCabv7i7SbU=. (9 bytes)
...
Extracting 'gnu-mcu-eclipse-qemu-2.8.0-4-20190211-0633-win64.zip'...
error: Cannot read property 'path' of null
```

The solution is to configure the antivirus to be less aggressive, at least for files in the `AppData\Roaming\xPacks` and `AppData\Local\Caches\xPacks` folders.

If this is not possible, temporarily disable the antivirus; if this is also not possible, install the packs manually (if you can!).

## Cannot find the bin folder on macOS

When installing binary packages as xPacks, the install location is a folder that ends in `.content/bin`, like 

```
/Users/ilg/Library/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/7.2.1-1.1.3/.content/bin
```

Unfortunately, due to a weird decision of the Eclipse macOS developers, the file system browser does not show file/folders starting with a dot; thus, on macOS, the `.content/bin` final part of the path must be entered manually.

This is one more reason to use the **xPack...** button, and select the xPack version in the drop down box.

## Cannot find the tools path preferences page

> The JLink/QEMU/OpenOCD plug-in doesn't appear to be installing correctly, or at all, there is no JLink/QEMU/OpenOCD page in the Run/Debug group.

Starting with version 4.x, the Preferences were moved under the new **MCU** group:

![MCU]({{ site.baseurl }}/assets/images/2017/preferences-mcu.png)

## Java was started but returned exit code=13

This obscure message is issued by Eclipse when you are trying to use a 64-bit Eclipse on a 32-bit Java (and possibly the other way around).

If you install Java for the first time, be sure you use the 64-bit Java on 64-bit systems, and then the 64-bit version of Eclipse.

## Receive fatal alert: handshake_failure

![Handshake failure]({{ site.baseurl }}/assets/images/2017/handshake-failure.png)

If you use the Oracle JDK, starting with mid January 2017, attempts to install from SourceForge [fail with handshake_error]({{ site.baseurl }}/blog/2017/01/29/plugins-install-issue/). Install the [Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files](http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html) and retry to install the plug-ins.

## Initial GDB 7.12 fails on macOS

When using `arm-none-eabi-gdb` 7.12 from the initial `6_2-2016q4-20161216`, the debug session fails to start on macOS; the reason is a bug in `arm-none-eabi-gdb` affecting the MI2 interface; the solution is to use a more recent version, `6-2017-q1-update` or later.

## GDB 7.12 is not compatible with Neon.2

Due to some CDT bugs, Neon.2 fails to suspend or to terminate a debug session when using GDB 7.12; the solution is to use Neon.3 or later.

## Unable to read repository

If you are behind a firewall, older Java virtual machines [fail to connect to SourceForge]({{ site.baseurl }}/blog/2016/12/02/plugins-install-issue/). Install the latest JDK and retry to install the plug-ins.

## I cannot install the plug-ins on Eclipse Neon

Eclipse Neon uses CDT 9.x, which introduced some incompatible API changes. To accommodate these changes, a new major version was released (3.1.1), providing a solution that works on both the new API and the previous 8.x API (version 8.6 or higher).

This change also raised the minimum supported version to Eclipse Luna SR2 and JavaSE-1.7. Eclipse Kepler and previous are no longer supported.

## I cannot install the plug-ins

> I get the following when trying to install Cross Compiler

```console
Cannot complete the install because one or more required items could not be found.
Software being installed: GNU ARM C/C++ Cross Compiler 1.15.2.201511061603 (ilg.gnuarmeclipse.managedbuild.cross.feature.group 1.15.2.201511061603)
```

Your Eclipse does not include CDT. You need to install **Eclipse IDE for C/C++ Developers** or to manually add CDT to an existing Eclipse.

## I cannot connect via J-Link to my ST DISCOVERY or NUCLEO board

If you try to connect via the SEGGER J-Link debug plug-in to a stock ST DISCOVERY or NUCLEO board and the JLinkGDBServer keeps refuses to connect (_'Connecting to J-Link failed. Connected correctly?'_), please note that the on-board programmer firmware on the ST boards is compatible with ST-LINK/v2, not J-Link. However, SEGGER provides an upgrade path, and most of the ST bemo boards can be converted to J-Link; please follow the SEGGER [Converting ST-LINK on-board into a J-Link](https://www.segger.com/products/debug-probes/j-link/models/other-j-links/st-link-on-board/) page.

## I installed Eclipse with Synaptics and I have problems to install the plug-ins

On GNU/Linux, **DO NOT** install Eclipse with the system package manager, because usually it installs an older version, and CDT is not include.

Instead, go to the [Eclipse download site](http://www.eclipse.org/downloads/) and get the proper **Eclipse IDE for C/C++ Developers**, preferably the 64-bit version.

## OpenOCD fails to start with `-c echo "Started by GNU ARM Eclipse"`

> I'm trying to start OpenOCD in a terminal and it fails to execute the `echo` command...

The syntax required by the OpenOCD `echo` command is a single string, in other words both echo and the message must be in the same string. To achieve this in a shell, the string must be quoted:

```
-c 'echo "Started by GNU ARM Eclipse"'
```

Please note that this command is used by the plug-in to detect when the GDB server is initialised and ready to receive commands; it is not necessary when starting OpenCOD manually.

## How to compile files excluded from build?

> Why the default state for `system/src/.../xxx.c` is not enabled?

Because during project creation the wizard was configured with **Exclude unused**.

> How to enable them?

Right click → **Resource Configurations** → **Exclude from build** → uncheck


## The **Devices** tab is not visible.

> I installed GNU ARM Eclipse plug-ins in LPCXpresso. ... I can't see Devices tab in the Settings window of project Properties.

Unfortunately it is not possible to assign devices/boards to projects created by other plug-ins, because they lack the mechanisms to handle such additional data. The **Devices** tab is  visible only for projects created by the GNU ARM Eclipse plug-ins.

## Error: undefined reference to _function_

> I created a simple STM32x project... I can call the functions in RCC and GPIO header files, but while calling functions in TIM header the linker reports an undefined reference.

By default, the template wizard enables the **Exclude unused** option. The result is that unused device drivers source files, although copied in the project, are excluded from build, mainly to save some build time.

If you need to re-include some of the source files you need to right click on the file, select **Resource Configurations** → **Exclude from Build...** and deselect the build configuration you want to include the file.

## How can I debug projects compiled with ARM CC?

Generally debugging is done using the GDB client program, which reads only GNU debugging info, preferably from .ELF files. If you can manage to configure non-GNU toolchains to generate .ELF files and to include dwarf debugging info, you are free to experiment with GDB, but please be aware that non-GNU toolchains are not supported by the GNU ARM Eclipse plug-ins.

## How do I create a C-only (not C++) Cortex-M projects?

Well, easily, with **New C Project**. However if the question is related to the projects generated by the templates, they always use G++ as linker.

> I want to make sure the G++ compiler is not putting any object code in that I do not want.

No need to worry, if you have no C++ source files in your project, the g++ compiler is never used.

The advantage of using g++ as linker is that, even for C projects, you can link a library that has a C interface but internally uses C++ (this is perfectly possible).

If you have no C++ object files in the project, there is no difference.

## Why my breakpoints are not effective and execution stops somewhere else?

> My breakpoints behave erratic, the program does not stop in the desired function but in the function immediately following.

This is usually the effect of optimisations, if your function was not referred in your program, the linker removed it completely. Eclipse does not know this, and any breakpoint placed in the removed function is in fact placed at the beginning of the next function.

## How to single-step empty loops?

> I'm trying to single-step a simple loop, but execution does not stop after a single iteration, the target runs continuously, with permanent interactions with the debugger.

The current GDB has a problem with placing breakpoints **in simple loops**, and **single-stepping fails**. The problem was already reported ([bug 1401565](https://bugs.launchpad.net/gcc-arm-embedded/+bug/1401565)). If you really need this, switch to assembly view and single-stepping is again functional.

## Why the debugging flow with -Og is sometimes jumpy?

> The manual suggests to use -Og for optimising programs for Debug, but when stepping loops the execution flow is sometimes quite jumpy, moving outside the loop and back.

In GCC prior 4.9, the definition of **-Og** needs a small adjustment, also add the **-fno-move-loop-invariants** option to the Debug configuration; this will prevent the compiler to move some constant parts of the loop outside it and the execution flow will be more easy to follow. The problem was already reported ([bug 1395077](https://bugs.launchpad.net/gcc-arm-embedded/+bug/1395077)). Starting with 4.9, the -fno-move-loop-invariants is added automatically to -Og.

## How can I add new SourceForge tickets if no Create Ticket button is available?

> Please excuse me for not using the support ticket tool you provided on sourceforge but I seem to be too incompetent to even spot some type of "add request" button.

Following the migration to GitHub, the SourceForge ticketing system was configured as read-only, and new tickets can no longer be added.

Please login to GitHub and use the GitHub Issues trackers.

## Plug-ins update from 0.5.x running on Juno to current version fails

> Cannot complete the install because one or more required items could not be found.

Attempts to update the plug-ins when running on Eclipse Juno are expected to fail, since versions starting with 1.x up require Eclipse 4.3 Kepler.

The recommended solution is to first upgrade your Eclipse to Kepler 4.3 and then retry to update the plug-ins.

## Semihosting enabled application hangs

> After usb disconected and reconected program do not run (the example flashing led is not blinking).

This is absolutely normal for any application build with semihosting support. The semihosting channel is using resources from the debugger. Without the debugger active, the instructions used for the communication channel generate run-time faults.

Update: M3/M4 projects generated with version 2.2.1-201404120702 or later check when not running under debugger and skip the trace call, so it is possible to run the application standalone.

## Unrecognized command line option "-std=gnu11" (or "-std=c++11")

You are using an old toolchain, pre GCC 4.7. In older versions, the C11 and the C++11 standards were not available, and compilers did not allow to set this option.

Update your toolchain to a modern one, or, if this is not possible, change the **-std=** option to something supported by your toolchain (probably -std=gnu1x, or -std=gnu99; -std=c++0x for C++).

## Program "echo" not found in PATH

You are running on Windows, and did not install the full content of the archive described in the [Build Tools][1] page. The *echo* program is not used per se, it is only a workaround for a known CDT bug. On macOS and GNU/Linux the *echo* program is always present, being part of the standard configuration. On Windows it should be installed separately and, for convenience, it is provided in the Build Tools package.

## Installation problems on Eclipse 3.8

> I was trying to install the plugin in my eclipse 3.8 but I got: Cannot complete the install because one or more required items could not be found.

Version 1.x or later of the GNU ARM Eclipse plug-ins cannot run on Eclipses older than 4.3 Kepler. Please update Eclipse to the latest version and reinstall the plug-ins.

## The plug-in seems to ignore assembly .s files. How can I add them to the project?

Due to a very complicated portability reason, Eclipse is not able to distinguish, and thus separately process, **.s** and **.S** files. The current CDT configuration associates assembly files only with .asm and .S files, and completely ignores .s files. Although it might be possible to change the Eclipse file associations, I would not recommend this. Better change the assembly file extensions to .S and use the default settings.

Please note that .S assembly files will be processed by **gcc**, not by **as**; this also means that the file will be first preprocessed like all C/C++ files, allowing conditional compilation and macro expansion.

## The generated Makefile seems to be broken. How can I fix it?

If you notice something wrong in the Makefiles, like macro names not substituted, missing sections, labels, etc, the project file might be broken. To fix it, create a new project. Do not copy/paste the damaged one, be sure you create it from scratch. However, you can copy/paste the source files.

As mentioned in the [Known issues][2], avoid changing settings for individual files/folders or changing the toolchain for a project, since these are known problems in some CDT version and might damage your project.

## I want to see the source code. How can I access the repository?

Go to [GitHub](https://github.com/gnu-mcu-eclipse/eclipse-plugins).

## The build generates a long console listing instead of creating the secondary targets

You enabled the Internal builder, which does not work properly. Switch back to the External builder and the build will succeed.

## Cannot run program "make": Launching failed

Most probably you are running on Windows, and forgot to add the builder tools or to add the path to them. See the [Build Tools][1] page.

## Program "arm-none-eabi-gcc" not found in PATH

You most probably did not configure properly the toolchain path, and CDT cannot start the discovery process. Check the path in the project **Properties** → **C/C++ Build** → **Settings** → **Toolchains** → **Path**.

![Setting the toolchain path and preffx]({{ site.baseurl }}/assets/images/2013/10/SettingsPathPrefix.png)

## Program "gcc" not found in PATH

Although it looks like the above, it is worse, since it shows that the prefix is not prepended to the compiler command. Check the prefix in the project **Properties** → **C/C++ Build** → **Settings** → **Toolchains** → **Prefix**.

## The Toolchains tab does not appear on old projects

The **Toolchains** tab is specific to the new version of the plug-in. If you have projects created with the old version (0.5.x), the Toolchains tab does not appear.

You can identify old project by checking the Settings page; if the tool names do not start with "Cross ARM", or the Target Processor page does not show in the second half options specific to the AArch64 family, then you are not in the case of the new plug-in.

## How to migrate projects created with the old version of the plugin?

Unfortunately projects created with the old version of the plug-in cannot be migrated by a simple change of the toolchain settings in Eclipse, since CDT has some problems with changing toolchains.

The recommended method is to create a new project, add the source files and update the project options.

## Cannot use -c together with -o ... for multiple files

If the compiler complains something like this, then it might be possible that projects created with versions pre-1.1.3 need an update. First check the list of include folders, for each compiler tool, if the list is there, you're done; otherwise, adding the folders again usually fixes the problem.

If you have lots of folders and re-entereing them is tedious, you can try to manually edit the `.cproject` file. For this, first close Eclipse, and edit `.cproject` with a separate editor. Search for the lines with ".include.files"; if below them you see the list of folders, you don't have to re-enter them again; check if the `<option>` element has an `name=` attribute; if not, add it before the superClass attribute, with the following content:

```
<option id="...include.paths.NNN" name="Include paths (-I)" superClass="...">
```

## I tried to use Float ABI: hard on Cortex-M4, but the linker fails

```console
Building target: test1.elf
Invoking: Cross ARM C++ Linker
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/bin/ld: error: test1.elf uses VFP register arguments
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/lib/libg.a(lib_a-impure.o) does not
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/bin/ld: failed to merge target specific data of file
/usr/bin/../lib/gcc/arm-none-eabi/4.7.4/../../../../arm-none-eabi/lib/libg.a(lib_a-impure.o)
...
```

Although on Cortex-M4 the only available FPU hardware is fpv4-sp-d16, the compiler does not have a default defined for this, and it is necessary to explicitly select **FPU Type: fpv4-sp-d16** in the C/C++ Settings page.

## Launching the debugger fails with "Error in final launch sequence"

The GDB client 7.4.1.20130913-cvs, packed in gcc-arm-none-eabi-4_7-2013q3 has some problems to decode DWARF debug information generated by -g3 option and sometimes crashes during launch, generating an obscure Eclipse error message box.

![Final launch sequence error]({{ site.baseurl }}/assets/images/2013/10/final-launch-sequence-error.png)

The problem is known and the 4_7-2014q1 update should fix it. For the time being, please recompile your project with -g or -g2 to work around this issue.

## What do the template configurations (standalone, retargetting or semihosting) mean?

* **Standalone** means a typical embedded configuration, that does not use the POSIX system calls (open, close, read, write, etc).
* **Retargetting** is a more elaborate embedded configuration where the application makes use of these calls, but redirects the file descriptors to local devices or files, by providing custom implementations for the system calls (like \_open, \_close, \_read, \_write, etc). This configuration allows to port POSIX programs easier.
* **Semihosting** is a special testing configuration, that bridges **all** system calls to the host operating system where the GDB server runs. This configurations is particularly interesting for running test programs that can leave the test results in a file stored on the host, for automated integration in a test suite.

## Problems, related to old bugs, that should no longer occur

### I changed the _"Remove command"_, but the value is not effective

In most usual managed build plug-ins, the **rm** command is hard-wired and it cannot be reconfigured. So its value is assumed to be constant, and, when the makefile is generated, CDT writes it inside the makefile. The GNU ARM Eclipse Plug-in takes a step further, and allows this definition to be reconfigured, but currently cannot trigger the recreation of the makefile.

Given that updating the Remove command is not done very often, the easiest workaround is to manually remove the makefile, or the entire build folder, and so the makefile will be created from scratch.

Fixed in 1.1.5.

-/-

 [1]: {{ site.baseurl }}/windows-build-tools/ "Build tools (make & rm) on Windows"
 [2]: {{ site.baseurl }}/support/known-issues/ "Known problems"
 [3]: https://sourceforge.net/projects/gnuarmeclipse/
