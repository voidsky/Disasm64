; Deklaruojame naudojamas C funcijas
extern puts		
extern printf	
extern gets		

extern fopen		
extern fclose
extern fseek
extern ftell
extern fread

extern 	putchar
extern  malloc
	
section .text   	; Code section.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Spausdina naujos eilutes simb. kompinacija
procNewLine:
	macBeginProc
	macPush
	
	jmp .begin   
 section .data	
   .localData	db 0x00
 section .text   
   
   .begin
	mov rcx, .localData
	call puts
   
	macPop
	macEndProc
	ret			; return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Spausdina ','
procPrintComma:
	macBeginProc
	macPush
	
	jmp .begin   
 section .data	
   .localData	db ', ',0x00
 section .text   
   
   .begin
	mov rcx, .localData
	call printf
   
	macPop
	macEndProc
	ret			; return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Int: RCX - [failo vardas]
; Out: RAX - failo dydis
procFailoDydis:
	macBeginProc
	jmp .begin   
 section .data
	.erNotFound db "[procFailoDydis] failas nerastas.",0	
	.erSeekError db "Seek klaida.",0		
	.fm db "r",0
	.fp dq 0	
	.fs dq 0
 section .text  
 .begin
	mov rdx, .fm
 	call fopen
	mov [.fp], rax	
	cmp rax, 0
	je .noFile
	
	mov rcx, [.fp]
	mov edx, 0
	mov r8, 2 ;SEEK_END
	call fseek
	or rax,rax
	jnz .seekError
	
	mov rcx, [.fp]	
	call ftell
	mov [.fs], rax
	
	mov rcx, [.fp]	
	call fclose 
	jmp .theEnd
 .noFile
	mov	rcx,.erNotFound
    call puts		
	jmp .theEnd	
 .seekError
	mov	rcx,.erSeekError
    call puts		
	jmp .theEnd	 
 .theEnd
	mov rax, [.fs]
	
	macEndProc
	ret			; return
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina registro reiksme - debugui
procPrintRAX:
	macBeginProc

	jmp .begin   
 section .data
	.fmt db "RAX-0x%016llx",10, 0
 section .text
 .begin	
	mov	rcx,.fmt
	mov	rdx,rax
    call printf
	
	macEndProc
	ret	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina registro reiksme - debugui
procPrintRCX:
	macBeginProc
	jmp .begin   
 section .data	
	.fmt db "RCX-0x%016llx",10, 0
 section .text
 .begin
	mov	rdx,rcx
	mov	rcx,.fmt	
    call printf
	macEndProc
	ret	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina registro reiksme - debugui
procPrintRDX:
	macBeginProc
	jmp .begin   
 section .data		
	.fmt db "RDX-0x%016llx",10, 0
 section .text	
 .begin 
	mov rax,rdx
	mov	rcx,.fmt
	mov	rdx,rax
    call printf

	macEndProc
	ret	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina atmintioes buferio turini
; In: RCX - baitu kiekis
;	  RDX - buferio adresas		  
procPrintBufferBytes:
	macBeginProc
	macPush
	jmp .begin
 section .data		
	.fmt db "%x ",0
 section .text	
 .begin
	mov rsi, rdx	
	cld
 .read_byte	
	lodsb	
	mov rbx, rcx
	mov rcx, rax

	mov	rcx,.fmt
	mov	rdx,rax
    call printf
	
	mov rcx, rbx
	loop .read_byte
	
	macPop
	macEndProc
	ret		
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina atmintioes buferio turini
; In: RCX - baitu kiekis
;	  RDX - buferio adresas		  
procPrintBufferChars:
	macBeginProc
	macPush
	jmp .begin
 .begin
	mov rsi, rdx	
	cld
 .read_byte
	lodsb	
	mov rbx, rcx
	mov rcx, rax

	mov rcx, rax
	call putchar	
	
	mov rcx, rbx
	loop .read_byte
	
	macPop
	macEndProc
	ret		
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina atmintioes buferio turini
; In: RCX - baitu kiekis
;	  RDX - buferio adresas		  
procPrintBuffer:
	macBeginProc
	push rcx
	push rdx
	call procPrintBufferBytes
	pop rdx
	pop rcx
	call procPrintBufferChars	
	macEndProc
	ret		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
; Spausdina atmintioes buferio turini
; In: RCX - reiksme
;	  RDX - maske
; Out: Bitu reiksme pritaikius maske
; pvz rcx 1010 0000
;     rdx 0111 0000
; rezultatas bus 0010 
procGetMaskedValue:
	macBeginProc
	mov rbx, rcx
	and rbx, rdx ;rbx saugo reiksme pritaikius maske
	mov rcx, 0
 .suk_dar	
	clc
	inc rcx
	rcr rdx, 1
	jnc .suk_dar
	dec rcx
	shr rbx,cl
	mov rax,rbx
	macEndProc
	ret		
	