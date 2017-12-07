# MyOs

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
