	.file	"testFiles/ass6_20CS10020_20CS10053_test1.c"

#	Temporary and function variables:-

#	main
#	a: -4
#	b: -8
#	p: -12
#	t0: -20
#	t1: -24
#	t10: -32
#	t11: -36
#	t12: -40
#	t13: -48
#	t14: -52
#	t15: -56
#	t16: -64
#	t17: -68
#	t18: -72
#	t19: -76
#	t2: -84
#	t20: -92
#	t21: -96
#	t22: -100
#	t3: -104
#	t4: -112
#	t5: -116
#	t6: -124
#	t7: -128
#	t8: -136
#	t9: -140
#	printInt
#	num: -4
#	printStr
#	c: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"\nMultiplying two numbers\n"
.LC1:
	.string	"\nEnter first number: "
.LC2:
	.string	"\nEnter second number: "
.LC3:
	.string	"\nNum 1 = "
.LC4:
	.string	"\nNum 2 = "
.LC5:
	.string	"\nProduct = "
.LC6:
	.string	"\n"
	.text
	.globl main
	.type main, @function
main:
.LFB0:
	.cfi_startproc
	pushq %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq %rsp, %rbp
	.cfi_def_cfa_register 6
	subq $140, %rsp
	movq $.LC0, -20(%rbp)
	movq -20(%rbp), %rdi
	call printStr
	movl %eax, -24(%rbp)
	movq $.LC1, -84(%rbp)
	movq -84(%rbp), %rdi
	call printStr
	movl %eax, -104(%rbp)
	leaq -12(%rbp), %rax
	movq %rax, -112(%rbp)
	movq -112(%rbp), %rdi
	call readInt
	movl %eax, -116(%rbp)
	movl -116(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC2, -124(%rbp)
	movq -124(%rbp), %rdi
	call printStr
	movl %eax, -128(%rbp)
	leaq -12(%rbp), %rax
	movq %rax, -136(%rbp)
	movq -136(%rbp), %rdi
	call readInt
	movl %eax, -140(%rbp)
	movl -140(%rbp), %eax
	movl %eax, -8(%rbp)
	movq $.LC3, -32(%rbp)
	movq -32(%rbp), %rdi
	call printStr
	movl %eax, -36(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -40(%rbp)
	movq $.LC4, -48(%rbp)
	movq -48(%rbp), %rdi
	call printStr
	movl %eax, -52(%rbp)
	movl -8(%rbp), %edi
	call printInt
	movl %eax, -56(%rbp)
	movq $.LC5, -64(%rbp)
	movq -64(%rbp), %rdi
	call printStr
	movl %eax, -68(%rbp)
	movl -4(%rbp), %eax
	imull -8(%rbp), %eax
	movl %eax, -72(%rbp)
	movl -72(%rbp), %edi
	call printInt
	movl %eax, -76(%rbp)
	movq $.LC6, -92(%rbp)
	movq -92(%rbp), %rdi
	call printStr
	movl %eax, -96(%rbp)
	movl $0, -100(%rbp)
	movl -100(%rbp), %eax
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size main, .-main
