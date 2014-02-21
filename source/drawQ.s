.section .text
.globl drawQ

drawQ:

	push {lr}

	ldr	r7, =Q
	mov	r1, #8			// index i
	mov	r2, #0			// index j
	mov	r3, #100		// m (number of columns)
	mov	r5, #2			// element size
	mov	r6, #0x0
drawQ1:
	mul	r4, r3, r1		// m*i
	add	r4, r2			// (m*i)+j
	mul	r4, r5

	strh	r6, [r7, r4]
	add	r1, #1
	cmp	r1, #50
	blt	drawQ1
	cmp	r2, #65
	beq	doneQ
	mov	r2, #65
	mov	r1, #8
	
	b	drawQ1

doneQ:

	ldr	r7, =Q
	mov	r1, #8			// index i
	mov	r2, #0			// index j
	mov	r3, #100		// m (number of columns)
	mov	r5, #2			// element size
	mov	r6, #0x0
drawQ2:
	mul	r4, r3, r1		// m*i
	add	r4, r2			// (m*i)+j
	mul	r4, r5

	strh	r6, [r7, r4]
	add	r2, #1
	cmp	r2, #65
	blt	drawQ2
	cmp	r1, #49
	beq	doneQ1
	mov	r1, #49
	mov	r2, #0
	
	b	drawQ2

doneQ1:

	ldr	r7, =Q
	mov	r1, #43			// index i
	mov	r2, #53			// index j
	mov	r3, #100		// m (number of columns)
	mov	r5, #2			// element size
	mov	r6, #0x0

drawQ3:
	
	mul	r4, r3, r1		// m*i
	add	r4, r2			// (m*i)+j
	mul	r4, r5
	
	strh	r6, [r7, r4]
	add	r2, #1
	cmp	r2, #80
	blt	drawQ3	


	ldr	r1, =Q
	pop {pc}

.section .data

Q:
	.rep	5000
	.hword	0xffff
	.endr
