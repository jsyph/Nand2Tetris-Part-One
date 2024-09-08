// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// add the value in R1 to itself R0 times and then R0 -= 1
    // init R2 to 0
    @R2
    M=0
    
    // check if R0 or R1 is 0
    @R0
    D=M
    @END
    D;JEQ

    @R1
    D=M
    @END
    D;JEQ

    @R1
    D=M

    @val
    M=D

    @R0
    M=M-1
(LOOP)
    @val
    D=M

    @R1
    M=D+M

    @R0
    M=M-1
    D=M

    @LOOP
    D;JGT
// (END LOOP)

    @R1
    D=M

    @R2
    M=D

(END)
    @END
    0;JMP

