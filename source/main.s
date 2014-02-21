/*
*	Assignment 3 - ARM, miniUART interface.
*	Authors: Ragheeb Barheyan, Nik Ryzhenkov
*	
*/

.section    .init
.globl     _start


_start:
    b       main
    


.section .text




main:
    mov     sp, #0x8000
	
	bl		EnableJTAG





//------------------------------

//Initialize SNES connection as well as frame buffer for feuter use 

	bl	SNESinit
	bl	InitFrameBuffer
// r6 is a globabl value holdiong return value of the SNESinit initialization sequence
// r7 is the global value holding return value of the InitFrameBuffer sequence
// note, r7 is heavily used. avoid using r7 without saving register window
	ldr	r6, [r0,#32]
	mov	r7, r0

//starting the game sequence
restart:

//start of the game and initialization of main game logic functionalities
	bl	NewGame				
	
//creation of the menue screen and initialization of the logic required to run the menue screen
	bl	menuScreen
	
//r12 hold return value associated with the choice made in the menue screen
// upon comparin, determines to either start over or to proceed to end sequence
	cmp	r12, #1
	bne	restart
	


haltLoop$:
	b		haltLoop$


.section .data

//------------------------------------------------
	
/*general use input buffer*/
buff:
	.rep	256
	.byte	0x0
	.endr	
_unknown_command:
	.asciz "Unknown Command \r\n>>>"
breakout:
	.asciz"breakout" 				// 8 characters long
