---
layout: page
permalink: /plugins/download/
title: Downloads
author: Liviu Ionescu

date: 2015-09-11 20:07:00 +0300

---

## The Eclipse package way

The simplest way is to download **GNU MCU Eclipse IDE for C/C++ Developers** from [GitHub Releases](https://github.com/gnu-mcu-eclipse/org.eclipse.epp.packages/releases/) and you get at once both Eclipse CDT and the MCU plug-ins.

## The Eclipse plug-ins way

Installing Eclipse usually does not require to separately download any binary, since Eclipse provides a special mechanism to install and update plug-ins.

Starting with v4.1, the GNU MCU Eclipse plug-ins update site URL was migrated to [netlify.com](https://www.netlify.com):

`http://gnu-mcu-eclipse.netlify.com/v4-neon-updates`

More details are available in the [Install](/plugins/install/) page.

### Pre-release versions

For previews, test releases are posted to a separate update site:

`http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-test`

Usually this site should be safe to use, but use it with caution.

### Experimental versions

For previews, experimental releases are posted to a separate update site:

`http://gnu-mcu-eclipse.netlify.com/v4-neon-updates-experimental`

Sometimes you can use this site to test some features that are not completely implemented, or that might change before a final version is released.

This site is not always updated; use it carefully, back up your workspace, and do not use it for production projects.

## The local archive way

If, for any reasons, you need to revert to a specific version, or the Eclipse mechanism to install new software fails,  you can always download the desired version and manually install the plug-ins from the local archive.

All versions of the plug-ins are available via the [GitHub Releases](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases) page. For details how to reach it, see the [Downloads]({{ site.baseurl }}/downloads/) page.

![Plug-ins Releases]({{ site.baseurl }}/assets/images/2015/github-gae-plugins-releases.png)

Navigate to the [Latest release](https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/latest) page (or the desired version) and download the attached archive, it should be a **zip** file with a long name like:

`ilg.gnuarmeclipse.repository-2.9.3-201508190739.zip`

Please note that not all plug-in versions run on all Eclipse versions, and usually new plug-in versions may require new Eclipse versions, so better try to stay as up-to-date with the Eclipse as possible. (For Eclipse Luna 4.4 and later, use versions 3.x; for Eclipse Kepler 4.3, use versions 2.x; for older Eclipses, try the final 0.5.5 version, but keep in mind it is no longer maintained).
