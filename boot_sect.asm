;
; A simple boot sector program
;

mov ah, 0x0e			; int 10/ah = 0eh -> scrolling teletype BIOS routine

mov al, 'H'				; Allocate the value'H' to al
int 0x10
mov al, 'e'				; Allocate the value'e' to al
int 0x10			
mov al, 'l'				; Allocate the value'l' to al
int 0x10
mov al, 'l'				; Allocate the value'l' to al
int 0x10
mov al, 'o'				; Allocate the value'o' to al
int 0x10
int 0x10
move al, 'W'			; Allocate the value'W' to al
int 0x10
move al, 'o'			; Allocate the value'o' to al
int 0x10
move al, 'r'			; Allocate the value'r' to al
int 0x10
move al, 'l'			; Allocate the value'l' to al
int 0x10
move al, 'd'			; Allocate the value'd' to al
int 0x10

jmp $					; Infinite jump


times 510-($-$$) db 0	; When compiled, our program must fit into 512 bytes,
						; with the last two bytes being the magic number,
						; so here, tell our assembly compiler to pad out our
						; program with enough zero bytes (db 0) to bring us to the
						; 510th byte.

dw 0xaa55				; Last two bytes (one word) form the magic number,
						; so BIOS knows wer are a boot sector.