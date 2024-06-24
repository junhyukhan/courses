// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
@i
M=0
@temp
M=0
(LISTEN)
    @i
    D=M
    @SCREEN
    A=D+A
    M=0


    @i
    D=M

    @DECREMENT
    D;JGT
    @SKIPDEC
    D;JEQ
    
    (DECREMENT)
        @i
        M=M-1
    (SKIPDEC)

    @KBD
    D=M // D=MEM[KBD]
    @LISTEN
    D;JEQ
(LOOP)
    @i
    D=M
    @SCREEN
    A=D+A // MEM[SCREEN+1]
    M=-1 // 16 bits becomes black
    
    @i
    D=M
    @8191
    D=D-A // D=D-8191, A is used because I actually want the constant 24575
    @INCREMENT
    D;JLT
    @SKIP
    D;JEQ

    (INCREMENT)
        @i
        M=M+1
    (SKIPINC)

    // Check if there is no input
    @KBD
    D=M
    @LISTEN
    D;JEQ
    
    @LOOP
    0;JMP
