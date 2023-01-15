.org 0x006c1230 ; From Shoot
    lhu         v1, InputFaceHeld(s1)
    andi        v1, BtnTriangle

.org 0x006c1560 ; From Draw
    lhu         v0, InputFaceHeld(s1)
    andi        v0, BtnTriangle

.org 0x006c1820 ; From Melee 1 to Melee 2
    lhu         v1, InputFace(s1)
    andi        v1, BtnCircle

.org 0x006c1868 ; From Melee 1 to Draw
    lhu         v1, InputFaceHeld(s1)
    andi        v1, BtnTriangle

.org 0x006c1cc8 ; From Aim 2
    lhu         v0, InputFaceHeld(s0)
    andi        v0, BtnTriangle

.org 0x006c2748 ; Bow ex at
    lhu         v0, InputFace(s1)
    andi        v0, BtnCircle

.org 0x006c2720
    lhu         v0, InputFaceHeld(s1)
    andi        v0, BtnTriangle