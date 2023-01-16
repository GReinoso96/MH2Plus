.ps2
.include "asm/addresses.asm"
.include "asm/defines.asm"
.open "ogSLPM_662.80","SLPM_662.80",0x00100000
    .include "asm/ElfFuncs.asm"
.close
;.open "unn1/nethttp.ovl","nethttp.ovl",0x008FAE00
;.close
.open "unn1/sub_main.ovl","sub_main.ovl",0x002E3900
    .include "asm/ChatQuest.asm"
    .include "asm/controls/camera.asm"
    .ifdef english
        .include "asm/msg/eng/WeaponMeleeName.asm"
        .include "asm/msg/eng/WeaponGunnerName.asm"
        .include "asm/msg/eng/ItemName.asm"
        .include "asm/msg/eng/SkillName.asm"
        .include "asm/msg/eng/SkSysName.asm"
        .include "asm/msg/eng/HelmName.asm"
        .include "asm/msg/eng/BodyName.asm"
        .include "asm/msg/eng/ArmName.asm"
        .include "asm/msg/eng/LegName.asm"
        .include "asm/msg/eng/WaistName.asm"
    .endif
    ;.include "asm/MakeSpace.asm"
    ;.include "asm/CustomFuncs.asm"
.close
.open "unn1/game.ovl","game.ovl",0x006AF200
    .include "asm/controls/general.asm"
    .include "asm/controls/SnS_Basic_ck.asm"
    .include "asm/controls/SnS_attack_combo.asm"
    .include "asm/controls/GS_Basic_ck.asm"
    .include "asm/controls/GS_attack_combo.asm"
    .include "asm/controls/Hammer_Basic_ck.asm"
    .include "asm/controls/Hammer_attack_combo.asm"
    .include "asm/controls/Lance_Basic_ck.asm"
    .include "asm/controls/Lance_attack_combo.asm"
    .include "asm/controls/LS_Basic_ck.asm"
    .include "asm/controls/LS_attack_combo.asm"
    .include "asm/controls/GL_Basic_ck.asm"
    .include "asm/controls/GL_attack_combo.asm"
    .include "asm/controls/HH_Basic_ck.asm"
    .include "asm/controls/HH_attack_combo.asm"
    .include "asm/controls/DB_Basic_ck.asm"
    .include "asm/controls/DB_attack_combo.asm"
    .include "asm/controls/Bow_Basic_ck.asm"
    .include "asm/controls/Bow_attack_combo.asm"
    .include "asm/controls/Gun_Basic_ck.asm"
    .include "asm/plMV.asm"
    ;.include "asm/controls/Guard_attack_ck.asm"
.close