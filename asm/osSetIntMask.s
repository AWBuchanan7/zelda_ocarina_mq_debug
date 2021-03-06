.include "macro.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purposee registers

.section .text

.align 4

glabel osSetIntMask
/* 005B40 80004F40 400C6000 */  mfc0  $t4, $12
/* 005B44 80004F44 3182FF01 */  andi  $v0, $t4, 0xff01
/* 005B48 80004F48 3C088001 */  lui   $t0, %hi(D_8000AD00) # $t0, 0x8001
/* 005B4C 80004F4C 2508AD00 */  addiu $t0, %lo(D_8000AD00) # addiu $t0, $t0, -0x5300
/* 005B50 80004F50 8D0B0000 */  lw    $t3, ($t0)
/* 005B54 80004F54 2401FFFF */  li    $at, -1
/* 005B58 80004F58 01614026 */  xor   $t0, $t3, $at
/* 005B5C 80004F5C 3108FF00 */  andi  $t0, $t0, 0xff00
/* 005B60 80004F60 00481025 */  or    $v0, $v0, $t0
/* 005B64 80004F64 3C0AA430 */  lui   $t2, %hi(D_A430000C) # $t2, 0xa430
/* 005B68 80004F68 8D4A000C */  lw    $t2, %lo(D_A430000C)($t2)
/* 005B6C 80004F6C 11400005 */  beqz  $t2, .L80004F84
/* 005B70 80004F70 000B4C02 */   srl   $t1, $t3, 0x10
/* 005B74 80004F74 2401FFFF */  li    $at, -1
/* 005B78 80004F78 01214826 */  xor   $t1, $t1, $at
/* 005B7C 80004F7C 3129003F */  andi  $t1, $t1, 0x3f
/* 005B80 80004F80 01495025 */  or    $t2, $t2, $t1
.L80004F84:
/* 005B84 80004F84 000A5400 */  sll   $t2, $t2, 0x10
/* 005B88 80004F88 004A1025 */  or    $v0, $v0, $t2
/* 005B8C 80004F8C 3C01003F */  lui   $at, 0x3f
/* 005B90 80004F90 00814024 */  and   $t0, $a0, $at
/* 005B94 80004F94 010B4024 */  and   $t0, $t0, $t3
/* 005B98 80004F98 000843C2 */  srl   $t0, $t0, 0xf
/* 005B9C 80004F9C 3C0A8001 */  lui   $t2, 0x8001
/* 005BA0 80004FA0 01485021 */  addu  $t2, $t2, $t0
/* 005BA4 80004FA4 954A2160 */  lhu   $t2, 0x2160($t2)
/* 005BA8 80004FA8 3C01A430 */  lui   $at, %hi(D_A430000C) # $at, 0xa430
/* 005BAC 80004FAC AC2A000C */  sw    $t2, %lo(D_A430000C)($at)
/* 005BB0 80004FB0 3088FF01 */  andi  $t0, $a0, 0xff01
/* 005BB4 80004FB4 3169FF00 */  andi  $t1, $t3, 0xff00
/* 005BB8 80004FB8 01094024 */  and   $t0, $t0, $t1
/* 005BBC 80004FBC 3C01FFFF */  lui   $at, (0xFFFF00FF >> 16) # lui $at, 0xffff
/* 005BC0 80004FC0 342100FF */  ori   $at, (0xFFFF00FF & 0xFFFF) # ori $at, $at, 0xff
/* 005BC4 80004FC4 01816024 */  and   $t4, $t4, $at
/* 005BC8 80004FC8 01886025 */  or    $t4, $t4, $t0
/* 005BCC 80004FCC 408C6000 */  mtc0  $t4, $12
/* 005BD0 80004FD0 00000000 */  nop   
/* 005BD4 80004FD4 00000000 */  nop   
/* 005BD8 80004FD8 03E00008 */  jr    $ra
/* 005BDC 80004FDC 00000000 */   nop   
