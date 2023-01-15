# MH2Plus
MH2Plus is an improvement patch for Monster Hunter 2 (Japan, PS2) Game Code SLPM_662.80.

# Usage
## Download
  Head over to the releases tab on the right and apply the downloaded file to a clean MH2 iso using xdelta.

## Set-Up
  First, you must supply the following:
  * AFSPacker.exe: https://github.com/MaikelChan/AFSPacker
  * Armips.exe: https://github.com/Kingcom/armips
  * SLPM_662.80: Extract from MH1US iso, rename to "ogSLPM_662.80".
  * Game data: Extract DATA.BIN from MH2 iso, an AFS tool other than AFSPacker to extract to a folder called data without leaving a filelist. (i.e. AFS_Explorer)
  * Extracted game data: DATA.BIN contains two unnamed files, keep both in the main folder as unnamed_#.bin, then extract unnamed_1.bin using the same method, save the contents to a folder called unn1.
  
  Your MH1Plus folder should look like the following:
  ```
  MH1Plus
  ┣.vscode (VSCode build tasks)
  ┣asm (MH2Plus code)
  ┣data (game data)
  ┣unn1 (unpacked game data)
  ┃┣dnas_ins
  ┃┣dnas_net
  ┃┣game
  ┃┣gm_sub
  ┃┗etc..
  ┣DATA.BIB
  ┣AFSPacker.exe
  ┣Armips.exe
  ┣Data.txt
  ┣main.asm
  ┣ogSLPM_662.80
  ┣pack.bat
  ┣packEnglish.bat
  ┣packMV.bat
  ┣unnamed_0.bin
  ┗unnamed_1.bin
  ```

## Building
  The repository contains build tasks for VSCode, otherwise just run Pack.bat for psp controls, packEnglish for psp controls and a provisory low effort english translation or packMV for psp controls and buffed Hunting Horn.

## Distributing your modifications
  Using an XDelta tool, you can generate xdelta patches by providing an original iso and your modified copy, by making an xdelta patch you can share your modifications without sharing actual game files, as that would be illegal.

# Additions
  * Hold O to gather or carve when crouching.

# PSP Controls
## General
  * Chat Button has been moved to R3 from Δ.
  * Map Zoom Button has been moved to L3 from Select.
  * Only □ Button can sheathe now.
  * Camera can be controlled with the Right Analog Stick as well as the D-Pad.
  * ALL Weapons are remapped, but not all changes are documented here at the moment.
## Great Sword
  * Δ Button: Forwards Slash/Charge
  * O Button: Side-Slash
  * Δ + O Buttons: Backwards Slash
  * Select Button: Kick
## Long Sword
  * Δ Button: Downward Slash
  * O Button: Poke
  * Δ + O Buttons: Fade Slash
  * R1 Button: Spirit Combo
## Sword and Shield
  * You must be guarding to use items now.
  * Δ Button: Combo Attacks
  * O Button: Round Slash
  * Δ + O Buttons: Lunge Attack
  * R1 + O Button: Shield Slash
  * R1 + Δ Button: Uppercut Slash
  * Roll + Δ  Button: Uppercut Slash
## Dual Blades
  * Δ Button: Combo Attacks / Demon Combo Attacks
  * O Button: Spin Attack Right / Demon Spin Attack Right
  * Select Button or Hold Left Stick to the Left + O: Spin Attack Left / Demon Spin Attack Left
  * Δ + O Button: Lunge Attack / Demon Rush Attack
## Hammer
  * Δ Button: Stomp Combo
  * O Button: Side-slam
  * Charge + Δ Button: Charge Attack
## Hunting Horn
  * Δ Button: Side Swings
  * O Button: Poke
  * Δ + O Buttons: Superpund
  * R1 Button: Recital Mode
## Lance
  * Δ Button: Medium Poke
  * O Button: High Poke
  * X Button: Hop Back
  * R1 + Δ or O Button: Shield Poke
  * Δ + O Buttons: Start Charging / Stop Charging
  * Δ or O Button while Charging: Slide Poke
## Bowguns
  * Δ Button: Reload
  * O Button: Fire
  * Select Button or Δ + O Buttons: Melee Strike

# To-Do
  * Clean up code, many things are messy.
  * Fix a few problems with Lance input, weapon is fully usable but charge moves need a good scrubbing.
  * Implement hold to carve/gather when crouching (Easy peasy).

## Other planned features
  These will all be part of an optional rebalance patch.
  
  * Check Gunlance MVs.
  ** Find a way to prevent the MV mod from going online.
  * Make Velocidrome, Gendrome and Iodrome not flinch on every hit.
  * Rework the HH Crafting Trees to allow better variety.
