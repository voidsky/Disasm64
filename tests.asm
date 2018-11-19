;testuojame procPrintModRM
testPrintModRM:
	macBeginProc
	
	; test 0000.0001 1100.0011 - BX
	; test 0000.0000 1100.0011 - BL
	; test 0000.0001 0000.0001 - (BX)+(DI)+

	;procPrintModRM testai
	mov cx,01c0h
	call procPrintModRM
	call procNewLine	
	mov cx,01c1h
	call procPrintModRM
	call procNewLine	
	mov cx,01c2h
	call procPrintModRM
	call procNewLine	
	mov cx,01c3h
	call procPrintModRM
	call procNewLine	
	mov cx,01c4h
	call procPrintModRM
	call procNewLine	
	mov cx,01c5h
	call procPrintModRM
	call procNewLine	
	mov cx,01c6h
	call procPrintModRM
	call procNewLine	
	mov cx,01c7h
	call procPrintModRM
	call procNewLine	

	mov cx,00c0h
	call procPrintModRM
	call procNewLine	
	mov cx,00c1h
	call procPrintModRM
	call procNewLine	
	mov cx,00c2h
	call procPrintModRM
	call procNewLine	
	mov cx,00c3h
	call procPrintModRM
	call procNewLine	
	mov cx,00c4h
	call procPrintModRM
	call procNewLine	
	mov cx,00c5h
	call procPrintModRM
	call procNewLine	
	mov cx,00c6h
	call procPrintModRM
	call procNewLine	
	mov cx,00c7h
	call procPrintModRM
	call procNewLine
	
	
	mov cx,0000h
	call procPrintModRM
	call procNewLine
	
	mov cx,0001h
	call procPrintModRM
	call procNewLine
	
	mov cx,0002h
	call procPrintModRM
	call procNewLine
	
	mov cx,0003h
	call procPrintModRM
	call procNewLine
	
	mov cx,0004h
	call procPrintModRM
	call procNewLine
	
	mov cx,0005h
	call procPrintModRM
	call procNewLine
	
	mov cx,0006h
	call procPrintModRM
	call procNewLine
	
	mov cx,0007h
	call procPrintModRM
	call procNewLine	
	macEndProc
	ret
	
;testuojame procPrintModRM
testPrintOp1Byte:
	macBeginProc
	mov cl, 0D7h
	call procPrintOps1Byte
	mov cl, 0CBh
	call procPrintOps1Byte	
	macEndProc
	ret	

testPrintOp1ByteReg:
	macBeginProc
	macPush
	mov cl, 060h
	call procPrintOps1ByteReg	
	mov cl, 068h
	call procPrintOps1ByteReg		
	mov cl, 090h
	call procPrintOps1ByteReg	
	mov cl, 040h
	call procPrintOps1ByteReg		
	mov cl, 048h
	call procPrintOps1ByteReg				
	mov cl, 047h
	call procPrintOps1ByteReg			
	mov cl, 04Ah
	call procPrintOps1ByteReg			
	
	macPop
	macEndProc			
	ret	
	
testPrintOp1byte1data:	
	macBeginProc
	macPush
	;jo 0x12
	mov cl, 070h
	mov ch, 012h
	call procPrintOp1byte1data	

	;jo 0x12
	mov cl, 0E0h
	mov ch, 034h
	call procPrintOp1byte1data	
	
	; test 2 data 
	mov cl,0e8h
	mov dx,01234h
	call procPrintOp1byte2data
	
	mov cl,0cah
	mov dx,01234h
	call procPrintOp1byte2data

	;test 4 data 
	mov cl,09Ah
	mov dx,01234h
	mov bx,05678h
	call procPrintOp1byte4data
	
	macPop
	macEndProc			
	ret	

testPrintOps2byteModRegRm:	
	macBeginProc
	macPush
	;jo 0x12
	mov cl, 10001000b ;
	mov ch, 11001000b ;
	mov edx, 1234h
	
	call procPrintOps2byteModRegRm

	mov cl, 10001011b ;mov
	mov ch, 00111010b ;
	mov edx, 1234h	
	call procPrintOps2byteModRegRm

	mov cl, 10001001b ;mov
	mov ch, 00111010b ;
	mov edx, 1234h	
	call procPrintOps2byteModRegRm

	mov cl, 10001001b ;mov
	mov ch, 01111010b ;
	mov edx, 1234h
	call procPrintOps2byteModRegRm	

	mov cl, 10001001b ;mov
	mov ch, 10111010b ;
	mov edx, 1234h
	call procPrintOps2byteModRegRm	
	
	macPop
	macEndProc			
	ret	

testPrintOps2byteModRm
	macBeginProc
	macPush

	mov ecx, 0f0f7h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	mov ecx, 0f0f6h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	mov ecx, 0f1f6h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	mov ecx, 082ffh
	mov edx, 1234h	
	call procPrintOps2byteModRm

	mov ecx, 0B8f7h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	;shl al,cl
	mov ecx, 0E0D2h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	;shl al,1
	mov ecx, 0E0D0h
	mov edx, 1234h	
	call procPrintOps2byteModRm

	;rcr byte ptr [bx+si+10],cl
	mov ecx, 058D2h
	mov edx, 0010h	
	call procPrintOps2byteModRm	

	;rcr byte ptr [bx+si+1234],cl
	mov ecx, 098D0h
	mov edx, 1234h	
	call procPrintOps2byteModRm	
	
	macPop
	macEndProc			
	ret	

testProcPrintImmediateAccumulator	
	macBeginProc
	macPush
		
	mov ecx, 002dh
	mov edx, 1234h	
	call procPrintImmediateAccumulator	

	mov ecx, 003ch
	mov edx, 0012h	
	call procPrintImmediateAccumulator	
	
	
	mov ecx, 012BFh
	mov edx, 03412h	
	call procPrintImmediateToRegister

	mov ecx, 034B7h
	mov edx, 03412h	
	call procPrintImmediateToRegister
	
	
	macPop
	macEndProc			
	ret	
	
testProcPrintOps2byteModRmImmediate	
	macBeginProc
	macPush
		
	;ADC    [BX + SI+0x3412],7856	
	mov cx, 08081h
	mov dx, 3412h	
	mov bx, 7856h		
	call procPrintOps2byteModRmImmediate		

		
	;MOV    AX,3412
	mov cx, 0c0c7h
	mov dx, 3412h	
	mov bx, 7856h		
	call procPrintOps2byteModRmImmediate	
	
	macPop
	macEndProc			
	ret	

testProcPrintMemAccum	
	macBeginProc
	macPush
		
	;mov ax,[3412]	
	mov cl, 0A1h
	mov dx, 03412h	
	call procPrintMemAccum			

		
	;mov [3412],ax
	mov cl, 0A3h
	mov dx, 03412h	
	call procPrintMemAccum	
	
	macPop
	macEndProc			
	ret	
