.org Lance_Basic_ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0xC
    li          v1, 0x3
    beq         v0, v1, @@DoCharge
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoHigh
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoMedium
    nop
    b           @@CheckRoll
    nop
@@DoCharge:
    li          a2, 0x3
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoHigh:
    li          a2, 0x1
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoMedium:
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
    li          a2, 0x6D
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