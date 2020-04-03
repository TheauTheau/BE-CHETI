; ce programme est pour l'assembleur RealView (Keil)
	thumb
	
;

		area  mesdata, data, readwrite ; La déclaration d'une zone pour variable ou adresse
TIMER	DCD 0	; L'initialisation d'une variable Timer
                ;The DCD directive allocates one or more words of memory, aligned on four-byte boundaries, and defines the initial runtime contents of the memory. DCDU is the same, except that the memory alignment is arbitrary.

	area  moncode, code, readonly
	export timer_callback
		
GPIOB_BSRR	equ	0x40010C10; Bit Set/Reset register
	
	
timer_callback	proc

	; Si la valeur de Timer = 0
	ldr 	r0, =TIMER ; Mettre l'@ de Timer dans r0
	ldr		r2, [r0] ; Mettre dans r2 la valeur de Timer
	cbz		r2, alors ; Timer = 0 => Mise à 1
	cbnz	r2, sinon ; Timer = 1 => Mise à 0
;Alors
alors
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	movs	r1, #0x00000002
	str	r1, [r3]
; Mettre Timer à 1
	mov		r2, #0x1
	str		r2, [r0]
	bx 		lr

;sinon 
sinon
; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	movs	r1, #0x00020000
	str	r1, [r3]
; Mettre Timer à 0
	mov		r2, #0x0
	str		r2, [r0]
; N.B. le registre BSRR est write-only, on ne peut pas le relire
	bx lr

	endp
	end