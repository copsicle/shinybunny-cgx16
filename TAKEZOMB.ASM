; Author: Gonen Cohen
; Example of finding and taking over a zombie
; This code probably can be optimized and doesn't win against anything right now
IDEAL
MODEL tiny

CODESEG
ORG 100h
init:
	push ax
	mov cx, 0Ah
hold:
	WAIT
	WAIT
	WAIT
	WAIT
	loop hold
	mov cx, 2
start:
	; Push start address and start search in 8000h
	push ax
	mov bx, ax
	add bx, offset ind
	inc [word bx]
	add bx, [bx]
	dec bx
	mov bh, [bx]
	xor bl, bl
	mov ax, [bx]
	; If the low and high bytes are different (not CCCCh) there might be an address here
	cmp al, ah
	pop ax
	je l1
	; Unscramble zombie address with inverse translation table
	pop bx
	add bx, offset ttbl
	xlat
	xchg al, ah
	xlat
	xor ah, al
	xchg ax, bx
	; Inject into zombie - mov ax, {our initial address} & jmp ax
	sub ax, offset ttbl
	mov [byte bx + 072h], 0B8h
	mov [bx + 073h], ax
	mov [word bx + 075h], 0E0FFh
l1:
	loop start

ind dw 2
locs db 081h, 085h, 042h, 046h, 023h, 027h, 004h, 008h 
; Translation table generated from gentable.py
ttbl db 000h,02Eh,088h,0A6h,02Bh,005h,0A3h,08Dh,093h,0BDh,01Bh,035h,0B8h,096h,030h,01Eh,04Eh,060h,0C6h,0E8h,065h,04Bh,0EDh,0C3h,0DDh,0F3h,055h,07Bh,0F6h,0D8h,07Eh,050h,0FAh,0D4h,072h,05Ch
db 0D1h,0FFh,059h,077h,069h,047h,0E1h,0CFh,042h,06Ch,0CAh,0E4h,0B4h,09Ah,03Ch,012h,09Fh,0B1h,017h,039h,027h,009h,0AFh,081h,00Ch,022h,084h,0AAh,06Ah,044h,0E2h,0CCh,041h,06Fh,0C9h,0E7h,0F9h,0D7h
db 071h,05Fh,0D2h,0FCh,05Ah,074h,024h,00Ah,0ACh,082h,00Fh,021h,087h,0A9h,0B7h,099h,03Fh,011h,09Ch,0B2h,014h,03Ah,090h,0BEh,018h,036h,0BBh,095h,033h,01Dh,003h,02Dh,08Bh,0A5h,028h,006h,0A0h,08Eh
db 0DEh,0F0h,056h,078h,0F5h,0DBh,07Dh,053h,04Dh,063h,0C5h,0EBh,066h,048h,0EEh,0C0h,080h,0AEh,008h,026h,0ABh,085h,023h,00Dh,013h,03Dh,09Bh,0B5h,038h,016h,0B0h,09Eh,0CEh,0E0h,046h,068h,0E5h,0CBh
db 06Dh,043h,05Dh,073h,0D5h,0FBh,076h,058h,0FEh,0D0h,07Ah,054h,0F2h,0DCh,051h,07Fh,0D9h,0F7h,0E9h,0C7h,061h,04Fh,0C2h,0ECh,04Ah,064h,034h,01Ah,0BCh,092h,01Fh,031h,097h,0B9h,0A7h,089h,02Fh,001h
db 08Ch,0A2h,004h,02Ah,0EAh,0C4h,062h,04Ch,0C1h,0EFh,049h,067h,079h,057h,0F1h,0DFh,052h,07Ch,0DAh,0F4h,0A4h,08Ah,02Ch,002h,08Fh,0A1h,007h,029h,037h,019h,0BFh,091h,01Ch,032h,094h,0BAh,010h,03Eh
db 098h,0B6h,03Bh,015h,0B3h,09Dh,083h,0ADh,00Bh,025h,0A8h,086h,020h,00Eh,05Eh,070h,0D6h,0F8h,075h,05Bh,0FDh,0D3h,0CDh,0E3h,045h,06Bh,0E6h,0C8h,06Eh,040h
exit:
	db 512-(exit-start) dup (0CCh)
END init