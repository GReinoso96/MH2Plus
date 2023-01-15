.org 0x00199FF0 ; Adds side rolling to SnS
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
    lhu         v0, 0x388(s0)
    addiu       v0, 0x4000
    andi        v0, 0xFFFF
    slti        at, v0, 0x5C72
    beqz        at, @@CheckLeft
    li          a1, 0x0
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
@@CheckLeft:
    ori         at, zero, 0xA38E
    slt         at, v0, at
    beqz        at, @@DoLeft
    nop
    li          a1, 0x0
    li          a2, 0x32
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    nop
@@DoLeft:
    li          a1, 0x0
    li          a2, 0x32
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    nop
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