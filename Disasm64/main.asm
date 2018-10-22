extern ExitProcess: PROC
extern WriteInt64: PROC
extern ReadString: PROC
extern WriteString: PROC
extern WriteHex64: PROC
extern Crlf: PROC

.CODE
main PROC
	mov rax,1
	inc rax
	call SumTwo

	mov rdx, offset WellcomeText
	call WriteString
	call ReadString
	call ExitProcess
main ENDP

SumTwo PROC
	inc rax
	ret
SumTwo ENDP

.DATA
WellcomeText byte '8088 Disassembler V0.1',0
END
