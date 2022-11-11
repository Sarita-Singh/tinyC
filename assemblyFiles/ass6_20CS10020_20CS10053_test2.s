	.file	"testFiles/ass6_20CS10020_20CS10053_test2.c"

#	Temporary and function variables:-

#	main
#	a: -4
#	b: -8
#	e: -16
#	t0: -24
#	t1: -28
#	t10: -32
#	t11: -36
#	t12: -44
#	t13: -48
#	t14: -52
#	t15: -60
#	t16: -64
#	t17: -68
#	t2: -72
#	t3: -80
#	t4: -88
#	t5: -92
#	t6: -100
#	t7: -104
#	t8: -108
#	t9: -116
#	printInt
#	num: -4
#	printStr
#	c: -8
#	readInt
#	eP: -8
#	some_function
#	a: -8

	.section	.rodata
.LC0:
	.string	"\nTesting Functions\n"
.LC1:
	.string	"\nPassing parameter to function :\n        int some_function(int *a)    \n"
.LC2:
	.string	"\nValue passed to function: "
.LC3:
	.string	"\n"
.LC4:
	.string	"\nAddress returned from function: "
.LC5:
	.string	"\n"
	.text
	.globl some_function
	.type some_function, @function
some_function:
.LFB0:
	.cfi_startproc
	pushq %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq %rsp, %rbp
	.cfi_def_cfa_register 6
	subq $8, %rsp
	movq %rsi, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size some_function, .-some_function
	.globl main
	.type main, @function
main:
.LFB1:
	.cfi_startproc
	pushq %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq %rsp, %rbp
	.cfi_def_cfa_register 6
	subq $116, %rsp
	movq $.LC0, -24(%rbp)
	movq -24(%rbp), %rdi
	call printStr
	movl %eax, -28(%rbp)
	movl $3, -72(%rbp)
	movl -72(%rbp), %eax
	movl %eax, -8(%rbp)
	leaq -8(%rbp), %rax
	movq %rax, -80(%rbp)
	movq -80(%rbp), %rax
	movq %rax, -16(%rbp)
	movq $.LC1, -88(%rbp)
	movq -88(%rbp), %rdi
	call printStr
	movl %eax, -92(%rbp)
	movq $.LC2, -100(%rbp)
	movq -100(%rbp), %rdi
	call printStr
	movl %eax, -104(%rbp)
	movl -8(%rbp), %edi
	call printInt
	movl %eax, -108(%rbp)
	movq $.LC3, -116(%rbp)
	movq -116(%rbp), %rdi
	call printStr
	movl %eax, -32(%rbp)
	movl -8(%rbp), %edi
	call some_function
	movl %eax, -36(%rbp)
	movl -36(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC4, -44(%rbp)
	movq -44(%rbp), %rdi
	call printStr
	movl %eax, -48(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -52(%rbp)
	movq $.LC5, -60(%rbp)
	movq -60(%rbp), %rdi
	call printStr
	movl %eax, -64(%rbp)
	movl $0, -68(%rbp)
	movl -68(%rbp), %eax
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size main, .-main
