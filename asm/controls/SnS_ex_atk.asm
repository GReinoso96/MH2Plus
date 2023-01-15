.org SnS_Basic_Ck ; This was pointless
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    jal         Pl_master_ck
    dmove       s0, a0
    bnez        v0, @@CheckGameClear
    nop
    jal         Online_ck
    nop
    li          v1, 0x1
    beq         v0, v1, @@End
    nop
@@CheckGameClear:
    jal         Game_clear_ck
    li          a0, 0x1
    li          v1, 0x1
    beq         v0, v1, @@End
    nop
    lbu         v1, 0x7E4(s0)
    bnez        v1, @@End
    nop
    lhu         v1, InputFace(s0)
    andi        v1, BtnCross
    beqz        v1, @@End
    nop
    lh          v1, 0x694(s0)
    slti        v1, v1, 0x4B
    bnez        v1, @@End
    nop
.definelabel SnS_Ex_Roll,.
    lhu         v0, 0x380 (s0)
    andi        v0, 0x3C00
    beqz        v0, @@DoExRoll
    nop
    lhu         v0, InputFace(s0)
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
@@End:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20