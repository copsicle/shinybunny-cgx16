; Author: Gonen Cohen
; First survivor code
IDEAL
MODEL tiny

CODESEG
ORG 100h
init:
	; Couldn't figure out the syntax to make jmp short work on tasm so I defined it manually
	; Offset is calculated in preprocessor, 1 is added because of the obfuscation spacing
	db 0EBh, ((ttbl - mac) / 2)
	; Obfuscation spacing
	db 0
mac:
; Repeat the code twice for smart bomb protection
rept 2
; Define local labels to fix redefining labels whel theyre duplicated
; If you happen to add more labels make sure you make them local
local hold
local start
local l1
local l2
local l2end
local aftersurv
local after
local l3
local last
	; Write our location to shared memory
	stosw
	mov cx, 18h
	; Wait for zombies to write into 8100-8800 by getting energy
hold:
	wait
	wait
	wait
	wait
	loop hold
start:
	mov bx, 8100h
	mov cx, 8
l1:	
	; Read and overwrite scrambled locations in the range
	push [bx]
	mov [word bx], 0CCCCh
	inc bh 
	loop l1
	; Initilize table address
	mov bx, ax
	add bx, offset ttbl - init
	mov cx, 8
l2:
	; Loop over stack and check if address might be legit
	pop ax
	cmp al, ah
	je l2end
	; Unscramble locations from stack
	xlat
	xchg al, ah
	xlat
	xor ah, al
	xchg ax, bx
	; Inject into zombie - mov bx, {the address to the after label} & jmp bx
	sub ax, offset ttbl - after
	mov [byte bx + 072h], 0BBh
	mov [bx + 073h], ax
	mov [word bx + 075h], 0E3FFh
	; Change bx back to table address and loop
	xchg ax, bx
	add bx, offset ttbl - after
l2end:	
	loop l2
aftersurv:
	; Put original address back in ax for the survivor
	sub bx, offset ttbl - init
	mov ax, bx
after:
	; Zombies start here, save es and pop ds into it for bombing
	push es
	push ds
	pop es
	; Use up both our bombs
	mov cx, 2
	mov di, ax
l3:
	; Bomb by xoring your initial location (different for zombies) with our location
	; This will always be 0-100 for the survivor, xoring also helps us avoid ourselves
	xor di, bx
	int 86h
	; Add some value to di so it would move
	add di, 0FFh
	loop l3

	add bx, offset last - init
last:
	; Same concept but for writing words instead until the end of time
	xor di, bx
	mov [word di], 0CCCCh
	add di, 0FFh
	jmp last
; End repeating 'macro'
endm
; Translation table generated from gentable.py
ttbl db 000h,02Eh,088h,0A6h,02Bh,005h,0A3h,08Dh,093h,0BDh,01Bh,035h,0B8h,096h,030h,01Eh,04Eh,060h,0C6h,0E8h,065h,04Bh,0EDh,0C3h,0DDh,0F3h,055h,07Bh,0F6h,0D8h,07Eh,050h,0FAh,0D4h,072h,05Ch
db 0D1h,0FFh,059h,077h,069h,047h,0E1h,0CFh,042h,06Ch,0CAh,0E4h,0B4h,09Ah,03Ch,012h,09Fh,0B1h,017h,039h,027h,009h,0AFh,081h,00Ch,022h,084h,0AAh,06Ah,044h,0E2h,0CCh,041h,06Fh,0C9h,0E7h,0F9h,0D7h
db 071h,05Fh,0D2h,0FCh,05Ah,074h,024h,00Ah,0ACh,082h,00Fh,021h,087h,0A9h,0B7h,099h,03Fh,011h,09Ch,0B2h,014h,03Ah,090h,0BEh,018h,036h,0BBh,095h,033h,01Dh,003h,02Dh,08Bh,0A5h,028h,006h,0A0h,08Eh
db 0DEh,0F0h,056h,078h,0F5h,0DBh,07Dh,053h,04Dh,063h,0C5h,0EBh,066h,048h,0EEh,0C0h,080h,0AEh,008h,026h,0ABh,085h,023h,00Dh,013h,03Dh,09Bh,0B5h,038h,016h,0B0h,09Eh,0CEh,0E0h,046h,068h,0E5h,0CBh
db 06Dh,043h,05Dh,073h,0D5h,0FBh,076h,058h,0FEh,0D0h,07Ah,054h,0F2h,0DCh,051h,07Fh,0D9h,0F7h,0E9h,0C7h,061h,04Fh,0C2h,0ECh,04Ah,064h,034h,01Ah,0BCh,092h,01Fh,031h,097h,0B9h,0A7h,089h,02Fh,001h
db 08Ch,0A2h,004h,02Ah,0EAh,0C4h,062h,04Ch,0C1h,0EFh,049h,067h,079h,057h,0F1h,0DFh,052h,07Ch,0DAh,0F4h,0A4h,08Ah,02Ch,002h,08Fh,0A1h,007h,029h,037h,019h,0BFh,091h,01Ch,032h,094h,0BAh,010h,03Eh
db 098h,0B6h,03Bh,015h,0B3h,09Dh,083h,0ADh,00Bh,025h,0A8h,086h,020h,00Eh,05Eh,070h,0D6h,0F8h,075h,05Bh,0FDh,0D3h,0CDh,0E3h,045h,06Bh,0E6h,0C8h,06Eh,040h
db 512-($-init) dup (0CCh)
end init