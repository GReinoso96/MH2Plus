.org 0x006beef8 ; From Poke1
    jal         GlCircleCheck
    dmove       at, s1

.org 0x006c0550
    beqz        v0, 0x06C0614
    nop
    lh          v0, 0x694(s1)
    slti        v0, v0, 0x4B
    bnez        v0, 0x06C0614

.org 0x006c0614 ; Ex Ck
    li          v0, 0x3
    beq         s0, v0, 0x006c0820 ; End
    lhu         v0, InputFace(s1)
    andi        at, v0, BtnTriangle
    beqz        at, 0x006c0820 ; End
    li          v1, 0x1
    andi        at, v0, BtnCircle
    beqz        at, @@DoTriangle
    nop
    b           0x006c0798
    nop
@@DoTriangle:
    b           0x006c064c
    nop

.org 0x006bf3dc ; From Overhead Shot
    lhu         v0, InputFace(s2)
    andi        v0, BtnCircle

.org 0x006bf45c ; From Overhead Shot (useless?)
    lhu         v1, InputFace(s2)
    andi        v1, BtnTriangleCircle

.org 0x006bf684 ; From Shield Poke
    jal         GlCircleCheck
    dmove       at, s0

.org 0x006bfbc0 ; From Upwards
    jal         GlCircleCheck
    dmove       at, s0

.org 0x006bff24 ; From Advancing Upwards
    jal         GlCircleCheck
    dmove       at, s0

.org 0x006c0090 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

.org 0x006c0840 ; Guard
    addiu       sp, -0x10
    sd          ra, (sp)
    jal         GetAttackBtn
    nop
    li          a3, 0xC
    li          v1, 0x3
    beq         v0, v1, @@DoBlast
    nop
    li          v1, 0x2
    beq         v0, v1, @@DoReload
    nop
    li          v1, 0x1
    beq         v0, v1, @@DoPoke
    nop
    b           @@DoNothing
    nop
@@DoBlast:
    lh          v0, 0x7D4(a0)
    bnez        v0, @@FireEmpty
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x3
    b           @@Return
    li          v0, 0x1
@@FireEmpty:
    jal         Pl_atk_set
    li          a2, 0x13
    b           @@Return
    li          v0, 0x1
@@DoPoke:
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x2
    b           @@Return
    li          v0, 0x1
@@DoReload:
    lbu         v1, 0x1C(a0)
    lbu         v0, 0x1D(a0)
    slt         at, v1, v0
    beqz        at, @@DoNothing
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x5
    b           @@Return
    li          v0, 0x1
@@DoNothing:
    dmove       v0, zero
@@Return:
    ld          ra, (sp)
    jr          ra
    addiu       sp, 0x10

;.org 0x006c0890 ; Guard Poke
;    lhu         v1, InputFace(a0)
;    andi        v0, v1, BtnTriangle

;.org 0x006c0890 ; Guard Reload
;    lhu         v1, InputFace(a0)
;    andi        v0, v1, BtnTriangle