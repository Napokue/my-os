;
; A simple boot sector program
;

mov al, 'H'
call my_print_function

mov al, 'e'
call my_print_function

mov al, 'l'
call my_print_function

mov al, 'l'
call my_print_function

mov al, 'o'
call my_print_function

jmp $					; Infinite jump

my_print_function:
	mov ah, 0x0e		; int 10/ah = 0eh -> scrolling teletype BIOS routine
	int 0x10			; Print the character in al
	ret					; Return from the function call

times 510-($-$$) db 0	; When compiled, our program must fit into 512 bytes,
						; with the last two bytes being the magic number,
						; so here, tell our assembly compiler to pad out our
						; program with enough zero bytes (db 0) to bring us to the
						; 510th byte.

dw 0xaa55				; Last two bytes (one word) form the magic number,
						; so BIOS knows wer are a boot sector.