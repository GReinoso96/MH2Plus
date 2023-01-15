.org 0x006bcef0 ; HH_ex_at
    addiu       sp, -0x30
    sd          ra, 0x20(sp)
    sq          s1, 0x10(sp)
    sq          s0, (sp)
    dmove       s1, a0
    jal         Pl_master_ck
    dmove       s0, a1
    bnez        v0, @@CheckGame
    nop
    jal         Online_ck
    nop
    li          v1, 0x1
    beq         v0, v1, @@Return
    nop
@@CheckGame:
    jal         Game_clear_ck
    li          a0, 0x1
    li          v1, 0x1
    beq         v0, v1, @@Return
    nop
    lbu         v1, 0x7E4(s1)
    bnez        v1, @@Return
    nop
    lhu         v1, InputFace(s1)
    andi        v1, BtnCross
    beqz        v1, @@CheckAttacks
    nop
    lh          v1, 0x694(s1)
    slti        v1, 0x4B
    bnez        v1, @@CheckAttacks
    li          v1, 0x5
    beq         s0, v1, @@CheckAttacks
    nop
    lhu         v0, 0x380(s1)
    andi        v0, 0x3C00
    beqz        v0, @@DoRoll
    nop
    lhu         v0, 0x388(s1)
    addiu       v0, 0x4000
    andi        v0, 0xFFFF
    slti        at, v0, 0x5C72
    beqz        at, @@CheckLeft
    dmove       a0, s1
    dmove       a1, zero
    li          a2, 0x31
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@DoReturn
    nop
@@CheckLeft:
    ori         at, zero, 0xA38E
    slt         at, v0, at
    beqz        at, @@DoLeft
    dmove       a0, s1
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@DoReturn
    nop
@@DoLeft:
    dmove       a0, s1
    dmove       a1, zero
    li          a2, 0x32
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@DoReturn
    nop
@@DoRoll:
    dmove       a0, s1
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_act_set2
    li          a3, 0x4
@@DoReturn:
    b           @@Return
    nop
@@CheckAttacks:
    li          a3, 0x4
    beq         s0, a3, @@AttackReturn
    li          v1, 0x6
    bne         s0, v1, @@CheckButtons
    nop
@@AttackReturn:
    b           @@Return
    nop
@@CheckButtons:
    lhu         v1, InputFace(s1)
    andi        at, v1, BtnTriangleCircle
    beqz        at, @@Return
    nop
    andi        at, v1, BtnTriangle
    beqz        at, @@CheckCircle
    dmove       a0, s1
    andi        at, v1, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    li          a1, 0x1
    li          a2, 0x14
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    nop
@@OnlyTriangle:
    addiu       v1, s0, -0x1
    sltiu       at, v1, 0x3
    bnez        at, @@DoSwing1
    nop
    beqz        s0, @@DoSwing2
    addiu       v1, s0, -0x2
    sltiu       at, v1, 0x2
    bnez        at, @@DoSwing2
    nop
    li          v1, 0x5
    bne         s0, v1, @@Return
    nop
@@DoSwing1:
    li          a1, 0x1
    li          a2, 0x9
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    nop
@@DoSwing2:
    li          a1, 0x1
    li          a2, 0xA
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    nop
@@CheckCircle:
    andi        at, v1, BtnCircle
    beqz        at, @@Return
    nop
    li          v1, 0x2
    beq         s0, v1, @@Poke2
    li          v1, 0x5
    bne         s0, v1, @@Poke1
    nop
@@Poke2:
    li          a1, 0x1
    li          a2, 0xC
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    nop
@@Poke1:
    li          v1, 0x3
    bne         s0, v1, @@Return
    li          a1, 0x1
    li          a2, 0x23
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    nop
@@Return:
    ld          ra, 0x20(sp)
    lq          s1, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x30

.org 0x006bd2b8 ; Play ex at
    jal         GetAttackBtn
    dmove       a0, s1
    li          a3, 0x4
    li          v1, 0x3
    beq         v0, v1, @@DoUpward ; Down
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoBack ; Right
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoForward ; Up
    nop
    b           0x006bd4f8 ; return
    nop
@@DoUpward:
    li          v0, 0x3
    beq         s0, v0, @@Upward3
    nop
    beq         s0, zero, @@Upward0
    nop
    li          a2, 0x12
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Upward3:
    li          a2, 0x22
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Upward0:
    li          a2, 0x1E
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@DoBack:
    li          v0, 0x3
    beq         s0, v0, @@Back3
    nop
    beq         s0, zero, @@Back0
    nop
    li          a2, 0x10
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Back3:
    li          a2, 0x20
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Back0:
    li          a2, 0x1C
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@DoForward:
    li          v0, 0x3
    beq         s0, v0, @@Forward3
    nop
    beq         s0, zero, @@Forward0
    nop
    li          a2, 0xf
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Forward3:
    li          a2, 0x1f
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@Forward0:
    li          a2, 0x17
    jal         Pl_act_set2
    li          a1, 0x1
    b           0x006bd4f8 ; return
    nop
@@CheckRoll:
    jal         CheckRollBtn
    dmove       a3, a0
    beqz        v0, 0x006bd4f8 ; return
    dmove       a1, zero
    li          a2, 0x6D
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x006bd4f8 ; return
    nop

.org 0x006bc308 ; Bounce?
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

/*
.org 0x006bd038 ; HH Ex At
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle
    beqz        v1, 0x6BD180
    nop
.org 0x006bd048
    lhu         v1, InputFace(s1)
    addiu       at, v1, BtnTriangle
    beqz        at, @@CheckCircle
    dmove       a0, s1
    addiu       at, v1, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    li          a1, 0x1
    li          a2, 0x14
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x6BD180
    nop
@@OnlyTriangle:
    addiu       v1, s0, -0x1
    sltiu       at, v1, 0x3
    bnez        at, @@DoSwing1
    nop
    beqz        s0, @@DoSwing2
    addiu       v1, s0, -0x2
    sltiu       at, v1, 0x2
    bnez        at, @@DoSwing2
    nop
    li          v1, 0x5
    bne         s0, v1, 0x6BD180
    nop
@@DoSwing1:
    li          a1, 0x1
    li          a2, 0x9
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x6BD180
    nop
@@DoSwing2:
    li          a1, 0x1
    li          a2, 0xA
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x6BD180
    nop
@@CheckCircle:
    li          v1, 0x2
    beq         s0, v1, @@Poke2
    li          v1, 0x5
    bne         s0, v1, @@Poke1
    nop
@@Poke2:
    li          a1, 0x1
    li          a2, 0x23
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x6BD180
    nop
@@Poke1:
    li          v1, 0x3
    bne         s0, v1, 0x6BD180
    li          a1, 0x1
    li          a2, 0x23
    jal         Pl_act_set2
    li          a3, 0x4
    b           0x6BD180
    nop


    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle
    beqz        v1, 0x6BD180
    nop
    jal         GetAttackBtn
    dmove       a0, s1
    li          a3, 0x4
    li          v1, 0x3
    beq         v0, v1, @@DoPound
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoPoke
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoSwing
    nop
    b           0x6BD180
    nop
@@DoSwing:
    beq         s0, zero, @@DoSwingA
    addiu       v1, s0, -0x2
    sltiu       at, v1, 0x2
    bnez        at, @@DoSwingA
    nop
    li          v1, 0x5
    bne         s0, v1, 0x6BD180
    nop
@@DoSwingA:
    li          a1, 0x1
    jal         Pl_act_set2
    li          a2, 0xA
    b           0x6BD180
    nop*/