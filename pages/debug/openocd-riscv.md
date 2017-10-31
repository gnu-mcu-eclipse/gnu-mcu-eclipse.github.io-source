---
layout: page
permalink: /debug/openocd/riscv/
title: OpenOCD configurations for RISC-V
author: Liviu Ionescu

date: 2017-10-31 21:11:00 +0300

---

## RISC-V specific configuration details

Although OpenOCD works the same for RISC-V as for ARM, there are some details that need to be considered.

### The Debugger tab

![OpenOCD RISC-V Debugger tab]({{ site.baseurl }}/assets/images/2017/openocd-riscv-debugger-tab.png)

The RISC-V specific configuration files must be entered in the **Config options:** field.

For boards with integrated JTAG adapters (like SiFive HiFive1), use the board file

* `-f "board/sifive-hifive1.cfg"`

For the Arty synthesised boards, use multiple commands, with separate interface and board files, for example for **E31Arty** with Olimex USB probes:

* `-c "adapter_khz 5000" -f "interface/ftdi/olimex-arm-usb-tiny-h.cfg" -f "board/sifive-e31arty.cfg"`
* `-c "adapter_khz 5000" -f "interface/ftdi/olimex-arm-usb-ocd.cfg" -f "board/sifive-e31arty.cfg"`

Similarly for **E51Arty** with Olimex USB probes:

* `-c "adapter_khz 5000" -f "interface/ftdi/olimex-arm-usb-tiny-h.cfg" -f "board/sifive-e51arty.cfg"`
* `-c "adapter_khz 5000" -f "interface/ftdi/olimex-arm-usb-ocd.cfg" -f "board/sifive-e51arty.cfg"`

For the SiFive configuration files, future OpenOCD are expected to include them in the distribution. If they are not yet there, please download them from [GitHub](https://github.com/gnu-mcu-eclipse/openocd/tree/gnu-mcu-eclipse-dev/tcl/board) and copy them to the openOCD `scripts` folder.

The second mandatory setting is the architecture, in the **GDB** → **Commands** field. 

For 32-bits devices, use:

```
set arch riscv:rv32
set remotetimeout 250
```

For 64-bits devices, use:

```
set arch riscv:rv64
set remotetimeout 250
```

### The Startup tab

![OpenOCD RISC-V Startup tab]({{ site.baseurl }}/assets/images/2017/openocd-riscv-startup-tab.png)

Since for the moment semihosting is not available on RISC-V, disable the **ARM semihosting** option in the **Initialization Commands** section.

For some obscure reasons related to the way the devices boot, disable the **Pre-run/Restart reset** in the **Run/Restart Commands** section. Unfortunately this will also prevent the **Restart** button to function properly.

For some targets (like the Arty synthesised ones), it might help to explicitly define the initial program counter, for example to `40400000`. If the debugged application is an ELF image, a safer solution is to be sure the actual reset address is defined in the linker scripts, for example as `ENTRY(riscv_reset_entry)`.

