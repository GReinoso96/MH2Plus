.org SnS_Basic_Ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoUpswing
    li          v1, 0x3
    beq         v0, v1, @@DoLunge
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoRoundslash
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoCombo
    nop
    b           @@CheckRoll
    nop
@@DoUpswing:
    li          a2, 0xc
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoLunge:
    li          a2, 0x1
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoRoundslash:
    li          a2, 0x2
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoCombo:
    li          a2, 0x0
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@CheckRoll:
    jal         CheckRollBtn
    dmove       a3, a0
    beqz        v0, @@NoRoll
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@End
    li          v0, 0x1
@@NoRoll:
    li          v0, 0x0
@@End:
    ld          ra, (sp)
    jr          ra
    addiu       sp, 0x10
.definelabel CheckRollBtn,.
    lhu         v0, InputFace(a3)
    andi        v0, BtnCross
    beqz        v0, @@NoRoll
    nop
    lh          v0, 0x694(a3)
    slti        v0, v0, 0x4B
    bnez        v0, @@NoRoll
    nop
    b           @@End
    li          v0, 0x1
@@NoRoll:
    li          v0, 0x0
@@End:
    jr          ra
    nop