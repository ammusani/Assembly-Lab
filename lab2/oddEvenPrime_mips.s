	.file	1 "oddEvenPrime.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	li	$2,11			# 0xb
	sw	$2,0($fp)
	lw	$3,0($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L2
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L2:
	beq	$2,$0,$L4
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L5
	nop

	b	$L3
	nop

$L4:
	lw	$3,0($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L6
	nop

	lw	$2,0($fp)
	addiu	$2,$2,2
	sw	$2,0($fp)
	b	$L3
	nop

$L6:
	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
	b	$L3
	nop

$L5:
	li	$2,1			# 0x1
	sw	$2,4($fp)
	li	$2,3			# 0x3
	sw	$2,8($fp)
	b	$L8
	nop

$L11:
	lw	$3,0($fp)
	lw	$2,8($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L9
	nop

	sw	$0,4($fp)
	b	$L10
	nop

$L9:
	lw	$2,8($fp)
	addiu	$2,$2,2
	sw	$2,8($fp)
$L8:
	lw	$2,0($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	addiu	$3,$2,1
	lw	$2,8($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L11
	nop

$L10:
	lw	$2,4($fp)
	beq	$2,$0,$L12
	nop

	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
	b	$L21
	nop

$L12:
	sw	$0,4($fp)
	b	$L14
	nop

$L19:
	li	$2,1			# 0x1
	sw	$2,4($fp)
	li	$2,3			# 0x3
	sw	$2,12($fp)
	b	$L15
	nop

$L18:
	lw	$3,0($fp)
	lw	$2,12($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L16
	nop

	sw	$0,4($fp)
	b	$L17
	nop

$L16:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L15:
	lw	$2,0($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,12($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L18
	nop

$L17:
	lw	$2,0($fp)
	addiu	$2,$2,2
	sw	$2,0($fp)
$L14:
	lw	$2,4($fp)
	beq	$2,$0,$L19
	nop

$L21:
	nop
$L3:
	move	$2,$0
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
