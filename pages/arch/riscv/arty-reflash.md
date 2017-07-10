---
layout: page
title: How to re-flash the Arty board?
permalink: /arch/riscv/arty-reflash/

date: 2017-07-07 20:36:00 +0300

---

## Vivado

The Xilinx recommended way to re-flash the Arty board is to use the Vivado Design Studio, a huge, Windows-only comercial application.

For those in the synthesised hardware business, this might be a perfectly acceptable solution.

For the rest of us, installing a Windows virtual machine and huge (tens of GB) applications only to re-flash a development board is a bit too much.

## xc3sprog

A simpler solution is to use the open source [xc3sprog](http://xc3sprog.sourceforge.net) program.

### How to build

#### GNU/Linux

On GNU/Linux, building `xc3sprog` requires `svn`, `cmake`, `libftdi` and `libusb`.

```bash
$ svn http://xc3sprog.svn.sourceforge.net/svnroot/xc3sprog/trunk xc3sprog.svn
$ mkdir build
$ cd build
$ cmake ../xc3sprog.svn
$ make
$ make install
```

#### macOS 

TODO: explain how to do this on macOS.

### How to use

The Arty board has a FTDI interface to program the Xlinx FPGA, but the SPI flash is not directly accessible by FTDI, so it requires a special image inside Xlinx to make the connections to the SPI flash. 

Given this configuration, the Arty re-flashing is done in two steps:

* the first step uses `xc3sprog` to program Xlinx to obtain access to the SPI flash
* the second step uses `openocd` to program the main `.mcs` image into the SPI flash

```bash
$ xc3sprog -c nexys4 E31_ArtyTop.bit
$ cd freedom-e-sdk
$ openocd -f bsp/env/coreplexip-e31-arty/openocd.cfg \
    -c "flash protect 0 0 last off" \
    -c "program coreplexip_e31_arty/arty.E31FPGAEvaluationConfig.mcs verify 0x40000000" \
    -c "exit"
```

TODO: explain where to get the E31_ArtyTop.bit file from.