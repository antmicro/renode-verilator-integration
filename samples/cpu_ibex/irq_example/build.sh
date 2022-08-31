#!/usr/bin/bash
wget --no-verbose https://github.com/lowRISC/lowrisc-toolchains/releases/download/20210412-1/lowrisc-toolchain-gcc-rv32imc-20210412-1.tar.xz
tar -xf lowrisc-toolchain-gcc-rv32imc-20210412-1.tar.xz

$PWD/lowrisc-toolchain-gcc-rv32imc-20210412-1/bin/riscv32-unknown-elf-gcc -nostdlib -nostartfiles -Tlink.ld -o main.elf main.c
$PWD/lowrisc-toolchain-gcc-rv32imc-20210412-1/bin/riscv32-unknown-elf-objdump -d main.elf > main.dump

