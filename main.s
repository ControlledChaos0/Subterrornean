	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SUB\000"
	.align	2
.LC1:
	.ascii	"TERROR\000"
	.align	2
.LC2:
	.ascii	"NEAN\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	mov	r0, #10
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, r5
	mov	r1, #76
	mov	r0, #81
	ldr	r2, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #31
	mov	r1, #76
	mov	r0, #99
	ldr	r2, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+20
	mov	r1, #76
	mov	r0, #135
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L7
	ldr	r3, .L7+4
	strh	r0, [r1]	@ movhi
	ldr	r1, .L7+8
	ldrh	r0, [r3, #48]
	ldr	r3, .L7+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Score:\000"
	.align	2
.LC4:
	.ascii	"0\000"
	.text
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L13
	ldr	r0, [r4]
	cmp	r0, #0
	sub	sp, sp, #12
	beq	.L12
.L10:
	mov	r3, #156
	ldr	r1, .L13+4
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #42
	mov	r1, #2
	ldr	r5, .L13+8
	mov	lr, pc
	bx	r5
	ldr	r5, .L13+12
	mov	r1, #70
	mov	r0, #2
	ldr	r3, .L13+16
	ldr	r2, .L13+20
	mov	lr, pc
	bx	r5
	mov	r1, #80
	mov	r0, #16
	ldr	r2, .L13+24
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L13+28
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L12:
	ldr	r3, .L13+32
	mov	lr, pc
	bx	r3
	b	.L10
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	backgroundBitmap
	.word	fillImage
	.word	drawString
	.word	32767
	.word	.LC3
	.word	.LC4
	.word	drawGame
	.word	fillScreen
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L22
	ldr	r4, .L22+4
	ldrh	r2, [r2]
	ldrh	r3, [r4, #4]
	tst	r2, #8
	add	r3, r3, #1
	strh	r3, [r4, #4]	@ movhi
	beq	.L15
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
.L15:
	pop	{r4, lr}
	bx	lr
.L21:
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrsh	r0, [r4, #4]
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	.LANCHOR0
	.word	buttons
	.word	initializeGame
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #0
	mov	lr, #2
	ldr	r5, .L26
	sub	sp, sp, #8
	ldr	ip, .L26+4
	ldr	r4, .L26+8
	mov	r3, #25
	mov	r2, #7
	mov	r1, #67
	mov	r0, #111
	stm	sp, {r5, r6}
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #25
	mov	r2, #7
	mov	r1, #67
	mov	r0, #129
	stm	sp, {r5, r6}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	32767
	.word	.LANCHOR0
	.word	drawBorderedRect
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+8
	ldr	r3, [r3]
	cmp	r3, #3
	ldrne	r3, .L39+12
	movne	lr, pc
	bxne	r3
.L29:
	ldr	r3, .L39+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L28
	ldr	r3, .L39+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L28:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToPause
.L40:
	.align	2
.L39:
	.word	updateGame
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #0
	ldr	r1, .L57+4
	ldr	r10, .L57+8
	strh	r1, [r2]	@ movhi
	ldr	r9, .L57+12
	ldrh	r2, [r10, #48]
	ldr	fp, .L57+16
	ldr	r4, .L57+20
	ldr	r7, .L57+24
	strh	r2, [r9]	@ movhi
	strh	r3, [fp]	@ movhi
	ldr	r6, .L57+28
	mov	lr, pc
	bx	r7
	ldr	r5, .L57+32
	ldrh	r1, [r9]
	ldr	r2, [r4]
	ldr	r8, .L57+36
.L43:
	strh	r1, [fp]	@ movhi
	ldrh	r3, [r10, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L50
.L45:
	.word	.L48
	.word	.L47
	.word	.L46
	.word	.L44
.L44:
	tst	r1, #8
	beq	.L50
	tst	r3, #8
	beq	.L56
.L50:
	mov	r1, r3
	b	.L43
.L46:
	tst	r1, #4
	beq	.L50
	tst	r3, #4
	bne	.L50
	mov	lr, pc
	bx	r8
	ldr	r2, [r4]
	ldrh	r1, [r9]
	b	.L43
.L48:
	mov	lr, pc
	bx	r6
	ldr	r2, [r4]
	ldrh	r1, [r9]
	b	.L43
.L47:
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
	ldrh	r1, [r9]
	b	.L43
.L56:
	mov	lr, pc
	bx	r7
	ldr	r2, [r4]
	ldrh	r1, [r9]
	b	.L43
.L58:
	.align	2
.L57:
	.word	mgba_open
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.word	goToStart
	.word	start
	.word	game
	.word	goToGame
	.size	main, .-main
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L64
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L64+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToGame
.L65:
	.align	2
.L64:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"YOU DIED\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #156
	push	{r4, r5, lr}
	ldr	r1, .L72
	sub	sp, sp, #28
	mov	r2, r3
	mov	r0, #42
	str	r1, [sp]
	ldr	r4, .L72+4
	mov	r1, #2
	mov	lr, pc
	bx	r4
	ldr	r5, .L72+8
	mov	r0, #29
	ldr	r3, .L72+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+16
	mov	r1, #76
	mov	r0, #96
	ldr	r3, .L72+20
	ldr	r2, .L72+24
	mov	lr, pc
	bx	r4
	mov	r2, #10
	ldr	r3, .L72+28
	ldr	r0, [r5]
	add	r1, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	cmp	r3, #9
	add	r2, sp, #12
	ble	.L71
	cmp	r3, #99
	mov	r1, #85
	movle	r0, #114
	movgt	r0, #111
	ldr	r3, .L72+20
	mov	lr, pc
	bx	r4
.L68:
	mov	r2, #3
	ldr	r3, .L72+32
	str	r2, [r3]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L71:
	mov	r1, #85
	mov	r0, #117
	ldr	r3, .L72+20
	mov	lr, pc
	bx	r4
	b	.L68
.L73:
	.align	2
.L72:
	.word	backgroundBitmap
	.word	fillImage
	.word	score
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC5
	.word	itoa
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L79
	ldrh	r1, [r3]
	ldr	r3, .L79+4
	tst	r1, #8
	str	r2, [r3]
	bxeq	lr
	ldr	r3, .L79+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L80:
	.align	2
.L79:
	.word	oldButtons
	.word	.LANCHOR0
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	updateGame
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L87
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	drawGame
	.size	draw, .-draw
	.global	spiderStraight
	.global	spiderDiagonal
	.global	vCounter
	.global	state
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.data
	.align	2
	.type	spiderStraight, %object
	.size	spiderStraight, 64
spiderStraight:
	.ascii	"\001\000\000\000\000\000\000\001\000\001\001\001\001"
	.ascii	"\001\001\000\000\000\001\001\001\001\000\000\001\001"
	.ascii	"\001\001\001\001\001\001\000\000\002\001\001\002\000"
	.ascii	"\000\001\001\000\002\002\000\001\001\000\001\000\001"
	.ascii	"\001\000\001\000\001\000\000\000\000\000\000\001"
	.type	spiderDiagonal, %object
	.size	spiderDiagonal, 64
spiderDiagonal:
	.ascii	"\000\000\001\000\000\001\000\000\000\000\001\001\001"
	.ascii	"\001\000\001\001\001\001\001\001\000\001\000\000\001"
	.ascii	"\001\001\001\001\000\000\000\001\001\001\001\002\001"
	.ascii	"\001\001\001\000\001\002\001\002\000\000\000\001\000"
	.ascii	"\001\002\000\000\000\001\000\000\001\000\000\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	vCounter, %object
	.size	vCounter, 2
vCounter:
	.space	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
