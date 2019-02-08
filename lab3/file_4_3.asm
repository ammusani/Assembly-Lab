main:
	add $s0, $zero, 115
	add $s1, $zero, 98

	andi $s0, $s0, 112 		#AND masking bits at 5th, 6th, 7th position
	ori $s1, $s1, 80		#Or masking bits at 5th and 7th position
