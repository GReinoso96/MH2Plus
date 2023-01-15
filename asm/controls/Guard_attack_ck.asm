.org Guard_attack_ck
    addiu       sp, -0x20
    sd          ra, 0x10
    sq          s0, (sp)
    jal         Pl_master_ck
    dmove       s0, a0
    bnez        v0, @@CheckGame
    nop
    jal         Online_ck
    nop
    li          v1, 0x1
    beq         v0, v1, @@End
    nop
@@CheckGame:
    jal         Game_clear_ck
    li          a0, 0x1
    li          v1, 0x1
    beq         v0, v1, @@End
    nop
    lbu         a0, 0x2(s0)
    li          v1, 0x7
    beq         a0, v1, @@CheckGS
    nop
    beq         a0, zero, @@CheckGS
    li          a3, 0x4
    beq         a0, a3, @@CheckSnS
    ;li          v1, 0x9
    ;beq         a0, v1, @@CheckGL
    ;nop
    ;li          v1, 0x3
    ;beq         a0, v1, @@CheckLance
    nop
    b           @@End
    nop
@@CheckGS:
    jal         CheckRollBtn
    dmove       a3, s0
    beqz        v0, @@End
    dmove       a0, s0
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@End
    nop
@@CheckSnS:
    jal         CheckRollBtn
    dmove       a3, s0
    beqz        v0, @@CheckGuardSlash
    dmove       a0, s0
    dmove       a1, zero
    li          a2, 0x1C
    jal         Pl_atk_set
    li          a3, 0x4
    b           @@End
    nop
@@CheckGuardSlash:
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangle
    beqz        v1, @@CheckGuardUpswing
    dmove       a0, s0
    jal         SnS_Guard_Attack
    nop
    b           @@End
@@CheckGuardUpswing:
    lhu         v1, InputFace(s0)
    andi        v1, BtnCircle
    beqz        v1, @@End
    dmove       a0, s0
    li          a1, 0x1
    li          a2, 0xC
    jal         Pl_atk_set
    li          a3, 0x4
    nop
    b           @@End
@@End:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20