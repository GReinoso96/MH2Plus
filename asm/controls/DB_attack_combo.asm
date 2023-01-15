.org 0x006b6a38 ; Combo Attacks
    lhu         v0, InputFace(s1)
    andi        at, v0, BtnTriangleCircle
    beqz        at, 0x006b6ab8 ; Normalize
    nop
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@OnlyTriangle
    li          v0, 0x4
    b           0x006b6ab8 ; Normalize
    sb          v0, 0x6(s1)
@@OnlyTriangle:
    li          v0, 0x1
    b           0x006b6ab8 ; Normalize
    sb          v0, 0x6(s1)
@@CheckCircle:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogLeft
    beqz        v0, @@DoRight
    li          v0, 0x3
    b           0x006b6ab8 ; Normalize
    sb          v0, 0x6(s1)
@@DoRight:
    li          v0, 0x2
    b           0x006b6ab8 ; Normalize
    sb          v0, 0x6(s1)

.org 0x006b710c ; From Lunge
    lhu         v0, InputFace(s0)
    andi        v0, BtnTriangle
    beqz        v0, 0x006b7148 ; Normalize
    nop
    li          v0, 0x1
    sb          v0, 0x6(s0)
    b           0x006b7148 ; Normalize
    nop

.org 0x006b72fc ; From Roll At
    lhu         v0, InputFace(s0)
    andi        at, v0, BtnTriangleCircle
    beqz        at, 0x006b7368 ; Normalize
    nop
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    li          v0, 0x1
    b           0x006b7368 ; Normalize
    sb          v0, 0x6(s0)
@@CheckCircle:
    lhu         v0, InputLAnalog(s0)
    andi        v0, LAnalogLeft
    beqz        v0, @@DoRight
    li          v0, 0x3
    b           0x006b7368 ; Normalize
    sb          v0, 0x6(s0)
@@DoRight:
    li          v0, 0x2
    b           0x006b7368 ; Normalize
    sb          v0, 0x6(s0)

.org 0x006b75ac ; From Demon Initiation
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle

.org 0x006b7854 ; From Demon Spin
    lhu         v0, InputFace(s1)
    andi        at, v0, BtnTriangleCircle
    beqz        at, 0x006b78d8 ; Normalize
    nop
    andi        at, v0, BtnTriangle
    beqz        at, 0x006b7884 ; Check Roll
    nop
    andi        at, v0, BtnCircle
    beqz        at, 0x006b7884 ; Check Roll
    li          v1, 0x6
    b           0x006b7884 ; Check Roll
    sb          v1, 0x6(s1)

.org 0x006b7ed0 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle