.org GL_Basic_Ck
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0xC
    li          v1, 0x4
    beq         v0, v1, @@DoUpswing
    nop
    li          v1, 0x3
    beq         v0, v1, @@DoUpswing
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoShoot
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoPoke
    nop
    b           @@CheckRoll
    nop
@@DoUpswing:
    li          a2, 0x4
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    nop
@@DoShoot:
    lbu         v0, 0x1C(a0)
    beqz        v0, @@DoEmpty
    nop
    jal         0x006bec30
    nop
    bnez        v0, @@DoFire
    nop
@@DoEmpty:
    li          a2, 0xE
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    nop
@@DoFire:
    li          a2, 0x17
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    nop
@@DoPoke:
    lhu         v0, 0x38C(a0)
    slti        v0, 0x78
    bnez        v0, @@PokeNormal
    li          a2, 0x6
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    nop
@@PokeNormal:
    li          a2, 0x0
    jal         Pl_atk_set
    li          a1, 0x1
    b           @@End
    nop
@@CheckRoll:
    jal         CheckRollBtn
    dmove       a3, a0
    beqz        v0, @@End
    dmove       a1, zero
    li          a2, 0x6D
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@End
    nop
@@End:
    ld          ra, (sp)
    jr          ra
    addiu       sp, 0x10