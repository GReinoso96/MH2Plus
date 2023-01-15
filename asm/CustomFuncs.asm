
.org GetAttackButton2 ; 0: Nothing, 1: Triangle, 2: Circle, 3: Triangle+Circle, 4: R1, 5: Select
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnR1
    beqz        at, @@CheckSelect
    nop
    b           @@End
    li          v0, 0x4
@@CheckSelect:
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnSelect
    beqz        at, @@CheckTrO
    nop
    b           @@End
    li          v0, 0x5
@@CheckTrO:
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    b           @@End
    li          v0, 0x3
@@CheckCircle:
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnCircle
    beqz        at, @@None
    nop
    b           @@End
    li          v0, 0x2
@@OnlyTriangle:
    b           @@End
    li          v0, 0x1
@@None:
    li          v0, 0x0
@@End:
    jr          ra
    nop
