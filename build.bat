yasm64 -f win64 -l disasm64.lst disasm64.asm
gcc -m64 -o disasm64 disasm64.obj
rem disasm64.exe t4-adc.com