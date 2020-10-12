---
layout: page
title: DEPRECATED > GNU MCU Eclipse RISC-V Embedded GCC releases
permalink: /toolchain/riscv/releases/

author: Liviu Ionescu

date: 2017-07-06 22:34:00 +0300

redirect-url: https://xpack.github.io/riscv-none-embed-gcc/releases/

---

## Deprecation notice

In mid-2019, the RISC-V toolchain binaries were moved from the GNU MCU Eclipse
project to the xPack project. The new page is:

* [https://xpack.github.io/riscv-none-embed-gcc/](https://xpack.github.io/riscv-none-embed-gcc/)

All previous releases are still available in the `@gnu-mcu-eclipse` scope,
but were deprecated and are not recommended for new projects.

___

{% for post in site.posts %}{% if post.categories contains "releases" %}{% if post.categories contains "riscv-none-gcc" %}
* [{{ post.title }}]({{ post.url }}) [(download)]({{ post.download_url }}){% endif %}{% endif %}{% endfor %}
