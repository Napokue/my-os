# MyOs

Learning to write a small and basic OS using the following resources:

* https://github.com/cfenollosa/os-tutorial
* http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

## Compile
To compile the asm files to bin, use the following command:
```
$nasm boot_sect.asm -f bin -o boot_sect.bin
```

## Run
To run the program, use the following command:
```
$qemu-system-i386 boot_sect.bin
```
