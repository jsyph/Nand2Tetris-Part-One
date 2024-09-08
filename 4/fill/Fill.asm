// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(MAIN)
    @KBD
    D=M
    
    @SET_BLACK
    D;JNE

    @SET_WHITE
    D;JEQ

    @MAIN
    0;JMP

(SET_WHITE)
    @SCREEN
    D=A
    @addr
    M=D
    
    @8191
    D=A
    @n
    M=D

    (SET_WHITE_LOOP)
        @addr
        A=M
        M=0

        @addr
        M=M+1

        @n
        M=M-1
        D=M
        @SET_WHITE_LOOP
        D;JGE
    
    @MAIN
    0;JMP


(SET_BLACK)
    @SCREEN
    D=A
    @addr
    M=D
    
    @8191
    D=A
    @n
    M=D

    (SET_BLACK_LOOP)
        @addr
        A=M
        M=-1

        @addr
        M=M+1

        @n
        M=M-1
        D=M
        @SET_BLACK_LOOP
        D;JGE
    
    @MAIN
    0;JMP

