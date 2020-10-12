---
layout: page
title: DEPRECATED > GNU MCU Eclipse QEMU releases
permalink: /qemu/releases/

author: Liviu Ionescu

date: 2015-09-10 09:08:00 +0300

redirect-url: https://xpack.github.io/qemu-arm/releases/

---

## Deprecation notice

In mid-2019, the QEMU binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new home page is:

* [https://xpack.github.io/qemu-arm/](https://xpack.github.io/qemu-arm/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.
___

{% for post in site.posts %}{% if post.categories contains "releases" %}{% if post.categories contains "qemu" %}
* [{{ post.title }}]({{ post.url }}) [(download)]({{ post.download_url }}){% endif %}{% endif %}{% endfor %}
