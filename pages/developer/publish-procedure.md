---
layout: page
permalink: /developer/publish-procedure/
title: How to publish the plug-ins?
author: Liviu Ionescu

date: 2015-09-10 21:07:00 +0300

---


The plug-ins are published both as update sites (on Bintray, as an Eclipse update site, with multiple mirrors) and as archives (on GitHub as [Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases)).

The reason Bintray is used is that GitHub does not provide a convenient way to publish an Eclipse update site.

## Create a new milestone

If not already done, create a new milestone.

* in the [plug-ins issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) page, click the [Milestones](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones) button and add a [new](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones/new) milestone. As title, use the current version, like _v4.3.1_.


## Fix issues

* scan the [plug-ins issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) list, and fix them. The commit message should be prefixed with the issue number, like `[#122]`;
* mark all fixed issues as part of the new milestone;
* add a message like _fixed on 2018-01-10_;
* do not close the issues

## Build

When all issues are fixed, run the maven build.

## Publish current work on the Bintray experimental site

After each new build, to allow testing on various platforms, the plug-ins should be published on the experimental site.

For this, run the `scripts/publish-v4-neon-updates-experimental.command` (this is a script that can be executed directly in the macOS Finder).

## Publish pre-release on the Bintray test site

If the new release has no problems, publish it on the test site, and allow some time for testers to use it.

For this, run the `scripts/publish-v4-neon-updates-test.command` (this is a script that can be executed directly in the macOS Finder).

A typical session looks like:

```console
$ /Users/ilg/My\ Files/MacBookPro\ Projects/GNU\ ARM\ Eclipse/plug-ins.git/scripts/publish-v4-neon-updates-test.command ; exit;

User: ilg-ul
API key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Owner: gnu-mcu-eclipse
Create version 'v4-neon-updates-test/p2/4.1.1.201707111115'
######################################################################## 100.0%
Created.

Upload 'artifacts.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
...
Upload 'plugins/ilg.gnumcueclipse.templates.stm_2.6.3.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Publish 'v4-neon-updates-test/p2/4.1.1.201707111115'
{"files":38}

Published on the test site.
Archive available from "/Users/ilg/My Files/MacBookPro Projects/GNU ARM Eclipse/archive/internal/ilg.gnumcueclipse.repository-4.1.1-201707111115.zip"
When final, don't forget to publish the archive too!
Install new software from http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test
logout
```

## Install on a separate Eclipse

Test if the new build can be used as an update site, by installing from `updates-test` on a separate Eclipse (not the one used for development).

## Build a test version of the Eclipse packages

The Eclipse Packaging Project allows to create complete Eclipse packages for all relevant platforms.

* clone the `gnu-mcu-eclipse/org.eclipse.epp.packages` project
* select the latest original branch (like `OXYGEN`)
* merge from upstream
* merge into the corresponding local branch (like `ogygen-gme`)
* edit `org.eclipse.epp.packages.git/releng/org.eclipse.epp.config/parent/pom.xml`
  * update the latest version `<gnumcueclipse.version>4.3.1</gnumcueclipse.version>`
  * temporarily update the site URL to the test site `<gnumcueclipse.repository>http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test</gnumcueclipse.repository>`
* remove the `archive` folder
* run the `org.eclipse.epp.packages.git/scripts/build.mac.command` script
* check if the retrieved plug-ins versions match the expected versions; if not, check if the update site was published correctly and the URL is right;
* the result should be in the `archive` folder, including the computed `.sha` values.

## Test the resulted packages

* install the packages on macOS, Windows & GNU/Linux
* create ARM and RISC-V projects 
* build & run.

## Update the Change log

Scan the Git log and add new entries to the [Change log]({{ site.baseurl }}/developer/change-log/) (pages/developer/change-log.md), grouped by days.

```console
$ git log --pretty='%cd * %h - %s' --date=short
```

## Update the list of current features and plug-ins versions

Add an entry with the latest feature & plug-in versions, copied from the publish script output. Name it like **version 4.1.1.201707111115 released**.

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

## Prepare a new blog post to announce the release

Add a new file to the `_drafts` and later moved to `_posts/plugins/releases`.

Name the post like: *2017-11-10-plugins-v4.2.1-201711101735-released.md*, title: *GNU MCU Eclipse plug-ins v4.2.1-201711101735 released*.

The structure of the post should contain:

* the initial `download_url` pointing to the releases generic page, not a specific release, since it does not exist, and the htmlproofer will fail.

```
download_url: https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/
```

* one intro paragraph with the summary of the changes
* a link to `[Binary files »]({{ page.download_url }})`
* headers like:

```
## New features
## Addressed bugs
## Template issues
## Other changes
## Known problems
```

An example would be the [4.1.1](https://gnu-mcu-eclipse.github.io/blog/2017/07/11/plugins-v4.1.1-201707111115-released/) announcement.

* scan the [GitHub Issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) for the issues tagged with the current milestone and add references to all tracked issues. Refer to them as **[Issue:#22]**.

* after creating the post entry, close issues with a message like _fixed since v3.2.1-201701141320_.

## Publish on the main Bintray updates site

When all ready, run the `scripts/publish-v4-neon-updates.command`:

```console
$ /Users/ilg/My\ Files/MacBookPro\ Projects/GNU\ ARM\ Eclipse/plug-ins.git/scripts/publish-v4-neon-updates.command ; exit;
Do you really want to publish? (Yes)? Yes

User: ilg-ul
API key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Owner: gnu-mcu-eclipse
Create version 'v4-neon-updates/p2/4.1.1.201707111115'
######################################################################## 100.0%
Created.

Upload 'artifacts.jar' to '/v4-neon-updates/p2/4.1.1.201707111115/'
######################################################################## 100.0%
...
Upload 'plugins/ilg.gnumcueclipse.templates.stm_2.6.3.201707111115.jar' to '/v4-neon-updates/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Publish 'v4-neon-updates/p2/4.1.1.201707111115'
{"files":38}

Published on the main site.
When final, don't forget to publish the archive too!
logout
```

Do not close the terminal before copy/paste the list to the ChangeLog page!.

## Publish on the main RISC-V update site

Use the `publish-riscv-v4-neon-updates.command` script.

## Test the update site

Using a test Eclipse, install the plug-ins from the update site.

## Clean the mess in the local archive folder

* go to **.../GNU MCU Eclipse/archive**
* move the latest archive from **internal** to **releases/plug-ins**
* move the other relevant archives from **internal** to **internal**

## Merge develop into master

* in SourceTree, switch to the **develop** branch
* push the **develop** branch to GitHub
* in SourceTree, switch to the **master** branch
* merge the **develop** branch into **master**
* check the submodules; update to latest commit if necessary
* push the **master** branch to GitHub
* switch to **develop**

## Publish the Web

* move the post from `_drafts` to `_posts/plugins/releases`
* Git Push & Sync the **gnu-mcu-eclipse.github.io-source** project; use something like `v4.2.1-201711101735 released` as message
* wait for the Travis build to complete; occasionally links to not work, and might need to restart the build

## Create a new GitHub release

* be sure the **develop** branch is up to date and set as default
* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page
* click **Draft a new release**
* name the tag like **v4.2.1-201711101735** (mind the `-` in the middle!)
* select the **develop** branch
* name the release like **GNU MCU Eclipse plug-ins v4.2.1-201711101735**  (mind the `-` in the middle!)
* as first line of the description, copy the download badge

```
[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/plug-ins/v4.1.1-201707111115/total.svg)](https://gnu-mcu-eclipse.github.io/blog/2017/07/11/plugins-v4.1.1-201707111115-released/)
```
* update the tag (v4.1.1-201707111115)
* also in the description, copy the first paragraph from the Web release page
* add a link to the Web page `[Continue reading »]()`
* get the URL from the web [Releases](http://gnu-mcu-eclipse.github.io/developer/releases/) page and update the above link and the badge
* **attach binaries** (drag and drop from the archives folder will do it)
* click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Publish the Web

* Git Push & Sync the **gnu-mcu-eclipse.github.io-source** project; use something like `v3.2.1-201701141320 released` as message
* wait for the Travis build to complete; occasionally links to not work, and might need to restart the build

Note: the release must exist, otherwise Travis will complain and do not publish the site to **gnu-mcu-eclipse.github.io**.

## Update the release link

From the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page, get the URL.

* update `download_url` to the actual release URL.

## Eclipse Packaging

The Eclipse Packaging Project allows to create complete Eclipse packages for all relevant platforms.

### Build

* in the `gnu-mcu-eclipse/org.eclipse.epp.packages` project
* edit `org.eclipse.epp.packages.git/releng/org.eclipse.epp.config/parent/pom.xml`
  * update the site URL to the release site `<gnumcueclipse.repository>http://gnu-mcu-eclipse.netlify.com/v4-neon-updates</gnumcueclipse.repository>`
* remove the `archive` folder
* run the `org.eclipse.epp.packages.git/scripts/build.mac.command` script
* check if the retrieved plug-ins versions match the expected versions; if not, check if the update site was published correctly and the URL is right
* the result should be in the `archive` folder, including the computed `.sha` values
* push the `gnu-mcu-eclipse/org.eclipse.epp.packages` project.

### Create the EPP GitHub release

* be sure the `org.eclipse.epp.packages.git` is up to date and pushed
* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases) page
* click **Draft a new release**
* name the tag like **v4.3.1-20180110-o2**; mind the `-` in the middle, the short date and the o2 which is a shortcut for Oxygen.2 
* select the corresponding GME branch, like **oxygen-gme**
* name the release like **GNU MCU Eclipse IDE for C/C++ Developers Oxygen.2 20170711**; mind the short date
* as first line of the description, copy the download badge
```
[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/org.eclipse.epp.packages/v4.3.1-20180110-o2/total.svg)](https://gnu-mcu-eclipse.github.io/blog/2018/01/10/plugins-v4.3.1-201801092051-released/)
```
* update the tag (v4.3.1-20180110-o2)
* update the URL to the actual release post
* copy the description from a previous release, and update 
* copy the SHA numbers from the maven console
* **attach binaries** (drag and drop from the archives folder will do it)
* click the **Publish Release** button

### Update the main release 

Add a reference to the package. Copy from a previous release.

## Share on Facebook

* go to the new post and follow the Share link.
* DO NOT select **On your own Timeline**, but **On a Page you manage**
* select GNU MCU Eclipse
* posting as GNU MCU Eclipse
* click **Post to Facebook**
* check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)

## Update the Eclipse Marketplace records

* go to [Eclipse Marketplace](https://marketplace.eclipse.org/content/gnu-mcu-eclipse)
* log in
* click **Edit**
* update version number, minimum Eclipse versions.




