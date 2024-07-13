#!/bin/bash

rm main.o
rm exec-x86-64
nasm -f elf64 main.asm
ld -s -o exec-x86-64 main.o
./exec-x86-64