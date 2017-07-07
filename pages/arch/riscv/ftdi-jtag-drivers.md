---
layout: page
title: FTDI JTAG drivers
permalink: /arch/riscv/ftdi-jtag-drivers/

date: 2017-07-07 22:20:00 +0300

---

## Problem

Both the HiFive1 and the Arty boards use FTDI to access the JTAG interface.

By default, the standard FTDI drivers available on Windows and macOS assume the FTDI chip is used to connect UART ports via USB.

The FTDI chip can be reconfigured to access the JTAG interface via direct drivers, but this requires the presence of a small EEPROM to store the configuration, and neither board has this EEPROM physically installed.

On the HiFive1 board the problem is complicated by the fact that the second FTDI interface is used to forward the trace stream and must remain a virtual UART.

Except on GNU/Linux, where direct access to USB devices is native, for Windows and macOS there is no elegant solution to this problem, but only some work-arounds.

## Windows

Windows allows a port to be acceed via the user-space WinUSB driver only after explicitly reconfiguring a specific interface for direct drivers.

This requires installing a special driver, specifically configured for a given VID:PID.

One possible solution is [libusbk](https://sourceforge.net/projects/libusbk/), which also comes with a tool to generate these drivers. As with usual drivers, this generated driver can be installed and uninstalled, if no longer needed.

An older workaround used a tool called Zadig, but this tool had the major disadvantage that changes were permanent, and it was not possible to return the FTDI device to the default UART.

TODO: provide the driver binaries.

## macOS

Apple is even stricter when dealing with USB drivers; if the USB device has the FTDI VID:PID, it assumes it should be associated with a virtual UART device, and there is no simple way to reconfigure this.

The workaround requires to unload a kernel module:

```bash
$ sudo kextunload -p -b com.apple.driver.AppleUSBFTDI
$ sudo kextutil -b com.apple.driver.AppleUSBFTDI -p AppleUSBEFTDI-6010-1
```

This makes the HiFive1 board accessible to OpenOCD, but disables any other standard USB/UART adapter that uses the FTDI chips. Fortunately the change is nt permanent, and can be easily reversed.

TODO: explain how to reload the original Apple kext.

## GNU/Linux

GNU/Linux systems do not need suplimentary drivers to access the FTDI devices, but only some configuration tweaks.

```
$ lsusb
...
Bus XXX Device XXX: ID 0403:6010 Future Technology Devices
International, Ltd FT2232C Dual USB-UART/FIFO IC
```

TODO: explain how to use openocd rules file.

