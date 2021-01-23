00000000  EB53              jmp short 0x55
00000002  CC                int3
00000003  CC                int3
00000004  CC                int3
00000005  1E                push ds
00000006  07                pop es
00000007  50                push ax
00000008  89C3              mov bx,ax
0000000A  81C3CD00          add bx,0xcd
0000000E  D7                xlatb
0000000F  86D0              xchg dl,al
00000011  58                pop ax
00000012  30E0              xor al,ah
00000014  D7                xlatb
00000015  88D4              mov ah,dl
00000017  89C3              mov bx,ax
00000019  B91000            mov cx,0x10
0000001C  89800005          mov [bx+si+0x500],ax
00000020  D1E3              shl bx,1
00000022  E2F8              loop 0x1c
00000024  46                inc si
00000025  83E63F            and si,byte +0x3f
00000028  EBED              jmp short 0x17
0000002A  CC                int3
0000002B  CC                int3
0000002C  CC                int3
0000002D  1E                push ds
0000002E  07                pop es
0000002F  50                push ax
00000030  89C3              mov bx,ax
00000032  81C3CD00          add bx,0xcd
00000036  D7                xlatb
00000037  86D0              xchg dl,al
00000039  58                pop ax
0000003A  30E0              xor al,ah
0000003C  D7                xlatb
0000003D  88D4              mov ah,dl
0000003F  89C3              mov bx,ax
00000041  B91000            mov cx,0x10
00000044  89800005          mov [bx+si+0x500],ax
00000048  D1E3              shl bx,1
0000004A  E2F8              loop 0x44
0000004C  46                inc si
0000004D  83E63F            and si,byte +0x3f
00000050  EBED              jmp short 0x3f
00000052  CC                int3
00000053  CC                int3
00000054  CC                int3
00000055  1E                push ds
00000056  07                pop es
00000057  50                push ax
00000058  89C3              mov bx,ax
0000005A  81C3CD00          add bx,0xcd
0000005E  D7                xlatb
0000005F  86D0              xchg dl,al
00000061  58                pop ax
00000062  30E0              xor al,ah
00000064  D7                xlatb
00000065  88D4              mov ah,dl
00000067  89C3              mov bx,ax
00000069  B91000            mov cx,0x10
0000006C  89800005          mov [bx+si+0x500],ax
00000070  D1E3              shl bx,1
00000072  E2F8              loop 0x6c
00000074  46                inc si
00000075  83E63F            and si,byte +0x3f
00000078  EBED              jmp short 0x67
0000007A  CC                int3
0000007B  CC                int3
0000007C  CC                int3
0000007D  1E                push ds
0000007E  07                pop es
0000007F  50                push ax
00000080  89C3              mov bx,ax
00000082  81C3CD00          add bx,0xcd
00000086  D7                xlatb
00000087  86D0              xchg dl,al
00000089  58                pop ax
0000008A  30E0              xor al,ah
0000008C  D7                xlatb
0000008D  88D4              mov ah,dl
0000008F  89C3              mov bx,ax
00000091  B91000            mov cx,0x10
00000094  89800005          mov [bx+si+0x500],ax
00000098  D1E3              shl bx,1
0000009A  E2F8              loop 0x94
0000009C  46                inc si
0000009D  83E63F            and si,byte +0x3f
000000A0  EBED              jmp short 0x8f
000000A2  CC                int3
000000A3  CC                int3
000000A4  CC                int3
000000A5  1E                push ds
000000A6  07                pop es
000000A7  50                push ax
000000A8  89C3              mov bx,ax
000000AA  81C3CD00          add bx,0xcd
000000AE  D7                xlatb
000000AF  86D0              xchg dl,al
000000B1  58                pop ax
000000B2  30E0              xor al,ah
000000B4  D7                xlatb
000000B5  88D4              mov ah,dl
000000B7  89C3              mov bx,ax
000000B9  B91000            mov cx,0x10
000000BC  89800005          mov [bx+si+0x500],ax
000000C0  D1E3              shl bx,1
000000C2  E2F8              loop 0xbc
000000C4  46                inc si
000000C5  83E63F            and si,byte +0x3f
000000C8  EBED              jmp short 0xb7
000000CA  CC                int3
000000CB  CC                int3
000000CC  CC                int3
000000CD  00BBD368          add [bp+di+0x68d3],bh
000000D1  BE056D            mov si,0x6d05
000000D4  D6                salc
000000D5  82                db 0x82
000000D6  3951EA            cmp [bx+di-0x16],dx
000000D9  3C87              cmp al,0x87
000000DB  EF                out dx,ax
000000DC  54                push sp
000000DD  E05B              loopne 0x13a
000000DF  33885EE5          xor cx,[bx+si-0x1aa2]
000000E3  8D3662D9          lea si,[0xd962]
000000E7  B10A              mov cl,0xa
000000E9  DC670F            fsub qword [bx+0xf]
000000EC  B4EE              mov ah,0xee
000000EE  55                push bp
000000EF  3D8650            cmp ax,0x5086
000000F2  EB83              jmp short 0x77
000000F4  386CD7            cmp [si-0x29],ch
000000F7  BF04D2            mov di,0xd204
000000FA  6901BA0E          imul ax,[bx+di],word 0xeba
000000FE  B5DD              mov ch,0xdd
00000100  66B00B            o32 mov al,0xb
00000103  63D8              arpl ax,bx
00000105  8C37              mov [bx],segr6
00000107  5F                pop di
00000108  E432              in al,0x32
0000010A  89E1              mov cx,sp
0000010C  5A                pop dx
0000010D  FF442C            inc word [si+0x2c]
00000110  97                xchg ax,di
00000111  41                inc cx
00000112  FA                cli
00000113  92                xchg ax,dx
00000114  297DC6            sub [di-0x3a],di
00000117  AE                scasb
00000118  15C378            adc ax,0x78c3
0000011B  10AB1FA4          adc [bp+di-0x5be1],ch
0000011F  CC                int3
00000120  77A1              ja 0xc3
00000122  1A72C9            sbb dh,[bp+si-0x37]
00000125  9D                popfw
00000126  264E              es dec si
00000128  F5                cmc
00000129  2398F04B          and bx,[bx+si+0x4bf0]
0000012D  11AAC279          adc [bp+si+0x79c2],bp
00000131  AF                scasw
00000132  147C              adc al,0x7c
00000134  C7                db 0xc7
00000135  93                xchg ax,bx
00000136  2840FB            sub [bx+si-0x5],al
00000139  2D96FE            sub ax,0xfe96
0000013C  45                inc bp
0000013D  F1                int1
0000013E  4A                dec dx
0000013F  22994FF4          and bl,[bx+di-0xbb1]
00000143  9C                pushfw
00000144  27                daa
00000145  73C8              jnc 0x10f
00000147  A01BCD            mov al,[0xcd1b]
0000014A  761E              jna 0x16a
0000014C  A5                movsw
0000014D  803B53            cmp byte [bp+di],0x53
00000150  E83E85            call word 0x8691
00000153  ED                in ax,dx
00000154  56                push si
00000155  02B9D16A          add bh,[bx+di+0x6ad1]
00000159  BC076F            mov sp,0x6f07
0000015C  D460              aam 0x60
0000015E  DB                db 0xdb
0000015F  B308              mov bl,0x8
00000161  DE650D            fisub word [di+0xd]
00000164  B6E2              mov dh,0xe2
00000166  59                pop cx
00000167  318A5CE7          xor [bp+si-0x18a4],cx
0000016B  8F                db 0x8f
0000016C  346E              xor al,0x6e
0000016E  D5BD              aad 0xbd
00000170  06                push es
00000171  D06B03            shr byte [bp+di+0x3],1
00000174  B8EC57            mov ax,0x57ec
00000177  3F                aas
00000178  8452E9            test [bp+si-0x17],dl
0000017B  813A8E35          cmp word [bp+si],0x358e
0000017F  5D                pop bp
00000180  E630              out 0x30,al
00000182  8BE3              mov sp,bx
00000184  58                pop ax
00000185  0CB7              or al,0xb7
00000187  DF64B2            fbld tword [si-0x4e]
0000018A  0961DA            or [bx+di-0x26],sp
0000018D  7FC4              jg 0x153
0000018F  AC                lodsb
00000190  17                pop ss
00000191  C17A12A9          sar word [bp+si+0x12],0xa9
00000195  FD                std
00000196  46                inc si
00000197  2E95              cs xchg ax,bp
00000199  43                inc bx
0000019A  F8                clc
0000019B  90                nop
0000019C  2B9F244C          sub bx,[bx+0x4c24]
000001A0  F721              mul word [bx+di]
000001A2  9AF2491DA6        call word 0xa61d:0x49f2
000001A7  CE                into
000001A8  75A3              jnz 0x14d
000001AA  1870CB            sbb [bx+si-0x35],dh
000001AD  91                xchg ax,cx
000001AE  2A42F9            sub al,[bp+si-0x7]
000001B1  2F                das
000001B2  94                xchg ax,sp
000001B3  FC                cld
000001B4  47                inc di
000001B5  13A8C07B          adc bp,[bx+si+0x7bc0]
000001B9  AD                lodsw
000001BA  16                push ss
000001BB  7EC5              jng 0x182
000001BD  71CA              jno 0x189
000001BF  A219CF            mov [0xcf19],al
000001C2  741C              jz 0x1e0
000001C4  A7                cmpsw
000001C5  F348              rep dec ax
000001C7  209B4DF6          and [bp+di-0x9b3],bl
000001CB  9E                sahf
000001CC  25                db 0x25
