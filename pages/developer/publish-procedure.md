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

Test if the new build can be used as an update site, by installing from updates-test on a separate Eclipse (not the one used for development).

## Create a new milestone

In the [plug-ins issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) page, click the [Milestones](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones) button and add a [new](https://github.com/gnu-mcu-eclipse/eclipse-plugins/milestones/new) milestone. As title, use the current version, like _v3.2.1_.

## Update the Change log

Scan the Git log and add new entries to the [Change log]({{ site.baseurl }}/developer/change-log/) (pages/developer/change-log.md), grouped by days.

```console
$ git log --pretty='%cd * %s' --since 2015-06-24 \
--reverse --date=short >~/Desktop/ChangeLog.txt
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

Scan the [GitHub Issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) and add references to all tracked issues.

Mark all these issues as part of the current version milestone. Refer to them as **[Issue:#22]**. 

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

Use the `publish-riscv-v4-neon-updates.command` command.

## Clean the mess in the local archive folder

* go to **.../GNU MCU Eclipse/archive**
* move the latest archive to **releases/plug-ins**
* move the other archives to **internal**

## Merge develop into master

* in SourceTree, switch to the **develop** branch
* push the **develop** branch to GitHub
* in SourceTree, switch to the **master** branch
* merge the **develop** branch into **master**
* push the **master** branch to GitHub
* switch to **develop**

## Publish the Web

* Git Push & Sync the **gnu-mcu-eclipse.github.io-source** project; use something like `v4.2.1-201711101735 released` as message
* wait for the Travis build to complete; occasionally links to not work, and might need to restart the build

## Create a new GitHub release

* be sure the **develop** branch is up to date and set as default
* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page
* click **Draft a new release**
* name the tag like **v4.2.1-201711101735** (mind the `-` in the middle!)
* select the **develop** branch
* name the release like **GNU MCU Eclipse plug-ins v4.2.1-201711101735**  (mind the `-` in the middle!)
* as description, copy the first paragraph from the Web release page
* add a link to the Web page `[Continue reading »]()`
* get the URL from the web [Releases](http://gnu-mcu-eclipse.github.io/developer/releases/) page and update the above link
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

## Add the release downloads badge

The code looks like this:

```
[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/plug-ins/v4.1.1-201707111115/total.svg)](https://gnu-mcu-eclipse.github.io/blog/2017/07/11/plugins-v4.1.1-201707111115-released/)
```

Copy/paste it after _Continue reading..._ and update the URLs.

## Close issues

For all [GitHub issues](https://github.com/gnu-mcu-eclipse/eclipse-plugins/issues) marked with the current version, close them with a message like _fixed since v3.2.1-201701141320_.

## Share on Facebook

* go to the new post and follow the Share link.
* DO NOT select **On your own Timeline**, but **On a Page you manage**
* select GNU MCU Eclipse
* posting as GNU MCU Eclipse
* click **Share link**
* check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)

## Update the Eclipse Marketplace records

* go to [Eclipse Marketplace](https://marketplace.eclipse.org/content/gnu-mcu-eclipse)
* log in
* click **Edit**
* update version number, minimum Eclipse versions.

## Eclipse Packaging

The Eclipse Packaging Project allows to create complete Eclipse packages for all relevant platforms.

### Build

* clone the `gnu-mcu-eclipse/org.eclipse.epp.packages` project
* edit `org.eclipse.epp.packages.git/releng/org.eclipse.epp.config/parent/pom.xml`
  * update `<gnumcueclipse.version>4.1.1</gnumcueclipse.version>`
* be sure the `v4-neon-updates` is up to date
* run the `org.eclipse.epp.packages.git/scripts/build.mac.command`

### Publish

## Create a new GitHub release

* be sure the **gnumcueclipse** branch is up to date and set as default
* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases) page
* click **Draft a new release**
* name the tag like **v4.1.1-20170711** (mind the `-` in the middle!)
* select the **gnumcueclipse** branch
* name the release like **GNU MCU Eclipse IDE for C/C++ Developers Neon.3 20170711**  (mind the `-` in the middle!)
* **attach binaries** (drag and drop from the archives folder will do it)
* click the **Publish Release** button


