.org 0x00199FF0
.definelabel SnS_Guard_ck,.-(0x280)
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    dmove       a0, s0
    lh          v1, 0x694(s0)
    slti        v1, 0x4B
    bnez        v1, @@CheckTriangle
    nop
    lhu         v1, InputFace(s0)
    andi        at, v1, BtnCross
    beqz        at, @@CheckTriangle
    nop
    ;lhu         v1, InputLAnalog(s0)
    ;andi        at, v1, LAnalogLeft
    ;bnez        at, @@RollLeft
    li          a1, 0x0
    ;andi        at, v1, LAnalogRight
    ;bnez        at, @@RollRight
    ;nop
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    nop
;@@RollLeft:
    ;li          a2, 0x32
    ;jal         Pl_atk_set
    ;li          a3, 0x4
    ;b           @@Return
    ;nop
;@@RollRight:
    ;li          a2, 0x31
    ;jal         Pl_atk_set
    ;li          a3, 0x4
    ;b           @@Return
    ;nop
@@CheckTriangle:
    andi        at, v1, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    li          a1, 0x1
    li          a2, 0xC ; Fast Uppercut
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    nop
@@CheckCircle:
    andi        at, v1, BtnCircle
    beqz        at, @@CheckSquare
    nop
    li          a1, 0x1
    li          a2, 0x3 ; Shield Slash
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    nop
@@CheckSquare:
    andi        at, v1, BtnSquare
    beqz        at, @@Return
    nop
    lbu         at, 0x7DE(s0)
    bnez        at, @@Return
    nop
    lbu         at, 0x7E4(s0)
    bnez        at, @@Return
    nop
    jal         0x0070ec40 ; Pl_item_set
    li          a1, 0x2
    dmove       a0, s0
    jal         0x0070fb30
    dmove       a1, zero
    lbu         at, 0x84A(s0)
    ori         at, 0x1
    b           @@Return
    sb          at, 0x84A(s0)
@@Return:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20
.align 8
.definelabel CheckCamSide,.-(0x280)
    lbu         a0, 0x380(s2)
    andi        v0, a0, 0x4
    bnez        v0, @@Do
    nop
    lbu         a0, 0x380(s2)
    andi        v0, a0, 0x8
    bnez        v0, @@Do
    nop
    lhu         a0, 0x6C(s3)
    andi        v0, a0, 0xC00
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamLeft,.-(0x280)
    lhu         a0, 0x6C(s3)
    andi        v0, a0, 0x800
    bnez        v0, @@Do
    nop
    lhu         a0, 0x380(s2)
    andi        v0, a0, 0x8
    beqz        v0, @@Nope
@@Do:
    nop
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamRight,.-(0x280)
    lhu         a0, 0x6C(s3)
    andi        v0, a0, 0x400
    bnez        v0, @@Do
    nop
    lhu         a0, 0x380(s2)
    andi        v0, a0, 0x4
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamUp,.-(0x280)
    lhu         a0, 0x6E(s3)
    andi        v0, a0, 0x2000
    bnez        v0, @@Do
    nop
    lhu         a0, 0x380(s2)
    andi        v0, a0, 0x000C
    bnez        v0, @@Nope
    nop
    lhu         a0, 0x384(s2)
    andi        v0, a0, 0x20
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.align 8
.definelabel GetAttackBtnHH,.-(0x280) ; 0: None, 1: Triangle, 2: Circle, 3: Triangle + Circle, 4: Square
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnSquare
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

.align 8
.definelabel CheckCamDown,.-(0x280)
    lhu         a0, 0x6E(s3)
    andi        v0, a0, 0x1000
    bnez        v0, @@Do
    nop
    lhu         a0, 0x380(s2)
    andi        v0, a0, 0x000C
    bnez        v0, @@Nope
    nop
    lhu         a0, 0x384(s2)
    andi        v0, a0, 0x10
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.align 8
.definelabel GunUnsheatheCk,.-(0x280)
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnTriangle
    beqz        at, @@Nope
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@Nope
    nop
    andi        at, v0, BtnR1
    beqz        at, @@Nope
    nop
    b           @@End
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@End:
    jr          ra
    nop
.align 8
.definelabel GlCircleCheck,.-(0x280)
    lhu         v0, InputFace(at)
    andi        at, v0, BtnTriangle
    bnez        at, @@Nope
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@Nope
    li          v0, 0x1
    b           @@Return
    nop
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop