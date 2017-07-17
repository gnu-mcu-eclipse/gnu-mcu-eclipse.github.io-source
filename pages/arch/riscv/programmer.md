---
layout: page
title: Programmer
permalink: /arch/riscv/programmer/

date: 2017-07-17 23:36:00 +0300

---

## ABI

Assembler mnemonics for RISC-V integer and floating-point registers.

| Register | ABI Name | Description | Caller | Calee |
|----------|----------|-------------|--------|-------|
| x0 | zero | Hard-wired zero |  |  |
| x1 | ra | Return address | * |  |
| x2 | sp | Stack pointer |  | * |
| x3 | gp | Global pointer |  |  |
| x4 | tp | Thread pointer |  |  |
| x5  | t0 | Temporary/alternate link register | * |  |
| x6–x7 | t1-t2 | Temporaries | * |  |
| x8 | s0/fp | Saved register/frame pointer |  | * |
| x9 | s1 | Saved register |  | * |
| x10–x11 | a0-a1 | Function arguments/return values | * |  |
| x12–x17 | a2-a7 | Function arguments | * |  |
| x18–x27 | s2-s11 | Saved registers |  | * |
| x28–x31 | t3-t6 | Temporaries | * |  |
|----------|----------|-------------|-------|
| f0–f7 | ft0-ft7 | FP temporaries | * |  |
| f8–f9 | fs0-fs1 | FP saved registers |  | * |
| f10–f11 | fa0-fa1 | FP arguments/return values | * |  |
| f12–f17 | fa2-fa7 | FP arguments | * |  |
| f18–f27 | fs2-fs11 | FP saved registers |  | * |
| f28–f31 | ft8-ft11 | FP temporaries | * |  |


