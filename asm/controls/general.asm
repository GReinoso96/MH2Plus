.org 0x00711910 ; Unsheathe Button
    lhu     v0, InputFace(s3)
    andi    v0, BtnTriangle

.org 0x0070f2c4 ; Crouch Unsheathe
    lhu     v0, InputFace(s0)
    andi    v0, BtnTriangle

.org 0x0070f340 ; Crouch Continuous Gathering
    lhu     v0, InputFaceHeld(s0)

.org 0x007149f8 ; Roll to Attack
    lhu     v0, InputFace(s1)
    andi    v0, BtnTriangle

.org 0x00716230 ; Side Roll to Attack
    lhu     v0, InputFace(s0)
    andi    v0, BtnTriangle

.org 0x007113C0 ; Skip sns item use check
    b       0x711498
    nop

.org 0x0071149c ; Weapon Sheathe to Square only
    andi    v0, v1, BtnSquare

.org 0x00720670 ; Egg Attack
    lhu         v0, InputFace(s1)
    andi        v0, BtnTriangle

.org GetAttackBtn ; 0: None, 1: Triangle, 2: Circle, 3: Triangle + Circle, 4: Select
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnSelect
    beqz        at, @@CheckTrO
    nop
    b           @@End
    li          v0, 0x4
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

.org LSGetAttackBtn ; LS Get Input
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnR1
    beqz        at, @@CheckTrO
    nop
    b           @@End
    li          v0, 0x4
@@CheckTrO:
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    b           @@End
    li          v0, 0x3
@@CheckCircle:
    andi        at, v0, BtnCircle
    beqz        at, @@None
    nop
    b           @@End
    li          v0, 0xA
@@OnlyTriangle:
    b           @@End
    li          v0, 0x1
@@None:
    li          v0, 0x0
@@End:
    jr          ra
    nop