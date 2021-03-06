---
layout: page
permalink: /support/known-issues/
title: Known issues
author: Liviu Ionescu

date: 2015-09-11 21:35:00 +0300

redirect-url: https://eclipse-embed-cdt.github.io/support/known-issues/

---

## Major bugs

### Editing the toolchain may damage the project

In certain conditions, **changing the toolchain** for a project in the **C/C++ Build** → **Tool Chain Editor** page from another plug-in to GNU MCU Eclipse plug-in might not work; even worse, there are cases when the project is permanently damaged. There is not known way to repair such a broken project; you have to create a new project and copy the content (this is a CDT bug, not a plug-in bug).

## Annoying bugs

### CDT 9.5 and the empty Debugger Console

CDT 9.5 introduced a [bug](https://bugs.eclipse.org/bugs/show_bug.cgi?id=541069) 
in the code processing macros, affecting the 
Debugger Console, which always shown as empty.

The bug was fixed and CDT 9.5.5 issued on Nov 19th, 2018.

If you installed any of the initial Photon or 2018-09 releases, including 
[GNU MCU Eclipse IDE for C/C++ Developers 2018-09 20180930](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/tag/v4.4.2-20180930-2018-09),
please perform **Help** → **Check for Updates** and be sure you update to 
CDT 9.5.5 or later.

### Eclipse 4.8 Photon on Linux is unresponsive

This is a Linux specific issue. Due to some GTK issues, the long ARM 
dropdown controls sometimes take 30 
seconds to initialise. On previous Eclipse versions it was possible to 
force the use of GTK2, but on Eclipse 4.8 Photon this does not work as 
expected.

The workaround is to downgrade to Eclipse 4.7 or upgrade to 4.9.

### Win XP 64 global path ignored for debugging sessions

If you are using Win XP 64 and, while starting a debug session, the launcher complains that arm-none-eabi-gdb cannot be found in the current path, you are facing an Eclipse+Java bug, not able to properly process the exec() environment on Win XP 64.

If you really need to use Win XP 64, the workaround is to add the toolchain path to the system path, but be sure you have no more than one toolchain installed.

Preferably avoid using Win XP 64, as recommended below.

### Win XP 64 not able to start the debugging sessions

If you are using Win XP 64 and, while starting J-Link or OpenOCD debug sessions, the launcher hangs at about 62%, you are facing an Eclipse+Java bug, not able to start external processes on Win XP 64.

Generally **Win XP 64 is not recommended at all** and even Win XP 32 is no longer supported by newer Java releases; if you really need to use XP 64, preferably experiment with a 32-bit Java and a 32-bit Eclipse.

However please note that no support requests referring to Win XP 64 will be processed.

### The debugging session fails for imported project

If you imported the project from another workspace and notice that the debugging session fails with messages like:

	/Users/build/GCC-4-8-build/gcc-arm-none-eabi-4_8-2014q2-20140609/src/gdb/gdb/linespec.c:2445: internal-error: decode_line_full: Assertion `state-&gt;canonical_names[i].suffix != NULL' failed.
	A problem internal to GDB has been detected,
	further debugging may prove unreliable.

you are facing a GDB+Eclipse bug, related to an incorrect import of the breakpoints existing in the original project.

The workaround is to remove all breakpoints from the new project right after import.

### Build fails after rename

Due to a problem buried deep into Eclipse, in certain conditions, immediately after renaming a project, right clicking on a project and choosing **Build Configurations** → **Build All**, will display an error window, claiming that the project that the renamed project no longer exist:

![Rename error]({{ site.baseurl }}/assets/images/2013/10/renameError.jpg)

The problem is related to a caching mechanism, and is easily cured by exiting Eclipse and opening it again. Another solution is to close only the renamed project and to reopen it.

### Add Global Variables... is disabled

In the J-Link or OpenOCD sessions, the Variables view does not allow to add global variables. This is a known CDT DSF bug [219040](https://bugs.eclipse.org/bugs/show_bug.cgi?id=219040), not a plug-in bug. As a workaround, you can use watch expressions.

![Add Global Variables is disabled]({{ site.baseurl }}/assets/images/2013/10/DSFAddGlobalVariables.png)

### The internal builder fails while generating the listing

Due to a CDT bug, when using the Internal builder it is not possible to generate the additional program listing. If you need it, it is recommended to enable the **External builder** in the project **Properties** → **C/C++ Build** → **Builder Settings** tab → **Builder type**. 

The **Internal builder** is long deprecated, it was no longer maintained by the CDT team for many years, and it is strongly recommended **not** to use it at all. 

### Conflict while editing tools

Due to a CDT bug, selecting tools in the toolchain editor (the project **Properties** → **C/C++ Build** → **Tool Chain Editor** → **Select Tools...** button)

![Select Tools]({{ site.baseurl }}/assets/images/2013/10/SelectTools.png)

complains about a tool conflict:


![Benign tool conflict message]({{ site.baseurl }}/assets/images/2013/10/ToolConflict.png)


The message is benign, being triggered by an improper test in CDT (all these extra steps have as input the .elf generated by the linker, and this condition is flagged as error by CDT). You can safely ignore it.


### Binaries not visible after build

Due to an Eclipse bug, in certain conditions, after project **→** **Build All**, the generated binaries, do not show in the Project Explorer. A manual **Refresh** makes them visible.

### References to old project name after renaming

Due to a CDT bug, after renaming a project, the Problems window will complain *Invalid project path: Missing project folder or file* referring to the old name. The problem can be cured by closing and reopening the project.

## Other problems

### The Restart button

Due to some bugs in Eclipse, the implementation of his simple button has encountered several problems. Depending on the version you are using, the first time you click this button you might get a message box informing that the button was not enabled. Ignore this message, close the message box and click the button again, this time it’ll be effective.

### Tool Settings window update

Not really a bug, but sometimes perceived like an unusual behaviour, enabling/disabling the secondary tools in the **C/C++ Build** → **Settings → Toolchains** page and immediately switching to the **Tool Settings** tab does not show/hide the new tools. It is necessary to press the **Apply** button for this change to be effective.

![Press Apply after enabling/disabling tools]({{ site.baseurl }}/assets/images/2013/10/ToolsSelection.png)

### Map and listing not removed by Clean

The linker **.map** and the assembler **.lst** files are not removed when running the project **Clean** process. Since these are specific tool options and not makefile targets, the build process does not know about them and is not able to remove them when executing the clean target. Usually these files are generated during each build, so after successful builds they should always be up to date. If the build does not complete, it is possible to still have some of these files around, from the previous build, and this may be confusing. In such cases it is recommended to manually remove them, or, even better, to completely remove the Debug/Release build folder and start a clean build.


## Advices (to avoid problems)

### Toolchain path

**DO NOT add the toolchain path** to the system path, especially if you are using multiple toolchains (and if you do not do it yet, it is very likely that you will, as soon as new versions of the toolchains will be available). The toolchain path should be configured for each toolchain in the **Toolchains** tab, in the **C/C++ Build** → **Settings** page.

### Win XP 64

**Avoid using Win XP 64**, and even XP 32, they are no longer supported by newer Java version; if you really need to use them, for XP 64 preferably experiment with a 32-bit Java and a 32-bit Eclipse. Also please note that no support requests referring to Win XP 64 will be processed.

## Fixed issues

* in versions previous to 1.1.4, after changing the **Remove command** in the **C/C++ Build** → **Settings → Toolchains** page, it was necessary to manually remove the makefile or, even better, the entire build folder, to give CDT a chance to recreate the makefile using the new definition. Starting with version 1.1.5, the makefile is automatically removed and recreated.

## Fixed CDT related issues

* CDT bug [322168](https://bugs.eclipse.org/bugs/show_bug.cgi?id=322168), fixed in Kepler 4.3 SR2: after setting any build property for a folder, the build process did not perform the secondary targets, and no HEX file was created.
* CDT bug [322168](https://bugs.eclipse.org/bugs/show_bug.cgi?id=322168), fixed in Kepler 4.3 SR2: after setting any property for a source file the build process did not perform the secondary targets, and no HEX file was created.
* CDT bug [392416](https://bugs.eclipse.org/bugs/show_bug.cgi?id=392416), fixed in Kepler 4.3 SR2: changing compiler options did not automatically re-trigger a discovery process to get the new default compiler macros. Although most options do not change the default compiler macros, some (like **-std=**) do, and not updating the index can be the source of very annoying situations. If you run older Eclipses, you need to manually clear the discovered entries.

![Clear discovered paths and symbols]({{ site.baseurl }}/assets/images/2013/10/ClearSettings.png)
