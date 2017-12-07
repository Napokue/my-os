;
; A simple boot sector program with conditions
;

mov ah, 0x0e                ; int 10/ah = 0eh -> scrolling teletype BIOS routine

mov bx, 40                  ; Allocate the value 40 to bx

cmp bx, 4                   ; compare bx with 4
jle then_block              ; if (bx <= 4) then jump to "then_block"
cmp bx, 40                  ; Compare bx with 40 
jl then_else_if_block       ; else if (bx < 40) then jump to "then_else_if_block"
jmp then_else_block         ; else then jump to "then_else_block"

then_block:
    mov al, 'A'             ; Allocate the value 'A' to al
    jmp the_end             ; Jump to "the_end"
then_else_if_block:
    mov al, 'B'             ; Allocate the value 'B' to al
    jmp the_end             ; Jump to "the_end"
then_else_block:        
    mov al, 'C'             ; Allocate the value 'C' to al
    jmp the_end             ; Jump to "the_end"
the_end:

int 0x10                    ; Print the character in al

jmp $                       ; Infinite jump

times 510-($-$$) db 0       ; Padding 510 bytes with 0
dw 0xaa55                   ; Last two bytes (one word) form the magic number,
                            ; so BIOS knows wer are a boot sector.