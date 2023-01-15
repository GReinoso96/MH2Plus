.org HH_Basic_Ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoSwing2
    li          v1, 0x3
    beq         v0, v1, @@DoPound
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoPoke
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoSwing
    nop
    b           @@CheckRoll
    nop
@@DoSwing2:
    li          a2, 0xA
    jal         Pl_act_set2 ; Not sure why HH uses this one
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoPound:
    li          a2, 0x14
    jal         Pl_act_set2
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoPoke:
    li          a2, 0xB
    jal         Pl_act_set2
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@DoSwing:
    li          a2, 0x9
    jal         Pl_act_set2
    li          a1, 0x1
    b           @@End
    li          v0, 0x1
@@CheckRoll:
    jal         CheckRollBtn
    dmove       a3, a0
    beqz        v0, @@NoRoll
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@End
    li          v0, 0x1
@@NoRoll:
    li          v0, 0x0
@@End:
    ld          ra, (sp)
    jr          ra
    addiu       sp, 0x10