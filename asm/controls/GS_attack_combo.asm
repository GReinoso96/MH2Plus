.org 0x006B09F8 ; GS Charge Held
    lhu         v0, InputFaceHeld
    andi        v0, BtnTriangle

.org 0x006b0580 ; GS Bounce
    lhu         v1, InputFace(s0)
    andi        v1, BtnTriangleCircle

.org 0x006b1748 ; GS Ex Atk Black Magic Don't Ask
    jal         GetAttackBtn
    dmove       a0, s1
    beqz        v0, @@End
    nop
    li          v1, 0x1 ; Charge: 1
    beq         v0, v1, @@ChargeCombos
    nop
    li          v1, 0x3 ; Backward: 3
    beq         v0, v1, @@BackwardCombos
    nop
    li          v1, 0x2 ; Side: 2
    beq         v0, v1, @@SideslashCombos
    nop
    b           @@End
    nop
@@ChargeCombos:
    li          v1, 0x4
    beq         s0, v1, @@End
    li          v1, 0x2
    beq         s0, v1, @@ChCheckRight ; Came from 2 (Backward)
    li          a1, 0x1
    beq         s0, a1, @@ChCheckLeft ; Came from 1 (Sideslash)
    nop
    b           @@End
    nop
@@ChCheckRight:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogRight
    beqz        v0, @@ChNotRight
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x19
    b           @@End
    nop
@@ChNotRight:
    jal         Pl_atk_set
    li          a2, 0x15
    b           @@End
    nop
@@ChCheckLeft:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogLeft
    beqz        v0, @@ChNotLeft
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x18
    b           @@End
    nop
@@ChNotLeft:
    jal         Pl_atk_set
    li          a2, 0x16
    b           @@End
    nop
@@BackwardCombos:
    li          v1, 0x2
    beq         s0, v1, @@End
    li          v1, 0x4
    beq         s0, v1, @@BwCheckCharged ; Came from 4 (Charged)
    li          v1, 0x1
    beq         s0, a1, @@BwCheckSide ; Came from 1 (Sideslash)
    nop
    b           @@End
    nop
@@BwCheckCharged:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogRight
    beqz        v0, @@BwNotRight
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0xb
    b           @@End
    nop
@@BwNotRight:
    jal         Pl_atk_set
    li          a2, 0x9
    b           @@End
    nop
@@BwCheckSide:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogRight
    beqz        v0, @@BwNotSideRight
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0xC
    b           @@End
    nop
@@BwNotSideRight:
    jal         Pl_atk_set
    li          a2, 0xA
    b           @@End
    nop
@@SideslashCombos:
    li          v1, 0x1
    beq         s0, v1, @@End
    li          v1, 0x4
    beq         s0, v1, @@SlCheckCharged ; Came from 4 (Charged)
    li          v1, 0x2
    beq         s0, a1, @@SlCheckBack ; Came from 2 (Backwards)
    nop
    b           @@End
    nop
@@SlCheckCharged:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogLeft
    beqz        v0, @@SlNotChargedLeft
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x7
    b           @@End
    nop
@@SlNotChargedLeft:
    jal         Pl_atk_set
    li          a2, 0x5
    b           @@End
    nop
@@SlCheckBack:
    lhu         v0, InputLAnalog(s1)
    andi        v0, LAnalogLeft
    beqz        v0, @@SlNotBackLeft
    li          a1, 0x1
    jal         Pl_atk_set
    li          a2, 0x8
    b           @@End
    nop
@@SlNotBackLeft:
    jal         Pl_atk_set
    li          a2, 0x6
    b           @@End
    nop
@@End:
    ld          ra, 0x20(sp)
    lq          s1, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x30