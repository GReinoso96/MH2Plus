.org GS_Basic_ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoKick
    li          v1, 0x3
    beq         v0, v1, @@DoBackward
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoSide
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoDownward
    nop
    b           @@CheckRoll
    nop
@@DoKick:
    li          a2, 0x4
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoBackward:
    li          a2, 0x1
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoSide:
    li          a2, 0x0
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoDownward:
    li          a2, 0x13
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