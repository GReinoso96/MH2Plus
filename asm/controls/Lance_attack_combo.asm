.org 0x006b4840 ; From Medium Poke ck
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle
    beqz        v1, 0x006b48f8 ; End
    li          v1, 0x3
    beq         s0, v1, 0x006b48f8 ; End
    nop
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangle
    beqz        v1, @@CheckCircle
    li          v0, 0x2
    bne         s0, v0, @@Medium2
    dmove       a0, s1
    li          a1, 0x1
    li          a2, 0xa
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b48f8 ; End
    nop
@@Medium2:
    li          a1, 0x1
    li          a2, 0x9
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b48f8 ; End
    nop
@@CheckCircle:
    lhu         v1, InputFace(s1)
    andi        v1, BtnCircle
    beqz        v1, 0x006b48f8 ; End
    li          v0, 0x2
    bne         s0, v0, @@High2
    dmove       a0, s1
    li          a1, 0x1
    li          a2, 0xd
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b48f8 ; End
    nop
@@High2:
    li          a1, 0x1
    li          a2, 0xc
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b48f8 ; End
    nop

.org 0x006b4a78 ; From High Poke ck
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangleCircle
    beqz        v1, 0x006b4b28 ; End
    li          v1, 0x2
    beq         s0, v1, 0x006b4b28 ; End
    nop
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangle
    beqz        v1, @@CheckCircle
    li          v0, 0x1
    bne         s0, v0, @@Medium2
    dmove       a0, s1
    li          a1, 0x1
    li          a2, 0xa
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b4b28 ; End
    nop
@@Medium2:
    li          a1, 0x1
    li          a2, 0x9
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b4b28 ; End
    nop
@@CheckCircle:
    lhu         v1, InputFace(s1)
    andi        v1, BtnCircle
    beqz        v1, 0x006b4b28 ; End
    li          v0, 0x1
    bne         s0, v0, @@High2
    dmove       a0, s1
    li          a1, 0x1
    li          a2, 0xd
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b4b28 ; End
    nop
@@High2:
    li          a1, 0x1
    li          a2, 0xc
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b4b28 ; End
    nop

.org 0x006b4dbc ; From Charge
    jal         GetAttackBtn
    dmove       a0, s0
    li          a1, 0x1
    li          a3, 0x4
    li          v1, 0x3
    beq         v0, v1, @@DoStop
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoStop
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoPoke
    nop
    b           0x006b4e20 ; Other Stuff
    nop
@@DoStop:
    jal         Pl_atk_set
    li          a2, 0x4
    b           0x006b4e20 ; Other Stuff
    nop
@@DoPoke:
    jal         Pl_atk_set
    li          a2, 0x6
    b           0x006b4e20 ; Other Stuff
    nop

.org 0x006b50e8 ; Hit Wall
    jal         GetAttackBtn
    dmove       a0, s0
    li          v1, 0x2
    beq         v0, v1, @@DoStop
    nop
    b           0x006b5110
    nop
@@DoStop:
    li          v1, 0x1
    sb          v1, 0x6(s0)
    nop

.org 0x006b52f0 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

.org 0x0070f5c8 ; Guard
    jal         GetAttackBtn
    dmove       a0, s0
    beqz        v0, 0x0070f6d0
    li          v1, 0x3
    beq         v0, v1, @@DoCharge
    li          a1, 0x1
    b           @@End
    nop
@@DoCharge:
    li          a1, 0x0
@@End:
    jal         0x006b56b0
    nop
    b           0x0070f6d0
    nop

.org 0x0071a968 ; Hop Lance and GL Check
    lhu         v0, InputFace(s1)
    andi        v0, BtnTriangleCircle
    beqz        v0, 0x0071aa18 ; Resume
    nop
    lhu         a0, InputFace(s1)
    li          v0, 0x9
    lbu         v1, 0x2(s1)
    beq         v1, v0, @@CheckGL
    nop
    li          v0, 0x3
    beq         v1, v0, @@CheckLan
    nop
    b           0x0071aa18 ; Resume
    nop
@@CheckGL:
    andi        v0, a0, BtnTriangle
    beqz        v0, @@GLCheckCircle
    nop
    b           0x0071aa18 ; Resume
    sb          zero, 0x7(s1)
@@GLCheckCircle:
    lbu         v1, 0x1C(s1)
    lbu         v0, 0x1D(s1)
    slt         at, v1, v0
    beqz        at, @@Do4
    li          v0, 0x1B
    b           0x0071aa18 ; Resume
    sb          v0, 0x7(s1)
@@Do4:
    li          v0, 0x4
    b           0x0071aa18 ; Resume
    sb          v0, 0x7(s1)
@@CheckLan:
    andi        v0, a0, BtnTriangle
    beqz        v0, @@CheckCircle
    nop
    b           0x0071aa18 ; Resume
    sb          zero, 0x7(s1)
@@CheckCircle:
    li          v0, 0x1
    b           0x0071aa18 ; Resume
    sb          v0, 0x7(s1)