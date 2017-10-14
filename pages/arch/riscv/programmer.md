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


## Preprocessor macros

### 32 bits

```console
$ ./riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define __GXX_ABI_VERSION 1011
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_cmodel_medlow 1
#define __riscv_float_abi_soft 1
#define __riscv_xlen 32

$ ./riscv64-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define __GXX_ABI_VERSION 1011
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_atomic 1
#define __riscv_cmodel_medlow 1
#define __riscv_compressed 1
#define __riscv_div 1
#define __riscv_float_abi_soft 1
#define __riscv_mul 1
#define __riscv_muldiv 1
#define __riscv_xlen 32

$ ./riscv64-unknown-elf-gcc -march=rv32imafdc -mabi=ilp32d -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define __FP_FAST_FMA 1
#define __FP_FAST_FMAF 1
#define __GXX_ABI_VERSION 1011
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_atomic 1
#define __riscv_cmodel_medlow 1
#define __riscv_compressed 1
#define __riscv_div 1
#define __riscv_fdiv 1
#define __riscv_flen 64
#define __riscv_float_abi_double 1
#define __riscv_fsqrt 1
#define __riscv_mul 1
#define __riscv_muldiv 1
#define __riscv_xlen 32
```

### 64 bits

```console
$ ./riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define _LP64 1
#define __GXX_ABI_VERSION 1011
#define __LP64__ 1
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_cmodel_medlow 1
#define __riscv_float_abi_soft 1
#define __riscv_xlen 64

$ ./riscv64-unknown-elf-gcc -march=rv64imac -mabi=lp64 -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define _LP64 1
#define __GXX_ABI_VERSION 1011
#define __LP64__ 1
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_atomic 1
#define __riscv_cmodel_medlow 1
#define __riscv_compressed 1
#define __riscv_div 1
#define __riscv_float_abi_soft 1
#define __riscv_mul 1
#define __riscv_muldiv 1
#define __riscv_xlen 64

$ ./riscv64-unknown-elf-gcc -march=rv64imafdc -mabi=lp64d -E -dM - < /dev/null | egrep -i 'risc|fp[^-]|version|abi|lp' | sort
#define _LP64 1
#define __FP_FAST_FMA 1
#define __FP_FAST_FMAF 1
#define __GXX_ABI_VERSION 1011
#define __LP64__ 1
#define __STDC_VERSION__ 201112L
#define __VERSION__ "7.1.1 20170509"
#define __riscv 1
#define __riscv_atomic 1
#define __riscv_cmodel_medlow 1
#define __riscv_compressed 1
#define __riscv_div 1
#define __riscv_fdiv 1
#define __riscv_flen 64
#define __riscv_float_abi_double 1
#define __riscv_fsqrt 1
#define __riscv_mul 1
#define __riscv_muldiv 1
#define __riscv_xlen 64
```

### Misc

```c
#define __riscv_xlen 32
#define __riscv_xlen 64
```

```c
#define __riscv_cmodel_medlow 1
#define __riscv_cmodel_medany 1
```

```c
#define __riscv_float_abi_soft 1
#define __riscv_float_abi_single 1
#define __riscv_float_abi_double 1
```

## The `gp` (Global Pointer) register

The `gp` (Global Pointer) register is a solution to further optimise memory accesses within a single 4KB region. 

The linker uses the `__global_pointer$` symbol definition to compare the memory addresses and, if within range, it replaces absolute/pc-relative addressing with gp-relative addressing, which makes the code more efficient. This process is also called _relaxing_, and can be disabled by `-Wl,--no-relax`.

```console
$ cat main.c 
int i;
int main()
{
  return i;
}

$ riscv32-unknown-elf-gcc  main.c --save-temps
$ cat main.s
...
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
...
$ riscv32-unknown-elf-objdump -d a.out
...
   101b4:       8341a783                lw      a5,-1996(gp) # 11fdc <i>
...
```

The gp register should be loaded during startup with the address of the `__global_pointer$` symbol and should not be changed later. 

```c
	.section .reset_entry,"ax",@progbits
	.align	1
	.globl	_reset_entry
	.type	_reset_entry, @function
_reset_entry:

.option push
.option norelax
	la gp, __global_pointer$
.option pop

	la sp, __stack

	j _start
```

The 4K region can be anywhere in the addressed memory, but, for the optimisation to be effective, it should preferably cover the most intensely used RAM area. For standard newlib applications, this is the area where the `.sdata` section is allocated, since it includes variables like `_impure_ptr`, `__malloc_sbrk_base`, etc. Thus, the definition should be placed right before the `.sdata` section. For example:

```
PROVIDE( __global_pointer$ = . + (4K / 2) );
*(.sdata .sdata.*)
```

The region size is 4K because RISC-V immediate values are 12-bit signed values, which are +/- 2048 in decimal or +/- 0x800 in hex; since the values are signed, the `__global_pointer$` must point to the middle of the region.
