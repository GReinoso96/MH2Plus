.org Gun_Basic_ck
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoMelee
    li          v1, 0x3
    beq         v0, v1, @@DoMelee
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoFire
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoReload
    nop
    b           @@CheckRoll
    nop
@@DoMelee:
    li          a2, 0x3
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@Return
    li          v0, 0x1
@@DoFire:
    dmove       s0, a0
    ;lh          v0, 0x694(s0)
    ;slti        v0, v0, 0x4B
    ;beqz        v0, @@CheckRoll
    lbu         v0, 0x1C(s0)
    bnez        v0, @@FireType
    dmove       a0, s0
    li          a2, 0x2
    li          a3, 0x5
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@Return
    li          v0, 0x1
@@FireType:
    li          v0, 0x1
    sb          v0, 0x845(s0)
    dmove       a0, s0
    jal         0x006b1ad0 ;unk
    nop
    li          a1, 0x1
    bne         v0, a1, @@CheckType
    dmove       a0, s0
    li          a2, 0x8
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@Return
    li          v0, 0x1
@@CheckType:
    lbu         a1, 0x534(s0)
    jal         0x003b5730 ; unk
    dmove       a0, s0
    dsll32      v1, v0, 0x10
    dsra32      v1, v1, 0x10
    li          v0, 0x2
    beq         v1, v0, @@FireHeavy
    li          a1, 0x1
    beq         v1, a1, @@FireMedium
    nop
    beq         v1, zero, @@FireNormal
    nop
    b           @@FireMedium
    nop
@@FireNormal:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x0
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@FireReturn
    nop
@@FireMedium:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x4
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@FireReturn
    nop
@@FireHeavy:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x5
    jal         Pl_atk_set
    li          a3, 0x5
@@FireReturn:
    b           @@Return
    li          v0, 0x1
@@DoReload:
    lbu         v1, 0x1C(a0)
    bnez        v1, @@None
    lh          v0, 0x814(a0)
    blez        v0, @@None
    li          a2, 0x1
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@Return
    li          v0, 0x1
@@CheckRoll:
    jal         CheckRollBtn
    dmove       a3, a0
    beqz        v0, @@None
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    li          v0, 0x1
@@None:
    li          v0, 0x0
@@Return:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20
/*
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    lhu         v1, InputFace(a0)
    andi        v0, v1, BtnCross
    beqz        v0, @@CheckAmmo
    dmove       s0, a0
    lh          v0, 0x694(s0)
    slti        v0, 0x4B
    bnez        v0, @@CheckAmmo
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    li          v0, 0x1
@@CheckAmmo:
    lbu         v0, 0x1C(s0)
    bnez        v0, @@FireType
    andi        v0, v1, BtnCircle
    beqz        v0, @@CheckMelee
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x2
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@Return
    li          v0, 0x1
@@FireType:
    li          v0, 0x1
    sb          v0, 0x845(s0)
    lhu         v0, InputFace(s0)
    andi        v0, BtnCircle
    beqz        v0, @@CheckMelee
    dmove       a0, s0
    jal         0x006b1ad0 ;unk
    nop
    li          a1, 0x1
    bne         v0, a1, @@CheckUnk
    dmove       a0, s0
    li          a2, 0x8
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@Return
    li          v0, 0x1
@@CheckUnk:
    lbu         a1, 0x534(s0)
    jal         0x003b5730 ; unk
    dmove       a0, s0
    dsll32      v1, v0, 0x10
    dsra32      v1, v1, 0x10
    li          v0, 0x2
    beq         v1, v0, @@FireHeavy
    li          a1, 0x1
    beq         v1, a1, @@FireMedium
    nop
    beq         v1, zero, @@FireNormal
    nop
    b           @@FireMedium
    nop
@@FireNormal:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x0
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@FireReturn
    nop
@@FireMedium:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x4
    jal         Pl_atk_set
    li          a3, 0x5
    b           @@FireReturn
    nop
@@FireHeavy:
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x5
    jal         Pl_atk_set
    li          a3, 0x5
@@FireReturn:
    b           @@Return
    li          v0, 0x1
@@CheckMelee:
    lbu         v1, 0x1C(s0)
    beqz        v1, @@DoReload
    nop
    lbu         v0, 0x1D(s0)
    slt         at, v1, v0
    beqz        at, @@None
    nop
    lh          v0, 0x814(s0)
    slt         at, v1, v0
    beqz        at, @@DoMelee
    nop
@@DoReload:
    lhu         v0, InputFace(s0)
    andi        at, v0, BtnTriangle
    beqz        at, @@None
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@YesReload
    nop
@@DoMelee:
    lbu         v0, 0x6AF(s0)
    bnez        v0, @@None
    nop
    lbu         v0, 0x6B0(s0)
    bnez        v0, @@None
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0x3
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@Return
    li          v0, 0x1
@@YesReload:
    li          a1, 0x1
    dmove       a0, s0
    dmove       a2, a1
    jal         Pl_act_set2
    li          a3, 0x5
    b           @@Return
    li          v0, 0x1
@@None:
    dmove       v0, zero
@@Return:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20*/