%define crlf  0x0D, 0x0A

%macro macPush 0
	push rax
	push rbx
	push rcx
	push rdx
	push r8
%endmacro

%macro macPop 0
	pop r8
	pop rdx
	pop rcx
	pop rbx
	pop rax
%endmacro

%macro macPushTiny 0
	push rbx
	push rcx
	push rdx
	push r8
%endmacro

%macro macPopTiny 0
	pop r8
	pop rdx
	pop rcx
	pop rbx
%endmacro

%macro macBeginProc 0
	push rbp
	mov rbp, rsp
	sub rsp, 20h
%endmacro

%macro macEndProc 0
	add rsp, 20h
	pop rbp
%endmacro

%macro macPrintf 0
	macPush
	call printf
	macPop
%endmacro

%macro macPrintRCX 0
	macPush
	call procPrintRCX
	macPop
%endmacro