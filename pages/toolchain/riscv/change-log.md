---
layout: page
title: The 2017 RISC-V GCC Change Log
permalink: /toolchain/riscv/change-log/

date: 2017-07-07 16:34:00 +0300

---

Entries in this file are in reverse chronological order.

## 2017

### 2017-09-12

- v7.1.1-2-20170912-2255 released
- add multilib support for rv32imaf/ilp32f
- remove mandatory link of libgloss

### 2017-07-02

- v7.1.1-1-20170702-0625 released

### 2017-06-27

- add support for `--specs=nano.specs`; this translates into a separate build for `newlib` with specific configuration options and a separate build of the C++ standard libraries with `-Os`.
