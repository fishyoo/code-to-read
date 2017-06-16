	.file	"TinyHelloWorld.c"
.globl str
	.section	.rodata
.LC0:
	.string	"Hello world!\n"
	.data
	.align 4
	.type	str, @object
	.size	str, 4
str:
	.long	.LC0
	.text
.globl print
	.type	print, @function
print:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	str, %eax
#APP
	movl $13,%edx 
	movl %eax,%ecx  
	movl $0,%ebx  
	
#NO_APP
	popl	%ebx
	popl	%ebp
	ret
	.size	print, .-print
.globl exit
	.type	exit, @function
exit:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	exit, .-exit
.globl nomain
	.type	nomain, @function
nomain:
	pushl	%ebp
	movl	%esp, %ebp
	call	print
	call	exit
	popl	%ebp
	ret
	.size	nomain, .-nomain
	.ident	"GCC: (GNU) 4.1.2 (Ubuntu 4.1.2-0ubuntu4)"
	.section	.note.GNU-stack,"",@progbits
