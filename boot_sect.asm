;
; A simple boot sector program
;

mov ah, 0x0e		; int 10/ah = 0eh -> scrolling teletype BIOS routine

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
int 0x10
move al, 'W'
int 0x10
move al, 'o'
int 0x10
move al, 'r'
int 0x10
move al, 'l'
int 0x10
move al, 'd'
int 0x10

jmp $					; Jump to the current address (i.e forever).


times 510-($-$$) db 0	; When compiled, our program must fit into 512 bytes,
						; with the last two bytes being the magic number,
						; so here, tell our assembly compiler to pad out our
						; program with enough zero bytes (db 0) to bring us to the
						; 510th byte.

dw 0xaa55				; Last two bytes (one word) form the magic number,
						; so BIOS knows wer are a boot sector.

