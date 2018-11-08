INCLUDE Win64.inc	; function prototypes for this library
extern WriteString: PROC

.CODE
 SkaitykFaila PROC 
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp

	;
	; nuskaitome faila i buferi
	;
	mov rcx, offset inputFilename
	mov rdx, GENERIC_READ
	mov r8, DO_NOT_SHARE
	xor r9, r9 
	push 0
	push FILE_ATTRIBUTE_NORMAL
	push OPEN_EXISTING
	sub rsp, 32
	call CreateFile
	mov inputFileHandle,eax			; save file handle

	;skaitome N bitu is input failo
	mov ecx, inputFileHandle		; input handle
	mov rdx, offset fileBuffer		; ptr to fileBuffer
	mov r8, bufSize		; num bytes to read
	mov r9, offset bytesWeHaveRead	; bytes actually read
	push 0				; ptr to asynchronous info
	sub rsp, 32
	call ReadFile 		; read fileBuffer from input file

	mov rdx, offset fileBuffer
	add rdx, bytesWeHaveRead
	mov lastByteAddress, rdx

	mov ecx, inputFileHandle
	call CloseHandle

	mov rsp, rbp
	add		rsp,28h				; restore stack 

	ret
SkaitykFaila ENDP


IrasykFaila PROC 
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp	
	;
	; rasome faila is buferio 
	;
	mov ecx, offset outputFilename
	mov rdx, GENERIC_WRITE
	mov r8, DO_NOT_SHARE
	xor r9, r9 
	push 0
	push FILE_ATTRIBUTE_NORMAL
	push CREATE_ALWAYS
	sub rsp, 32
	call CreateFile
	mov outputFileHandle,eax			; save file handle

	;rasome N bitu i output failo
	mov ecx, outputFileHandle		; file handle
	mov rdx, offset fileBuffer		; fileBuffer pointer
	mov r8, bufSize			; number of bytes to write
	mov r9, offset bytesWeHaveRead	; number of bytes written
	push    0				; overlapped execution flag
	sub rsp, 32
	call WriteFile		; write text to file

	mov ecx, outputFileHandle
	call CloseHandle

	mov rsp, rbp
	add		rsp,28h				; restore stack 

	ret
IrasykFaila ENDP

Dizasambliuok PROC
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp	

	mov rcx, offset fileBuffer

SKAITYK_SEKANTI:
	mov [baitoAdresas], rcx

	mov rax, rcx
	
	call DizasambliuokKomanda

	inc rcx
	cmp rcx, [lastByteAddress]
	jne SKAITYK_SEKANTI

	mov rsp, rbp
	add		rsp,28h				; restore stack 

	ret 
Dizasambliuok ENDP


DizasambliuokKomanda PROC
	push rax
	push rbx
	push rcx


	mov bl,[rax]

	and bl, 088h
	cmp bl, 88h
	jne gal_mov2
	call DekoduokMOV
gal_mov2:

	pop rcx
	pop rbx
	pop rax
	ret
DizasambliuokKomanda ENDP

DekoduokMOV PROC
	push rax
	push rbx
	push rcx

	mov rdx, offset opMOV
	call WriteString

	mov rax, baitoAdresas


	pop rcx
	pop rbx
	pop rax
	ret
DekoduokMOV ENDP

DekoduokRM PROC
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp	
	
	;ch - w
	;cl - mod
	;dl - rm
	;r8 - 8 bytes after command
	cmp cl, 11b
	jne gal_displacement00
	call PrintRegisterByCode
	jmp end_decode_rm
gal_displacement00:
	cmp cl, 00b
	jne gal_displacement01
	call PrintEAddrByCode
	jmp end_decode_rm
gal_displacement01:
	cmp cl, 01b
	jne gal_displacement11
	call PrintEAddrByCode
	;print addr word
	jmp end_decode_rm
gal_displacement11:
	call PrintEAddrByCode
	;print addr double word
end_decode_rm:
	mov rsp, rbp
	add		rsp,28h				; restore stack 
DekoduokRM ENDP

PrintRegisterByCode PROC
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp	

	;ch - w
	;cl - mod
	;dl - rm
	;r8 - 8 bytes after command
	cmp ch,1
	jne byte_instruction
	mov r10, offset regAX
	jmp print_reg
byte_instruction:
	mov r10, offset regAL
print_reg:

	xor rbx, rbx
	mov al,dl
	mov bl,3
	mul bl
	mov rax, r10
	add rax, rbx

	mov rdx,rax
	call WriteString

	mov rsp, rbp
	add		rsp,28h				; restore stack 	
PrintRegisterByCode ENDP

PrintEAddrByCode PROC
	sub		rsp,28h				; set aside shadow space + align stack pointer
	mov rbp,rsp	

	;ch - w
	;cl - mod
	;dl - rm
	;r8 - 8 bytes after command
	xor rbx, rbx
	mov al,dl
	mov bl,10
	mul bl

	mov rax, offset eaddr1
	add rax, rbx
	mov rdx,rax
	call WriteString

	mov rsp, rbp
	add		rsp,28h				; restore stack 	
PrintEAddrByCode ENDP

.DATA
fileBuffer QWORD 100000 DUP(?)
bufSize QWORD ($-fileBuffer)
errMsg BYTE "Cannot create file",0dh,0ah,0

inputFilename     BYTE "DISASM1.BIN",0
outputFilename     BYTE "output.txt",0

inputFileHandle   DWORD ?
outputFileHandle   DWORD ?

bytesWeHaveRead QWORD ?    	; number of bytes read/written
lastByteAddress QWORD ?

baitoAdresas QWORD ?

regAX BYTE "AX",0
regCX BYTE "CX",0
regDX BYTE "DX",0
regBX BYTE "BX",0
regSP BYTE "SP",0
regBP BYTE "BP",0
regSI BYTE "SI",0
regDI BYTE "DI",0

regAL BYTE "AL",0
regCL BYTE "CL",0
regDL BYTE "DL",0
regBL BYTE "BL",0
regAH BYTE "AH",0
regCH BYTE "CH",0
regDH BYTE "DH",0
regBH BYTE "BH",0

regES BYTE "ES",0
regCS BYTE "CS",0
regSS BYTE "SS",0
regDS BYTE "DS",0

eaddr1 BYTE "(BX)+(SI)",0
eaddr2 BYTE "(BX)+(DI)",0
eaddr3 BYTE "(BP)+(SI)",0
eaddr4 BYTE "(BP)+(DI)",0
eaddr5 BYTE "(SI)     ",0
eaddr6 BYTE "(DI)     ",0
eaddr7 BYTE "(BP)     ",0
eaddr8 BYTE "(BX)     ",0


opMOV BYTE "MOV ",0

END