.org 0x006b5968 ; Combo Input Check
    lhu         v0, InputFace(s1)
    andi        at, v0, BtnTriangleCircle
    beqz        at, 0x006b59d8 ; Normalize
    nop
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    li          v0, 0x1
    b           0x006b59d8 ; Normalize
    sb          v0, 0x6(s1)
@@CheckCircle:
    andi        at, v0, BtnCircle
    beqz        at, 0x006b59d8 ; Normalize
    nop
    li          v0, 0x2
    sb          v0, 0x6(s1)
    b           0x006b59d8 ; Normalize
    nop

.org 0x006b5d9c ; Lunge to Uppercut
    lhu         v0, InputFace(s0)
    andi        at, v0, BtnTriangle
    beqz        at, 0x006b5dd8 ; Normalize
    nop
    li          v0, 0x1
    b           0x006b5dd8 ; Normalize
    sb          v0, 0x6(s0)

.org 0x006b61e4 ; Uppercut to Combo
    lhu         v0, InputFace(s0)
    andi        at, v0, BtnTriangleCircle
    beqz        at, 0x006b6250 ; Normalize
    nop
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    li          v0, 0x1
    b           0x006b6250 ; Normalize
    sb          v0, 0x6(s0)
@@CheckCircle:
    andi        at, v0, BtnCircle
    beqz        at, 0x006b6250 ; Normalize
    nop
    li          v0, 0x2
    sb          v0, 0x6(s0)
    b           0x006b6250 ; Normalize
    nop

.org 0x006b6410 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

;.org 0x0070f680 ; Guard Slice
;    lhu         v1, InputFace(s0)
;    andi        v1, BtnTriangleCircle

.org 0x0070f650 ; Custom Guard Func
    jal         SnS_Guard_ck
    move        a0, s0
    b           0x0070f6d0 ; Return