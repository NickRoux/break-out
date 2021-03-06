.section .text
.globl movePeddleL



movePeddleL:
	push {r0, r2-r11, lr}

	ycoor	.req	r0
	xcoor	.req	r1
	height	.req	r2
	width	.req	r3
	colour	.req	r5
	addr 	.req	r4
	
	ldr	r10, =12					// the pixel that the peddle should be in is 10 which is the beginning of the wall on the left, the reason we are using 12 instead of 10 is because we move the peddle two pixels at a time
	//ldr 	xcoor, =370					// depening on the position of the peddle this will change

undraw:
	cmp	xcoor, r10					// xcoor of the peddle is less than 12 don't move the peddle anymore
	blt	donemoving
	add	xcoor, #118
	ldr 	ycoor, =737					// y coordinate = 737
	ldr 	height, =15					// height = 15
	ldr 	width, =2					// width 2
	ldr 	colour, =0xff11					// and a colour
	ldr	addr, [r7, #32]
	bl	drawShape					// undraw the specified pixel of the peddle, instead of undrawing the whole thing,allows for smooth movement
	

	sub	xcoor, #120					// sub x by 120 this two pixels before the initial xcoor of the peddle

draw:
	ldr	colour, =0x00ff					// draw the peddle with the new pixels on the left
	ldr	ycoor, =737
	ldr	height, =15
	ldr	width, =2					// fill the two pixels, how many time you do it makes the peddle move left
	bl	drawShape
	


donemoving:
	pop {r0, r2-r11, pc}					// the reason we are not poping r1 is to return the updated xcoor of the peddle


