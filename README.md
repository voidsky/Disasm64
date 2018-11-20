# Disasm64
8086 disassembly application. Project done during computer architecture course.

Project is done using nasm(yasm) 64 bit assembly and some c functions to handle input/output.

I have chosen such technolgies because I was curious about few topis:
- Learning about asm 64 bit programming 
- Compiling assembly executable for windows 64 platform. 
    During the comp architecture course we were doing assembly programming for a ms dos using dosbox. 
    I was interested in making some executable code on a windows 64 platform.
- Linking assembly code to some higher lever programming language library. 
    During the comp architecture course we were using dos api (int) to handle input, output and some other manipulations.
    For modern platform you could use windows api function calls or libraries from higher level programming languages. 
    I have chosen to use c and use some basic c input output functions.
- Understandig assembly procedure calls on 64 platform and differences between win 64 calls and unix/posix 64 calls.
- Dissassembling some simple c applications and exploriing how assemblu code is constructed using c compile.
    To understand how some c function calls are made I have used some super simple c programs that I decompiled using gdb.
    
To build this project on windows 64 you will need:
- NASM or YASM ( add its path to PATH variable )
- mingw-w64 (i have used x86_64-8.1.0-posix-seh-rt_v6-rev0 , https://mingw-w64.org/doku.php/download/mingw-builds )

Build script is build.bat
Some tests are in test.bat

Basicly, disasm64.exe take file name as argument and outputs 8086 assembly code.


    
    
