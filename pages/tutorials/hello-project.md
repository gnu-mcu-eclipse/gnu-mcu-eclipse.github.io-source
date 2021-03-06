---
layout: page
permalink: /tutorials/hello-arm/
title: 'Tutorial: Create a Hello ARM test project'
author: Liviu Ionescu

date: 2015-09-11 22:43:00 +0300

---

Note: This page was superseded by the new [Create a Blinky Arm test project][1] page.

If you are new to Arm development, it is recommended to follow this short tutorial and learn how to build a simple test executable program.

Note: this tutorial was created with the **GNU Tools for ARM Embedded Processors** toolchain in mind. Only when using this toolchain the build is guaranteed to succeed. Using other toolchains might be possible, but small changes might be necessary in the source code and in the linker options.


## Prerequisites

Before creating a new project, please be sure you checked all prerequisites described in the [How to use]({{ site.baseurl }}/plugins/mbs/) page, especially the need to install the [build tools]({{ site.baseurl }}/windows-build-tools/install/) if you use Windows as your development platform.

It is also recommended to [set the workspace preferences][2].

## Create a new C project

To create a new project, go to _Eclipse_ menu, **File** → **New** (or the button in the upper left corner), and select the **C Project**:

![NewCProject]({{ site.baseurl }}/assets/images/2013/10/NewCProject.png)

In the **C Project** window:

* in the *Project name:* field enter the name of the new project, for example **hello**
* in the *Project type:* section expand the **Executable** type and select **Hello World ARM Cortex-M C/C++ Project** (after you complete this tutorial, you can also build specific STM32F1x or STM32F4x projects, following the same procedure).
* in the *Toolchains:* section select **Cross ARM GCC**
* click the **Next >** button

![New C Hello Project]({{ site.baseurl }}/assets/images/2013/10/NewCHelloProject1.png)

In the ** Target processor settings** window be sure to:

* select the Cortex-M3, since the current version of QEMU emulates only Corte-M3 core
* leave the *Clock (Hz):* field set to 8000000, since this is the default QEMU value, and for generic cores it cannot be changed
* as for real hardware, the memory sizes reflect exactly the values of the emulated controller (in our case a STM32F103RB)
* for a more complete example, change the *Use system calls:* fields to **Semihosting (POSIX system calls via host)**
* click the **Next >** button.

![Hello Processor Settings]({{ site.baseurl }}/assets/images/2013/10/HelloProcessorSettings.png)

In the **Folders** page leave the suggested folders unchanged and click the **Next >** button.

![Define the project folders]({{ site.baseurl }}/assets/images/2013/10/HelloFolderSettings.png)

In the **Select Configurations** page leave the suggested Debug/Release configurations checked and click the **Next >** button.

![Hello Configurations]({{ site.baseurl }}/assets/images/2013/10/HelloConfigurations.png)

In the **Cross GNU ARM Toolchain** window:

* select the *Toolchain name:* **GNU Tools for ARM Embedded Processors** (mandatory)
* browse for the **bin** folder within the toolchain folder
* click the **Finish** button

![Hello Toolchain]({{ site.baseurl }}/assets/images/2013/10/HelloToolchain.png)

Note 1: when selecting the path, be sure you select the **/bin** folder where the programs with long, prefixed names are stored, and not the inner /bin folder where the short name programs may be available.

Note 2: DO NOT SKIP this step, it is mandatory to have a correct toolchain path defined in order for the build to complete correctly.

![Hello Toolchain Path]({{ site.baseurl }}/assets/images/2013/10/HelloToolchainPath.png)

The result of the wizard is a simple project, with a **main()** function printing a greeting on the standard output.

![Hello Project]({{ site.baseurl }}/assets/images/2013/10/HelloProject.png)

## Build the project

To start the build:

* select the new project in the *Project Explorer* section
* click the **hammer** icon

![Hammer Build]({{ site.baseurl }}/assets/images/2013/10/HammerBuild1.png)

The build process should leave in the *Console* window a listing like this:

![Hello Project Build Console]({{ site.baseurl }}/assets/images/2013/10/HelloProjectBuildConsole.png)

The files created by the build process are left in a folder named by the name of the configuration, for example *Debug* or *Release*.

![Hello Build Result]({{ site.baseurl }}/assets/images/2013/10/HelloBuildResult.png)

As seen above, the *Debug* folder is populated with

* all make files required for the build (**makefile** and various ***.mk** files, generated by CDT),
* the object files and dependency files generated during the build (**main.o** and **main.d**)  and
* the final executable file, with all debug symbols, useful for a debug session (**hello.elf**)
* the binary executable file, ready to be programmed in flash (**hello.hex**)
* a program map, with all symbols and their associated addresses (**hello.map**)

## Semihosting

Contrary to usual POSIX environments, like GNU/Linux, embedded systems usually do not provide standard input/output devices. In the code generated by the template, the output of the printf() calls, including trace_printf(), is redirected to a special debugging channel implemented by most debuggers, using the semihosting protocol.

## Run the test with QEMU

This project is not specific to a physical processor, so no specific initialisations are included, which makes the code generated above being able to run on any Cortex-M3 processors (assuming it has at least the required RAM).

The most convenient way to test such generic code is to use the [QEMU Debugging plug-in][3].

## Next step

Once you checked the development environment to be functional, proceed with creating real projects using the [STM32Fx][4] templates, Freescale [KLxx][5] templates, or, if your target processor is not yet supported, using the Generic [Cortex-M][6] template.

## Troubleshooting

The usual sources for build failures are:

* a wrong or missing toolchain path; go to the project properties, C/C++ Build → Setting → the Toolchains tab and define the correct path;

![Global Tools Paths]({{ site.baseurl }}/assets/images/2015/02/GlobalToolsPaths.png)

* missing build tools (make & rm) on Windows; install the [build tools][7].

## Support

If something went wrong and you cannot build the project, please check the [How to use]({{ site.baseurl }}/plugins/mbs/), the [FAQ]({{ site.baseurl }}/support/faq/) and the [Known issues]({{ site.baseurl }}/support/known-issues/) pages. If you do not find the answer to your question, please read the [Support]({{ site.baseurl }}/support/) page on how to record a support request in the Support tracker. Do not post comments on this page unless they are related to the text (the phrasing is not correct, you discovered typos, etc).

 [1]: {{ site.baseurl }}/tutorials/blinky-arm/ "Tutorial: Create a Blinky Arm test project"
 [2]: {{ site.baseurl }}/eclipse/workspace/preferences/ "Workspace preferences"
 [3]: {{ site.baseurl }}/debug/qemu/ "The QEMU debugging Eclipse plug-in"
 [4]: {{ site.baseurl }}/templates/stm32f/ "STM32Fxx templates"
 [5]: {{ site.baseurl }}/templates/klxx/ "KLxx template"
 [6]: {{ site.baseurl }}/templates/cortexm/ "Generic Cortex-M template"
 [7]: {{ site.baseurl }}/windows-build-tools/ "Build tools (make & rm) for Windows"
