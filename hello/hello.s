
.text                           # section declaration

	# we must export the entry point to the ELF linker or
	.global _start              # loader. They conventionally recognize _start as their
	# entry point. Use ld -e foo to override the default.

_start:

	# write our string to stdout

	movq    $len,%rdx           # third argument: message length
	movq    $msg,%rcx           # second argument: pointer to message to write
	movq    $1,%rbx             # first argument: file handle (stdout)
	movq    $4,%rax             # system call number (sys_write)
	int     $0x80               # call kernel

	# and exit

	movq    $0,%rbx             # first argument: exit code
	movq    $1,%rax             # system call number (sys_exit)
	int     $0x80               # call kernel

.data                           # section declaration
msg:
	.ascii    "Hello, world!\n"   # our dear string
	len = . - msg                 # length of our dear string
