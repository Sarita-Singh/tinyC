	.file	"testFiles/ass6_20CS10020_20CS10053_test3.c"

#	Temporary and function variables:-

#	main
#	number1: -4
#	number2: -8
#	number3: -12
#	number4: -16
#	number5: -20
#	number6: -24
#	number7: -28
#	t10: -32
#	t11: -36
#	t12: -40
#	t13: -44
#	t14: -48
#	t15: -56
#	t16: -60
#	t17: -64
#	t18: -72
#	t19: -76
#	t20: -80
#	t21: -84
#	t22: -92
#	t23: -96
#	t24: -100
#	t25: -104
#	t26: -108
#	t27: -116
#	t28: -120
#	t29: -124
#	t3: -128
#	t30: -136
#	t31: -140
#	t32: -144
#	t33: -152
#	t34: -156
#	t36: -164
#	t37: -168
#	t38: -172
#	t39: -180
#	t4: -188
#	t40: -192
#	t42: -200
#	t43: -204
#	t44: -208
#	t45: -216
#	t46: -220
#	t47: -224
#	t49: -232
#	t5: -236
#	t50: -240
#	t51: -244
#	t52: -252
#	t53: -256
#	t54: -260
#	t6: -264
#	t7: -272
#	t8: -276
#	t9: -280
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8
#	some_func_for_testing
#	n: -4
#	t0: -12
#	t1: -16
#	t2: -20

	.section	.rodata
.LC0:
	.string	"Value passed to function: "
.LC1:
	.string	"\nNumber 1: "
.LC2:
	.string	"\n-(number1) = "
.LC3:
	.string	"\nNumber 2: "
.LC4:
	.string	"\nNumber 3: "
.LC5:
	.string	"\nn1 + number2 = "
.LC6:
	.string	"\nn1 * number2 = "
.LC7:
	.string	"\nn1 / number2 = "
.LC8:
	.string	"\nincrementing number1: "
.LC9:
	.string	"\nValue of number1 after function call: "
.LC10:
	.string	"\ndecrementing number1: "
.LC11:
	.string	"\nValue of number1 after function call: "
.LC12:
	.string	"\nincrement after function call: "
.LC13:
	.string	"\nValue of number1 after function call: "
.LC14:
	.string	"\n"
	.text
	.globl some_func_for_testing
	.type some_func_for_testing, @function
some_func_for_testing:
.LFB0:
	.cfi_startproc
	pushq %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq %rsp, %rbp
	.cfi_def_cfa_register 6
	subq $20, %rsp
	movl %esi, -4(%rbp)
	movq $.LC0, -12(%rbp)
	movq -12(%rbp), %rdi
	call printStr
	movl %eax, -16(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -20(%rbp)
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size some_func_for_testing, .-some_func_for_testing
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
	subq $280, %rsp
	movl $8, -128(%rbp)
	movl -128(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC1, -188(%rbp)
	movq -188(%rbp), %rdi
	call printStr
	movl %eax, -236(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -264(%rbp)
	movq $.LC2, -272(%rbp)
	movq -272(%rbp), %rdi
	call printStr
	movl %eax, -276(%rbp)
	movl -4(%rbp), %eax
	negl %eax
	movl %eax, -280(%rbp)
	movl -280(%rbp), %edi
	call printInt
	movl %eax, -32(%rbp)
	movl $11, -36(%rbp)
	movl -36(%rbp), %eax
	movl %eax, -8(%rbp)
	movl $18, -40(%rbp)
	movl -40(%rbp), %eax
	movl %eax, -12(%rbp)
	movl $9, -44(%rbp)
	movl -44(%rbp), %eax
	movl %eax, -16(%rbp)
	movl $222, -48(%rbp)
	movl -48(%rbp), %eax
	movl %eax, -20(%rbp)
	movq $.LC3, -56(%rbp)
	movq -56(%rbp), %rdi
	call printStr
	movl %eax, -60(%rbp)
	movl -8(%rbp), %edi
	call printInt
	movl %eax, -64(%rbp)
	movq $.LC4, -72(%rbp)
	movq -72(%rbp), %rdi
	call printStr
	movl %eax, -76(%rbp)
	movl -12(%rbp), %edi
	call printInt
	movl %eax, -80(%rbp)
	movl -4(%rbp), %eax
	addl -8(%rbp), %eax
	movl %eax, -84(%rbp)
	movl -84(%rbp), %eax
	movl %eax, -20(%rbp)
	movq $.LC5, -92(%rbp)
	movq -92(%rbp), %rdi
	call printStr
	movl %eax, -96(%rbp)
	movl -20(%rbp), %edi
	call printInt
	movl %eax, -100(%rbp)
	movl -4(%rbp), %eax
	imull -8(%rbp), %eax
	movl %eax, -104(%rbp)
	movl -104(%rbp), %eax
	movl %eax, -24(%rbp)
	movl -24(%rbp), %edi
	call printInt
	movl %eax, -108(%rbp)
	movq $.LC6, -116(%rbp)
	movq -116(%rbp), %rdi
	call printStr
	movl %eax, -120(%rbp)
	movl -4(%rbp), %eax
	cdq
	idivl -8(%rbp), %eax
	movl %eax, -124(%rbp)
	movl -124(%rbp), %eax
	movl %eax, -28(%rbp)
	movq $.LC7, -136(%rbp)
	movq -136(%rbp), %rdi
	call printStr
	movl %eax, -140(%rbp)
	movl -28(%rbp), %edi
	call printInt
	movl %eax, -144(%rbp)
	movq $.LC8, -152(%rbp)
	movq -152(%rbp), %rdi
	call printStr
	movl %eax, -156(%rbp)
	incl -4(%rbp)
	movl -4(%rbp), %edi
	call some_func_for_testing
	movq $.LC9, -164(%rbp)
	movq -164(%rbp), %rdi
	call printStr
	movl %eax, -168(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -172(%rbp)
	movq $.LC10, -180(%rbp)
	movq -180(%rbp), %rdi
	call printStr
	movl %eax, -192(%rbp)
	decl -4(%rbp)
	movl -4(%rbp), %edi
	call some_func_for_testing
	movq $.LC11, -200(%rbp)
	movq -200(%rbp), %rdi
	call printStr
	movl %eax, -204(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -208(%rbp)
	movq $.LC12, -216(%rbp)
	movq -216(%rbp), %rdi
	call printStr
	movl %eax, -220(%rbp)
	movl -4(%rbp), %eax
	movl %eax, -224(%rbp)
	incl -4(%rbp)
	movl -224(%rbp), %edi
	call some_func_for_testing
	movq $.LC13, -232(%rbp)
	movq -232(%rbp), %rdi
	call printStr
	movl %eax, -240(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -244(%rbp)
	movq $.LC14, -252(%rbp)
	movq -252(%rbp), %rdi
	call printStr
	movl %eax, -256(%rbp)
	movl $0, -260(%rbp)
	movl -260(%rbp), %eax
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size main, .-main
