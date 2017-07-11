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

When dealing with USB drivers, Apple is even stricter; if the USB device has any of the FTDI VID:PID pairs, macOS assumes it should be associated with a virtual UART device, and there is no simple way to reconfigure this.

To view the attached USB devices on macOS, use `system_profiler`. For example, the HiFive1 board is seen as Dual RS232-HS, PID:VID 6010:0403:

```bash
$ system_profiler SPUSBDataType
...
    Dual RS232-HS:

      Product ID: 0x6010
      Vendor ID: 0x0403  (Future Technology Devices International Limited)
      Version: 7.00
      Speed: Up to 480 Mb/sec
      Manufacturer: FTDI
      Location ID: 0xfa130000 / 5
      Current Available (mA): 500
      Current Required (mA): 500
      Extra Operating Current (mA): 0
```

If you already use FTDI based USB/UART adapters, remember the Product ID, since you need to manually enable it in a later step.

By default, macOS identifies the board as a **Dual RS232-HS** device, and offers to configure it as a network interface. Since the HiFive1 board does not have an EEPROM to store an unique ID, the devices are named using a string containing the address in the HUB hierarchy, so the `a13` letters in the name are different when connecting the board to a different USB port.

```bash
$ ls -l /dev/tty.usbserial*
crw-rw-rw-  1 root  wheel   19,  28 Jul 10 12:09 /dev/tty.usbserial-fa13A
crw-rw-rw-  1 root  wheel   19,  30 Jul 10 12:09 /dev/tty.usbserial-fa13B
```

Attempts to open the trace port (the second UART) are ok:

```bash
$ screen /dev/tty.usbserial-fa13B 115200
                SIFIVE, INC.

         5555555555555555555555555
        5555                   5555
       5555                     5555
      5555                       5555
     5555       5555555555555555555555
    5555       555555555555555555555555
   5555                             5555
  5555                               5555
 5555                                 5555
5555555555555555555555555555          55555
 55555           555555555           55555
   55555           55555           55555
     55555           5           55555
       55555                   55555
         55555               55555
           55555           55555
             55555       55555
               55555   55555
                 555555555
                   55555
                     5

               'led_fade' Demo
...
```

Use `Ctrl-A Ctrl-K` to kill the session, or `Ctrl-A Ctrl-D` to detach and `screen -r` to reconnect.

Attempts to open the HiFive1 board with OpenOCD fail with:

```
$ openocd -f board/sifive-freedom-e300-hifive1.cfg 
GNU MCU Eclipse 64-bits Open On-Chip Debugger 0.10.0+dev-00135-g80299198 (2017-06-22-18:37)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
adapter speed: 10000 kHz
Info : auto-selecting first available session transport "jtag". To override use 'transport select <transport>'.
Error: libusb_claim_interface() failed with LIBUSB_ERROR_ACCESS
Error: unable to open ftdi device with vid 0403, pid 6010, description 'Dual RS232-HS', serial '*' at bus location '*'
```

The workaround it to disable all _personalities_ of the AppleUSBFTDI kernel:

```bash
$ sudo kextunload -verbose -bundle-id com.apple.driver.AppleUSBFTDI -personalities-only
```

This command will remove the UART associations for all FTDI based devices. All devices will be available for user space drivers, like `libusb`. 

In the HiFive1 case, the first interface should no longer be available as a tty device, but as JTAG, and OpenOCD should be able to connect to the JTAG interface:

```bash
$ openocd -f board/sifive-freedom-e300-hifive1.cfg 
GNU MCU Eclipse 64-bits Open On-Chip Debugger 0.10.0+dev-00135-g80299198 (2017-06-22-18:37)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
adapter speed: 10000 kHz
Info : auto-selecting first available session transport "jtag". To override use 'transport select <transport>'.
Info : ftdi: if you experience problems at higher adapter clocks, try the command "ftdi_tdo_sample_edge falling"
Info : clock speed 10000 kHz
Info : JTAG tap: riscv.cpu tap/device found: 0x10e31913 (mfg: 0x489 (SiFive, Inc.), part: 0x0e31, ver: 0x1)
Info : dtmcontrol_idle=5, dbus_busy_delay=1, interrupt_high_delay=0
Info : dtmcontrol_idle=5, dbus_busy_delay=1, interrupt_high_delay=1
Info : Examined RISCV core; XLEN=32, misa=0x40001105
Info : dtmcontrol_idle=5, dbus_busy_delay=1, interrupt_high_delay=2
...
Info : dtmcontrol_idle=5, dbus_busy_delay=2, interrupt_high_delay=36
halted at 0x204003b8 due to debug interrupt
Info : Found flash device 'issi is25lp128' (ID 0x0018609d)
cleared protection for sectors 64 through 255 on flash bank 0
```

This next command will redo the UART association only for the given personality, in this case the second interface of PID 0x6010 (`AppleUSBEFTDI-6010-1`).

```bash
$ sudo kextutil -verbose -bundle-id com.apple.driver.AppleUSBFTDI -personality AppleUSBEFTDI-6010-1
$ ls -l /dev/tty.usbserial*
crw-rw-rw-  1 root  wheel   19,  30 Jul 10 12:09 /dev/tty.usbserial-fa13B
```

The second interface should be available again to `screen`, as before.

If you have other FTDI devices that you need to remain associated to UART, issue similar commands, for each one.

The AppleUSBFTDI module has many _personalities_; to bring them back, start `kextutil` in interractive mode, or reboot:

```bash
$ sudo kextutil -verbose -bundle-id com.apple.driver.AppleUSBFTDI -interactive
Defaulting to kernel file '/System/Library/Kernels/kernel'
/System/Library/Extensions/AppleUSBFTDI.kext appears to be loadable (not including linkage for on-disk libraries).
Load /System/Library/Extensions/AppleUSBFTDI.kext and its dependencies into the kernel [Y/n]? 
Loading /System/Library/Extensions/AppleUSBFTDI.kext.
/System/Library/Extensions/AppleUSBFTDI.kext successfully loaded (or already loaded).

/System/Library/Extensions/AppleUSBFTDI.kext and its dependencies are now loaded, and started as listed below. You can now return to the debugger to set breakpoints before starting any kexts that need to be started.

    com.apple.driver.AppleUSBFTDI - already started

Send personalities for /System/Library/Extensions/AppleUSBFTDI.kext [Y/n/a]? 
Send personality AppleUSBEFTDI-6011-3 [Y/n/a]? 
Send personality AppleUSBEFTDI-6011-0 [Y/n/a]? 
Send personality AppleUSBEFTDI-FT2232HQ-1 [Y/n/a]? 
Send personality AppleUSBEFTDI-6010-0 [Y/n/a]? 
Send personality AppleUSBEFTDI-6015 [Y/n/a]? 
Send personality AppleUSBEFTDI-6011-1 [Y/n/a]? 
Send personality AppleUSBEFTDI-6001 [Y/n/a]? 
Send personality AppleUSBEFTDI-6010-1 [Y/n/a]? 
Send personality AppleUSBEFTDI-SeaLevel [Y/n/a]? 
Send personality TI XDS100v2 Serial [Y/n/a]? 
Send personality AppleUSBEFTDI-6011-2 [Y/n/a]? 
Send personality AppleUSBEFTDI-6014 [Y/n/a]? 
```

### Use case

I personaly have two USB/UART DB-9 adapters and the RISC-V HiFive1 and Arty boards.

To make them work, I use a file

```
# Disable all FTDI devices
kextunload -verbose -bundle-id com.apple.driver.AppleUSBFTDI -personalities-only
# Enable the second interface on the HiFive1 board
kextutil -verbose -bundle-id com.apple.driver.AppleUSBFTDI -personality AppleUSBEFTDI-6010-1
# Enable the DIGITUS USB/UART DB-9 adapters
kextutil -verbose -bundle-id com.apple.driver.AppleUSBFTDI -personality AppleUSBEFTDI-6001
```

that I start with:

```
$ sudo bash ${HOME}/opt/scripts/ftdi.sh
```

## GNU/Linux

GNU/Linux systems do not need suplimentary drivers to access the FTDI devices, but only some configuration tweaks.

```
$ lsusb
...
Bus XXX Device XXX: ID 0403:6010 Future Technology Devices
International, Ltd FT2232C Dual USB-UART/FIFO IC
```

TODO: explain how to use openocd rules file.

