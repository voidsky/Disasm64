section .data	
regNames16  db  'AX',0,'CX',0,'DX',0,'BX',0,'SP',0,'BP',0,'SI',0,'DI',0
regNames8   db  'AL',0,'CL',0,'DL',0,'BL',0,'AH',0,'CH',0,'DH',0,'BH',0
regNamesSeg db  'ES',0,'CS',0,'SS',0,'DS'
dispNames	db  '[BX+SI',0
			db	'[BX+DI',0
			db	'[BP+SI',0
			db	'[BP+DI',0
			db	'[SI',0,0,0,0,
			db	'[DI',0,0,0,0,
			db	'[BP',0,0,0,0,
			db	'[BX',0,0,0,0,

op1byte	; (nr1) pats paprasciausias atvejis
			; opcode - yra vienas baita be jokiu parametru
			db	0F0h,	'LOCK   ',0

			db	09Bh,	'WAIT   ',0
			db	0F4h,	'HLT    ',0
			db	0FBh,	'STI    ',0
			db	0FAh,	'CLI    ',0
			db	0FDh,	'STD    ',0
			db	0FCh,	'CLD    ',0
			db	0F9h,	'STC    ',0
			db	0F5h,	'CMC    ',0
			db	0F8h,	'CLC    ',0
			db	0CFh,	'IRET   ',0
			db	0CEh,	'INTO   ',0			
			db	0CBh,	'RETF   ',0
			db	0C3h,	'RET    ',0
			db	099h,	'CWD    ',0
			db	098h,	'CBW    ',0			
			db	02Fh,	'DAS    ',0
			db	03Fh,	'AAS    ',0			
			db	027h,	'BAA    ',0
			db	037h,	'AAA    ',0
			
			db	09Dh,	'POPF   ',0
			db	09Ch,	'PUSHF  ',0
			db	09Eh,	'SAHF   ',0
			db	09Fh,	'LAHF   ',0
			
			db	0D7h,	'XLAT   ',0
			
			db	0CCh,	'INT 3  ',0

			db	0F2h,	'REPNE  ',0
			db	0F3h,	'REPE   ',0
			
			db	0A4h,	'MOVSB  ',0
			db	0A5h,	'MOVSW  ',0

			db	0A6h,	'CMPSB  ',0
			db	0A7h,	'CMPSW  ',0

			db	0AEh,	'SCASB  ',0
			db	0AFh,	'SCASW  ',0

			db	0ACh,	'LODSB  ',0
			db	0ADh,	'LODSW  ',0

			db	0AAh,	'STOSB  ',0
			db	0ABh,	'STOSW  ',0
			
			db	0ECh,	'IN AL  ',0
			db	0EDh,	'IN AX  ',0
			
			db	0EEh,	'OUT AL ',0
			db	0EFh,	'OUT AX ',0
			
			db	006h,	'PUSH ES',0
			db	00Eh,	'PUSH CS',0
			db	016h,	'PUSH SS',0
			db	01Eh,	'PUSH DS',0

			db	007h,	'POP ES ',0
			db	017h,	'POP SS ',0
			db	01Fh,	'POP DS ',0

			db	090h,	'NOP    ',0

			db	000h
			
op1byteReg	; (nr2) truputi sudetingesnis atvejis
			; opcode - yra vienas baitas formato xxxxxreg
			db	050h,	'PUSH    ',0
			db	058h,	'POP     ',0
			db	090h,	'XCHG AX,',0
			db	040h,	'INC     ',0
			db	048h,	'DEC     ',0
			
			db	000h
				
			
op1byte1data ; (nr3) 
			;opcode data (pvz int 8, jmp 200 ir t.t.)
			db	0CBh,	'INT    ',0
			db	0E3h,	'JCXZ   ',0			
			db	0E0h,	'LOOPNZ ',0
			db	0E1h,	'LOOPZ  ',0
			db	0E2h,	'LOOP   ',0
			db	079h,	'JNS    ',0
			db	071h,	'JNO    ',0
			db	07Bh,	'JNP    ',0
			db	077h,	'JA     ',0
			db	073h,	'JAE    ',0
			db	07Fh,	'JG     ',0
			db	07Dh,	'JGE    ',0
			db	075h,	'JNE    ',0
			db	078h,	'JS     ',0
			db	070h,	'JO     ',0
			db	07Ah,	'JPE    ',0
			db	076h,	'JBE    ',0
			db	072h,	'JB     ',0
			db	07Eh,	'JLE    ',0
			db	07Ch,	'JL     ',0
			db	074h,	'JE     ',0
			
			db	0E6h,	'OUT AL,',0
			db	0E7h,	'OUT AX,',0
			
			db	0E4h,	'IN  AL,',0
			db	0E5h,	'IN  AX,',0
			
			db	0EBh,	'JMP    ',0

			db	0D4h,	'AAM    ',0
			db	0D5h,	'AAD    ',0
								
			db	000h
		
op1byte2data
			;opcode data data
			db	0CAh,	'RETF   ',0
			db	0C2h,	'RET    ',0
			db	0E9h,	'JMP    ',0
			db	0E8h,	'CALL   ',0
			db	000h

op1byte4data 
			;opcode data data data data
			db	0EAh,	'JMPF   ',0
			db	09Ah,	'CALLF  ',0
			db	000h, 000h, 000h, 000h			
		
op2byteModRegRm 
			;2 baitai 
			;opcode modrefrm
			db	030h,	'XOR    ',0
			db	032h,	'XOR    ',0			
			db	008h,	'OR     ',0
			db	008h,	'OR     ',0			
			db	084h,	'TEST   ',0
			db	085h,	'TEST   ',0			
			db	020h,	'AND    ',0
			db	022h,	'AND    ',0			
			db	038h,	'CMP    ',0
			db	03Ah,	'CMP    ',0			
			db	018h,	'SSB    ',0
			db	01Ah,	'SSB    ',0		
			db	028h,	'SUB    ',0
			db	02Ah,	'SUB    ',0			
			db	010h,	'ADC    ',0
			db	012h,	'ADC    ',0		
			db	000h,	'ADD    ',0
			db	002h,	'ADD    ',0			
			db	088h,	'MOV1   ',0
			db	08Ah,	'MOV1   ',0			
			db	086h,	'XCHG   ',0			
			db	08Bh,	'LEA    ',0
			db	0C5h,	'LDS    ',0
			db	0C4h,	'LES    ',0
			db	0FFh

op2byteModRm ;(nr5) xxxxxxxw moxxxrmm
			;2 baitai 
			;opcode modNNNrm
			;antro baito NNN papildomai identifikuoja komanda
			db	0FFh, 006h,	'PUSH   ',0
			db	0FFh, 002h,	'CALL   ',0
			db	0FFh, 003h,	'CALLF  ',0			
			db	0FFh, 004h,	'JMP    ',0
			
			db	08Fh, 000h,	'POP    ',0
			db	0FEh, 000h,	'INC B  ',0
			db	0FFh, 000h,	'INC W  ',0
			db	0FEh, 001h,	'DEC B  ',0
			db	0FFh, 001h,	'DEC W  ',0
			db	0F6h, 002h,	'NOT B  ',0
			db	0F7h, 002h,	'NOT W  ',0			
			db	0F6h, 003h,	'NEG B  ',0
			db	0F7h, 003h,	'NEG W  ',0
			db	0F6h, 004h,	'MUL B  ',0
			db	0F7h, 004h,	'MUL W  ',0
			db	0F6h, 005h,	'IMUL B ',0
			db	0F7h, 005h,	'IMUL W ',0
			db	0F6h, 006h,	'DIV B  ',0
			db	0F7h, 006h,	'DIV W  ',0
			db	0F6h, 007h,	'IDIV B ',0
			db	0F7h, 007h,	'IDIV W ',0
			
			db	0D0h, 004h,	'SHL    ',0
			db	0D2h, 004h,	'SHL    ',0
			
			db	0D0h, 005h,	'SHR    ',0
			db	0D2h, 005h,	'SHR    ',0
			
			db	0D0h, 007h,	'SAR    ',0
			db	0D2h, 007h,	'SAR    ',0
			
			db	0D0h, 000h,	'ROL    ',0
			db	0D2h, 000h,	'ROL    ',0
			
			db	0D0h, 001h,	'ROR    ',0
			db	0D2h, 001h,	'ROR    ',0
			
			db	0D0h, 002h,	'RCL    ',0
			db	0D2h, 002h,	'RCL    ',0
			
			db	0D0h, 003h,	'RCR    ',0
			db	0D2h, 003h,	'RCR    ',0
			
			db	08Eh, 000h,	'MOV2   ',0
			db	08Ch, 000h,	'MOV3   ',0

			db	000h, 000h
			
op2byteModRmImmediate	
			;opcode modNNNrm data1 data2(if w=1)
			;antro baito NNN papildomai identifikuoja komanda
			db	0C6h, 000h,	'MOV4   ',0
			db	080h, 000h,	'ADD    ',0
			db	080h, 002h,	'ADC    ',0
			db	080h, 005h,	'SUB    ',0
			db	080h, 003h,	'SBB    ',0
			db	080h, 007h,	'CMP    ',0
			db	080h, 004h,	'AND    ',0
			db	0F6h, 000h,	'TEST   ',0
			db	080h, 001h,	'OR     ',0
			db	080h, 006h,	'XOR    ',0
			db	000h, 000h
			
immediateAccumulator
			;opcode data1 data2(if w=1)
			db	004h, 'ADD  ', 0
			db	014h, 'ADC  ', 0			
			db	02Ch, 'SUB  ', 0
			db	01Ch, 'SSB  ', 0
			db	03Ch, 'CMP  ', 0
			db	024h, 'AND  ', 0
			db	0A8h, 'TEST ', 0
			db	00Ch, 'OR   ', 0
			db	034h, 'XOR  ', 0
			db	0
					
immediateToRegister
			;papildomas mov variantas: immediate to register
			;opcode data1 data2(jei w=1)
			;kur opcode 1011wreg
			db	0B0h, 'MOV5 ', 0
			db	0
memAccum
			;papildomas mov variantas: memory to accum arba accum to memAccum
			;opcode addrlow addrhigh
			;kur opcode 101000dw
			db	0A0h, 'MOV6 ', 0
			db	0
			
section .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
; In:CH - xxxxxxxw
;    CL - moxxxrmm
;    DL - disp low
;    DH - disp high
; Out: AL - kiek seknaciu baitu atspausdinti (disp reiksme)
; ch - zemiausia bitas - W
; cl - du auksciausi, mod reiksme, trys zemiausi rm reiksme
; test 0000.0001 1100.0011 - BX
; test 0000.0000 1100.0011 - BL
; test 0000.0001 0000.0001 - (BX)+(DI)+
procPrintModRM
	macBeginProc
	macPush
	jmp .begin
 section .data
	.txtWordPtr db " word ptr ",0
	.txtBytePtr db " byte ptr ",0	
	.fmt	  db "%s",0
	.fmt2	  db "+0x%x]",0	
	.fmt3	  db "]",0		
	.byte1	  db 0	
	.byte2	  db 0		
	.dispLow  db 0
	.dispHigh db 0	
	.mod	  db 0	
 section .text	
.begin 
	mov [.byte1],ch
	mov [.byte2],cl	
	mov [.dispLow], dl
	mov [.dispHigh], dh
	
	mov bh,cl
	shr bh,06
	and bh,03
	mov [.mod], bh
	cmp bh,11b
	je .rmIsRegister
	
	;jei ne registras, isvedam word ptr/byte ptr is paskaiciuojam disp teksto adresa
	;mov rcx, .fmt	
	;mov rdx, .txtWordPtr 	
	;test byte [.byte1],1
	;jnz .wordPtr
	;mov rdx, .txtBytePtr
 ;.wordPtr	
	;call printf
	
	mov rdx,dispNames
	mov bl, 7 ;disp names eilutes ilgis
	jmp .endMod
 .rmIsRegister
	test byte [.byte1],1
	jnz .word
	mov rdx,regNames8	
	mov bl, 3;reg eilutes ilgis
	jmp .endMod	
 .word
	mov rdx,regNames16
	mov bl, 3;reg eilutes ilgis	
 .endMod	
	;cia rax turi adresa i registru arba disp tekstu pradzia
	;cl pask 3 bitai saugo registro arba disp treksto numeris
	;bl saugo teksto ilgi ( registro arba disp teksto )
	;dauginam ta numeris is tekstu ilgio ir pridedam prie pradinio adreso
	xor rax,rax
	mov al, bl
	and cl,111b
	mul cl
	add rdx, rax
	
	mov rcx,.fmt
	call printf

	;isvedam dispalcement baitus
	;jei mod ne 00 ir ne 11
	xor rcx,rcx
	mov cl,byte [.mod]	
	;call procPrintRCX
	cmp cl,3
	je .endProc
	cmp cl,0
	je .noDisplacement	
	xor rdx,rdx
	mov dl,[.dispLow]
	cmp cl,1
	je .printDisp
	mov dh,[.dispHigh]
 .printDisp	
	mov rcx,.fmt2
	call printf	
	jmp .endProc
 .noDisplacement	
	mov rcx,.fmt3
	call printf	
	
 .endProc		
	macPop
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; In:CH - xxxxxxxw
;    CL - xxxxxreg
procPrintReg:	
	macBeginProc
	macPush
	; registro isvedimui naudojam ta pacia procPrintModRM
	; tik cl 2 auksciausius bitus nustatom 11, kad isvestu registru reiksmes
	or cl,11000000b
	call procPrintModRM
	macPop
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
; In:CH - xxxxxxdw
;    CL - moregrmm	
;	 DH - disp high
;	 DL - disp low 	 
procPrintModRmWithReg
	macBeginProc
	macPush	
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2	db 0
	.fmt	db '%s',0
	.dispLow 	db 0
	.dispHigh	db 0
	
 section .text		
 .begin	
	mov [.byte1],cl
	mov [.byte2],ch	
	mov [.dispLow], dl
	mov [.dispHigh], dh
	
	test ch,2
	jz .toReg	

	shr cl,3
	call procPrintReg

	call procPrintComma

	mov cx,[.byte1]
	mov dx,[.dispLow]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
	; In:CH - xxxxxxxw
	;    CL - moxxxrmm
	;    DL - disp low
	;    DH - disp high	
	call procPrintModRM
	
	jmp .toliau	
.toReg	
	mov cx,[.byte1]
	mov dx,[.dispLow]
	call procPrintModRM

	call procPrintComma	
	
	mov cl,[.byte1]
	mov ch,[.byte2]
	shr cl,3	
	call procPrintReg
	
	jmp .toliau	

.toliau
	macPop
	macEndProc
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintop1byte:
	macBeginProc
	macPushTiny
	xor rax, rax
	mov rbx,op1byte
	mov rsi,0
 .kartojam	
 	;macPrintRCX

	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
 
	cmp cl, [rbx+rsi]
	je .radom
	add rsi, 9
	jmp .kartojam
 .radom	
	inc rsi
 	lea rcx,[rbx+rsi]
	call puts
	mov rax, 1
	jmp .baigiam 
 .neradom_baigiam
	xor rax, rax
	jmp .baigiam
 .baigiam	
	macPopTiny
	macEndProc
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintop1byteReg:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.co 	db 0
	.fmt	db "%s",0
 section .text	
 .begin 
	mov rbx,op1byteReg
	mov rsi,0
	
	mov [.co],cl
	mov ch, [.co]
	and ch, 0F8h	
 .kartojam	
	cmp byte [rbx+rsi], 0
	je .neradom_baigiam 
 	cmp ch,byte [rbx+rsi]
	je .radom
	add rsi, 10
	jmp .kartojam
 .radom
	;spausdinam komanda
	inc rsi
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	;spausdinam registro reiksme
	mov al,[.co]
	and al,07h	
	mov ch,1 ;registras visada word tipo
	mov cl,al
	call procPrintReg
	
	call procNewLine
	
	mov rax, 1
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0	
	jmp .baigiam
 .baigiam
	macPopTiny
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;    CH - data1
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintOp1byte1data:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2 	db 0	
	.fmt	db "%s",0
	.fmt2   db "0x%x",10, 0
 section .text		
 .begin	
	;macPrintRCX
 
	mov [.byte1],cl
	mov [.byte2],ch
	
	mov rbx,op1byte1data
	mov rsi,0
 .kartojam	
	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
 
	cmp cl, [rbx+rsi]
	je .radom
	add rsi, 9
	jmp .kartojam
 .radom	
	inc rsi
 	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	xor rdx,rdx
 	mov dl,byte [.byte2]
	mov rcx,.fmt2
	call printf
		
	mov rax, 2
	jmp .baigiam 
 .neradom_baigiam
	xor rax, rax
	jmp .baigiam
 .baigiam
	macPopTiny
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;    CH - modregrm 
;	 DL - disp low 	
;	 DH - disp high
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintop2byteModRegRm:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2 	db 0	
	.fmt	db "%s",0	
	.dispLow 	db 0
	.dispHigh	db 0
 section .text
 .begin		
	mov [.byte1],cx
	mov [.dispLow], dx
 	mov rbx,op2byteModRegRm
	mov rsi,0
		
 .kartojam	
	cmp byte [rbx+rsi], 0FFh
	je .neradom_baigiam

	mov cl, [.byte1]
	and cl, 0FEh	
 	cmp cl,byte [rbx+rsi]
	je .radom
	add rsi, 9
	jmp .kartojam
 .radom
	;spausdinam komanda
	inc rsi
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
; In:CH - xxxxxxdw
;    CL - moregrmm	
;	 DH - disp high
;	 DL - disp low 	
	mov ch, [.byte1]
    mov cl, [.byte2]
	mov dl, [.dispLow]
	mov dh, [.dispHigh]		
	call procPrintModRmWithReg	
	call procNewLine

	mov rax, 2	
	;priudeda disp kieki prie rezultato
	xor cl,cl
	mov cl, [.byte2]
	shr cl, 6
	and cl,3
	cmp cl,3
	je .nepridedam
	add al,cl
 .nepridedam		
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0	
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;    CH - modrm byte
;	 DL - disp low 	
;	 DH - disp high
; Out:AL komandos ilgis baitais, jei 0 - neapazino	
procPrintop2byteModRm:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2 	db 0	
	.fmt	db "%s",0	
	.fmtHex	db "%x",0
	.dispLow 	db 0
	.dispHigh	db 0	
 section .text
 .begin		
	mov [.byte1],cx
	mov [.dispLow], dx
	
 	mov rbx,op2byteModRm
	mov rsi,0

 .kartojam	 
 	cmp word [rbx+rsi], 0
	je .neradom_baigiam 

 	mov cl, [.byte1]
	mov ch, [.byte2]
	shr ch,3
	and ch,7		
 	cmp cx,word [rbx+rsi]
	je .radom
	
	;gal logines funkcijos
	and cl, 0Feh
 	cmp cx,word [rbx+rsi]
	je .radom

	add rsi, 10
	jmp .kartojam
 .radom	
	;spausdinam komanda
	inc rsi
	inc rsi
	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	mov ch, [.byte1]
    mov cl, [.byte2]
	mov dl, [.dispLow]
	mov dh, [.dispHigh]		
	call procPrintModRM
			
	;jei buvo logines funkcijos
	xor rcx,rcx
	mov ch, byte [.byte1]
	and ch,0FCh
	cmp ch,0D0h
	jne .newLine
	call procPrintComma
	;cia logine funkcija, priklausomai nuo zemiausiu bitu reikia atspausdinti ,CL ,CX ,1
    mov cl, [.byte1]
	test cl, 2
	jz .spausDinkVieneta
	and ch,0
	mov cl,1 ;CL or CX
	call procPrintReg
 	jmp .newLine
 .spausDinkVieneta
 	mov rdx,1
	mov rcx,.fmtHex
	call printf
	jmp .newLine		
 .newLine		
	call procNewLine

	mov rax, 2

	;priudeda disp kieki prie rezultato
	xor cl,cl
	mov cl, [.byte2]
	shr cl, 6
	and cl,3
	cmp cl,3
	je .nepridedam
	add al,cl
 .nepridedam			
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0	
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;    CH - modrm byte
;	 DL - immediate data byte 1
;	 DH - immediate data byte 1
;    BL - immediate data byte 1
;    BH - immediate data byte 1
; Out:AL komandos ilgis baitais, jei 0 - neapazino	
procPrintop2byteModRmImmediate
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	 db 0
	.byte2 	 db 0	
	.fmt	 db "%s",0	
	.fmtHex	 db "%x",0
	.fmtData db ",%x",0	
	.data1 	 db 0
	.data2	 db 0	
	.data3 	 db 0
	.data4	 db 0	
	.mod	 db 0
	.baituKiekis db 0
 section .text
 .begin		
	mov [.byte1],cx
	shr ch,6
	and ch,7	
	mov [.mod],ch	
	mov rax, 2
	mov [.baituKiekis], al
	mov word [.data1], dx
	mov word [.data3], bx
	
 	mov rbx,op2byteModRmImmediate
	mov rsi,0

 .kartojam	 
 	mov cx, word [.byte1]
	;primas baitas pagal kuri atpazinsime
	and cl,0feh
	;antras  baitas pagal kuri atpazinsime	
	shr ch,3
	and ch,7	

	cmp word [rbx+rsi], 0
	je .neradom_baigiam 
	
 	cmp cx,word [rbx+rsi]
	je .radom
	add rsi, 10
	jmp .kartojam
 .radom	
	;spausdinam komanda
	inc rsi
	inc rsi
	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	mov ch, [.byte1]
    mov cl, [.byte2]
	mov dx, [.data1]
	call procPrintModRM
		
			
			
	;priudeda disp kieki prie rezultato
	xor rdx,rdx
	xor rcx,rcx
	xor rax,rax 
	xor rbx,rbx 	
	mov rbx,.data1			;tolienio data adresas priklausomai nuo to ar buvo displacement
	mov al,[.baituKiekis]
	xor cl,cl
	mov cl, [.mod]
	cmp cl,0
	je .displacementNebuvo
	cmp cl,3
	je .displacementNebuvo	
	add rbx, rcx	

	add al,cl				;viso baitu adresas
	mov [.baituKiekis],al
 .displacementNebuvo
	inc byte [.baituKiekis]	 
	;spausdinam immediate data 
	mov dl,[rbx]
	mov cl,[.byte1]
	test cl,1
	jz .data1baitas
	mov dh,[rbx+1]	
	inc byte [.baituKiekis]
 .data1baitas
	mov rcx,.fmtData
	call printf
	
	call procNewLine	 
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0	
	mov [.baituKiekis],al
	jmp .baigiam
 .baigiam
	;mov al, [.baituKiekis]
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;	 CH - disp low
;	 DL - disp high
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintImmediateAccumulator:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.fmt	db "%s",0	
	.fmtByte	db "AL,0x%x",0		
	.fmtWord	db "AX,0x%x",0			
	.dataLow 	db 0
	.dataHigh	db 0	
	.byte 		db 0
	.totalBytes db 0
 section .text
 .begin		
	mov [.dataLow],ch
	mov [.dataHigh],dl
	mov [.byte],cl
	
	mov rbx,immediateAccumulator
	mov rsi,0
 .kartojam	
	mov cl, [.byte]
	and cl,0FEh

	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
	
	cmp cl, [rbx+rsi]
	je .radom
	add rsi, 7 ;ilgis str
	jmp .kartojam
 .radom	
	inc rsi
	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf

	xor rdx,rdx
	mov dl, [.dataLow]
	mov al, 2
	mov [.totalBytes],al
	mov cl,[.byte]	
	test cl,1
	jnz .itsWord	
	mov rcx, .fmtByte	
	jmp .toliau	
 .itsWord	
	mov rcx, .fmtWord 
	mov dh, [.dataHigh]	
	mov al, 3
	mov [.totalBytes],al
 .toliau
	call printf
	call procNewLine
		
	jmp .baigiam 
 .neradom_baigiam
	mov al, 0
	mov [.totalBytes],al
	jmp .baigiam
 .baigiam
	xor rax,rax
	mov al, [.totalBytes]
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;	 CH - disp low 	
;	 DL - disp high
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintOp1byte2data
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2 	db 0	
	.byte3 	db 0		
	.fmt	db "%s",0
	.fmt2   db "0x%x",10, 0
 section .text		
 .begin	
	mov [.byte1],cl
	mov [.byte2],ch
	mov [.byte3],dl
	
	mov rbx,op1byte2data
	mov rsi,0
 .kartojam	
	mov cl,[.byte1]
	mov ch,[rbx+rsi]
	;macPrintRCX 
	
	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
 
	mov cl,[.byte1]
	cmp cl, [rbx+rsi]
	je .radom
	add rsi, 9
	jmp .kartojam
 .radom	
	inc rsi
 	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	xor rdx,rdx
 	mov dl,byte [.byte2]
 	mov dh,byte [.byte3]	
	mov rcx,.fmt2
	call printf
		
	mov rax, 3
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;	 DL - data byte 1 	
;	 DH - data byte 2
;	 BL - data byte 3	
;	 BH - data byte 4
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintOp1byte4data
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.byte1 	db 0
	.byte2 	db 0	
	.byte3 	db 0	
	.byte4 	db 0	
	.byte5 	db 0		
	.fmt	db "%s",0
	.fmt2   db "0x%x:0x%x",10, 0
 section .text		
 .begin	
	mov [.byte1],cl
	mov [.byte2],dl
	mov [.byte3],dh
	mov [.byte4],bl
	mov [.byte5],bh
	
	mov rbx,op1byte4data
	mov rsi,0
 .kartojam	
	cmp word [rbx+rsi], 0
	je .neradom_baigiam
 
	cmp cl, [rbx+rsi]
	je .radom
	add rsi, 9
	jmp .kartojam
 .radom	
	inc rsi
 	
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	xor rdx,rdx
	xor r8,r8
	mov rcx,.fmt2	
 	mov dx,word [.byte4]		
 	mov r8w,word [.byte2]
	call printf
		
	mov rax, 5
	jmp .baigiam 
 .neradom_baigiam
	mov rax, 0
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;	 DL - data 1
;	 DH - data 2 	
;papildomas mov variantas: immediate to register
;opcode data1 data2(jei w=1)
;kur opcode 1011wreg
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintImmediateToRegister:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.co 	db 0
	.fmt	db "%s",0
	.fmt2	db "%x",0	
	.data1  db 0
	.data2  db 0	
	.baituKiekis db 0
 section .text	
 .begin 
	mov [.data1],dx
	mov byte [.baituKiekis],2
	mov rbx,immediateToRegister
	mov rsi,0
	
	mov [.co],cl
	mov ch, [.co]
	and ch, 0F0h		
 .kartojam	
	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
 
 	cmp ch,byte [rbx+rsi]
	je .radom
	add rsi, 7
	jmp .kartojam
 .radom
	;spausdinam komanda
	inc rsi
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
	
	;spausdinam registro reiksme
	; In:CH - xxxxxxxw
	;    CL - xxxxxreg
	mov al,[.co]
	shr al,3
	mov ch,al
	mov al,[.co]	
	and al,7	
	mov cl,al
	call procPrintReg
	call procPrintComma
	
	xor rdx,rdx
	xor rax,rax
	mov al,[.co]	
	test al,8
	jz .vienasBaitas
	mov dh, [.data2] 
	inc byte [.baituKiekis]
 .vienasBaitas	
	mov dl, [.data1] 
	mov rcx, .fmt2
	call printf
	
	call procNewLine
	
	mov rax, [.baituKiekis]
	jmp .baigiam 
 .neradom_baigiam

	mov rax, 0	
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; In:CL - opcode
;	 DL - addr low
;	 DH - addr high
;papildomas mov variantas: memory to accum arba accum to memAccum
;opcode addrlow addrhigh
;kur opcode 101000dw
; Out:AL komandos ilgis baitais, jei 0 - neapazino
procPrintMemAccum:
	macBeginProc
	macPushTiny
	jmp .begin
 section .data
	.co 	db 0
	.fmt	db "%s",0
	.memToAcum	db "[0x%x],%s",0		
	.acumToMem	db "%s,[0x%x]",0			
	.ax		db "AX",0
	.al		db "AL",0	
	.data1  db 0
	.data2  db 0	
 section .text	
 .begin 
	mov [.data1],dx

	mov rbx,memAccum
	mov rsi,0
	
	mov [.co],cl
	mov ch, [.co]
	and ch, 0ACh		
 .kartojam	
	cmp byte [rbx+rsi], 0
	je .neradom_baigiam
 
 	cmp ch,byte [rbx+rsi]
	je .radom
	add rsi, 7
	jmp .kartojam
 .radom
	;spausdinam komanda
	inc rsi
 	lea rdx,[rbx+rsi]
	mov rcx,.fmt
	call printf
		
	xor rbx,rbx	
	xor rdx,rdx
	xor rax,rax
	xor r8,r8
	
	mov rbx,.al	
	mov al,[.co]	
	test al,1
	jz .vienasBaitas
	mov rbx,.ax
 .vienasBaitas	 
 		
	mov rcx, .acumToMem		
	mov rdx, rbx
	xor r8,r8
	mov r8w, word [.data1]
	test al,2
	jnz .Toliau
	mov rcx, .memToAcum
	xor rdx,rdx
	mov dx, word [.data1]
	mov r8, rbx	
 .Toliau
	call printf
		
	call procNewLine
	
	mov rax, 2
	jmp .baigiam 
 .neradom_baigiam

	mov rax, 0	
	jmp .baigiam
 .baigiam
	;call procPrintRAX
	macPopTiny
	macEndProc
	ret	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;disasambliuok;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Atlieka disasambliavima
; In: RCX - baitu kiekis
;	  RDX - buferio adresas		  
procDisasambliuok:
	macBeginProc
	macPush
	jmp .begin
 section .data		
	.fmtAdresas 	db "%08x ",0	
	.fmtBaitai  	db "%016I64x ",0	
	.fmtDB 			db "db %x ",10,0
	.adresas 		dq 0
	.indexas 		dq 0
	.visoSkaityti 	dq 0
 section .text	
 .begin
	mov [.adresas], rdx	
	mov [.visoSkaityti], rcx
	mov [.indexas], dword 0000
.read_byte	
	xor rdx,rdx	
	xor rcx,rcx
	
	;isvedam indekso numeri (adresas)
	mov rcx,.fmtAdresas
	mov rdx, [.indexas]
	macPrintf

	;isvedam 8 baitus
	mov rcx,.fmtBaitai
	mov rax, [.adresas]
	xor rdx,rdx
	mov rdx, [rax]
	macPrintf	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	xor rcx,rcx
	mov cl, byte [rbp]
	call procPrintop1byte
	;macPrintRAX
	cmp al,0
	jg .radom	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]	
	call procPrintop1byteReg
	;macPrintRAX
	cmp al,0
	jg .radom	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;    CH - 2nd byte
	; Out:AL - 2 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]			
	call procPrintOp1byte1data
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;    CH - 2nd byte
	;	 DL - disp low 		
	;	 DH - disp high
	; Out:AL - 2 jei radom, 0 jei ne	
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]			
	mov dl, byte [rbp+2]				
	mov dh, byte [rbp+3]					
	call procPrintop2byteModRegRm
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;    CH - 2nd byte
	;	 DL - disp low 		
	;	 DH - disp high
	; Out:AL - 2 jei radom, 0 jei ne	
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]			
	mov dl, byte [rbp+2]				
	mov dh, byte [rbp+3]						
	call procPrintop2byteModRm
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;    CH - mod rm byte
	;	 DL - data 1
	;	 DH - data 2
	;    BL - data 3
	;    BH - data 4
	; Out:AL - 2 jei radom, 0 jei ne	
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]			
	mov dl, byte [rbp+2]				
	mov dh, byte [rbp+3]							
	mov bl, byte [rbp+4]				
	mov bh, byte [rbp+5]								
	call procPrintop2byteModRmImmediate
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;	 CH - disp low
	;	 DL - disp high
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]				
	mov dl, byte [rbp+2]							
	call procPrintImmediateAccumulator
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;	 ch - disp low 	
	;	 dl - disp high	
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov ch, byte [rbp+1]				
	mov dl, byte [rbp+2]								
	call procPrintOp1byte2data
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;	 DL - disp low 		
	;	 DH - disp high
	;	 BL - seg low 			
	;	 BH - seg high
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov dl, byte [rbp+1]				
	mov dh, byte [rbp+2]								
	mov bl, byte [rbp+3]				
	mov bh, byte [rbp+4]									
	call procPrintOp1byte4data
	;macPrintRAX
	cmp al,0
	jg .radom	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;	 DL - data low
	;	 DH - data h 	
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov dl, byte [rbp+1]					
	mov dh, byte [rbp+2]									
	call procPrintImmediateToRegister
	;macPrintRAX
	cmp al,0
	jg .radom	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	; In:CL - byte
	;	 DL - data low
	;	 DH - data h 	
	; Out:AL - 1 jei radom, 0 jei ne
	mov rbp,[.adresas]
	mov cl, byte [rbp]		
	mov dl, byte [rbp+1]					
	mov dh, byte [rbp+2]										
	call procPrintMemAccum
	;macPrintRAX
	cmp al,0
	jg .radom	
	
	; ne neradome, isvedam "db [baito reiksme]"
	mov rbx,[.adresas]
	mov rcx, .fmtDB
	xor rdx,rdx
	mov dl, byte [rbx]	
	call printf

	; padidinam indeksa vientu ir vaziuojam toliau	
	; jei dar nevirsijom indekso
	inc  qword [.indexas]
	inc  qword [.adresas]
	xor rax,rax
	mov rcx, [.indexas]
	cmp rcx, [.visoSkaityti]
	jle .read_byte	
	jmp .pabaiga
	
 .radom
	;jei radom, ah`e turime operacijos baitu kieki
	;pridedam ji prie indekso ir adreso 
	;ir vaziuojam toliau jei dar nevirsijom indekso
	add [.indexas], rax
	add [.adresas], rax
	mov rcx, [.indexas]
	cmp rcx, [.visoSkaityti]
	jle .read_byte	
	
 .pabaiga	
	macPop
	macEndProc
	ret	

	;va ir viskas :)
	