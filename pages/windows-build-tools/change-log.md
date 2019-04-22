---
layout: page
title: The 2018 Windows Build Tools Change Log
permalink: /windows-build-tools/change-log/

author: Liviu Ionescu

date: 2015-09-04 17:02:00 +0300

---

Entries in this file are in reverse chronological order.

## 2019

### 2019-04-22

- v2.12 released
- update build for XBB v2.1
- update to latest busybox rmyorston commit 65ae5b24cc08f898e81b36421b616fc7fc25d2b1
- fix the 32-bit build bug

## 2018

### 2018-04-28

- v2.11 released
- build with the latest XBB scripts
- update to latest busybox rmyorston commit 6f7d1af269eed4b42daeb9c6dfd2ba62f9cd47e4

### 2018-01-03

- v2.10 released
- update to make 4.2.1
- update to latest busybox rmyorston commit 096aee2bb468d1ab044de36e176ed1f6c7e3674d
- no more setup.exe files

## 2017

### 2017-06-29

- v2.9-20170629 released
- updated to rebranded helper

### 2017-06-07

- v2.9-20170607 released
- rebranded GNU MCU Eclipse
- use busybox rmyorston commit c2002eae394c230d6b89073c9ff71bc86a7875e8

## 2016

### 2016-11-22

- v2.8-20161122* released
- add mkdir.exe, as a copy of busybox.exe
- use busybox rmyorston commit 9fa1e4990e655a85025c9d270a1606983e375e47

### 2016-10-28

- v2.7-20161028* released

### 2016-10-20

- **[Issue:[#2](https://github.com/gnu-mcu-eclipse/windows-build-tools/issues/2)]** nsi file: add InstallDir; silent install should honour /D
- update url to github.io

### 2016-10-17

- pre v2.7

## 2015

### 2015-07-17

- README.md added

### 2015-07-16

- v2.6-201507152002 released
- support for 64-bit windows added (build scripts)

### 2015-05-14

- nsis build: add dlls
- deprecate the Ubuntu build script
- build updated for Docker; pre v2.5 (internal release)

### 2015-03-24

- v2.4-201503242026 released
- CHANGES updated
- nsis add busybox to package; remove multiUser

### 2015-03-21

- v2.4-201503212005 released
- add version to path; nsis updates from openocd

### 2015-03-18

- NOGLOB option should keep the default value; removed.

### 2015-03-17

- scripts location moved below gnuarmeclipse.
- build script with more generic name, moved to scripts
- pre 2.4 functional on 32-bit; sh.exe not functional on 64-bit
- pre v2.4, 64-bit ready; multi-user added, not functional
- original MultiUser.nsh file, without CR

### 2015-01-25

- v2.3-201501242223, with static apps, no dlls

### 2015-01-24

- v2.2-201501232303 released
- use msys2

### 2015-01-22

- v2.1-201501221704 released
- new version using msys

## 2014

### 2014-12-02

- DLLs added. ASCII txt in Windows format.

### 2014-12-01

- v2.0 git clone command fixed in HOWTO

Note: Earlier versions were stored in QEMU & OpenOCD repositories.
