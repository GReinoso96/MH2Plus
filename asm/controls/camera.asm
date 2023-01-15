.org 0x0031ad28
    jal         CheckCamDown
    nop
.org 0x0031ad48
    jal         CheckCamUp
    nop
.org 0x0031ad78
    jal         CheckCamUp
    nop
.org 0x0031ad98
    jal         CheckCamDown
    nop
.org 0x0031aeb8
    jal         CheckCamSide
    nop
.org 0x0031aee8
    jal         CheckCamLeft
    nop
    beqz        v0, 0x0031AF00
.org 0x0031af00
    jal         CheckCamRight
    nop