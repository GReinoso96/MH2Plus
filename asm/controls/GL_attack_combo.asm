.org 0x006beef8 ; From Poke1
    lhu         v0, InputFace(s1)
    andi        v0, BtnCircle

.org 0x006c0618 ; Ex Ck
    lhu         v0, InputFace(s1)
    andi        v0, BtnTriangle
    beqz        v0, 0x006c0820 ; End
    li          v0, 0x3
    beq         s0, v0, 0x006c0820 ; End
    nop
    lhu         v0, InputFace(s1)
    andi        v0, BtnTriangle
    beqz        v0, 0x006c0798 ; Other Stuff
    nop
    b           0x006c064c ; Do Stuff
    nop

.org 0x006bf3dc ; From Overhead Shot
    lhu         v0, InputFace(s2)
    andi        v0, BtnCircle

.org 0x006bf45c ; From Overhead Shot (useless?)
    lhu         v1, InputFace(s2)
    andi        v1, BtnTriangleCircle

.org 0x006bf684 ; From Shield Poke
    lhu         v0, InputFace(s0)
    andi        v0, BtnCircle

.org 0x006bfbc0 ; From Upwards
    lhu         v0, InputFace(s0)
    andi        v0, BtnCircle

.org 0x006bff24 ; From Advancing Upwards
    lhu         v0, InputFace(s0)
    andi        v0, BtnCircle

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