.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purposee registers

.section .text

.align 4

glabel func_80009160
/* 009D60 80009160 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 009D64 80009164 AFBF0014 */  sw    $ra, 0x14($sp)
/* 009D68 80009168 0C001CA0 */  jal   __osDisableInt
/* 009D6C 8000916C E7AC0018 */   swc1  $f12, 0x18($sp)
/* 009D70 80009170 3C068001 */  li    $a2, 0x80010000 # 0.000000
/* 009D74 80009174 24C6AF04 */  addiu $a2, %lo(D_8000AF04) # addiu $a2, $a2, -0x50fc
/* 009D78 80009178 8CCE0000 */  lw    $t6, ($a2)
/* 009D7C 8000917C C7A40018 */  lwc1  $f4, 0x18($sp)
/* 009D80 80009180 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* 009D84 80009184 00402025 */  move  $a0, $v0
/* 009D88 80009188 E5C40018 */  swc1  $f4, 0x18($t6)
/* 009D8C 8000918C 8CC30000 */  lw    $v1, ($a2)
/* 009D90 80009190 946F0000 */  lhu   $t7, ($v1)
/* 009D94 80009194 35F80002 */  ori   $t8, $t7, 2
/* 009D98 80009198 A4780000 */  sh    $t8, ($v1)
/* 009D9C 8000919C 8CC30000 */  lw    $v1, ($a2)
/* 009DA0 800091A0 8C790008 */  lw    $t9, 8($v1)
/* 009DA4 800091A4 C4660018 */  lwc1  $f6, 0x18($v1)
/* 009DA8 800091A8 8F250020 */  lw    $a1, 0x20($t9)
/* 009DAC 800091AC 30A80FFF */  andi  $t0, $a1, 0xfff
/* 009DB0 800091B0 44884000 */  mtc1  $t0, $f8
/* 009DB4 800091B4 05010004 */  bgez  $t0, .L800091C8
/* 009DB8 800091B8 468042A0 */   cvt.s.w $f10, $f8
/* 009DBC 800091BC 44818000 */  mtc1  $at, $f16
/* 009DC0 800091C0 00000000 */  nop   
/* 009DC4 800091C4 46105280 */  add.s $f10, $f10, $f16
.L800091C8:
/* 009DC8 800091C8 460A3482 */  mul.s $f18, $f6, $f10
/* 009DCC 800091CC 240A0001 */  li    $t2, 1
/* 009DD0 800091D0 3C014F00 */  li    $at, 0x4F000000 # 0.000000
/* 009DD4 800091D4 4449F800 */  cfc1  $t1, $31
/* 009DD8 800091D8 44CAF800 */  ctc1  $t2, $31
/* 009DDC 800091DC 00000000 */  nop   
/* 009DE0 800091E0 46009124 */  cvt.w.s $f4, $f18
/* 009DE4 800091E4 444AF800 */  cfc1  $t2, $31
/* 009DE8 800091E8 00000000 */  nop   
/* 009DEC 800091EC 314A0078 */  andi  $t2, $t2, 0x78
/* 009DF0 800091F0 51400013 */  beql  $t2, $zero, .L80009240
/* 009DF4 800091F4 440A2000 */   mfc1  $t2, $f4
/* 009DF8 800091F8 44812000 */  mtc1  $at, $f4
/* 009DFC 800091FC 240A0001 */  li    $t2, 1
/* 009E00 80009200 46049101 */  sub.s $f4, $f18, $f4
/* 009E04 80009204 44CAF800 */  ctc1  $t2, $31
/* 009E08 80009208 00000000 */  nop   
/* 009E0C 8000920C 46002124 */  cvt.w.s $f4, $f4
/* 009E10 80009210 444AF800 */  cfc1  $t2, $31
/* 009E14 80009214 00000000 */  nop   
/* 009E18 80009218 314A0078 */  andi  $t2, $t2, 0x78
/* 009E1C 8000921C 15400005 */  bnez  $t2, .L80009234
/* 009E20 80009220 00000000 */   nop   
/* 009E24 80009224 440A2000 */  mfc1  $t2, $f4
/* 009E28 80009228 3C018000 */  lui   $at, 0x8000
/* 009E2C 8000922C 10000007 */  b     .L8000924C
/* 009E30 80009230 01415025 */   or    $t2, $t2, $at
.L80009234:
/* 009E34 80009234 10000005 */  b     .L8000924C
/* 009E38 80009238 240AFFFF */   li    $t2, -1
/* 009E3C 8000923C 440A2000 */  mfc1  $t2, $f4
.L80009240:
/* 009E40 80009240 00000000 */  nop   
/* 009E44 80009244 0540FFFB */  bltz  $t2, .L80009234
/* 009E48 80009248 00000000 */   nop   
.L8000924C:
/* 009E4C 8000924C 44C9F800 */  ctc1  $t1, $31
/* 009E50 80009250 314B0FFF */  andi  $t3, $t2, 0xfff
/* 009E54 80009254 0C001CBC */  jal   func_800072F0
/* 009E58 80009258 AC6B0020 */   sw    $t3, 0x20($v1)
/* 009E5C 8000925C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 009E60 80009260 27BD0018 */  addiu $sp, $sp, 0x18
/* 009E64 80009264 03E00008 */  jr    $ra
/* 009E68 80009268 00000000 */   nop   
