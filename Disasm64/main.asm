extern ExitProcess: PROC
extern WriteInt64: PROC
extern ReadString: PROC
extern WriteString: PROC
extern WriteHex64: PROC
extern Crlf: PROC

extern SkaitykFaila: PROC
extern IrasykFaila: PROC
extern Dizasambliuok: PROC

.CODE
main PROC
	mov rdx, offset WellcomeText
	call WriteString

	call SkaitykFaila

	call Dizasambliuok

;	call IrasykFaila

	call ReadString
	call ExitProcess
main ENDP

SumTwo PROC
	inc rax
	ret
SumTwo ENDP

.DATA
WellcomeText byte '8088 Disassembler V0.1',13,10,0
END
