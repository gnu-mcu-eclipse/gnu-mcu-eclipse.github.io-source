---
layout: page
title: How to publish the ARM Embedded GCC binaries?
permalink: /toolchain/arm/publish-procedure/

date: 2017-07-07 10:09:00 +0300

---

The ARM Embedded GCC binaries are published on GitHub [Releases](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/).

## Update the Change log

Generally, apart from packing, there should be no local changes.

Open the `CHANGES.txt` file from  `gnu-mcu-eclipse/arm-none-eabi-gcc-build.git` project git, and copy entries to the web git.

In the web git, add new entries to the [Change log]({{ site.baseurl }}/toolchain/arm/change-log/) (`pages/toolchain/arm/change-log.md`), grouped by days.

## Edit the build script

Edit the `VERSION` file to point to the actual release.

## Push the build script git

Push `gnu-mcu-eclipse/arm-none-eabi-gcc-build.git` to GitHub.

Possibly push the helper project too.

## Check/clone/pull build scripts

Be sure the scripts in `gnu-mcu-eclipse/arm-none-eabi-gcc-build.git` are up to date.

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc-build.git \
  ~/Downloads/openocd-build.git
```

## Build

```console
$ bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh cleanall
$ caffeinate bash ~/Downloads/arm-none-eabi-gcc-build.git/scripts/build.sh --all
```

For more details, see the [build]({{ site.baseurl }}/toolchain/arm/build-procedure/) page.

## Prepare a new blog post 

In the web git:

- add a new file to `_posts/arm-none-eabi-gcc/releases`
- name the file like `2016-01-11-arm-none-eabi-gcc-v7-1-1-2-20160110-released.md`
- name the post like: **GNU MCU Eclipse ARM Embedded GCC v7.1.1-1-20170702 released**.
- as `download_url` use the generic `https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/` 
- update the `date:` field with the current date

Close [issues](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/issues) on the way. Refer to them as:

- **[Issue:\[#22\]\(...\)]**.

## Update the SHA sums

Copy/paste the build report at the end of the post as:

```console
## Checksums
The SHA-256 hashes for the files are:

a723d8c6870d1808882ea2eaa630a8c60c5cb6bd25dc238091d2f9738298c44a ?
gnu-mcu-eclipse-arm-none-eabi-gcc-7.1.1-1-20170702-0625-centos32.tgz

...
```

## Update the Web

- commit the `gnu-mcu-eclipse.github.io-source` project; use a message like **ARM Embedded GCC v7.1.1-1-20170702-0625 released**
- wait for the Travis build to complete; occasionally links to not work, and might need to restart the build.
- remember the post URL, since it must be updated in the release page

Note: initially the link to binaries points to the parent releases folder, otherwise Travis will complain and do not publish the site to `gnu-mcu-eclipse.github.io`.

## Create a new GitHub release

- go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases) page
- click **Draft a new release**
- name the tag like **v7.1.1-1-20170702** (mind the dashes in the middle!)
- select the corresponding `-gme` branch
- name the release like **GNU MCU Eclipse ARM Embedded GCC v7.2.0-1-20171109**
- as description
  - add a downloads badge like `[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/arm-none-eabi-gcc/v7.1.1-1-20170702/total.svg)]()`; use empty URL for now
  - copy the first paragraph from the Web release page
- add a link to the Web page `[Continue reading »]()`; use an empty URL for now
- get URL from web and update the above links
- **attach binaries** and SHA (drag and drop from the archives folder will do it)
- click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the web link 

In the web git:

- `download_url: https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/tag/v7.1.1-1-20170702`
- use something like `v7.1.1-1-20170702 update link` as message

## Share on Facebook

- go to the new post and follow the Share link.
- DO NOT select **On your own Timeline**, but **On a Page you manage**
- select GNU MCU Eclipse
- posting as GNU MCU Eclipse
- click **Post to Facebook**
- check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)

