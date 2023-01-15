/*
.org 0x00897f4a ; HH Swing 1
    .db     21
.org 0x00897f62 ; HH Swing 2
    .db     21
.org 0x00897f7a ; HH Poke 1
    .db     9
.org 0x00897f92 ; HH Poke 2
    .db     9
.org 0x00897faa ; HH Pound 1
    .db     10
.org 0x00897fc2 ; HH Pound 2
    .db     28
.org 0x00897fda ; HH Forward Slam
    .db     23
.org 0x00897ff2 ; HH Side Sweep 1
    .db     18
.org 0x0089800a ; HH Side Sweep 2
    .db     18
.org 0x00898022 ; HH Back Slam
    .db     21
.org 0x00898082 ; HH Recital Mode On
    .db     12
.org 0x0089809a ; HH Recital Mode Off
    .db     16
*/

.ifdef mvmod
    .org 0x00897f4a ; HH Swing 1
        .db     24
    .org .+(0x11) ; KO Value
        .db     12
    .org 0x00897f62 ; HH Swing 2
        .db     24
    .org .+(0x11) ; KO Value
        .db     12
    .org 0x00897f7a ; HH Poke 1
        .db     11
    .org 0x00897f92 ; HH Poke 2
        .db     11
    .org 0x00897faa ; HH Pound 1
        .db     13
    .org .+(0x11) ; KO Value
        .db     5
    .org 0x00897fc2 ; HH Pound 2
        .db     38
    .org .+(0x11) ; KO Value
        .db     10
    .org 0x00897fda ; HH Forward Slam
        .db     43
    .org .+(0x11) ; KO Value
        .db     22
    .org 0x00897ff2 ; HH Side Sweep 1
        .db     38
    .org .+(0x11) ; KO Value
        .db     22
    .org 0x0089800a ; HH Side Sweep 2
        .db     38
    .org .+(0x11) ; KO Value
        .db     22
    .org 0x00898022 ; HH Back Slam
        .db     41
    .org .+(0x11) ; KO Value
        .db     25
    .org 0x00898082 ; HH Recital Mode On
        .db     22
    .org .+(0x11) ; KO Value
        .db     20
    .org 0x0089809a ; HH Recital Mode Off
        .db     26
    .org .+(0x11) ; KO Value
        .db     20
.endif