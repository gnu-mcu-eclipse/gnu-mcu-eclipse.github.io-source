---
layout: page
title: How to publish the Windows Build Tools binaries?
permalink: /windows-build-tools/publish-procedure/

author: Liviu Ionescu

date: 2016-10-28 12:28:00 +0300

---

The Windows Build Tools binaries are published on GitHub  [Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases)).

## Update the Change log

Scan the documentation Git log and add new entries to the [Change log]({{ site.baseurl }}/windows-build-tools/change-log/) (`pages/windows-build-tools/change-log.md`), grouped by days.

Close issues on the way. Refer to them as:

- **[Issue:\[#22\]\(...\)]**.

## Update the CHANGES.txt file

Edit the `gnuarmeclipse/info/CHANGES.txt` file (copy the entries from the web change log).

## Commit to the project git

In the **gnuarmeclipse/windows-build-tools** project, commit all changes.

## Check/clone/pull build scripts

Be sure the scripts in the **windows-build-tools.git** are up to date.

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/windows-build-tools.git \
  ~/Downloads/windows-build-tools.git
```

## Build

Important note: Before starting the build, double check if the repository is clean (all changes were committed), otherwise the build version will be stamped with `-dirty`.

```console
$ bash ~/Downloads/build-scripts.git/scripts/build-windows-build-tools.sh cleanall
$ caffeinate bash ~/Downloads/build-scripts.git/scripts/build-windows-build-tools.sh --all
```

## Prepare a new blog post to announce the release

- add a new file to `_posts/windows-build-tools/releases`
- name the file like `2016-10-28-windows-build-tools-v2-7-20161028-released.md`
- name the post like: **GNU MCU Eclipse Windows Build Tools v2.7-20161028 released**.

## Update the release post with the SHA sums

Copy/paste the build report at the end of the post as

```console
25b495b340d84b971736a5dfc2a639608c19b5d9d30d14e86e870c1ce461b855 ?
gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win32.zip

da147a2cd378183af1d19ecb655637b5b1deedb691fac25657d9d0e2a102e1be ?
gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win64.zip
```

## Update the web

- commit the **gnuarmeclipse.github.io-source.git** project; use a message like **Windows Build Tools v2.7-20161028 released**
- push the **gnuarmeclipse.github.io-source.git** project

## Push the project git

With SourceTree, push to the GitHub remote, the **master** branch.

## Create the release

- for stable releases, be sure the **master** branch is up to date and set as default
- go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases) page
- click **Draft a new release**
- name the tag like **v2.7-20161028**
- select the **master** branch
- name the release like **GNU MCU Eclipse Windows Build Tools v2.7-20161028**
- as description
  - add a downloads badge like `[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/windows-build-tools/v2.10-20180103/total.svg)]()`; use the 
  - copy the first paragraph from the Web release page
- add a link to the Web page `[Continue reading »]()`
- get URL from web and update the above links
- attach binaries and SHA (drag and drop from the archives folder will do it)
- click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the web link to resources

* `download_url: https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/tag/v2.10-20180103/`

## Copy binaries to the local archive folder

- go to `.../GNU MCU Eclipse/archive`
- move the latest binaries and SHA to `releases/build-tools`

## Share on Facebook

- go to the new post and follow the Share link.
- DO NOT select **On your own Timeline**, but **On a Page you manage**
- select GNU MCU Eclipse
- posting as GNU MCU Eclipse
- click **Post to Facebook**
- check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)
