# Constants
N_ELEMENTS = 5

main:

	# Locals:
	#	- $t0: int i
	#	- $t1: temporary calc
	#	- $t2: 4 * i
	
loop__init:

	li	$t0, 0			# int i = 0;

loop__cond:
	bge	$t0, N_ELEMENTS, loop__end

loop__body:

	li	$v0, 1			# syscall 1: print_int
	# TODO: grab value from array
	# la	$t1, array		# (array
	# mul	$t2, $t0, 4		#  + 4 *
	# add	$t1, $t1, $t2		#  i)
	# lw	$a0, ($t1)		# 

	mul	$t2, $t0, 4		# (4 * i)
	sw	$a0, array($t2)		# + array


	syscall				# putchar(array[i]);

	li	$v0, 11			# syscall 11: print_char
	li	$a0, '\n'		#
	syscall				# putchar('\n');

loop__step:
	addi	$t0, $t0, 1		# i++;
	b	loop__cond		# goto loop__cond;


loop__end:

	li	$v0, 0
	jr	$ra			# return 0;

	.data

array:
	.word	3, 1, 4, 1, 5
