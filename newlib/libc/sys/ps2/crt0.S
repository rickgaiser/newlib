	.set noreorder

#include "regs.S"

.text
	.p2align 4
	.global	_start
	.ent	_start
_start:

# Clear bss
zerobss:
	la	v0, _fbss
	la	v1, _end
3:
	nop
	nop
	nop
	sq	zero, (v0)
	sltu	t0, v0, v1
	bne	t0, zero, 3b
	addiu	v0, v0, 16


	/* Setup gp */
	la	gp, _gp

	/* Setup stack */
	la	t0, 0x2000000	/* 32MB */
	la	t1, K0BASE
	addu	t0, t0, t1
	/* Subtract enough for main's arguments */
	subu	t0, t0, 32
	move	sp, t0
	sw	sp, __stackbase

	/* Now setup arguments and call main() */
#	addiu	sp, sp, -4
	move	a0, zero
	jal	main
	nop
#	sw	ra, (sp)

#	lw	ra, (sp)
	jr	ra
#	addiu	sp, sp, 4

	.end	_start

	.global	_exit
	.ent	_exit
_exit:
	jr	ra
	nop

	.end	_exit

	.bss
	.align	6
	.global	__stackbase
__stackbase:
	.space	4
savedra:
	.space	4
_args_ptr:
	.space	4
	.align	4
