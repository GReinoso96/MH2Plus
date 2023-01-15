.org 0x006b2c04 ; Pound Combo
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangle
    beqz        v1, 0x006b2c38 ; Normalize
    nop
    li          v1, 0x1
    sw          v1, 0x8(s0)
    b           0x006b2c38 ; Normalize
    nop

.org 0x006b2e34 ; Pound 2 Combo
    lhu         v0, InputFace(s0)
    andi        v0, BtnTriangle
    beqz        v0, 0x006b2e68 ; Normalize
    nop
    li          v0, 0x1
    sw          v0, 0x8(s0)
    b           0x006b2e68 ; Normalize
    nop

.org 0x006b4540 ; Charge Release
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangle

.org 0x006b34a8 ; Spin Cancel
    lhu         v0, InputFace(s0)
    andi        v0, BtnTriangle

.org 0x006b3e88 ; Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

.org 0x006b4218 ; Hammer ex ck
    lhu         v1, InputFace(s1)
    andi        v1, BtnTriangle
    beqz        v1, 0x006b4258 ; End
    li          a1, 0x1
    bne         s0, a1, 0x006b4258 ; End
    dmove       a0, s1
    li          a2, 0xb
    jal         Pl_atk_set
    li          a3, 0x4
    b           0x006b4258 ; End
    nop