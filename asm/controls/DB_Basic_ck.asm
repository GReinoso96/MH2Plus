.org DB_Basic_ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoSpinLeft
    li          v1, 0x3
    beq         v0, v1, @@DoLunge
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoSpinRight
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoCombo
    nop
    b           @@CheckRoll
    nop
@@DoLunge:
    li          a2, 0x0
    jal         DB_atk_set
    li          a1, 0x2
    b           @@End
    li          v0, 0x1
@@DoSpinRight:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogLeft
    beqz        v0, @@DoRight
    nop
@@DoSpinLeft:
    li          a2, 0x0
    jal         DB_atk_set
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoRight:
    li          a2, 0x0
    jal         DB_atk_set
    li          a1, 0x0
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