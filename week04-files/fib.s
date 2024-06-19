main:
	# Args:		void
	# Returns:	$v0: int
	# Frame:	[$ra]		# Anything pushed to the stack, in order
	# Uses:		[$v0, $a0, $t0]
	# Clobbers:	[$t0, $v0, $a0]
	#
	# Locals:
	#	- $t0: int n
	#
	# Structure:
	#
	# -> [prologue]
	# -> [body]
	#    -> count_loop
	#       -> [init]
	#       -> [cond]
	#	-> [body]
	#	-> [step]
	#	-> [end]
	# -> [epilogue]

main__prologue:
	push	$ra

main__body:

	li	$v0, 4				# syscall 4: print_string
	la	$a0, main__enter_number_msg	#
	syscall					# printf(...)

	li	$v0, 5				# syscall 5: read_int
	syscall					# 
	move	$t0, $v0			# scanf("%d", &n);

	li	$v0, 4				# syscall 4: print_string
	la	$a0, main__result_msg_1		#
	syscall					# printf(...)

	li	$v0, 1				# syscall 1: print_int
	move	$a0, $t0			#
	syscall					# printf("%d", n);

	li	$v0, 4				# syscall 4: print_string
	la	$a0, main__result_msg_2		#
	syscall					# printf(...)


	move	$a0, $t0			# Load argument for fib call
	jal	fib				# fib(n)

	move	$a0, $v0
	li	$v0, 1				# syscall 1: print_int
	syscall					#

	li	$v0, 11
	li	$a0, '\n'
	syscall


main__epilogue:

	pop	$ra

	li	$v0, 0				# 
	jr	$ra				# return 0;

#####################################################################################
# .TEXT fib
	.text
fib:
	# Args:
	#	- $a0: int n
	# Returns:
	#	- $v0: int
	#
	# Frame:	[$ra, $s0, $s1]
	# Uses:		[$s0, $s1, $a0, $v0]
	# Clobbers:	[$a0, $v0]
	#
	# Locals:
	#	- $s0: int n
	#	- $s1: int fib(n - 1)
	#
	# Structure:
	# -> [prologue]
	# -> [body]
	#    -> n_ge_2 
	# -> [epilogue]

fib__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1

fib__body:
	move	$s0, $a0
	bge	$a0, 2, fib__n_ge_2	# if (n >= 2) goto fib__n_ge_2;

	move	$v0, $a0		#
	b	fib__epilogue		# return n;

fib__n_ge_2:

	addi	$a0, $a0, -1
	jal	fib			# 
	move	$s1, $v0		# fib(n - 1)

	addi	$a0, $s0, -2
	jal	fib

	add	$v0, $v0, $s1		# return fib(n - 2) + fib(n - 1);


fib__epilogue:
	pop	$s1
	pop	$s0
	pop	$ra
	end
	
	jr	$ra










	.data
main__enter_number_msg:
	.asciiz	"Enter a number:"

main__result_msg_1:
	.asciiz	"Fibonacci of "

main__result_msg_2:
	.asciiz	" is "