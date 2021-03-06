.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purposee registers

.section .text

.align 4

/* 009890 80008C90 00000000 */  nop   
/* 009894 80008C94 00000000 */  nop   
/* 009898 80008C98 00000000 */  nop   
/* 00989C 80008C9C 00000000 */  nop   
glabel func_80008CA0
/* 0098A0 80008CA0 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0098A4 80008CA4 AFB00020 */  sw    $s0, 0x20($sp)
/* 0098A8 80008CA8 3C108001 */  lui   $s0, %hi(D_8000AFA0) # $s0, 0x8001
/* 0098AC 80008CAC 2610AFA0 */  addiu $s0, %lo(D_8000AFA0) # addiu $s0, $s0, -0x5060
/* 0098B0 80008CB0 8E0E0000 */  lw    $t6, ($s0)
/* 0098B4 80008CB4 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0098B8 80008CB8 AFA40030 */  sw    $a0, 0x30($sp)
/* 0098BC 80008CBC 55C00054 */  bnezl $t6, .L80008E10
/* 0098C0 80008CC0 8FBF0024 */   lw    $ra, 0x24($sp)
/* 0098C4 80008CC4 0C001A9C */  jal   func_80006A70
/* 0098C8 80008CC8 00000000 */   nop   
/* 0098CC 80008CCC 3C018001 */  lui   $at, %hi(D_8000AFBC) # $at, 0x8001
/* 0098D0 80008CD0 3C048001 */  lui   $a0, %hi(D_80016D30) # $a0, 0x8001
/* 0098D4 80008CD4 3C058001 */  lui   $a1, %hi(D_80016D48) # $a1, 0x8001
/* 0098D8 80008CD8 AC20AFBC */  sw    $zero, %lo(D_8000AFBC)($at)
/* 0098DC 80008CDC 24A56D48 */  addiu $a1, %lo(D_80016D48) # addiu $a1, $a1, 0x6d48
/* 0098E0 80008CE0 24846D30 */  addiu $a0, %lo(D_80016D30) # addiu $a0, $a0, 0x6d30
/* 0098E4 80008CE4 0C001874 */  jal   osCreateMesgQueue
/* 0098E8 80008CE8 24060005 */   li    $a2, 5
/* 0098EC 80008CEC 3C068001 */  lui   $a2, %hi(D_80016D60) # $a2, 0x8001
/* 0098F0 80008CF0 3C078001 */  lui   $a3, %hi(D_80016D78) # $a3, 0x8001
/* 0098F4 80008CF4 24E76D78 */  addiu $a3, %lo(D_80016D78) # addiu $a3, $a3, 0x6d78
/* 0098F8 80008CF8 24C66D60 */  addiu $a2, %lo(D_80016D60) # addiu $a2, $a2, 0x6d60
/* 0098FC 80008CFC 240F000D */  li    $t7, 13
/* 009900 80008D00 2418000E */  li    $t8, 14
/* 009904 80008D04 3C058001 */  lui   $a1, %hi(D_80016D30) # $a1, 0x8001
/* 009908 80008D08 A4CF0000 */  sh    $t7, ($a2)
/* 00990C 80008D0C A0C00002 */  sb    $zero, 2($a2)
/* 009910 80008D10 ACC00004 */  sw    $zero, 4($a2)
/* 009914 80008D14 A4F80000 */  sh    $t8, ($a3)
/* 009918 80008D18 A0E00002 */  sb    $zero, 2($a3)
/* 00991C 80008D1C ACE00004 */  sw    $zero, 4($a3)
/* 009920 80008D20 24A56D30 */  addiu $a1, %lo(D_80016D30) # addiu $a1, $a1, 0x6d30
/* 009924 80008D24 0C001488 */  jal   func_80005220
/* 009928 80008D28 24040007 */   li    $a0, 7
/* 00992C 80008D2C 3C078001 */  lui   $a3, 0x8001
/* 009930 80008D30 3C058001 */  lui   $a1, %hi(D_80016D30) # $a1, 0x8001
/* 009934 80008D34 24E66D78 */  addiu $a2, $a3, 0x6d78
/* 009938 80008D38 24A56D30 */  addiu $a1, %lo(D_80016D30) # addiu $a1, $a1, 0x6d30
/* 00993C 80008D3C 0C001488 */  jal   func_80005220
/* 009940 80008D40 24040003 */   li    $a0, 3
/* 009944 80008D44 2419FFFF */  li    $t9, -1
/* 009948 80008D48 AFB90028 */  sw    $t9, 0x28($sp)
/* 00994C 80008D4C 0C001944 */  jal   osGetThreadPri
/* 009950 80008D50 00002025 */   move  $a0, $zero
/* 009954 80008D54 8FA80030 */  lw    $t0, 0x30($sp)
/* 009958 80008D58 00002025 */  move  $a0, $zero
/* 00995C 80008D5C 0048082A */  slt   $at, $v0, $t0
/* 009960 80008D60 10200003 */  beqz  $at, .L80008D70
/* 009964 80008D64 01002825 */   move  $a1, $t0
/* 009968 80008D68 0C00190C */  jal   osSetThreadPri
/* 00996C 80008D6C AFA20028 */   sw    $v0, 0x28($sp)
.L80008D70:
/* 009970 80008D70 0C001CA0 */  jal   __osDisableInt
/* 009974 80008D74 00000000 */   nop   
/* 009978 80008D78 8FAB0030 */  lw    $t3, 0x30($sp)
/* 00997C 80008D7C 3C038001 */  lui   $v1, %hi(D_80016D30) # $v1, 0x8001
/* 009980 80008D80 3C048001 */  lui   $a0, %hi(D_80015B80) # $a0, 0x8001
/* 009984 80008D84 3C0A8001 */  lui   $t2, %hi(D_80016D30) # $t2, 0x8001
/* 009988 80008D88 24845B80 */  addiu $a0, %lo(D_80015B80) # addiu $a0, $a0, 0x5b80
/* 00998C 80008D8C 24636D30 */  addiu $v1, %lo(D_80016D30) # addiu $v1, $v1, 0x6d30
/* 009990 80008D90 24090001 */  li    $t1, 1
/* 009994 80008D94 254A6D30 */  addiu $t2, %lo(D_80016D30) # addiu $t2, $t2, 0x6d30
/* 009998 80008D98 3C068001 */  lui   $a2, %hi(func_80008E20) # $a2, 0x8001
/* 00999C 80008D9C AFA2002C */  sw    $v0, 0x2c($sp)
/* 0099A0 80008DA0 AE090000 */  sw    $t1, ($s0)
/* 0099A4 80008DA4 AE040004 */  sw    $a0, 4($s0)
/* 0099A8 80008DA8 AE030008 */  sw    $v1, 8($s0)
/* 0099AC 80008DAC AE03000C */  sw    $v1, 0xc($s0)
/* 0099B0 80008DB0 AE000010 */  sw    $zero, 0x10($s0)
/* 0099B4 80008DB4 AE000014 */  sw    $zero, 0x14($s0)
/* 0099B8 80008DB8 AE000018 */  sw    $zero, 0x18($s0)
/* 0099BC 80008DBC 24C68E20 */  addiu $a2, %lo(func_80008E20) # addiu $a2, $a2, -0x71e0
/* 0099C0 80008DC0 AFAA0010 */  sw    $t2, 0x10($sp)
/* 0099C4 80008DC4 00002825 */  move  $a1, $zero
/* 0099C8 80008DC8 02003825 */  move  $a3, $s0
/* 0099CC 80008DCC 0C001154 */  jal   osCreateThread
/* 0099D0 80008DD0 AFAB0014 */   sw    $t3, 0x14($sp)
/* 0099D4 80008DD4 0C001CC4 */  jal   func_80007310
/* 0099D8 80008DD8 00000000 */   nop   
/* 0099DC 80008DDC 3C048001 */  lui   $a0, %hi(D_80015B80) # $a0, 0x8001
/* 0099E0 80008DE0 0C0023F0 */  jal   osStartThread
/* 0099E4 80008DE4 24845B80 */   addiu $a0, %lo(D_80015B80) # addiu $a0, $a0, 0x5b80
/* 0099E8 80008DE8 0C001CBC */  jal   func_800072F0
/* 0099EC 80008DEC 8FA4002C */   lw    $a0, 0x2c($sp)
/* 0099F0 80008DF0 8FAC0028 */  lw    $t4, 0x28($sp)
/* 0099F4 80008DF4 2401FFFF */  li    $at, -1
/* 0099F8 80008DF8 00002025 */  move  $a0, $zero
/* 0099FC 80008DFC 51810004 */  beql  $t4, $at, .L80008E10
/* 009A00 80008E00 8FBF0024 */   lw    $ra, 0x24($sp)
/* 009A04 80008E04 0C00190C */  jal   osSetThreadPri
/* 009A08 80008E08 01802825 */   move  $a1, $t4
/* 009A0C 80008E0C 8FBF0024 */  lw    $ra, 0x24($sp)
.L80008E10:
/* 009A10 80008E10 8FB00020 */  lw    $s0, 0x20($sp)
/* 009A14 80008E14 27BD0030 */  addiu $sp, $sp, 0x30
/* 009A18 80008E18 03E00008 */  jr    $ra
/* 009A1C 80008E1C 00000000 */   nop   

glabel func_80008E20
/* 009A20 80008E20 27BDFFB0 */  addiu $sp, $sp, -0x50
/* 009A24 80008E24 AFBF0034 */  sw    $ra, 0x34($sp)
/* 009A28 80008E28 AFB70030 */  sw    $s7, 0x30($sp)
/* 009A2C 80008E2C 0080B825 */  move  $s7, $a0
/* 009A30 80008E30 AFB6002C */  sw    $s6, 0x2c($sp)
/* 009A34 80008E34 AFB50028 */  sw    $s5, 0x28($sp)
/* 009A38 80008E38 AFB40024 */  sw    $s4, 0x24($sp)
/* 009A3C 80008E3C AFB30020 */  sw    $s3, 0x20($sp)
/* 009A40 80008E40 AFB2001C */  sw    $s2, 0x1c($sp)
/* 009A44 80008E44 AFB10018 */  sw    $s1, 0x18($sp)
/* 009A48 80008E48 AFB00014 */  sw    $s0, 0x14($sp)
/* 009A4C 80008E4C 0C0023EC */  jal   func_80008FB0
/* 009A50 80008E50 AFA00044 */   sw    $zero, 0x44($sp)
/* 009A54 80008E54 94430002 */  lhu   $v1, 2($v0)
/* 009A58 80008E58 3C018001 */  lui   $at, %hi(D_80016D90) # $at, 0x8001
/* 009A5C 80008E5C 2416000E */  li    $s6, 14
/* 009A60 80008E60 14600004 */  bnez  $v1, .L80008E74
/* 009A64 80008E64 A4236D90 */   sh    $v1, %lo(D_80016D90)($at)
/* 009A68 80008E68 24030001 */  li    $v1, 1
/* 009A6C 80008E6C 3C018001 */  lui   $at, %hi(D_80016D90) # $at, 0x8001
/* 009A70 80008E70 A4236D90 */  sh    $v1, %lo(D_80016D90)($at)
.L80008E74:
/* 009A74 80008E74 3C138001 */  lui   $s3, %hi(D_80015AEC) # $s3, 0x8001
/* 009A78 80008E78 3C128001 */  lui   $s2, %hi(D_80015AE8) # $s2, 0x8001
/* 009A7C 80008E7C 3C118001 */  lui   $s1, %hi(D_80015AE0) # $s1, 0x8001
/* 009A80 80008E80 26315AE0 */  addiu $s1, %lo(D_80015AE0) # addiu $s1, $s1, 0x5ae0
/* 009A84 80008E84 26525AE8 */  addiu $s2, %lo(D_80015AE8) # addiu $s2, $s2, 0x5ae8
/* 009A88 80008E88 26735AEC */  addiu $s3, %lo(D_80015AEC) # addiu $s3, $s3, 0x5aec
/* 009A8C 80008E8C 2415000D */  li    $s5, 13
/* 009A90 80008E90 27B40044 */  addiu $s4, $sp, 0x44
.L80008E94:
/* 009A94 80008E94 8EE4000C */  lw    $a0, 0xc($s7)
.L80008E98:
/* 009A98 80008E98 02802825 */  move  $a1, $s4
/* 009A9C 80008E9C 0C000CA0 */  jal   osRecvMesg
/* 009AA0 80008EA0 24060001 */   li    $a2, 1
/* 009AA4 80008EA4 8FAE0044 */  lw    $t6, 0x44($sp)
/* 009AA8 80008EA8 95C30000 */  lhu   $v1, ($t6)
/* 009AAC 80008EAC 10750005 */  beq   $v1, $s5, .L80008EC4
/* 009AB0 80008EB0 00000000 */   nop   
/* 009AB4 80008EB4 1076002A */  beq   $v1, $s6, .L80008F60
/* 009AB8 80008EB8 00000000 */   nop   
/* 009ABC 80008EBC 1000FFF6 */  b     .L80008E98
/* 009AC0 80008EC0 8EE4000C */   lw    $a0, 0xc($s7)
.L80008EC4:
/* 009AC4 80008EC4 0C001D0C */  jal   func_80007430
/* 009AC8 80008EC8 00000000 */   nop   
/* 009ACC 80008ECC 3C038001 */  lui   $v1, %hi(D_8000FFFF) # $v1, 0x8001
/* 009AD0 80008ED0 94636D90 */  lhu   $v1, %lo(D_80016D90)($v1)
/* 009AD4 80008ED4 3C018001 */  lui   $at, %hi(D_80016D90) # $at, 0x8001
/* 009AD8 80008ED8 2463FFFF */  addiu $v1, %lo(D_8000FFFF) # addiu $v1, $v1, -1
/* 009ADC 80008EDC 306FFFFF */  andi  $t7, $v1, 0xffff
/* 009AE0 80008EE0 15E0000E */  bnez  $t7, .L80008F1C
/* 009AE4 80008EE4 A42F6D90 */   sh    $t7, %lo(D_80016D90)($at)
/* 009AE8 80008EE8 0C0023EC */  jal   func_80008FB0
/* 009AEC 80008EEC 00000000 */   nop   
/* 009AF0 80008EF0 8C580010 */  lw    $t8, 0x10($v0)
/* 009AF4 80008EF4 00408025 */  move  $s0, $v0
/* 009AF8 80008EF8 00003025 */  move  $a2, $zero
/* 009AFC 80008EFC 53000005 */  beql  $t8, $zero, .L80008F14
/* 009B00 80008F00 96030002 */   lhu   $v1, 2($s0)
/* 009B04 80008F04 8C440010 */  lw    $a0, 0x10($v0)
/* 009B08 80008F08 0C000C18 */  jal   osSendMesg
/* 009B0C 80008F0C 8C450014 */   lw    $a1, 0x14($v0)
/* 009B10 80008F10 96030002 */  lhu   $v1, 2($s0)
.L80008F14:
/* 009B14 80008F14 3C018001 */  lui   $at, %hi(D_80016D90) # $at, 0x8001
/* 009B18 80008F18 A4236D90 */  sh    $v1, %lo(D_80016D90)($at)
.L80008F1C:
/* 009B1C 80008F1C 8E790000 */  lw    $t9, ($s3)
/* 009B20 80008F20 8E500000 */  lw    $s0, ($s2)
/* 009B24 80008F24 27280001 */  addiu $t0, $t9, 1
/* 009B28 80008F28 0C001BA8 */  jal   osGetCount
/* 009B2C 80008F2C AE680000 */   sw    $t0, ($s3)
/* 009B30 80008F30 8E2D0004 */  lw    $t5, 4($s1)
/* 009B34 80008F34 00508023 */  subu  $s0, $v0, $s0
/* 009B38 80008F38 8E2C0000 */  lw    $t4, ($s1)
/* 009B3C 80008F3C 020D7821 */  addu  $t7, $s0, $t5
/* 009B40 80008F40 240A0000 */  li    $t2, 0
/* 009B44 80008F44 01ED082B */  sltu  $at, $t7, $t5
/* 009B48 80008F48 002A7021 */  addu  $t6, $at, $t2
/* 009B4C 80008F4C 01CC7021 */  addu  $t6, $t6, $t4
/* 009B50 80008F50 AE420000 */  sw    $v0, ($s2)
/* 009B54 80008F54 AE2E0000 */  sw    $t6, ($s1)
/* 009B58 80008F58 1000FFCE */  b     .L80008E94
/* 009B5C 80008F5C AE2F0004 */   sw    $t7, 4($s1)
.L80008F60:
/* 009B60 80008F60 0C001ABF */  jal   func_80006AFC
/* 009B64 80008F64 00000000 */   nop   
/* 009B68 80008F68 1000FFCB */  b     .L80008E98
/* 009B6C 80008F6C 8EE4000C */   lw    $a0, 0xc($s7)
/* 009B70 80008F70 00000000 */  nop   
/* 009B74 80008F74 00000000 */  nop   
/* 009B78 80008F78 00000000 */  nop   
/* 009B7C 80008F7C 00000000 */  nop   
/* 009B80 80008F80 8FBF0034 */  lw    $ra, 0x34($sp)
/* 009B84 80008F84 8FB00014 */  lw    $s0, 0x14($sp)
/* 009B88 80008F88 8FB10018 */  lw    $s1, 0x18($sp)
/* 009B8C 80008F8C 8FB2001C */  lw    $s2, 0x1c($sp)
/* 009B90 80008F90 8FB30020 */  lw    $s3, 0x20($sp)
/* 009B94 80008F94 8FB40024 */  lw    $s4, 0x24($sp)
/* 009B98 80008F98 8FB50028 */  lw    $s5, 0x28($sp)
/* 009B9C 80008F9C 8FB6002C */  lw    $s6, 0x2c($sp)
/* 009BA0 80008FA0 8FB70030 */  lw    $s7, 0x30($sp)
/* 009BA4 80008FA4 03E00008 */  jr    $ra
/* 009BA8 80008FA8 27BD0050 */   addiu $sp, $sp, 0x50
