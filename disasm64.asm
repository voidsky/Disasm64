;Kompiliavimui ir linkinimui su C bibliotekomis
;naudajame nasm (yasm) ir mingw-w64 aplinka:
;yasm64 -f win64 -l disasm64.lst disasm64.asm
;gcc -m64 -o disasm64 disasm64.obj
;(arba naudoti disbuild.bat)

;Dekompiliavimui/patikrinimui naudojame
;gdb -q hello_64.exe
;disassemble main
;x/[ilgis][formatas c/b/] [adresas]
;x/20c 0x404000

;Pastaba:
;sitame kode naudojama win64 calling conventions:
;The Microsoft x64 calling convention[14][15] is followed on Windows and pre-boot UEFI (for long mode on x86-64). It uses registers RCX, RDX, R8, R9 ;for the first four integer or pointer arguments (in that order), and XMM0, XMM1, XMM2, XMM3 are used for floating point arguments. Additional ;arguments are pushed onto the stack (right to left). Integer return values (similar to x86) are returned in RAX if 64 bits or less. Floating point ;return values are returned in XMM0. Parameters less than 64 bits long are not zero extended; the high bits are not zeroed.

;Keletas ASM->C pavyzdziu ( demesio, pavyzdziuose naudojama ne Win64, bet  System V AMD64 ABI calling convention`as t.y., rdi - rsi - rdx - rcx - r8 - r9 - rest on stack)
;https://www.csee.umbc.edu/portal/help/nasm/sample.shtml

%include 'nasmmac.inc'          ; Pagalbiniai makrosai

section .data		; Data section, initialized variables
	argCount: 		db 0, 0
		
	fileNameAddr: 	dq 0
	fileMode: 		db "r",0
	filePointer:	dq 0
	fileSize: 		dq 0
	fileChar:		dw 0

	txtFileName:		db "Pradinis failas: %s",10,0	
	txtFileSize:		db "Failo dydis: %d (baitu)",10,0	
	txtFileNotFound:	db "Nepavyko atidaryti failo",0
	txtEndOfFile: 		db "Failo skaitymas baigtas",0 

	addrBuff			dq 0
		
section .text   	; Code section.
       
        global main			; the standard gcc entry point
main:						; the program label for the entry point
	push rbp
	mov rbp, rsp
	sub rsp, 20h
	
	;int main(int argc, char *argv[]) { /* ... */ }
	;argc  - bus perduotas per rcx
	;[rdx] - saugos nuoroda i pirma (0) argumenta, sekantis bus [rdx+8] ir t.t.	
	;issisaugome argumentu kieki (turime ecx`e)
	add   ecx, '0'   ; paverciam i ascii numeri
	mov	[argCount], cl 	
	;issaugom pirmo argumento adresa
	mov rax, rdx
	add rax, 08
	mov rdx,[rax]
	mov [fileNameAddr], rdx	
	
	call procSkaitykFaila
	mov rax, [filePointer]
	cmp rax, 0
	je .the_end

	;isvedame failo turini	
	;mov rcx, [fileSize]	
	;mov rdx, [addrBuff]
	;call procPrintBuffer
	
	mov rcx, [fileSize]	
	mov rdx, [addrBuff]	
	call procDisasambliuok
	
	;zemiau proceduros naudojamos dizasamblerio derinimui
	;mov rcx, 00A0h
	;mov rdx, 0070h
	;call procGetMaskedValue
	;call procPrintRAX	
	;call testPrintModRM
	;mov ch,0
	;mov cl,0
	;call procPrintReg
	;call procPrintReg
	;call testPrintOp1Byte
	;call testPrintOp1ByteReg
	;call testPrintOp1byte1data
	;call testPrintOps2byteModRegRm
	;call testPrintOps2byteModRm
	;call testProcPrintImmediateAccumulator
	;call testProcPrintOps2byteModRmImmediate
	;call testProcPrintMemAccum
	
	jmp .the_end
				
.the_end:
	
	mov	eax,0		; normal, no error, return value
	add rsp, 20h
	pop rbp
	ret			; return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
; Failo skaitymas i atminti
; Atminties adresas issaugomas [addrBuff]
; Failo dydis [fileSize]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
procSkaitykFaila:
	push rbp
	mov rbp, rsp
	sub rsp, 20h
	
	;isvedam failo pavadinima
	mov	rcx,txtFileName
	mov	rdx,[fileNameAddr]
    call printf
	
	;gauname failo dydi ir issaogome ji
	xor rax,rax	
	mov rcx, [fileNameAddr]
	call procFailoDydis
	mov [fileSize], rax
	;isvedam failo dydi
	mov	rcx,txtFileSize
	mov	rdx,[fileSize]
    call printf
	
	;rezervuojam reikiama atminties keiki	
	mov rcx, [fileSize]
	call malloc
	mov [addrBuff],rax
	;call procPrintRAX

	;atidarom / nuskaitom / uzdarom faila
	mov rcx, [fileNameAddr]
	mov rdx, fileMode
	call fopen	
	mov [filePointer], rax	
	cmp rax, 0
	je .file_not_found
		
	mov rcx, [addrBuff]
	mov rdx, [fileSize]
	mov r8, 1
	mov r9, [filePointer]
	call fread
	;call procPrintRAX

	mov rcx,  [filePointer]
	call fclose
	
	jmp .the_end
 .file_not_found	
	mov	rcx,txtFileNotFound
    call puts		; Call C function	
	jmp .the_end
 .the_end
	mov	eax,0		; normal, no error, return value
	add rsp, 20h
	pop rbp 
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%include 'mnemonics.asm'
%include 'nasmlibc.asm'
;%include 'tests.asm'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	