	.file	"testFiles/ass6_20CS10020_20CS10053_test4.c"

#	Temporary and function variables:-

#	main
#	num1: -4
#	num2: -8
#	num3: -12
#	t0: -16
#	t1: -24
#	t10: -28
#	t11: -32
#	t12: -40
#	t13: -44
#	t14: -52
#	t15: -56
#	t16: -64
#	t17: -68
#	t18: -76
#	t19: -80
#	t2: -84
#	t20: -92
#	t21: -96
#	t22: -100
#	t23: -108
#	t24: -112
#	t25: -120
#	t26: -124
#	t27: -132
#	t28: -136
#	t29: -144
#	t3: -148
#	t30: -152
#	t31: -160
#	t32: -164
#	t33: -168
#	t34: -172
#	t35: -176
#	t36: -184
#	t37: -188
#	t38: -196
#	t39: -200
#	t4: -204
#	t40: -212
#	t41: -216
#	t42: -220
#	t43: -224
#	t44: -232
#	t45: -236
#	t46: -244
#	t47: -248
#	t48: -256
#	t49: -260
#	t5: -268
#	t50: -276
#	t51: -280
#	t52: -288
#	t53: -292
#	t54: -300
#	t55: -304
#	t56: -312
#	t57: -316
#	t58: -320
#	t6: -324
#	t7: -328
#	t8: -332
#	t9: -340
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"\nNumber 1: "
.LC1:
	.string	"\nNumber 2: "
.LC2:
	.string	"\nNumber 3: "
.LC3:
	.string	"\nTesting operators \n"
.LC4:
	.string	"\nTesting != operator: "
.LC5:
	.string	"Pass"
.LC6:
	.string	"Fail"
.LC7:
	.string	"\nTesting == operator:"
.LC8:
	.string	"Pass"
.LC9:
	.string	"Fail"
.LC10:
	.string	"\nTesting < operator: "
.LC11:
	.string	"Pass"
.LC12:
	.string	"Fail"
.LC13:
	.string	"\nTesting > operator: "
.LC14:
	.string	"Pass"
.LC15:
	.string	"Fail"
.LC16:
	.string	"\nTesting <= operator: "
.LC17:
	.string	"Pass"
.LC18:
	.string	"Fail"
.LC19:
	.string	"\nTesting <= operator: "
.LC20:
	.string	"Pass"
.LC21:
	.string	"Fail"
.LC22:
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
	subq $340, %rsp
	movl $809, -16(%rbp)
	movl -16(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC0, -24(%rbp)
	movq -24(%rbp), %rdi
	call printStr
	movl %eax, -84(%rbp)
	movl -4(%rbp), %edi
	call printInt
	movl %eax, -148(%rbp)
	movl $1109, -204(%rbp)
	movl -204(%rbp), %eax
	movl %eax, -8(%rbp)
	movq $.LC1, -268(%rbp)
	movq -268(%rbp), %rdi
	call printStr
	movl %eax, -324(%rbp)
	movl -8(%rbp), %edi
	call printInt
	movl %eax, -328(%rbp)
	movl $1809, -332(%rbp)
	movl -332(%rbp), %eax
	movl %eax, -12(%rbp)
	movq $.LC2, -340(%rbp)
	movq -340(%rbp), %rdi
	call printStr
	movl %eax, -28(%rbp)
	movl -12(%rbp), %edi
	call printInt
	movl %eax, -32(%rbp)
	movq $.LC3, -40(%rbp)
	movq -40(%rbp), %rdi
	call printStr
	movl %eax, -44(%rbp)
	movq $.LC4, -52(%rbp)
	movq -52(%rbp), %rdi
	call printStr
	movl %eax, -56(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	jne .L1
	jmp .L2
.L1:
	movq $.LC5, -64(%rbp)
	movq -64(%rbp), %rdi
	call printStr
	movl %eax, -68(%rbp)
	jmp .L3
.L2:
	movq $.LC6, -76(%rbp)
	movq -76(%rbp), %rdi
	call printStr
	movl %eax, -80(%rbp)
.L3:
	movq $.LC7, -92(%rbp)
	movq -92(%rbp), %rdi
	call printStr
	movl %eax, -96(%rbp)
	movl $809, -100(%rbp)
	movl -100(%rbp), %eax
	movl %eax, -8(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	je .L4
	jmp .L5
.L4:
	movq $.LC8, -108(%rbp)
	movq -108(%rbp), %rdi
	call printStr
	movl %eax, -112(%rbp)
	jmp .L6
.L5:
	movq $.LC9, -120(%rbp)
	movq -120(%rbp), %rdi
	call printStr
	movl %eax, -124(%rbp)
.L6:
	movq $.LC10, -132(%rbp)
	movq -132(%rbp), %rdi
	call printStr
	movl %eax, -136(%rbp)
	movl -12(%rbp), %eax
	movl %eax, -8(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	jl .L7
	jmp .L8
.L7:
	movq $.LC11, -144(%rbp)
	movq -144(%rbp), %rdi
	call printStr
	movl %eax, -152(%rbp)
	jmp .L9
.L8:
	movq $.LC12, -160(%rbp)
	movq -160(%rbp), %rdi
	call printStr
	movl %eax, -164(%rbp)
.L9:
	movl $81, -168(%rbp)
	movl -168(%rbp), %eax
	negl %eax
	movl %eax, -172(%rbp)
	movl -172(%rbp), %eax
	movl %eax, -8(%rbp)
	movl $7, -176(%rbp)
	movl -176(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC13, -184(%rbp)
	movq -184(%rbp), %rdi
	call printStr
	movl %eax, -188(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	jg .L10
	jmp .L11
.L10:
	movq $.LC14, -196(%rbp)
	movq -196(%rbp), %rdi
	call printStr
	movl %eax, -200(%rbp)
	jmp .L12
.L11:
	movq $.LC15, -212(%rbp)
	movq -212(%rbp), %rdi
	call printStr
	movl %eax, -216(%rbp)
.L12:
	movl $81, -220(%rbp)
	movl -220(%rbp), %eax
	negl %eax
	movl %eax, -224(%rbp)
	movl -224(%rbp), %eax
	movl %eax, -4(%rbp)
	movq $.LC16, -232(%rbp)
	movq -232(%rbp), %rdi
	call printStr
	movl %eax, -236(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	jle .L13
	jmp .L14
.L13:
	movq $.LC17, -244(%rbp)
	movq -244(%rbp), %rdi
	call printStr
	movl %eax, -248(%rbp)
	jmp .L15
.L14:
	movq $.LC18, -256(%rbp)
	movq -256(%rbp), %rdi
	call printStr
	movl %eax, -260(%rbp)
.L15:
	movq $.LC19, -276(%rbp)
	movq -276(%rbp), %rdi
	call printStr
	movl %eax, -280(%rbp)
	movl -8(%rbp), %eax
	cmpl %eax, -4(%rbp)
	jle .L16
	jmp .L17
.L16:
	movq $.LC20, -288(%rbp)
	movq -288(%rbp), %rdi
	call printStr
	movl %eax, -292(%rbp)
	jmp .L18
.L17:
	movq $.LC21, -300(%rbp)
	movq -300(%rbp), %rdi
	call printStr
	movl %eax, -304(%rbp)
.L18:
	movq $.LC22, -312(%rbp)
	movq -312(%rbp), %rdi
	call printStr
	movl %eax, -316(%rbp)
	movl $0, -320(%rbp)
	movl -320(%rbp), %eax
	movq %rbp, %rsp
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size main, .-main
