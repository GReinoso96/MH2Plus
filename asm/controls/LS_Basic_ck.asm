.org 0x006baa04 ; Poke
    andi        v0, v1, BtnCircle
/*.org LS_Basic_ck
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    jal         LSGetAttackBtn
    nop
    li          a3, 0x4
    beq         v0, a3, @@DoSpirit
    li          v1, 0x3
    beq         v0, v1, @@DoHop
    nop
    li          v1, 0xA
    beq         v0, v1, @@DoPoke
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoDownward
    nop
    b           @@CheckRoll
    nop
@@DoSpirit:
    jal         LSGetSpirit
    li          a1, 0xF
    li          a1, 0x1
    bne         v0, a1, @@NoSpirit
    li          a2, 0x7
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@SpiritDone
    nop
@@NoSpirit:
    li          a2, 0x12
    jal         Pl_atk_set
    li          a3, 0x4
@@SpiritDone:
    b           @@End
    li          v0, 0x1
@@DoHop:
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x2
    b           @@End
    li          v0, 0x1
@@DoPoke:
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x4
    b           @@End
    li          v0, 0x1
@@DoDownward:
    lhu         v0, 0x380(a0)
    andi        v0, 0x3C00
    beqz        v0, @@NormalDownward
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0xC
    b           @@DownwardDone
    nop
@@NormalDownward:
    jal         Pl_atk_set
    li          a2, 0x0
@@DownwardDone:
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
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20*/