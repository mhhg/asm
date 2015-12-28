	.section .data

prompt_str:
	.ascii "Enter Your Name: "
pstr_end:
	.set STR_SIZE, pstr_end - prompt_str

greet_str:
	.ascii "Hello "

gstr_end:
	.set GSTR_SIZE, gstr_end - greet_str

	.section .bss

	// Reserve 32 bytes of memory
	.lcomm  buff, 32

	// A macro with two parameters
	//  implements the write system call
	.macro write str, str_size
	movq  $4, %rax
	movq  $1, %rbx
	movq  \str, %rcx
	movq  \str_size, %rdx
	int     $0x80
	.endm


	// Implements the read system call
	.macro read buff, buff_size
	movq  $3, %rax
	movq  $0, %rbx
	movq  \buff, %rcx
	movq  \buff_size, %rdx
	int     $0x80
	.endm

	.section .text

	.globl _start

_start:
	write $prompt_str, $STR_SIZE
	read  $buff, $32

	// Read returns the length in rax
	pushq %rax

	// Print the hello text
	write $greet_str, $GSTR_SIZE

	popq  %rdx

	// edx = length returned by read
	write $buff, %rdx

_exit:
	movq  $1, %rax
	movq  $0, %rbx
    int     $0x80
