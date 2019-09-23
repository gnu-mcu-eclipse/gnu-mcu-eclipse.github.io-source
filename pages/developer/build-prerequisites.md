---
layout: page
permalink: /developer/build-prerequisites/
title: Build prerequisites
author: Liviu Ionescu

date: 2015-09-10 20:20:00 +0300

---

## Install & Configure Eclipse

### Install Git for Windows

On Windows, the `git` command is available in the 
[Git for Windows](https://git-scm.com/download/win) package.

It also comes with a minimal POSIX environment. To access it, start
the `bash.exe` program.

### Install SourceTree

For a convenient access to Git, it is recommended to install 
[SourceTree](https://www.sourcetreeapp.com/), available for macOS and Windows.

For GNU/Linux, either use the GitKraken, or directly the command line Git.

### Install Java

Install the latest Oracle JDK 1.8 available (currently 221); JRE is not enough,
without JDK you will not be able to run debug sessions.

Note: OpenJDK 12 fails; apparently OpenJDK 9 introduced some subtle changes
and the old Maven builds fail.

### Prepare folders

- in a place of you choice, create a folder `gnu-mcu-eclipse.github`
- inside it create a folder `develop`.

### Install Eclipse IDE for Eclipse Committers

This instance of Eclipse will be used for actual development. The latest
version known to work is 2018-12.

- go to [Eclipse download site](http://www.eclipse.org/downloads/)
  and follow the
  [download packages](https://www.eclipse.org/downloads/eclipse-packages/) link
- download **Eclipse IDE for Eclipse Committers**, preferably the 64-bit version
  (for example `eclipse-committers-2018-12-R-macosx-cocoa-x86_64`)
- unpack the archive
- on macOS, remove the `com.apple.quarantine` attribute:

```console
$ xattr -dr com.apple.quarantine Eclipse.app
```

- move it to `.../gnu-mcu-eclipse.github/develop`
- rename `Eclipse.app` to `Eclipse-committers-2018-12.app` (similarly for
  other platforms)

Notes:

- Oxygen 3a fails on JDK 10 or higher with missing
  `javax/annotation/PostConstruct`
  ([533390](https://bugs.eclipse.org/bugs/show_bug.cgi?id=533390))
- Photon fails to build 2018-12 (4.10) with OpenJDK 12

### Start the new Eclipse

- in the `.../gnu-mcu-eclipse.github/develop` folder create a new workspace
  named `eclipse-committers-2018-12-workspace`
  (note: be sure you create the workspace where you need it to be, since
  moving later is generally not supported by Eclipse; if you need this,
  preferably create a new workspace)
- check **Use this as default...**
- check if you installed the right Eclipse; go to the _Eclipse_ menu →
  **Help** (**Eclipse** on macOS) → **About Eclipse** and the first line
  should read **Eclipse IDE for Eclipse Committers**

### Set Java 1.8 as default

- in the _Eclipse_ menu → **(Window →) Preferences** → **Java** → **Installed JREs**
  - Add → Standard VM
    - JRE Home: select the `/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home` folder
    - JRE name: jdk 1.8 221
  - click the **Apply** button
- in the _Eclipse_ menu → **(Window →) Preferences** → **Java** → **Compiler**
  - Compiler compliance level: select 1.8
  - click the **Apply** button

### Install CDT plug-ins

- **Help** → **Install New Software**
  - Work with: `2018-12 - http://download.eclipse.org/releases/2018-12`
    - In **Application Development Framework**
      - optional **Eclipse Project SDK**
    - In **Mobile and Device Development**
      - select **C/C++ GCC Cross Compile Support**
      - select **C/C++ GDB Hardware Debugging**
      - select **C/C++ Memory View Enhancements**
    - In **Programming Languages**
      - optional **C/C++ Autotools**
      - select **C/C++ Development Tools**
      - select **C/C++ Development Tools SDK**
      - optional **C/C++ Docker Container Launch Support**
      - optional **C/C++ LLVM-Family**
      - optional **C/C++ Unit Testing Support**
    - click the **Next** button
    - accept the terms of the license agreement
    - click the **Finish** button
  - wait for the new plug-ins to be installed (in background, see status line)
- restart

Note: without the CDT sources available in the SDK, the extension point
schemas will not be available so attempts to add new elements to the
extensions will not be possible, and only 'Generic' elements will be offered.

### Install base API

- go to <http://www.eclipse.org/cdt/downloads.php>, and download `cdt-9.2.1.zip`
  (for compatibility with Eclipse 4.6 Neon.3)
- unpack the archive
- move the new folder to in the `develop` folder
- in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development**
  → **Target Platform**
  - click the **Add...** button
  - select **Nothing: Start with an empty target**
  - Next
    - Enter name: `9.2.1 Neon`
    - click **Add...** → **Directory** → **Next >**
    - click **Browse...** → `cdt-9.2.1`
    - click the **Finish** button
  - click the **Reload** button
  - click the **Finish**
- enable only the **Running Platform as Active** (mandatory!)
- click **Apply and Close**

Selecting the running platform is required when starting Eclipse to Run or
Debug, without it the core plug-ins will not be available.

- in the _Eclipse_ menu → **(Window →) Preferences** → **Plug-in Development**
  → **API Baselines**
  - click the **Add Baseline...** button
  - select **A target platform**
    - Enter name: `9.2.1 Neon`
    - enable `9.2.1 Neon`
    - click the **Refresh** button
    - click the **Finish** button
- click **Apply and Close**

### Create and configure the workspace

- change the workspace preferences
  - go to the _Eclipse_ menu → **(Window →) Preferences...**
  - **General** → **Workspace**
    - enable **Refresh on access**
    - set **Text file encoding: UTF-8**
    - click the **Apply** button
  - **General** → **Editors** → **Text Editors**
    - enable **Show Print Margin** (80)
    - enable **Show Line Numbers**
    - click the **Apply** button
  - **General** → **Editors** → **File Associations**
    - click **Add** and add *.inf, *.sh, *.command, *.ini, *.liquid, *.launch
    - for each, click the **Add** button in the Associate editors area
    - associate with the Text Editor
    - click the **Apply and Close** button

  - go to the _Eclipse_ menu → **(Window →) Preferences...**
  - **Run/Debug** → **Console**
    - disable Limit console output
    - click the **Apply** button
  - **Java** → **Editor** → **Folding**
    - disable **Header Comments**
    - disable **Imports**
    - click the **Apply** button
  - **XML** → **XML Files** → **Editor**
    - Line width 72
    - enable **Split multiple attributes...**
    - disable **Align final bracket...**
    - enable **Preserve whitespace in tags with PCDATA content**
    - enable **Clear all blank lines**
    - disable **Format comments**
    - enable **Insert whitespace before closing...**
    - enable **Indent using tabs**
    - click the **Apply** button
  - click the **Apply and Close** button

### Install several Eclipse CDT instances

These separate instances of Eclipse will be used to test the plug-in.

Go to [Eclipse download site](http://www.eclipse.org/downloads/) and follow
the [download packages](https://www.eclipse.org/downloads/eclipse-packages/)
link.

#### Eclipse CDT 2019-06

From
[Eclipse download packages](https://www.eclipse.org/downloads/eclipse-packages/)
install **Eclipse IDE for C/C++ Developers**.

- download **Eclipse IDE for C/C++ Developers**
  (`eclipse-cpp-2019-06-R-macosx-cocoa-x86_64.dmg`)
- unpack the archive into the `develop` folder
- on macOS, remove the `com.apple.quarantine` attribute:

```console
$ xattr -dr com.apple.quarantine Eclipse.app
```

- rename `Eclipse.app` to `Eclipse-cdt-2019-06.app`
- start Eclipse, use an workspace named `eclipse-committers-photon-workspace`
- enable Use this as the default
- in the _Eclipse_ menu → **(Window →) Preferences** → **C/C++** →
  **Appearance**
  - disable **Show source roots at top of project**
  - click the **Apply and Close**
- in Project Explorer, click the down pointing triangle →
  **Filters and Customizations...**
  - disable `.*` resources
  - click the OK button

## Clone the repositories

On Unix systems, the recommended method is using a command line:

```console
$ cd .../gnu-mcu-eclipse.github
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/eclipse-plugins.git eclipse-plugins.git
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages.git org.eclipse.epp.packages.git
```

On Windows, the `git` command is available in the
[Git for Windows](https://git-scm.com/download/win) package, it should
have been installed from the first step.

## Import the projects

In the commiters Eclipse, import projects using the generic importer:

- _Eclipse_ menu → **Project**
  - disable **Build Automatically**
- _Eclipse_ menu → **File** → **Import**
- Select
  - General → **Existing Projects into Workspace**
  - click **Next**
- Import Projects
  - Root Directory: `.../gnu-mcu-eclipse.github/eclipse-plugins.git`
  - enable **Search for nested projects**
  - disable **Copy projects into workspace**
  - disable **Add project(s) to working set**
  - click **Finish**
- Import Projects
  - Root Directory: `.../gnu-mcu-eclipse.github/org.eclipse.epp.packages.git`
  - enable **Search for nested projects**
  - disable **Copy projects into workspace**
  - disable **Add project(s) to working set**
  - click **Finish**

(From EPP disable most projects, except cpp & common)

## Configure the working sets

In the Java Perspective, create Working Sets

- down arrow → **Top Level Elements** → **Working Sets**
- down arrow → **Select Working Sets...** → **New...**)
  - **GNU MCU Eclipse plugins root** (with the `gnumcueclipse-plugins` project)
  - **GNU MCU Eclipse repositories** (with the `ilg.gnumcueclipse.repository`
    project)
  - **GNU MCU Eclipse EPP packages root** (with the `org.eclipse.epp*` projects)
  - **GNU MCU Eclipse features** (with all `*.feature` projects)
  - **GNU MCU Eclipse bundles** (empty for now)
  - click the **OK** button

## Create the Maven run configurations

To start the plug-ins Maven build from Eclipse

- in the `GNU MCU Eclipse plugins root` set, select the `gnumcueclipse-plugins`
  project
- _Eclipse_ menu → **Run** → **Run Configurations...**
- double click the **Maven Build** entry
- **Name:** `GME clean verify`
- in the Main tab
  - Base directory: click the Workspace... button and select the
    `gnumcueclipse-plugins`
  - Goals: `clean verify`
  - optionally, if warnings are issued, add a new parameter, name
    `tycho.localArtifacts`, value `ignore`
- click the **Apply** button
- in the JRE tab
  - select Execution environment **JavaSE-1.8** (to ensure compatibility
    with older environments)
- click the **Apply** button  

To start the EPP Maven build from Eclipse

- in the `GNU MCU Eclipse EPP packages root` set, select the
  `org.eclipse.simrel` project
- _Eclipse_ menu → **Run** → **Run Configurations...**
- double click the **Maven Build** entry
- **Name:** `GME EPP clean verify -Pcpp`
- in the Main tab
  - Base directory: click the Workspace... button and select
    the `org.eclipse.simrel`
  - Goals: `clean verify`
  - Profiles: `epp.package.cpp`
- click the **Apply** button
- in the JRE tab
  - Execution environment **JavaSE 8 (1.8.9_221)**
- click the **Apply** button  

The project `org.eclipse.epp.packages.git` is a fork of
`https://git.eclipse.org/gitroot/epp/org.eclipse.epp.packages.git`.

## CDT Wiki

For more details, see [https://wiki.eclipse.org/CDT](https://wiki.eclipse.org/CDT), especially the [Getting started with CDT development](https://wiki.eclipse.org/Getting_started_with_CDT_development) page.
