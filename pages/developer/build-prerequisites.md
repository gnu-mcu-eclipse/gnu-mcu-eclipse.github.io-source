---
layout: page
permalink: /developer/build-prerequisites/
title: Build prerequisites
author: Liviu Ionescu

date: 2015-09-10 20:20:00 +0300

---

## Install & Configure Eclipse

### Install Git for Windows

On Windows, the `git` command is available in the [Git for Windows](https://git-scm.com/download/win) package.

It also comes with a minimal POSIX environment. To access it, start the `bash.exe` program.

### Install SourceTree

For a convenient access to Git, it is recommended to install [SourceTree](https://www.sourcetreeapp.com/), available for macOS and Windows.

### Install Java

Install Sun JDK 1.8 or later (required since Eclipse 4.6); JRE is not enough, without JDK you will not be able to run debug sessions.

### Prepare folders

*   in a place of you choice, create a folder `GNU MCU Eclipse`
*   inside it create two more folders, `Eclipses` and `Eclipse Workspaces`

### Install Eclipse IDE for Eclipse Committers

This instance of Eclipse will be used for actual development.

- go to [Eclipse download site](http://www.eclipse.org/downloads/) and follow the [download packages](https://www.eclipse.org/downloads/eclipse-packages/) link
- download **Eclipse IDE for Eclipse Committers**, preferably the 64-bits version (for example eclipse-committers-oxygen-1a-macosx-cocoa-x86_64.dmg)
- unpack the archive
- on macOS, remove the `com.apple.quarantine` attribute:

```console
xattr -d com.apple.quarantine Eclipse.app
```
- rename `Eclipse.app` to `Eclipse-com-cdt-47.app` (`eclipse` to `eclipse-com-cdt-47` on Windows)
- move it to `.../GNU MCU Eclipse/Eclipses`
- create link on the desktop:
  - on Windows, create a shortcut for `eclipse.exe`, rename it `e47-gme.lnk` and copy it to the desktop or a place of your choice
  - on macOS, create a Finder alias for `Eclipse.app`, rename it `E47 GME` and move it to a place of your choice
  - on GNU/Linux, create a soft link for `eclipse`, rename it `E47 GME` and move it to a place of your choice

###   Start the new Eclipse

-   create a new workspace, preferably in a separate folder, like `Eclipse Workspaces/w-gme-47` (note: be sure you create the workspace where you need it to be, since moving later is generally not supported by Eclipse; if you need this, preferably create a new workspace)
- check **Use this as default...**
-   check if you installed the right Eclipse; go to the _Eclipse_ menu → **Help** (**Eclipse** on macOS) → **About Eclipse** and the first line should read **Eclipse IDE for Eclipse Committers**
-   **Help** → **Install New Software**
  * Work with: `Oxygen - http://download.eclipse.org/releases/oxygen`
    * In **Programming Languages**
      * select **C/C++ Development Tools**
      * select **C/C++ Development Tools SDK**
      * optional: Autotools, LLVM-Family, Unit Testing, Docker Container Launch Support...
    * In **Mobile and Device Development**
      * select **C/C++ GCC Cross Compile Support**
      * select **C/C++ GDB Hardware Debugging**
      * select **C/C++ Memory View Enhancements**
    * click the **Next** button
    * accept the terms of the license agreement
    * click the **Finish** button
  * wait for the new plug-ins to be installed
-   restart

Note: without the CDT sources available in the SDK, the extension point schemas will not be available so attempts to add new elements to the extensions will not be possible, and only 'Generic' elements will be offered

### Install base API

* go to <http://www.eclipse.org/cdt/downloads.php>, and download `cdt-9.2.1.zip` (for compatibility with Ecipse 4.6 Neon.3)
* unpack the archive
* move the new folder to in the Eclipses folder
* in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development** → **Target Platform**
  * click the **Add...** button
  * select **Nothing: Start with an empty target**
  * Next
    * Enter name: `9.2.1 Neon`
    * click **Add...** → **Directory** → **Next >**
    * click **Browse...** → `cdt-9.2.1`
    * click the **Finish** button
  * click the **Reload** button
  * click the **Finish**
* enable only the **Running Platform as Active** (mandatory!)
* click **Apply and Close**

Selecting the running platform is required when starting Eclipse to Run or Debug, without it the core plug-ins will not be available.

* in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development** → **API Baselines**
  * click the **Add Baseline...** button
  * select **A target platform**
    * Enter name: `9.2.1 Neon`
    * enable `9.2.1 Neon`
    * click the **Refresh** button
    * click the **Finish** button
* click **Apply and Close**

### Create and configure the workspace

-   change the workspace preferences
  * go to the _Eclipse_ menu → **(Window →) Preferences...**
  * **General** → **Workspace**
    * disable **Build automatically**
    * enable **Refresh on access**
    * enable **Save automatically before rebuild**
    * set **Text file encoding: UTF-8**
    * click the **Apply** button
  * **General** → **Editors** → **Text Editors**
    * enable **Show Print Margin** (80)
    * enable **Show Line Numbers**
    * click the **Apply** button
  * **General** → **Editors** → **File Associations**
    * click **Add** and add *.inf, *.sh, *.command, *.ini
    * for each, click the **Add** button in the Associate editors area
    * associate with the Text Editor
    * click the **Apply and Close** button

  * go to the _Eclipse_ menu → **(Window →) Preferences...**
  * **Run/Debug** → **Console**
    * disable Limit console output
    * click the **Apply** button
  * **Java** → **Editor** → **Folding**
    * disable **Header Comments**
    * disable **Imports**
    * click the **Apply** button
  * **XML** → **XML Files** → **Editor**
    * Line width 72
    * enable **Split multiple attributes...**
    * disable **Align final bracket...**
    * enable **Preserve whitespace..**
    * enable **Clear all blank lines**
    * disable **Format comments**
    * enable **Insert whitespace before closing...**
    * enable **Indent using tabs**
    * click the **Apply** button
  * click the **Apply and Close** button

### Install several Eclipse CDT instances

These separate instances of Eclipse will be used to test the plug-in.

Go to [Eclipse download site](http://www.eclipse.org/downloads/) and follow the [download packages](https://www.eclipse.org/downloads/eclipse-packages/) link.

#### Eclipse 4.7 Oxygen

Install **Eclipse IDE for C/C++ Developers**.

-   download **Eclipse IDE for C/C++ Developers** (`eclipse-cpp-oxygen-1a-macosx-cocoa-x86_64.dmg`)
-   unpack the archive
-   rename *_Eclipse_* to **Eclipse-cdt-47.app**
-   on macOS, make a Finder alias of the **Eclipse.app**, rename it **E47 CDT test** and move it to a place of your choice (the Desktop, for example); remove the `com.apple.quarantine` attribute.

#### Eclipse 4.6 Neon.3

-   download **Eclipse IDE for C/C++ Developers** (`eclipse-cpp-neon-3-macosx-cocoa-x86_64.tar.gz`)
-   unpack the archive
-   rename *_Eclipse_* to **Eclipse-cdt-46.app**
-   on macOS, make a Finder alias of the **Eclipse.app**, rename it **E46 CDT test** and move it to a place of your choice (the Desktop, for example); remove the `com.apple.quarantine` attribute.

## Clone the repositories

On Unix systems, the recommended method is using a command line:

```console
$ cd .../GNU\ MCU\ Eclipse
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/eclipse-plugins.git eclipse-plugins.git
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages.git org.eclipse.epp.packages.git
```

On Windows, the `git` command is available in the [Git for Windows](https://git-scm.com/download/win) package, it should have been installed from the first step.

## Import the projects

Import projects using the generic importer:

* _Eclipse_ menu → **File** → **Import**
* Select
  * General → **Existing Projects into Workspace**
  * click **Next**
* Import Projects
  * Root Directory: `.../GNU MCU Eclipse/eclipse-plugins.git`
  * enable **Search for nested projects**
  * disable **Add project(s) to working set**
  * click **Finish**
* Import Projects
  * Root Directory: `.../GNU MCU Eclipse/org.eclipse.epp.packages.git`
  * enable **Search for nested projects**
  * disable **Add project(s) to working set**
  * click **Finish**

(From EPP disable most projects, except cpp & common)
## Configure the working sets

In the Java Perspective, create Workspace Sets

* **GNU MCU Eclipse bundles**
* **GNU MCU Eclipse features**
* **GNU MCU Eclipse plugins root** (with the `gnumcueclipse-plugins` project)
* **GNU MCU Eclipse repositories** (with the `ilg.gnumcueclipse.repository` and `ilg.gnumcueclipse.riscv.repository` projects)
* **GNU MCU Eclipse EPP packages root** (with the `org.eclipse.epp*` projects)

In the Java Perspective, the Package Explorer:

* click the down pointing triangle icon and select **Top Level Elements** → **Working Sets**
* click the down pointing triangle icon and select  **Configure Working Sets...**
  * click the **New...** button
  * click the **Resource** category
  * Give the set a name (for example `GNU MCU Eclipse bundles`)
  * select the desired projects
  * click the **Finish** button
  * repeat for all desires sets
* click the **OK** button

## Create the Maven run configurations

To start the plug-ins Maven build from Eclipse

* in the `GNU MCU Eclipse plugins root` set, select the `gnumcueclipse-plugins` project
* _Eclipse_ menu → **Run** → **Run Configurations...**
* double click the **Maven Build** entry
* **Name:** `GME clean verify` 
* in the Main tab
  * Base directory: click the Workspace... button and select the `gnumcueclipse-plugins`
  * Goals: `clean verify`
  * optionally, if warnings are issued, add a new parameter, name `tycho.localArtifacts`, value `ignore`
* click the **Apply** button
* in the JRE tab
  * Execution environment JavaSE-1.8
* click the **Apply** button  

To start the EPP Maven build from Eclipse

* in the `GNU MCU Eclipse EPP packages root` set, select the `org.eclipse.epp-buildall` project
* _Eclipse_ menu → **Run** → **Run Configurations...**
* double click the **Maven Build** entry
* **Name:** `GME EPP clean verify -Pcpp` 
* in the Main tab
  * Base directory: click the Workspace... button and select the `org.eclipse.epp-buildall`
  * Goals: `clean verify`
  * Profiles: `epp.package.cpp`
* click the **Apply** button
* in the JRE tab
  * Execution environment JavaSE-1.8
* click the **Apply** button  

The project `org.eclipse.epp.packages.git` is a fork of [https://git.eclipse.org/gitroot/epp/org.eclipse.epp.packages.git](https://git.eclipse.org/gitroot/epp/org.eclipse.epp.packages.git)

```console
$ git clone https://git.eclipse.org/gitroot/epp/org.eclipse.epp.packages.git org.eclipse.epp.packages.git
```

## CDT Wiki

For more details, see [https://wiki.eclipse.org/CDT](https://wiki.eclipse.org/CDT), especially the [Getting started with CDT development](https://wiki.eclipse.org/Getting_started_with_CDT_development) page.



