---
layout: page
permalink: /developer/publish-procedure/
title: How to publish the plug-ins?
author: Liviu Ionescu

date: 2015-09-10 21:07:00 +0300

---

The plug-ins are published both as update sites (on Bintray, as an Eclipse update site, with multiple mirrors) and as archives (on GitHub as [Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases)).

The reason Bintray is used is that GitHub does not provide a convenient way to publish an Eclipse update site.

## Publish current work on the Bintray experimental site

After each new build, to allow testing on various platforms, the plug-ins are published on the experimental site.

For this, run the `scripts/publish-v4-neon-updates-experimental.command` (this is a script that can be executed directly in the macOS Finder).

## Publish pre-release on the Bintray test site

For this, run the `scripts/publish-v4-neon-updates-test.command` (this is a script that can be executed directly in the macOS Finder).

A typical session looks like:

```
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
Upload 'artifacts.xml.xz' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'content.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'content.xml.xz' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'p2.index' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.codered.feature_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.debug.gdbjtag.jlink.feature_4.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.debug.gdbjtag.openocd.feature_4.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.debug.gdbjtag.pyocd.feature_1.1.4.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.debug.gdbjtag.qemu.feature_3.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.doc.user.feature_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.managedbuild.cross.arm.feature_2.5.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.managedbuild.cross.riscv.feature_2.5.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.packs.feature_2.2.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.templates.ad.feature_1.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.templates.cortexm.feature_1.4.3.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.templates.freescale.feature_2.2.9.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'features/ilg.gnumcueclipse.templates.stm.feature_2.6.3.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.codered_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.core_4.1.1.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.core_1.2.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag.jlink_4.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag.openocd_4.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag.pyocd_1.1.4.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag.qemu_3.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag.restart_1.3.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.gdbjtag_3.2.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.debug.packs_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.doc.user_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.managedbuild.cross.arm_2.5.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.managedbuild.cross.riscv_2.5.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.managedbuild.cross_1.1.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.managedbuild.packs_1.3.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.packs.core_1.1.4.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.packs.data_1.3.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.packs.ui_1.2.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.packs_1.2.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.templates.ad_1.1.5.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.templates.core_2.5.7.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.templates.cortexm_1.4.3.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.templates.freescale.pe_1.2.2.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
Upload 'plugins/ilg.gnumcueclipse.templates.freescale_2.2.9.201707111115.jar' to '/v4-neon-updates-test/p2/4.1.1.201707111115/'
######################################################################## 100.0%
Uploaded.
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

Test if the new build can be used as an update site, by installing from updates-test on a separate Eclipse (not the one used for development).

## Create a new milestone

In the [plug-ins issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) page, click the [Milestones](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones) button and add a [new](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones/new) milestone. As title, use the current version, like _v3.2.1_.

## Update the Change log

Scan the Git log and add new entries to the [Change log]({{ site.baseurl }}/developer/change-log/) (pages/developer/change-log.md), grouped by days.

```
$ git log --pretty='%cd * %s' --since 2015-06-24 \
--reverse --date=short >~/Desktop/ChangeLog.txt
```

## Update the list of current features and plug-ins versions

Add an entry with the latest feature & plug-in versions, copied from the publish script output. Name it like **version 4.1.1.201707111115 released**.

## Prepare a new blog post to announce the release

Add a new file to the `_drafts` and later moved to `_posts/plugins/releases`.

Name the post like: *Release v2.9.3 201508190739*, title: *Version 2.2.1-201404120702 released*.

The structure of the post should contain:

* date, as _Aug 1, 2015_ (italics)
* one intro paragraph with the summary of the changes
* a link to `[Binary files »]()`, currently empty, to be filled with the release URL
* headers like:

```
## New features
## Addressed bugs
## Template issues
## Other changes
## Known problems
```

An example would be the [2.9.1](https://github.com/gnu-mcu-eclipse/eclipse-plugins/wiki/Release-v2.9.1-201508011813) announcement.

Scan the [GitHub Issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) and the [SourceForge trackers](https://sourceforge.net/p/gnuarmeclipse/_list/tickets) and add references to all tracked issues.

Mark all these issues as part of the current version milestone. Refer to them as **[Issue:#22]**. For SourceForge, refer to them as **[bugs:#98]**, **[feature-requests:#60]**, **[support-requests:#81]**.

## Test local version of the Web

* build the local Jekyll **gnuarmeclipse.github.io-source** project
* test it using the localhost:4000 address
* Git Push & Sync the **gnuarmeclipse.github.io-source** project; use something like `v3.2.1-201701141320 released` as message
* Git Push & Sync the **gnuarmeclipse.github.io** project; use something like `v3.2.1-201701141320 released` as message

## Publish on the main Bintray updates site

When all ready, run the `scripts/publish-v4-neon-updates.command`:

```
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

Use the `publish-riscv-v4-neon-updates.command` command.

## Clean the mess in the local archive folder

-   go to **.../GNU MCU Eclipse/archive**
-   move the latest archive to **releases/plug-ins**
-   move the other archives to **internal**

## Merge develop into master

* in SourceTree, switch to the **develop** branch
* push the **develop** branch to GitHub
* in SourceTree, switch to the **master** branch
* merge the **develop** branch into **master**
* push the **master** branch to GitHub
* switch to **develop**

## Create a new GitHub release

* be sure the **develop** branch is up to date and set as default
* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page
* click **Draft a new release**
* name the tag like **v2.9.3-201508190739** (mind the `-` in the middle!)
* select the **develop** branch
* name the release like **GNU MCU Eclipse plug-ins v2.9.3-201508190739**  (mind the `-` in the middle!)
* as description, copy the first paragraph from the Web release page
* **attach binaries** (drag and drop from the archives folder will do it)
* click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Publish the Web

* Git Push & Sync the **gnuarmeclipse.github.io-source** project; use something like `v3.2.1-201701141320 released` as message
* wait for the Travis build to complete; occasionally links to not work, and might need to restart the build

Note: the release must exist, otherwise Travis will complain and do not publish the site to **gnuarmeclipse.github.io**.

## Update the release link

In the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page:

* add a link to the Web page `[Continue reading »]()`
* get URL from web [Releases](http://gnuarmeclipse.github.io/developer/releases/) and update the above link

## Add the release downloads badge

The code looks like this:

```
[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnuarmeclipse/plug-ins/v3.4.1-201704251808/total.svg)](http://gnuarmeclipse.github.io/blog/2017/02/25/plugins-v3.4.1-201704251808-released/)
```

## Close issues

For all [GitHub issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) marked with the current version, close them with a message like _fixed since v3.2.1-201701141320_.

## Publish on SourceForge ()

* go to [SourceForge Files](http://sourceforge.net/projects/gnuarmeclipse/files/Current%20Releases/)
* select the folder corresponding to the latest version (currently **3.x**); create a new one if necessary
* click the **Add File** button
* drag and drop the file (for example ilg.gnuarmeclipse.repository-3.1.1-201606210758.zip) in the upload window and click the **Upload** button
* click the **Done** button
* check it the new file was published; click the info icon
* enable the **Windows**, **macOS** and **Linux** buttons
* after a while the new upload will be marked as latest version

## Share on Facebook

* go to the new post and follow the Share link.
* DO NOT select **On your own Timeline**, but **On a Page you manage**
* select GNU MCU Eclipse
* posting as GNU ARM Eclipse
* click **Share link**
* check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)

## Update the Eclipse Marketplace records

* go to [Eclipse Marketplace](https://marketplace.eclipse.org/content/gnu-arm-eclipse)
* log in
* click **Edit**
* update version number, minimum Eclipse versions.

