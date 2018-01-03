---
layout: page
title: How to publish the OpenOCD binaries?
permalink: /openocd/publish-procedure/

author: Liviu Ionescu

date: 2016-10-28 18:09:00 +0300

---

The OpenOCD binaries are published on GitHub  [Releases](https://github.com/gnu-mcu-eclipse/openocd/releases)).

## Update the Change log

Copy entries from the `info/CHANGES.txt` file. In the project git, scan the log.
In the documentation git, add new entries to the [Change log]({{ site.baseurl }}/openocd/change-log/) (`pages/openocd/change-log.md`), grouped by days.

Close issues on the way. Refer to them as:

- **[Issue:\[#22\]\(...\)]**.

## Commit to the project git

In the **gnu-mcu-eclipse/openocd** project, commit all changes.

## Merge stable release

For **stable releases**, with SourceTree

- change to the **gnu-mcu-eclipse** branch
- merge **gnu-mcu-eclipse-dev**.

## Push the project git

With SourceTree, push to the GitHub remote, the **gnu-mcu-eclipse** and the **gnu-mcu-eclipse-dev** branches.

## Check/clone/pull build scripts

Be sure the scripts in the **openocd-build.git** are up to date.

```console
$ git clone --recurse-submodules https://github.com/gnu-mcu-eclipse/openocd-build.git \
  ~/Downloads/openocd-build.git
```

## Build

Important note: Before starting the build, double check if the repository is clean (all changes were committed), otherwise the build version will be stamped with `-dirty`.

```console
$ bash ~/Downloads/openocd-build.git/scripts/build.sh cleanall
$ bash ~/Downloads/openocd-build.git/scripts/build.sh checkout-stable
$ caffeinate bash 
$ exec bash ~/Downloads/openocd-build.git/scripts/build.sh --all
```

## Prepare a new blog post to announce the release

In the documentation git:

- add a new file to `_posts/openocd/releases`
- name the file like `2016-01-11-openocd-v0-10-0-20160110-dev-released.md`
- name the post like: **GNU MCU Eclipse OpenOCD v0.10.0-20160110-dev released**.
- as `download_url` use the generic `https://github.com/gnu-mcu-eclipse/openocd/releases/` (will be updated later after the release is created)

## Update the release post with the SHA sums

Copy/paste the build report at the end of the post as

```console
06e474fe8e5070c84a80c7ffcb697e616a5f2a60f6178cc0c1ccd330c3e052f2 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-debian32.tgz

1c96b1e906fcaab55d5e3842049d05f76cb917c4bd5fbe71da9a0838d6519127 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-debian64.tgz

528722a2da544ed29c390c73ed2027c23f03df8d8ecd363b6f5f32df28ceca06 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-osx.pkg

0a8486eecd5b7d1a8d9a9a3d63a8374d918bd4665a617c300f06950791f55b40 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-osx.tgz

26bdcec5e696eadd52df8600070f5353f298b26e3dc456015cceb6f54ab367a2 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-win32-setup.exe

de3550c296611883587483073c3be9597a904e961a85c8e866ea499978eacc04 ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-win32.zip

142ee2936693f16205ba82adf3d0bee90cc4e9e279951c2b18a3929a7552cb8e ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-win64-setup.exe

0ec4539ca660d80f5ad1a6000f41852647ef93afc26a11d01f4bda5847277bfc ?
gnu-mcu-eclipse-openocd-0.10.0-5-20171110-1117-win64.zip
```

## Update the web

- commit the **gnuarmeclipse.github.io-source.git** project; use a message like **OpenOCD v0.10.0-5-20171110 released**
- run `jekyll-build.command`
- commit the **gnuarmeclipse.github.io.git** project; use a message like **OpenOCD v0.10.0-5-20171110 released**
- push the **gnuarmeclipse.github.io.git** project


## Create the release

- for stable releases, be sure the **gnuarmeclipse** branch is up to date and set as default
- go to the [GitHub Releases](https://github.com/gnu-mcu-eclipse/openocd/releases) page
- click **Draft a new release**
- name the tag like **v0.10.0-5-20171110**
- select the**gnuarmeclipse** or **gnuarmeclipse-dev** branch
- name the release like **GNU MCU Eclipse OpenOCD v0.10.0-5-20171110**
- as description, copy the first paragraph from the Web release page
- add a link to the Web page **\[Continue reading »\]\(\)**
- get URL from web and update the above link
- attach binaries and SHA (drag and drop from the archives folder will do it)
- click the **Publish Release** button

Note: at this moment the system should send a notification to all clients watching this project.

## Update the web link to resources

* `download_url: https://github.com/gnu-mcu-eclipse/openocd/releases/tag/v0.10.0-4-20171004`

## Copy binaries to the local archive folder

-   go to `.../GNU MCU Eclipse/archive`
-   move the latest binaries and SHA to `releases/openocd`

## Share on Facebook

- go to the new post and follow the Share link.
- DO NOT select **On your own Timeline**, but **On a Page you manage**
- select GNU MCU Eclipse
- posting as GNU MCU Eclipse
- click **Post to Facebook**
- check the post in the [Facebook page](https://www.facebook.com/gnu-mcu-eclipse)
