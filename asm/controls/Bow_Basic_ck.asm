.org 0x006c2520 ; Start of input detection
    jal         GetAttackBtn
    nop
    li          a3, 0x4
    li          v1, 0x3
    beq         v0, v1, @@DoReload
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoMelee
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoDraw
    nop
    b           @@Return
    nop
@@DoReload:
    lhu         v1, 0x7E6(a0)
    li          v0, 0x87
    sll         v1, 0x2
    addu        v1, a0
    lhu         v1, 0x77C(v1)
    beq         v1, v0, @@DoNothing
    nop
    lbu         v1, 0x775(a0)
    li          v0, 0xff
    bne         v1, v0, @@DoNothing
    li          a1, 0x1
    jal         Pl_act_set2
    li          a2, 0x11
    b           @@Return
    li          v0, 0x1
@@DoDraw:
    li          a1, 0x1
    li          a2, 0xB
    jal         Pl_act_set2
    li          a3, 0x5
    b           @@Return
    li          v0, 0x1
@@DoMelee:
    lbu         v0, 0x6AF(a0)
    bnez        v0, @@Return
    nop
    lbu         v1, 0x6B0(a0)
    bnez        v1, @@Return
    nop
    jal         0x006c0ab0
    nop
    li          a1, 0x1
    li          a2, 0x3
    jal         Pl_act_set2
    li          a3, 0x4
    b           @@Return
    li          v0, 0x1
@@DoNothing:
    li          v0, 0x0
@@Return:
    ld          ra, (sp)
    jr          ra
    addiu       sp, 0x10