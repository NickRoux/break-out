.section    .text
.globl     GetGPIO

// source of this file is the Lecture slides

	.equ	GPIOFSEL0,	0x20200000
GetGPIO:
	push	{ r1-r11, lr}
	
	pinNum	.req	r4
	mov	pinNum,	r0

	ldr	r0, =GPIOFSEL0
	gpioAdr	.req	r0
	
	pinBank	.req	r3
	lsr	pinBank, pinNum, #5
	lsl	pinBank, #2
	add	gpioAdr, pinBank
	.unreq	pinBank

	and	pinNum, #31
	getBit	.req	r3
	mov	getBit, #1
	lsl	getBit, pinNum
	.unreq	pinNum

	pinVal	.req	r4
	ldr	pinVal, [gpioAdr, #52]
	and	pinVal,	getBit
	.unreq	gpioAdr
	.unreq	getBit


	teq	pinVal, #0
	moveq	r0, #0
	movne	r0, #1

	.unreq	pinVal

	pop	{r1-r11, pc}
