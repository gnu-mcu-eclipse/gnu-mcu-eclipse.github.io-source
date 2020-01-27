---
layout: page
title: How to publish the Windows Build Tools binaries?
permalink: /windows-build-tools/publish-procedure/

author: Liviu Ionescu

date: 2016-10-28 12:28:00 +0300

---

The Windows Build Tools binaries are published on GitHub 
[Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/).

The procedure used to publish those binaries is documented on the 
[PUBLISH](https://github.com/gnu-mcu-eclipse/windows-build-tools/blob/master/PUBLISH.md) 
page in the same project.



The Windows Build Tools binaries are published on GitHub  [Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases)).

## Update CHANGELOG

Open the `CHANGELOG.txt` file from `gnu-mcu-eclipse/windows-build-tools.git` and copy entries to the web git.

In the web git, add new entries to the [Change log]({{ site.baseurl }}/windows-build-tools/change-log/) (`pages/windows-build-tools/change-log.md`), grouped by days.

## Commit the project git

In `gnu-mcu-eclipse/windows-build-tools.git`, commit all changes.

## Push the build script git

Push `gnu-mcu-eclipse/windows-build-tools.git` to GitHub.

Possibly push the helper project too.

## Check/clone/pull build scripts

Be sure the scripts in `windows-build-tools.git` are up to date.

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/windows-build-tools.git \
  ~/Downloads/windows-build-tools.git
```

## Build

Important note: Before starting the build, double check if the repository is clean (all changes were committed), otherwise the build version will be stamped with `-dirty`.

```console
$ bash ~/Downloads/windows-build-tools/scripts/build.sh cleanall
$ caffeinate bash ~/Downloads/windows-build-tools/scripts/build.sh --all
```

For more details, see the [build]({{ site.baseurl }}/windows-build-tools/build-procedure/) page.

## Prepare a new blog post

In the web git:

- add a new file to `_posts/windows-build-tools/releases`
- name the file like `2016-10-28-windows-build-tools-v2-7-20161028-released.md`
- name the post like: **GNU MCU Eclipse Windows Build Tools v2.7-20161028 released**.
- as `download_url` use the generic `https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/` (will be updated later after the release is created)
- update the `date:` field with the current date

Close [issues](https://github.com/gnu-mcu-eclipse/windows-build-tools/issues) on the way. Refer to them as:

- **[Issue:\[#22\]\(...\)]**.

## Update the SHA sums

Copy/paste the build report at the end of the post as

```console
## Checksums
The SHA-256 hashes for the files are:

25b495b340d84b971736a5dfc2a639608c19b5d9d30d14e86e870c1ce461b855 ?
gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win32.zip

da147a2cd378183af1d19ecb655637b5b1deedb691fac25657d9d0e2a102e1be ?
gnu-mcu-eclipse-build-tools-2.10-20180103-1919-win64.zip
```

## Update the web

- commit the `gnu-mcu-eclipse.github.io-source.git` project; use a message like **Windows Build Tools v2.7-20161028 released**
- push the project
- wait for the Travis build to complete; occasionally links to not work, and might need to restart the build
- remember the post URL, since it must be updated in the release page

Note: initially the link to binaries points to the parent releases folder, otherwise Travis will complain and do not publish the site to `gnu-mcu-eclipse.github.io`.

## Create the release

- for stable releases, be sure the `master` branch is up to date and set as default
- go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/windows-build-tools/releases) page
- click **Draft a new release**
- name the tag like **v2.7-20161028**
- select the `master` branch
- name the release like **GNU MCU Eclipse Windows Build Tools v2.7-20161028**
- as description
  - add a downloads badge like `[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/windows-build-tools/v2.10-20180103/total.svg)]()`; use empty URL for now
  - copy the first paragraph from the Web release page
- add a link to the Web page `[Continue reading »]()`; use an empty URL for now
- get URL from web and update the above links
- **attach binaries** and SHA (drag and drop from the archives folder will do it)
- click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the web link

* `download_url: https://github.com/gnu-mcu-eclipse/windows-build-tools/releases/tag/v2.10-20180103/`

## Copy binaries to the archive

- go to `.../GNU MCU Eclipse/archive`
- move the latest binaries and SHA to `releases/build-tools`

## Update the xPack

See the [Maintainer info](https://github.com/gnu-mcu-eclipse/windows-build-tools-xpack#how-to-publish) in the separate project.
