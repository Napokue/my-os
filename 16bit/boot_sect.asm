[org 0x7c00]
	mov bx, HELLO_MSG
	call print

	call print_nl

	mov bx, GOODBYE_MSG
	call print

	call print_nl

	mov dx, 0x12fe
	call print_hex

jmp $								; Infinite jump

%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

HELLO_MSG: db 'Hello, World!', 0
GOODBYE_MSG: db 'Goodbye!', 0

times 510-($-$$) db 0				; When compiled, our program must fit into 512 bytes,
									; with the last two bytes being the magic number,
									; so here, tell our assembly compiler to pad out our
									; program with enough zero bytes (db 0) to bring us to the
									; 510th byte.

dw 0xaa55							; Last two bytes (one word) form the magic number,
									; so BIOS knows wer are a boot sector.