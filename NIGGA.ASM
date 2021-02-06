; Author: Gonen Cohen
; First survivor code
IDEAL
MODEL small

CODESEG
ORG 100h
init:
    push ds
    push ds
    push es
    pop ds
    pop es
    pop ss
    lodsw

    mov dx, 0CCCCh
    mov di, ax
    add di, 0400h
    int 86h
    int 86h

    mov sp, di
    add sp, 08000h
    mov ax, 050ABh
	mov bx, di
	stosw
	jmp bx
end init