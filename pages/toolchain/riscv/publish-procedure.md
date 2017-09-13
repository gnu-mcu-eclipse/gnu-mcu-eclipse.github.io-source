---
layout: page
title: How to publish the RISC-V Embedded GCC binaries?
permalink: /toolchain/riscv/publish-procedure/

date: 2017-07-07 10:09:00 +0300

---

The RISC-V Embedded GCC binaries are published on GitHub [Releases](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/).

## Update the Change log

Generally, apart from packing, there should be no local changes.

In the documentation git, add new entries to the [Change log]({{ site.baseurl }}/toolchain/riscv/change-log/) (`pages/toolchain/riscv/change-log.md`), grouped by days.

## Update the CHANGES.txt file

In the `gnu-mcu-eclipse/riscv-none-gcc-build` project git, edit the `gnu-mcu-eclipse/info/CHANGES.txt` file (copy the entries from the web change log).

## Add tags to source repos

Check the project [riscv/riscv-gnu-toolchain](https://github.com/riscv/riscv-gnu-toolchain), and determine the specific commits used in the official distribution. Also check if newer stable commits are available

If not present, add tags with the original version number (like `v20170612`).

Add tags with the current version number (like `v7.1.1-2-20170912`), in the following projects:

* the [gnu-mcu-eclipse/riscv-gcc](https://github.com/gnu-mcu-eclipse/riscv-gcc) project
* the [gnu-mcu-eclipse/riscv-binutils-gdb](https://github.com/gnu-mcu-eclipse/riscv-binutils-gdb) project
* the [gnu-mcu-eclipse/riscv-newlib](https://github.com/gnu-mcu-eclipse/riscv-newlib) project

## Update the script 

In the [gnu-mcu-eclipse/riscv-none-gcc-build](https://github.com/gnu-mcu-eclipse/riscv-none-gcc-build), update the `scripts/build.sh` to refer to the latest version number (`RELEASE_VERSION`).

For major releases, Check if the library sources (gmp, mpfr, mpc, isl) did change and possibly update them.

## Build

Follow the steps in the separate [How to build]({{ site.baseurl }}/toolchain/riscv/build-procedure/) page.


## Prepare a new blog post to announce the release

In the documentation git:

* add a new file to `_posts/riscv-none-gcc/releases`
* name the file like `2016-01-11-riscv-none-gcc-v7-1-1-2-20160110-released.md`
* name the post like: **GNU MCU Eclipse RISC-V Embedded GCC v7.1.1-1-20170702-* released**.
* in the **Binary files »** link, use the Releases URL, like `https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/` (the page must exist, otherwise publishing will fail)

## Update the release post with the SHA hashes

Copy/paste the build report at the end of the post as

```
## Checksums
The SHA-256 hashes for the files are:

a723d8c6870d1808882ea2eaa630a8c60c5cb6bd25dc238091d2f9738298c44a ?
gnu-mcu-eclipse-riscv-none-gcc-7.1.1-1-20170702-0625-debian32.tgz

...
```

## Publish the Web

* git commit & push the `gnu-mcu-eclipse.github.io-source` project; use something like `v7.1.1-1-20170702-0625 released` as message
* wait for the Travis build to complete; occasionally links to not work, and might need to restart the build

Note: initially the link to binaries points to the parent releases folder, otherwise Travis will complain and do not publish the site to `gnu-mcu-eclipse.github.io`.

## Create a new GitHub release

In the [gnu-mcu-eclipse/riscv-none-gcc](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/) project:

* go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases) page
* click **Draft a new release**
* name the tag like **v7.1.1-1-20170702** (mind the dashes in the middle!)
* as description, copy the first paragraph from the Web release page
* **attach binaries** (drag and drop from the `deploy` folder will do it)
* click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the release link

In the project web, the recent post:

* update the **Binary files »** link to use the actual version, like `https://github.com/gnu-mcu-eclipse/riscv-none-gcc/releases/tag/v7.1.1-1-20170702` (copy/paste it from the browser).

## Publish the Web

* git commit & push the `gnu-mcu-eclipse.github.io-source` project; use something like `v7.1.1-1-20170702 update link` as message

## Share on Facebook

* go to the new post and follow the Share link.
* DO NOT select **On your own Timeline**, but **On a Page you manage**
* select GNU MCU Eclipse
* posting as GNU ARM Eclipse
* click **Share link**
* check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)



