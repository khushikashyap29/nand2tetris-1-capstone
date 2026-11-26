
// Box.asm
// Roll Number: 2501010082
// K = 82
// Starting row = 82
// Height = 20 rows
// Width = 48 pixels (3 words)

(LOOP)
    // Check whether any key is pressed
    @KBD
    D=M
    @BLACK
    D;JNE

(WHITE)
    @R15
    M=0
    @DRAW
    0;JMP

(BLACK)
    @R15
    M=-1

(DRAW)
    // Starting address = SCREEN + 32*82 = 19008
    @19008
    D=A
    @R13
    M=D

    // Total 20 rows
    @20
    D=A
    @R14
    M=D

(ROW)
    // First word
    @R15
    D=M
    @R13
    A=M
    M=D

    @R13
    M=M+1

    // Second word
    @R15
    D=M
    @R13
    A=M
    M=D

    @R13
    M=M+1

    // Third word
    @R15
    D=M
    @R13
    A=M
    M=D

    // Move to the next screen row
    @29
    D=A
    @R13
    M=D+M

    // Decrease row counter
    @R14
    M=M-1
    D=M
    @ROW
    D;JGT

    @LOOP
    0;JMP
