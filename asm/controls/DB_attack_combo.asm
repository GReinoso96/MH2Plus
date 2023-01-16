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
    andi        v1, BtnTriangle

.org 0x006b7854 ; From Demon Spin Rewrite
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle
    beqz        v1, 0x006b78d8 ; Check Roll
    nop
    lhu         v1, InputFace(s1)
    andi        at, v1, BtnTriangle
    beqz        at, @@DoSpin
    li          a1, 0x1
    sb          a1, 0x6(s1)
    lhu         a0, 0x380(s1)
    andi        v1, a0, 0x800
    beqz        v1, 0x006b78a8 ; Check Right
    nop
    b           0x006b7884 ; Check Roll
    sw          a1, 0x8(s1)
@@DoSpin:
    li          v1, 0x6
    b           0x006b78d8 ; Normalize
    sb          v1, 0x6(s1)

.org 0x006b7ed0 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle