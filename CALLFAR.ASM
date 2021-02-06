; Author: Gonen Cohen
; First survivor code
IDEAL
MODEL small

CODESEG
ORG 100h
init:
    db 0EBh, ((ending - mac) / 3) + 1
	; Obfuscation spacing
	db 81h
mac:
rept 3
local call_far
local end_survivor
    stosw
    push ds
    push ds
    pop es
    pop ss

    mov dx, 0CCCCh
    mov di, ax
    add di, offset (ending2 - init)
    int 86h
    int 86h

    mov bx,ax
    mov sp,ax

    add ax, offset call_far - init
    add bx, offset ending - init

    mov [bx], ax
    mov [bx+2], cs

call_far:
    call [dword bx]
end_survivor:
endm
ending db 512-($-init) dup (0CCh)
ending2:
end init