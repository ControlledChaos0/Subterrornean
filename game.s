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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpider.part.0, %function
drawSpider.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L64
	ldr	r3, [r0, #16]
	ldr	r2, [r2]
	cmp	r3, r2
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r1, [r0, #20]
	mov	r4, r0
	beq	.L57
	rsbs	r0, r3, #1
	movcc	r0, #0
	cmp	r2, r1
	cmpeq	r3, #0
	beq	.L35
	cmn	r3, r2
	rsb	r2, r2, #0
	beq	.L58
	cmp	r2, r1
	movne	r2, #0
	andeq	r2, r0, #1
	cmp	r2, #0
	bne	.L18
.L19:
	ldr	r6, [r4, #24]
	subs	r6, r6, #1
	bmi	.L1
	ldr	r2, [r4, #28]
	ldr	r8, .L64+4
.L27:
	cmp	r2, #0
	movgt	r5, #0
	rsbgt	r7, r6, #7
	bgt	.L31
	b	.L33
.L59:
	cmp	r3, #2
	bne	.L30
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #31
	add	r1, r5, r1
	add	r0, r6, r0
	mov	lr, pc
	bx	r8
	ldr	r2, [r4, #28]
.L30:
	add	r5, r5, #1
	cmp	r2, r5
	ble	.L33
.L31:
	ldr	r3, [r4, #32]
	mla	r3, r7, r2, r3
	ldrb	r3, [r3, r5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L59
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #0
	add	r1, r5, r1
	add	r0, r6, r0
	mov	lr, pc
	bx	r8
	ldr	r2, [r4, #28]
	add	r5, r5, #1
	cmp	r2, r5
	bgt	.L31
.L33:
	subs	r6, r6, #1
	bcs	.L27
.L1:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	ble	.L1
	mov	r6, #0
	ldr	r2, [r4, #24]
	ldr	r7, .L64+4
.L4:
	cmp	r2, #0
	movgt	r5, #0
	bgt	.L9
	b	.L10
.L60:
	cmp	r3, #2
	bne	.L8
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #31
	add	r1, r5, r1
	add	r0, r6, r0
	mov	lr, pc
	bx	r7
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #24]
.L8:
	add	r5, r5, #1
	cmp	r5, r2
	bge	.L10
.L9:
	ldr	r3, [r4, #32]
	mla	r3, r1, r5, r3
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L60
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r1, r5, r1
	mov	r2, #0
	add	r0, r6, r0
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #24]
	add	r5, r5, #1
	cmp	r5, r2
	ldr	r1, [r4, #28]
	blt	.L9
.L10:
	add	r6, r6, #1
	cmp	r6, r1
	blt	.L4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	cmp	r3, r1
	beq	.L35
	cmn	r1, r3
	moveq	r3, #1
	movne	r3, #0
	cmp	r1, #0
	movne	r1, r3
	moveq	r1, #1
	cmp	r1, #0
	beq	.L19
	ldr	r2, [r4, #24]
	cmp	r2, #0
	ble	.L1
	mov	r6, #0
	ldr	r7, .L64+4
.L16:
	ldr	r3, [r4, #28]
	subs	r5, r3, #1
	bpl	.L15
	b	.L11
.L62:
	cmp	r3, #2
	bne	.L14
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #31
	add	r1, r5, r1
	add	r0, r6, r0
	mov	lr, pc
	bx	r7
.L14:
	subs	r5, r5, #1
	bcc	.L61
.L53:
	ldr	r3, [r4, #28]
.L15:
	ldr	r2, [r4, #32]
	mla	r3, r6, r3, r2
	rsb	r2, r5, #7
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L62
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r1, r5, r1
	mov	r2, #0
	add	r0, r6, r0
	mov	lr, pc
	bx	r7
	subs	r5, r5, #1
	bcs	.L53
.L61:
	ldr	r2, [r4, #24]
.L11:
	add	r6, r6, #1
	cmp	r6, r2
	blt	.L16
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L58:
	cmp	r3, r1
	bne	.L19
.L18:
	ldr	r6, [r4, #28]
	subs	r6, r6, #1
	bmi	.L1
	ldr	r8, .L64+4
.L21:
	ldr	r5, [r4, #24]
	subs	r5, r5, #1
	rsbpl	r7, r6, #7
	bpl	.L25
	b	.L26
.L63:
	cmp	r3, #2
	bne	.L24
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #31
	add	r1, r5, r1
	add	r0, r6, r0
	mov	lr, pc
	bx	r8
.L24:
	subs	r5, r5, #1
	bcc	.L26
.L25:
	add	r1, r4, #28
	ldm	r1, {r1, r2}
	rsb	r3, r5, #7
	mla	r3, r1, r3, r2
	ldrb	r3, [r3, r7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L63
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	add	r1, r5, r1
	mov	r2, #0
	add	r0, r6, r0
	mov	lr, pc
	bx	r8
	subs	r5, r5, #1
	bcs	.L25
.L26:
	subs	r6, r6, #1
	bcs	.L21
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.word	setPixel
	.size	drawSpider.part.0, .-drawSpider.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpider.part.0, %function
updateSpider.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L93
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r3, r2
	movgt	r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strgt	r3, [r0, #16]
	sub	sp, sp, #16
	bgt	.L68
	add	r3, r3, #5
	cmp	r2, r3
	mvngt	r3, #0
	movle	r3, #0
	str	r3, [r0, #16]
.L68:
	ldr	r1, [r1]
	ldr	r3, [r5]
	cmp	r1, r3
	movge	r1, #1
	strge	r1, [r5, #20]
	bge	.L71
	add	r1, r1, #6
	cmp	r3, r1
	mvngt	r1, #0
	movle	r1, #0
	str	r1, [r5, #20]
.L71:
	ldr	r1, .L93+4
	ldr	r1, [r1]
	cmp	r1, #0
	str	r2, [r5, #12]
	str	r3, [r5, #8]
	bne	.L89
	ldr	r7, .L93+8
.L73:
	ldr	r3, [r7, #20]
	cmp	r3, #0
	ble	.L66
	mov	r6, #0
	ldr	r4, .L93+12
	ldr	r10, .L93+16
	ldr	r9, .L93+20
	ldr	r8, .L93+24
	b	.L81
.L79:
	ldr	r3, [r7, #20]
	cmp	r6, r3
	add	r4, r4, #40
	bge	.L66
.L81:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r6, r6, #1
	beq	.L79
	add	r0, r5, #24
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L79
	mov	r3, #0
	mov	r0, #1
	str	r3, [r4, #32]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r0, [r4, #36]
	ldr	r1, [r9]
	ldr	r2, [r8]
	str	r3, [r5, #36]
	ldr	r3, [r7, #20]
	sub	r1, r1, #1
	add	r2, r2, r0
	cmp	r6, r3
	str	r1, [r9]
	str	r0, [r5, #40]
	str	r2, [r8]
	add	r4, r4, #40
	blt	.L81
.L66:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L89:
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	cmp	r0, #0
	cmpne	r1, #0
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r5, #4]
	ldr	r7, .L93+8
	str	r3, [r5]
	ldr	r2, [r5, #32]
	bne	.L91
	ldr	r3, [r7, #4]
	cmp	r3, r2
	beq	.L92
.L76:
	str	r3, [r5, #32]
	b	.L73
.L91:
	ldr	r3, [r7, #12]
	cmp	r3, r2
	bne	.L76
	ldr	r3, [r7, #16]
	str	r3, [r5, #32]
	b	.L73
.L92:
	ldr	r3, [r7, #8]
	str	r3, [r5, #32]
	b	.L73
.L94:
	.align	2
.L93:
	.word	player
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	bullets
	.word	collision
	.word	spiderActive
	.word	score
	.size	updateSpider.part.0, .-updateSpider.part.0
	.align	2
	.global	difficulty
	.syntax unified
	.arm
	.fpu softvfp
	.type	difficulty, %function
difficulty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L105
	ldr	r3, [r3]
	cmp	r3, #50
	ldrls	pc, [pc, r3, asl #2]
	b	.L95
.L98:
	.word	.L104
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L103
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L102
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L101
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L100
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L99
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L95
	.word	.L97
.L97:
	mov	r0, #10
	mov	r2, #75
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
.L95:
	bx	lr
.L104:
	mov	r0, #2
	mov	r2, #500
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L103:
	mov	r0, #3
	mov	r2, #400
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L102:
	mov	r0, #4
	mov	r2, #300
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L101:
	mov	r0, #5
	mov	r2, #200
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L100:
	mov	r0, #6
	mov	r2, #150
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L99:
	mov	r0, #8
	mov	r2, #100
	ldr	r1, .L105+4
	ldr	r3, .L105+8
	str	r0, [r1]
	str	r2, [r3]
	bx	lr
.L106:
	.align	2
.L105:
	.word	score
	.word	spiderLimit
	.word	spiderRand
	.size	difficulty, .-difficulty
	.align	2
	.global	initializePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #80
	mov	r5, #1
	mov	lr, #7
	mov	r2, #120
	mov	ip, #5
	mov	r0, #0
	ldr	r4, .L109
	ldr	r3, .L109+4
	ldr	r4, [r4, #24]
	str	r5, [r3, #16]
	str	r4, [r3, #28]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #32]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	.LANCHOR0
	.word	player
	.size	initializePlayer, .-initializePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r10, .L124
	ldr	r9, .L124+4
	ldm	r10, {r7, fp}
	ldr	r6, .L124+8
.L112:
	mov	r4, #0
	ldr	r8, .L124+12
.L120:
	ldr	r3, [r10, #28]
	add	r2, r4, r4, lsl #2
	add	r3, r3, r2
	ldrb	r3, [r3, r5]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L113
.L115:
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L114
.L114:
	mov	r2, r9
	mov	r0, fp
	add	r1, r7, r4
	mov	lr, pc
	bx	r6
.L113:
	add	r4, r4, #1
	cmp	r4, #7
	bne	.L120
	add	r5, r5, #1
	cmp	r5, #5
	add	fp, fp, #1
	bne	.L112
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L116:
	mov	r2, #0
	mov	r0, fp
	add	r1, r7, r4
	mov	lr, pc
	bx	r6
	b	.L113
.L117:
	mov	r2, r8
	mov	r0, fp
	add	r1, r7, r4
	mov	lr, pc
	bx	r6
	b	.L113
.L119:
	mov	r2, #20480
	mov	r0, fp
	add	r1, r7, r4
	mov	lr, pc
	bx	r6
	b	.L113
.L118:
	mov	r0, fp
	ldr	r2, .L124+16
	add	r1, r7, r4
	mov	lr, pc
	bx	r6
	b	.L113
.L125:
	.align	2
.L124:
	.word	player
	.word	10338
	.word	setPixel
	.word	9620
	.word	17148
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initializeBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBullet, %function
initializeBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L130
	add	r0, r3, #240
.L127:
	str	r2, [r3, #4]
	str	r2, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L127
	bx	lr
.L131:
	.align	2
.L130:
	.word	bullets
	.size	initializeBullet, .-initializeBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r1, [r0]
	ldr	r2, .L141
	ldr	r0, [r0, #4]
	ldr	r3, .L141+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	32767
	.word	setPixel
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	ip, [r0, #4]
	ldr	r1, [r0]
	ldr	r2, [r0, #24]
	ldr	r3, [r0, #28]
	add	r2, ip, r2
	add	r3, r1, r3
	push	{r4, lr}
	sub	lr, r2, #50
	sub	r4, r3, #8
	cmp	lr, #137
	cmpls	r4, #144
	str	ip, [r0, #12]
	str	r2, [r0, #4]
	str	r1, [r0, #8]
	str	r3, [r0]
	bls	.L143
	mov	r3, #0
	mov	r2, #1
	str	r3, [r0, #32]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r2, [r0, #36]
.L143:
	pop	{r4, lr}
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L172
	ldr	r0, [r3, #20]
	cmp	r0, #0
	bxle	lr
	ldr	ip, .L172+4
	mov	r3, #0
	mov	r2, ip
	b	.L163
.L156:
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, #40
	bxeq	lr
.L163:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L156
	ldr	r2, .L172+8
	ldr	r1, [r2, #32]
	str	lr, [sp, #-4]!
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L171
.L159:
	.word	.L162
	.word	.L161
	.word	.L160
	.word	.L158
.L158:
	mvn	lr, #1
	ldm	r2, {r0, r1}
	add	r2, r3, r3, lsl #2
	add	r0, r0, #3
	str	r0, [ip, r2, lsl #3]
	add	r1, r1, #2
	add	r2, ip, r2, lsl #3
	str	r1, [r2, #4]
	str	lr, [r2, #28]
.L171:
	lsl	r2, r3, #2
.L157:
	mov	r1, #1
	add	r3, r2, r3
	add	ip, ip, r3, lsl #3
	str	r1, [ip, #32]
	ldr	lr, [sp], #4
	bx	lr
.L160:
	mov	lr, #2
	ldm	r2, {r0, r1}
	add	r2, r3, r3, lsl lr
	add	r0, r0, #3
	str	r0, [ip, r2, lsl #3]
	add	r1, r1, lr
	add	r2, ip, r2, lsl #3
	str	r1, [r2, #4]
	str	lr, [r2, #28]
	lsl	r2, r3, lr
	b	.L157
.L162:
	mvn	r0, #1
	ldm	r2, {r1, lr}
	add	r2, r3, r3, lsl #2
	add	r1, r1, #3
	str	r1, [ip, r2, lsl #3]
	add	r2, ip, r2, lsl #3
	str	lr, [r2, #4]
	str	r0, [r2, #24]
	lsl	r2, r3, #2
	b	.L157
.L161:
	mov	lr, #2
	ldm	r2, {r0, r1}
	add	r2, r3, r3, lsl lr
	add	r0, r0, #3
	str	r0, [ip, r2, lsl #3]
	add	r1, r1, #4
	add	r2, ip, r2, lsl #3
	str	r1, [r2, #4]
	str	lr, [r2, #24]
	lsl	r2, r3, lr
	b	.L157
.L173:
	.align	2
.L172:
	.word	.LANCHOR0
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L233
	ldr	r3, .L233+4
	ldrh	r2, [r2]
	ldm	r3, {r0, r1}
	tst	r2, #32
	str	lr, [sp, #-4]!
	str	r1, [r3, #12]
	str	r0, [r3, #8]
	beq	.L175
	ldr	ip, .L233+8
	ldrh	ip, [ip]
	tst	ip, #32
	bne	.L175
.L176:
	mov	ip, #0
	cmp	r1, #56
	ldr	lr, .L233+12
	str	ip, [r3, #32]
	ldrgt	ip, [r3, #16]
	ldr	lr, [lr, #24]
	subgt	r1, r1, ip
	str	lr, [r3, #28]
	strgt	r1, [r3, #4]
.L177:
	tst	r2, #16
	beq	.L179
	ldr	r1, .L233+8
	ldrh	r1, [r1]
	tst	r1, #16
	bne	.L179
.L180:
	mov	ip, #1
	ldr	r1, [r3, #4]
	ldr	lr, .L233+12
	cmp	r1, #178
	str	ip, [r3, #32]
	ldrle	ip, [r3, #16]
	ldr	lr, [lr, #28]
	addle	r1, ip, r1
	str	lr, [r3, #28]
	strle	r1, [r3, #4]
.L181:
	tst	r2, #128
	beq	.L183
	ldr	r1, .L233+8
	ldrh	r1, [r1]
	tst	r1, #128
	bne	.L183
.L184:
	mov	r1, #2
	cmp	r0, #135
	ldr	ip, .L233+12
	str	r1, [r3, #32]
	ldrle	r1, [r3, #16]
	ldr	ip, [ip, #32]
	addle	r0, r1, r0
	str	ip, [r3, #28]
	strle	r0, [r3]
.L185:
	tst	r2, #64
	beq	.L187
	ldr	r1, .L233+8
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L187
.L188:
	mov	r0, #3
	ldr	r1, [r3]
	ldr	ip, .L233+12
	cmp	r1, #5
	str	r0, [r3, #32]
	ldrgt	r0, [r3, #16]
	ldr	ip, [ip, #36]
	subgt	r1, r1, r0
	str	ip, [r3, #28]
	strgt	r1, [r3]
.L189:
	tst	r2, #1
	beq	.L174
	ldr	r3, .L233+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L232
.L174:
	ldr	lr, [sp], #4
	bx	lr
.L175:
	ldr	ip, .L233+16
	ldrh	ip, [ip, #48]
	tst	ip, #32
	bne	.L177
	b	.L176
.L179:
	ldr	r1, .L233+16
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L181
	b	.L180
.L183:
	ldr	r1, .L233+16
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L185
	b	.L184
.L187:
	ldr	r1, .L233+16
	ldrh	r1, [r1, #48]
	tst	r1, #64
	bne	.L189
	b	.L188
.L232:
	ldr	lr, [sp], #4
	b	fireBullet
.L234:
	.align	2
.L233:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	.LANCHOR0
	.word	67109120
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initializeSpider
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeSpider, %function
initializeSpider:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L243
	ldr	r0, [ip, #40]
	cmp	r0, #0
	bxle	lr
	mov	r2, #0
	mov	r1, #8
	str	lr, [sp, #-4]!
	ldr	r3, .L243+4
	add	lr, r0, r0, lsl #2
	add	r0, r0, lr, lsl #1
	ldr	ip, [ip, #4]
	add	r0, r3, r0, lsl #2
.L237:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #44
	cmp	r3, r0
	bne	.L237
	ldr	lr, [sp], #4
	bx	lr
.L244:
	.align	2
.L243:
	.word	.LANCHOR0
	.word	spiders
	.size	initializeSpider, .-initializeSpider
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #0
	mov	r4, #80
	mov	lr, #120
	mov	r9, #7
	mov	r7, #5
	mov	r6, #2
	mov	r5, #500
	mov	r1, ip
	ldr	r8, .L249
	ldr	r3, .L249+4
	ldr	r8, [r8, #24]
	str	r4, [r3]
	str	r0, [r3, #32]
	str	r9, [r3, #20]
	str	r8, [r3, #28]
	str	r7, [r3, #24]
	str	r4, [r3, #8]
	str	lr, [r3, #4]
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	ldr	r3, .L249+8
	str	r0, [r3]
	ldr	r3, .L249+12
	str	r0, [r3]
	ldr	r3, .L249+16
	str	r0, [r3]
	ldr	r3, .L249+20
	mov	r2, r0
	str	r6, [r3]
	ldr	r0, .L249+24
	ldr	r3, .L249+28
	str	r5, [r0]
	add	r0, r3, #240
.L246:
	str	r2, [r3, #4]
	str	r2, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L246
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	initializeSpider
.L250:
	.align	2
.L249:
	.word	.LANCHOR0
	.word	player
	.word	score
	.word	oldScore
	.word	spiderActive
	.word	spiderLimit
	.word	spiderRand
	.word	bullets
	.size	initializeGame, .-initializeGame
	.align	2
	.global	drawSpider
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpider, %function
drawSpider:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	drawSpider.part.0
	.size	drawSpider, .-drawSpider
	.align	2
	.global	updateSpider
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpider, %function
updateSpider:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateSpider.part.0
	.size	updateSpider, .-updateSpider
	.global	__aeabi_idivmod
	.align	2
	.global	activateSpider
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateSpider, %function
activateSpider:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L269
	mov	lr, pc
	bx	r7
	ldr	r2, .L269+4
	ldr	r3, .L269+8
	ldr	r1, [r2]
	mov	lr, pc
	bx	r3
	cmp	r1, #1
	beq	.L267
.L255:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L267:
	ldr	fp, .L269+12
	ldr	r3, .L269+16
	ldr	r2, [fp]
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L255
	ldr	r10, .L269+20
	ldr	r3, [r10, #40]
	cmp	r3, #0
	ble	.L255
	mov	r5, r1
	mov	r3, #0
	ldr	r8, .L269+24
	ldr	r9, .L269+28
	b	.L264
.L268:
	ldr	r1, [r10, #40]
.L259:
	add	r3, r3, #1
	cmp	r3, r1
	bge	.L255
.L264:
	add	r4, r3, r3, lsl #2
	add	r4, r3, r4, lsl #1
	add	r6, r8, r4, lsl #2
	ldr	r1, [r6, #36]
	cmp	r1, #0
	bne	.L268
	str	r5, [r6, #36]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r9, r0
	asr	r1, r0, #31
	add	r3, r3, r0
	rsb	r3, r1, r3, asr #9
	add	r1, r3, r3, lsl #3
	rsb	r3, r3, r1, lsl #3
	sub	r3, r0, r3, lsl #3
	cmp	r3, #141
	bgt	.L260
	mov	r0, #4
	smull	r2, ip, r9, r3
	asr	r1, r3, #31
	add	ip, ip, r3
	rsb	r1, r1, ip, asr #7
	add	ip, r1, r1, lsl #3
	rsb	r1, r1, ip, lsl #3
	sub	r3, r3, r1, lsl #1
	add	r3, r3, #44
	str	r3, [r6, #4]
	str	r0, [r8, r4, lsl #2]
.L261:
	ldr	r0, [fp]
	ldr	r3, [r10, #40]
	add	r0, r0, #1
	mov	r1, r3
	str	r0, [fp]
	b	.L259
.L260:
	smull	r2, r0, r9, r3
	asr	r1, r3, #31
	add	r0, r0, r3
	rsb	r1, r1, r0, asr #7
	add	r0, r1, r1, lsl #3
	rsb	r1, r1, r0, lsl #3
	cmp	r3, #284
	sub	r1, r3, r1, lsl #1
	bge	.L262
	ldr	r3, [r6, #28]
	add	r1, r1, #4
	rsb	r3, r3, #196
	str	r1, [r8, r4, lsl #2]
	str	r3, [r6, #4]
	b	.L261
.L262:
	ldr	r2, .L269+32
	cmp	r3, r2
	movgt	r3, #44
	ldrle	r3, [r6, #24]
	addle	r1, r1, #44
	rsble	r3, r3, #154
	addgt	r1, r1, #4
	strle	r1, [r6, #4]
	strle	r3, [r8, r4, lsl #2]
	strgt	r1, [r8, r4, lsl #2]
	strgt	r3, [r6, #4]
	b	.L261
.L270:
	.align	2
.L269:
	.word	rand
	.word	spiderRand
	.word	__aeabi_idivmod
	.word	spiderActive
	.word	spiderLimit
	.word	.LANCHOR0
	.word	spiders
	.word	-423447479
	.word	425
	.size	activateSpider, .-activateSpider
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L291
	sub	sp, sp, #20
	bl	updatePlayer
	ldr	r3, [r6, #20]
	cmp	r3, #0
	movgt	r4, #0
	ldrgt	r0, .L291+4
	ble	.L276
.L275:
	bl	updateBullet
	ldr	r3, [r6, #20]
	add	r4, r4, #1
	cmp	r3, r4
	add	r0, r0, #40
	bgt	.L275
.L276:
	bl	activateSpider
	ldr	r3, [r6, #40]
	cmp	r3, #0
	ble	.L274
	mov	r5, #0
	ldr	r4, .L291+8
	ldr	r7, .L291+12
	ldr	r8, .L291+16
	ldr	r9, .L291+20
.L280:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L279
	mov	r0, r4
	bl	updateSpider.part.0
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L279
	add	r0, r7, #20
	ldm	r0, {r0, r1}
	ldm	r7, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L290
.L279:
	ldr	r3, [r6, #40]
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L280
.L274:
	ldr	r2, .L291+24
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	difficulty
.L290:
	mov	lr, pc
	bx	r9
	b	.L279
.L292:
	.align	2
.L291:
	.word	.LANCHOR0
	.word	bullets
	.word	spiders
	.word	player
	.word	collision
	.word	goToLose
	.word	.LANCHOR1
	.size	updateGame, .-updateGame
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L302
	ldr	r5, .L302+4
	ldr	r0, [r4]
	ldr	r3, [r5]
	cmp	r3, r0
	sub	sp, sp, #24
	bne	.L299
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L299:
	mov	r2, #10
	ldr	r3, .L302+8
	add	r1, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #9
	mov	r2, #0
	ble	.L300
	cmp	r3, #99
	str	r2, [sp]
	mov	r3, #8
	ble	.L301
	mov	r2, #18
	mov	r1, #80
	mov	r0, #10
	ldr	r6, .L302+12
	mov	lr, pc
	bx	r6
	mov	r1, #80
	mov	r0, #10
	ldr	r3, .L302+16
	ldr	r6, .L302+20
	add	r2, sp, #12
	mov	lr, pc
	bx	r6
.L296:
	ldr	r3, [r4]
	str	r3, [r5]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L301:
	mov	r2, #12
	mov	r1, #80
	mov	r0, #13
	ldr	r6, .L302+12
	mov	lr, pc
	bx	r6
	mov	r1, #80
	mov	r0, #13
	ldr	r3, .L302+16
	ldr	r6, .L302+20
	add	r2, sp, #12
	mov	lr, pc
	bx	r6
	b	.L296
.L300:
	str	r2, [sp]
	mov	r3, #8
	mov	r2, #6
	mov	r1, #80
	mov	r0, #16
	ldr	r6, .L302+12
	mov	lr, pc
	bx	r6
	mov	r1, #80
	mov	r0, #16
	ldr	r3, .L302+16
	ldr	r6, .L302+20
	add	r2, sp, #12
	mov	lr, pc
	bx	r6
	b	.L296
.L303:
	.align	2
.L302:
	.word	score
	.word	oldScore
	.word	itoa
	.word	drawRect
	.word	32767
	.word	drawString
	.size	drawScore, .-drawScore
	.align	2
	.global	drawErase
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawErase, %function
drawErase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L326
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r0, [r3, #12]
	ldr	r2, [r3, #4]
	cmp	r0, r2
	ldr	r1, [r3, #8]
	sub	sp, sp, #20
	bne	.L305
	ldr	r3, [r3]
	cmp	r3, r1
	beq	.L306
.L305:
	mov	r2, #5
	mov	lr, #156
	mov	ip, #7
	ldr	r3, .L326+4
	stm	sp, {r2, ip, lr}
	str	r3, [sp, #12]
	ldr	r4, .L326+8
	sub	r3, r1, #2
	sub	r2, r0, #42
	mov	lr, pc
	bx	r4
.L306:
	ldr	r6, .L326+12
	ldr	r3, [r6, #20]
	cmp	r3, #0
	ble	.L313
	mov	r5, #0
	mov	r9, #156
	ldr	r4, .L326+16
	ldr	r8, .L326+4
	ldr	r7, .L326+8
.L312:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	bne	.L310
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L311
.L310:
	mov	r3, #1
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	sub	r2, r0, #42
	stmib	sp, {r3, r9}
	str	r3, [sp]
	str	r8, [sp, #12]
	sub	r3, r1, #2
	mov	lr, pc
	bx	r7
	mov	r3, #0
	str	r3, [r4, #36]
.L311:
	ldr	r3, [r6, #20]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L312
.L313:
	ldr	r3, [r6, #40]
	cmp	r3, #0
	ble	.L304
	mov	r5, #0
	mov	r9, #156
	ldr	r4, .L326+20
	ldr	r8, .L326+4
	ldr	r7, .L326+8
.L316:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	add	r5, r5, #1
	bne	.L314
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L315
.L314:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	ldr	lr, [r4, #24]
	ldr	ip, [r4, #28]
	sub	r3, r1, #2
	stm	sp, {ip, lr}
	str	r8, [sp, #12]
	str	r9, [sp, #8]
	sub	r2, r0, #42
	mov	lr, pc
	bx	r7
	mov	r3, #0
	str	r3, [r4, #40]
.L315:
	ldr	r3, [r6, #40]
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L316
.L304:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L327:
	.align	2
.L326:
	.word	player
	.word	backgroundBitmap
	.word	fillPartImage
	.word	.LANCHOR0
	.word	bullets
	.word	spiders
	.size	drawErase, .-drawErase
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L344
	bl	drawErase
	bl	drawScore
	ldr	r3, [r6, #20]
	cmp	r3, #0
	ble	.L329
	mov	r5, #0
	ldr	r4, .L344+4
	ldr	r8, .L344+8
	ldr	r7, .L344+12
	b	.L331
.L330:
	ldr	r3, [r6, #20]
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L329
.L331:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L330
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, r8
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #20]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L331
.L329:
	ldr	r3, [r6, #40]
	cmp	r3, #0
	ble	.L332
	mov	r5, #0
	ldr	r4, .L344+16
.L334:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	add	r5, r5, #1
	movne	r0, r4
	blne	drawSpider.part.0
.L333:
	ldr	r3, [r6, #40]
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L334
.L332:
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawPlayer
.L345:
	.align	2
.L344:
	.word	.LANCHOR0
	.word	bullets
	.word	32767
	.word	setPixel
	.word	spiders
	.size	drawGame, .-drawGame
	.global	spiderBitmaps
	.global	spiderDiagonal2
	.global	spiderDiagonal1
	.global	spiderStraight2
	.global	spiderStraight1
	.global	playerBitmaps
	.global	playerBack
	.global	playerFront
	.global	playerRight
	.global	playerLeft
	.comm	oldScore,4,4
	.comm	score,4,4
	.global	frame
	.comm	spiderRand,4,4
	.comm	spiderActive,4,4
	.comm	spiderLimit,4,4
	.comm	spiders,440,4
	.global	spiderVelocity
	.global	spiderCount
	.comm	bullets,240,4
	.global	bulletCount
	.comm	player,36,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	spiderVelocity, %object
	.size	spiderVelocity, 4
spiderVelocity:
	.word	1
	.type	spiderBitmaps, %object
	.size	spiderBitmaps, 16
spiderBitmaps:
	.word	spiderStraight1
	.word	spiderStraight2
	.word	spiderDiagonal1
	.word	spiderDiagonal2
	.type	bulletCount, %object
	.size	bulletCount, 4
bulletCount:
	.word	6
	.type	playerBitmaps, %object
	.size	playerBitmaps, 16
playerBitmaps:
	.word	playerLeft
	.word	playerRight
	.word	playerFront
	.word	playerBack
	.type	spiderCount, %object
	.size	spiderCount, 4
spiderCount:
	.word	10
	.type	spiderDiagonal2, %object
	.size	spiderDiagonal2, 64
spiderDiagonal2:
	.ascii	"\000\001\000\000\000\000\001\000\001\000\001\001\001"
	.ascii	"\001\000\000\000\001\001\001\001\000\001\001\000\001"
	.ascii	"\001\001\001\001\000\001\000\001\001\001\001\002\001"
	.ascii	"\000\000\001\000\001\002\001\002\000\001\000\001\000"
	.ascii	"\001\002\000\000\000\000\001\001\000\000\000\000"
	.type	spiderDiagonal1, %object
	.size	spiderDiagonal1, 64
spiderDiagonal1:
	.ascii	"\000\000\001\000\000\001\000\000\000\000\001\001\001"
	.ascii	"\001\000\001\001\001\001\001\001\000\001\000\000\001"
	.ascii	"\001\001\001\001\000\000\000\001\001\001\001\002\001"
	.ascii	"\001\001\001\000\001\002\001\002\000\000\000\001\000"
	.ascii	"\001\002\000\000\000\001\000\000\001\000\000\000"
	.type	spiderStraight2, %object
	.size	spiderStraight2, 64
spiderStraight2:
	.ascii	"\000\001\000\000\000\000\001\000\000\001\001\001\001"
	.ascii	"\001\001\000\001\000\001\001\001\001\000\001\000\001"
	.ascii	"\001\001\001\001\001\000\001\000\002\001\001\002\000"
	.ascii	"\001\000\001\000\002\002\000\001\000\001\001\000\001"
	.ascii	"\001\000\001\001\000\000\000\000\000\000\000\000"
	.type	spiderStraight1, %object
	.size	spiderStraight1, 64
spiderStraight1:
	.ascii	"\001\000\000\000\000\000\000\001\000\001\001\001\001"
	.ascii	"\001\001\000\000\000\001\001\001\001\000\000\001\001"
	.ascii	"\001\001\001\001\001\001\000\000\002\001\001\002\000"
	.ascii	"\000\001\001\000\002\002\000\001\001\000\001\000\001"
	.ascii	"\001\000\001\000\001\000\000\000\000\000\000\001"
	.type	playerBack, %object
	.size	playerBack, 35
playerBack:
	.ascii	"\000\001\001\001\000\000\002\002\002\000\003\003\003"
	.ascii	"\003\003\003\003\003\003\003\003\005\005\005\003\005"
	.ascii	"\005\000\005\005\005\005\000\005\005"
	.space	1
	.type	playerFront, %object
	.size	playerFront, 35
playerFront:
	.ascii	"\000\001\001\001\000\000\002\002\002\000\003\003\003"
	.ascii	"\003\003\003\002\004\002\003\003\005\005\005\003\005"
	.ascii	"\005\000\005\005\005\005\000\005\005"
	.space	1
	.type	playerRight, %object
	.size	playerRight, 35
playerRight:
	.ascii	"\001\001\001\000\000\002\002\000\000\000\003\003\003"
	.ascii	"\000\000\003\003\002\004\004\003\005\000\000\000\005"
	.ascii	"\005\000\000\000\005\005\005\000\000"
	.space	1
	.type	playerLeft, %object
	.size	playerLeft, 35
playerLeft:
	.ascii	"\000\000\001\001\001\000\000\000\002\002\000\000\003"
	.ascii	"\003\003\004\004\002\003\003\000\000\000\005\003\000"
	.ascii	"\000\000\005\005\000\000\005\005\005"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	frame, %object
	.size	frame, 4
frame:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
