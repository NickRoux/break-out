.section .text
.globl copy



copy:
	push {r0-r11,lr}

/*

	mov	r2, #50			// Height = 100 of the block height is basically number of rows i ?
	mov	r3, #100		// Width = 100 for this block Width is basically number of columns j ?
	mov	r4, #400		// index i in the fb ( where we will start copying at)
	mov	r5, #300
*/

	height	.req	r2
	width	.req	r3
	ycoor	.req	r4
	xcoor 	.req	r5	
// -----------------------------------------------------------------
	ldr	r6, [r0, #32]
	mov	r12, #2			// element size
	ldr	r11, =1024		// width of fb
	
	mov	r10, #0			// index i of the block and it starts at 0
	mov	r9, #0			// index j of the block and it starts at 0

	
draw:
	mul	r8, width, r10		// m*i for the block
	add	r8, r9			// (m*i)+j for the block
	mul	r8, r12			// offset for the block at [i] [j]
	//add	r8, r8, r8

	mul	r7, r11, ycoor		// m*i for the fb m in here should be the same as the block (the number of columns we are copying)
	add	r7, xcoor		// (m*i)+j for the fb
	mul	r7, r12			// offset for the fb at [i_fb][j_fb]
	//add	r7, r7, r7
	push	{r12}			// hiding r12 in the stack
	ldrh	r12, [r1, r8]
	cmp	r12, #0			// here we comparing what's in the array and check if it's black if so cpoy it in do, any other color won't be copied
	bne	don't
do:
	strh	r12, [r6, r7]
don't:
	pop	{r12}			// retrieving r12 from the stack

	add	r10, #1			// increment i by one of the block
	add	ycoor, #1		// increment i of the fb

	cmp	r10, height		// compare if r 12 is still less than the height
	blt	draw			
	sub	r10, height		// if i of the block is not less than the height we reset it bu subbing a 100 from it
	sub	ycoor, height		// and thus we reset i of the fb
	add	r9, #1			// we inc j of the block by 1
	add	xcoor, #1		// we inc j of the fb by 1

	cmp	r9, width		// check if i of the block is less than the width of the block
	blt	draw


test:

	pop	{r0-r11,pc}



	
