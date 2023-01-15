.definelabel @ChatStartMode,0x0035a040 ; 0E: Japanese, 0F: English
.definelabel @ChatStartButtonQuest,0x0033ebfc ; 0x100: Triangle, 0x2: L3
.definelabel @ChatStartButtonLobby,0x0033eff0
.definelabel @MapButton,0x003479e0

;.org @ChatStartMode
;    .dh 0xF
.org @ChatStartButtonQuest
    .dh BtnR3
.org @ChatStartButtonLobby
    .dh BtnR3
.org @MapButton
    .dh BtnL3