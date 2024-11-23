	.file	"asgn5.c" # This is the file where the code comes from
	.text # This is where the "text" or code section begins
	.globl	myAddTwoNumbersFunction # This makes myAddTwoNumbersFunction visivle to other files and modules
	.type	myAddTwoNumbersFunction, @function # This specifies myAddTwoNumbersFunctions as a function
myAddTwoNumbersFunction: # This is beginning of the myAddTwoNumbersFunction function
.LFB0: # This marks the beginning of the function prologue
	.cfi_startproc
	pushq	%rbp # This pushes the value of the base pointer register onto stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp # This moves value of stack sack pointer register into the base pointer register
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp) # This moves value of "edi" register into memory
	movl	%esi, -8(%rbp) # This moves value of "esi" register into memory
	movl	-4(%rbp), %edx # This moves the value from memory int "edx" register
	movl	-8(%rbp), %eax # This moves the value from memory into "eax" register
	addl	%edx, %eax # This adds values in the "edx" and "eax" registers and stores this result in "eax"
	popq	%rbp # This pops the value from the stack into base pointer register
	.cfi_def_cfa 7, 8
	ret # Returns from function
	.cfi_endproc
.LFE0: # This marks the end of the function
	.size	myAddTwoNumbersFunction, .-myAddTwoNumbersFunction # This specifies the size of myAddTwoNumbersFunction function
	.section	.rodata # This indicates the beginning of the read-only data section
.LC0: # This is a label for a string literal
	.string	"The answer is %d\n" # This defines a string literal
	.text # This indicates beginning of the code section
	.globl	main # This makes "main" function visile to other modules or files
	.type	main, @function # This specifies "main" as a function
main: # This defines the begining of "main" as a function
.LFB1: # This This marks the beginning of the "main" function block
	.cfi_startproc
	pushq	%rbp # This pushes value of base pointer  register onto stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp #This moves value of stack pointer register into the base pointer register
	.cfi_def_cfa_register 6
	subq	$16, %rsp # This subtracts 16 from stack pointer register to make space for local variables
	movl	$10, -12(%rbp) # This moves value 10 into memory
	movl	$7, -8(%rbp) # This moves value 7 into memory
	movl	$0, -4(%rbp) # This moves value 0 into memory relative to base pointer
	movl	-8(%rbp), %edx # This moves the value from memory into "edx" register
	movl	-12(%rbp), %eax # This moves the value from memory into "eax" register
	movl	%edx, %esi # This moves value from "edx" into "esi"
	movl	%eax, %edi # This moves value from "eax" onto "edi"
	call	myAddTwoNumbersFunction # This calls the myAddTwoNumbersFunction function
	movl	%eax, -4(%rbp) # This moves return value of myAddTwoNumbersFunction into memory
	movl	-4(%rbp), %eax # This  moves value from memory into "eax" register
	movl	%eax, %esi # This moves value from "eax" into "esi" 
	leaq	.LC0(%rip), %rdi # This loads the address of string literal ".LCO" into "rdi"
	movl	$0, %eax # This moves the value 0 into "eax"
	call	printf@PLT # This calls "printf" function
	movl	$0, %eax # This moves value 0 into "eax"
	leave # This releases stack frame of "main" function
	.cfi_def_cfa 7, 8
	ret # This returns from "main" function
	.cfi_endproc
.LFE1: # This marks the end of the function block
	.size	main, .-main # This specifies size of "main" function block
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0" # This provides information about the compiler used to generate the assembly code
	.section	.note.GNU-stack,"",@progbits # This indicates whether the stack needs to be executable or not
