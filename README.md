# MyOs

Learning to write a small and basic OS using the following resources:

* https://github.com/cfenollosa/os-tutorial
* http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

## Assembly
### Compile
To compile the asm files to bin, use the following command:
```
$nasm [file-name].asm -f bin -o [file-name].bin
```

## C
### Compile
```
$gcc -ffreestanding -c [file-name].c -o [file-name].o
```

### Linker
```
$ld -o [file-name].bin -Ttext 0x0 --oformat binary [file-name].o
```

## Qemu
### Run
To run the program, use the following command:
```
$qemu-system-i386 [File-name].bin
```
