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
	.file	"hw03Lib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	getPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	getPixel, %function
getPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	ldrh	r0, [r3, r0]
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	getPixel, .-getPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	cmp	r2, #0
	ldrh	r6, [sp, #16]
	ble	.L8
	ldr	ip, .L17
	ldr	r4, [ip]
	add	r5, r2, r0
	add	r4, r4, r0, lsl #1
	add	ip, r3, r1
.L10:
	cmp	r3, #0
	movgt	r2, r1
	ble	.L14
.L12:
	cmp	r0, #239
	bgt	.L11
	cmp	r2, #159
	rsbls	lr, r2, r2, lsl #4
	lslls	lr, lr, #5
	strhls	r6, [lr, r4]	@ movhi
.L11:
	add	r2, r2, #1
	cmp	ip, r2
	bne	.L12
.L14:
	add	r0, r0, #1
	cmp	r0, r5
	add	r4, r4, #2
	bne	.L10
.L8:
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawBorderedRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBorderedRect, %function
drawBorderedRect:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r6, r2, #0
	ldrh	r9, [sp, #32]
	ldrh	r8, [sp, #36]
	ble	.L19
	mov	ip, r0
	mov	r4, #0
	ldr	r2, .L33
	ldr	r5, [r2]
	add	lr, r3, r1
	add	r5, r5, r0, lsl #1
.L21:
	cmp	r3, #0
	movgt	r2, r1
	subgt	r7, r6, r4
	ble	.L27
.L25:
	cmp	ip, #239
	bgt	.L22
	cmp	r2, #159
	bgt	.L22
	rsb	r0, r2, r2, lsl #4
	cmp	r4, #0
	lsl	r0, r0, #5
	beq	.L23
	cmp	r1, r2
	cmpne	r7, #1
	sub	r10, lr, r2
	beq	.L23
	cmp	r10, #1
	rsbne	r0, r2, r2, lsl #4
	lslne	r0, r0, #5
	strhne	r9, [r0, r5]	@ movhi
	beq	.L23
.L22:
	add	r2, r2, #1
	cmp	lr, r2
	bne	.L25
.L27:
	add	r4, r4, #1
	cmp	r6, r4
	add	ip, ip, #1
	add	r5, r5, #2
	bne	.L21
.L19:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L23:
	strh	r8, [r0, r5]	@ movhi
	b	.L22
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	drawBorderedRect, .-drawBorderedRect
	.align	2
	.global	drawPara
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPara, %function
drawPara:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	subs	r6, r3, #0
	sub	sp, sp, #12
	str	r2, [sp, #4]
	ldrh	r9, [sp, #40]
	ldrh	r4, [sp, #44]
	ldr	r3, [sp, #48]
	ble	.L35
	mov	lr, #0
	mov	ip, r2
	ldr	r2, .L47
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [r2]
	add	r1, r0, r1, lsl #4
	add	r8, r3, #240
	add	r5, r5, r1, lsl #1
	eor	r1, r3, r3, asr #31
	lsl	r8, r8, #1
	sub	r1, r1, r3, asr #31
.L37:
	cmp	ip, #0
	movgt	r2, r5
	movgt	r3, #0
	subgt	r7, r6, lr
	bgt	.L41
	b	.L43
.L38:
	add	r3, r3, #1
	cmp	ip, r3
	strh	r4, [r2]	@ movhi
	add	r2, r2, #2
	beq	.L43
.L41:
	cmp	r3, r1
	sub	r0, ip, r3
	blt	.L38
	cmp	lr, #0
	cmpne	r0, r1
	ble	.L38
	cmp	r7, #1
	strhgt	r9, [r2]	@ movhi
	ble	.L38
	add	r3, r3, #1
	cmp	ip, r3
	add	r2, r2, #2
	bne	.L41
.L43:
	add	lr, lr, #1
	cmp	r6, lr
	add	r5, r5, r8
	bne	.L37
.L35:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.size	drawPara, .-drawPara
	.global	__aeabi_idiv
	.align	2
	.global	drawParaVertical
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawParaVertical, %function
drawParaVertical:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldr	r10, [sp, #68]
	mov	fp, r3
	ldrh	r3, [sp, #56]
	cmp	r10, #0
	str	r0, [sp, #4]
	str	r3, [sp, #12]
	ldrh	r7, [sp, #60]
	beq	.L49
	cmp	fp, #0
	ble	.L49
	mov	r9, #0
	mov	r6, r9
	mov	r4, r2
	ldr	r2, .L63
	ldr	r5, [sp, #64]
	ldr	r3, [r2]
	rsb	r1, r1, r1, lsl #4
	cmp	r5, #0
	str	r3, [sp, #8]
	lsl	r8, r1, #4
	rsblt	r5, r5, #0
.L51:
	cmp	r4, #0
	ble	.L57
	ldr	r3, .L63+4
	mov	r1, r10
	mov	r0, r9
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #4]
	add	ip, r3, r8
	ldr	r3, [sp, #8]
	add	r0, ip, r0
	mov	r2, #0
	add	r0, r3, r0, lsl #1
	sub	lr, fp, r6
	b	.L55
.L52:
	add	r2, r2, #1
	cmp	r4, r2
	strh	r7, [r0]	@ movhi
	add	r0, r0, #2
	beq	.L57
.L55:
	cmp	r2, r5
	sub	r3, r4, r2
	blt	.L52
	cmp	r6, #0
	cmpne	r3, r5
	ble	.L52
	cmp	lr, #1
	ble	.L52
	ldr	r3, [sp, #12]
	add	r2, r2, #1
	cmp	r4, r2
	strh	r3, [r0]	@ movhi
	add	r0, r0, #2
	bne	.L55
.L57:
	ldr	r3, [sp, #64]
	add	r6, r6, #1
	cmp	fp, r6
	add	r8, r8, #240
	add	r9, r9, r3
	bne	.L51
.L49:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.word	__aeabi_idiv
	.size	drawParaVertical, .-drawParaVertical
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	ip, #0
	sub	sp, sp, #8
	add	r2, sp, #4
	orr	r0, r0, r0, lsl #16
	str	r0, [sp, #4]
	ldr	r1, .L67
	str	ip, [r3, #220]
	str	r2, [r3, #212]
	ldr	r2, .L67+4
	ldr	r1, [r1]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.word	-2063578368
	.size	fillScreen, .-fillScreen
	.align	2
	.global	fillImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillImage, %function
fillImage:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	ip, #67108864
	mov	lr, #0
	subs	r4, r3, #0
	str	lr, [ip, #220]
	ble	.L69
	ldr	r3, .L75
	add	r4, r1, r4
	ldr	r3, [r3]
	rsb	r5, r1, r1, lsl #4
	rsb	r4, r4, r4, lsl #4
	add	r1, r0, r4, lsl #4
	ldr	lr, [sp, #12]
	add	r0, r0, r5, lsl #4
	add	r1, r3, r1, lsl #1
	add	r3, r3, r0, lsl #1
	orr	r0, r2, #-2147483648
	lsl	r2, r2, #1
.L71:
	str	lr, [ip, #212]
	str	r3, [ip, #216]
	add	r3, r3, #480
	cmp	r3, r1
	str	r0, [ip, #220]
	add	lr, lr, r2
	bne	.L71
.L69:
	pop	{r4, r5, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.size	fillImage, .-fillImage
	.align	2
	.global	fillPartImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillPartImage, %function
fillPartImage:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, [sp, #28]
	cmp	r6, #0
	ldr	r5, [sp, #24]
	ldr	r4, [sp, #32]
	ble	.L77
	mla	r3, r4, r3, r2
	ldr	r2, .L85
	ldr	r8, [r2]
	add	r8, r8, r0, lsl #1
	mov	r0, #0
	add	ip, r3, r5
	ldr	r3, [sp, #36]
	rsb	r1, r1, r1, lsl #4
	rsb	r7, r5, r5, lsl #31
	add	ip, r3, ip, lsl #1
	lsl	lr, r1, #4
	lsl	r4, r4, #1
	lsl	r7, r7, #1
.L79:
	cmp	r5, #0
	addgt	r3, ip, r7
	addgt	r2, r8, lr, lsl #1
	ble	.L82
.L80:
	ldrh	r1, [r3], #2
	cmp	r3, ip
	strh	r1, [r2], #2	@ movhi
	bne	.L80
.L82:
	add	r0, r0, #1
	cmp	r6, r0
	add	lr, lr, #240
	add	ip, ip, r4
	bne	.L79
.L77:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.size	fillPartImage, .-fillPartImage
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L88:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L88
	mov	r2, #67108864
.L89:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L89
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	abs
	.syntax unified
	.arm
	.fpu softvfp
	.type	abs, %function
abs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	rsblt	r0, r0, #0
	bx	lr
	.size	abs, .-abs
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	cmp	r3, ip
	blt	.L98
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L98
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L98
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L98:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
