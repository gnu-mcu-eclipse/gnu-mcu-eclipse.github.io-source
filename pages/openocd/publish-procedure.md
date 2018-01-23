---
layout: page
title: How to publish the OpenOCD binaries?
permalink: /openocd/publish-procedure/

author: Liviu Ionescu

date: 2016-10-28 18:09:00 +0300

---

The OpenOCD binaries are published on GitHub  [Releases](https://github.com/gnu-mcu-eclipse/openocd/releases)).

## Update the Change log

Open the `gnu-mcu-eclipse/info/CHANGES.txt` file from `gnu-mcu-eclipse/openocd-build.git` and copy entries to the web git.

In the web git, add new entries to the [Change log]({{ site.baseurl }}/openocd/change-log/) (`pages/openocd/change-log.md`), grouped by days.

## Update INFO

Edit the `info/INFO.txt` file from `openocd-build.git` and update the latest commits.

## Commit the project git

In `gnu-mcu-eclipse/openocd.git`, commit all changes. Remember the commit ID.

## Merge stable release

For **stable releases**, with SourceTree

- change to the `gnu-mcu-eclipse` branch
- merge `gnu-mcu-eclipse-dev`.

## Push the project git

With SourceTree, push to the GitHub remote, the `gnu-mcu-eclipse` and the `gnu-mcu-eclipse-dev` branches.

## Edit the build script

Edit the `OPENOCD_GIT_COMMIT` variable to point to the actual commit.

## Push the build script git

Push `gnu-mcu-eclipse/openocd-build.git` to GitHub.

Possibly push the helper project too.

## Check/clone/pull build scripts

Be sure the scripts in `gnu-mcu-eclipse/openocd-build.git` are up to date.

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/openocd-build.git \
  ~/Downloads/openocd-build.git
```

## Build

Important note: Before starting the build, double check if the repository is clean (all changes were committed), otherwise the build version will be stamped with `-dirty`.

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh cleanall
$ caffeinate bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

For more details, see the [build]({{ site.baseurl }}/openocd/build-procedure/) page.

## Test

Test the binaries on all platforms.

## Prepare a new blog post

In the web git:

- add a new file to `_posts/openocd/releases`
- name the file like `2016-01-11-openocd-v0-10-0-1-20160110-released.md`
- name the post like: **GNU MCU Eclipse OpenOCD v0.10.0-1-20160110 released**.
- as `download_url` use the generic `https://github.com/gnu-mcu-eclipse/openocd/releases/` (will be updated later after the release is created)
- update the `date:` field with the current date
- copy commit URLs from the GNU MCU Eclipse fork

Close [issues](https://github.com/gnu-mcu-eclipse/openocd/issues) on the way. Refer to them as:

- **[Issue:\[#22\]\(...\)]**.

## Update the SHA sums

Copy/paste the build report at the end of the post as

```console
## Checksums
The SHA-256 hashes for the files are:

2c9cd4585d7a44cb80dc65fa5e1a46decc3ce2ba1d28ad0da4301c33ee6bcbb3 ?
gnu-mcu-eclipse-openocd-0.10.0-6-20180112-1448-centos32.tgz

896f00121cd9df505182266924c7bdbe201b6de85edca58b9144331f3bf75d39 ?
gnu-mcu-eclipse-openocd-0.10.0-6-20180112-1448-centos64.tgz

8926cb9cc4cd2894f6b5c8da06943569f497313f8e77dcf5641320b7889eb859 ?
gnu-mcu-eclipse-openocd-0.10.0-6-20180112-1448-osx.tgz

605e38cd489190ed01d40be130c3be5d70e3370ffc4182f1b561de089a017116 ?
gnu-mcu-eclipse-openocd-0.10.0-6-20180112-1448-win32.zip

b757fb3c838ea82c88adae74043918b552c8ca48de0eb99c3507f321b97db5f5 ?
gnu-mcu-eclipse-openocd-0.10.0-6-20180112-1448-win64.zip
```

## Update the xPack

Update the `gnu-mcu-eclipse/openocd-xpack.git` project to the new version.

* update `baseUrl:`
* from the blog post, copy the SHA & file names
* commit all changes, use a message like `0.10.0-5.1` (without `v`)
* `npm version 0.10.0-5.1`
* don't publish yet, wait for the release

## Update the web

- commit the `gnu-mcu-eclipse.github.io-source.git` project; use a message like **OpenOCD v0.10.0-5-20171110 released**
- push the web project
- wait for the Travis build to complete; occasionally links to not work, and might need to restart the build.
- remember the post URL, since it must be updated in the release page

Note: initially the link to binaries points to the parent releases folder, otherwise Travis will complain and do not publish the site to `gnu-mcu-eclipse.github.io`.

## Create a new GitHub release

- for stable releases, be sure the `gnu-mcu-eclipse` branch is up to date and set as default
- go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/openocd/releases) page
- click **Draft a new release**
- name the tag like **v0.10.0-5-20171110** (mind the dashes in the middle!)
- select the `gnu-mcu-eclipse` or `gnu-mcu-eclipse-dev` branch
- name the release like **GNU MCU Eclipse OpenOCD v0.10.0-5-20171110**
- as description
  - add a downloads badge like `[![Github Releases (by Release)](https://img.shields.io/github/downloads/gnu-mcu-eclipse/openocd/v0.10.0-5-20171110/total.svg)]()`; use empty URL for now
  - copy the first paragraph from the Web release page
- add a link to the Web page `[Continue reading »]()`; use an empty URL for now
- get URL from web and update the above links
- **attach binaries** and SHA (drag and drop from the archives folder will do it)
- click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the web link 

In the web git:

- `download_url: https://github.com/gnu-mcu-eclipse/openocd/releases/tag/v0.10.0-4-20171004/`
- commit with a message like `v0.10.0-5-20171110 update link`

## Publish the xPack

In the `gnu-mcu-eclipse/openocd-xpack.git` project:

* `npm publish`

## Copy binaries to archive

-   go to `.../GNU MCU Eclipse/archive`
-   move the latest binaries and SHA to `releases/openocd`

## Share on Facebook

- go to the new post and follow the Share link.
- DO NOT select **On your own Timeline**, but **On a Page you manage**
- select GNU MCU Eclipse
- posting as GNU MCU Eclipse
- click **Post to Facebook**
- check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)
