; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export calcul_somme
	import TabSin
	import TabCos

calcul_somme proc
	
	push {lr}
	
	ldr r5 ,=TabSin
	ldr r6 ,=TabCos
	
	ldrsh r1, [r5,r0]
	ldrsh r2, [r5,r0]
	
	mul r1, r1, r1 ;on fait le carré (on passe de 1.15 à 2.30)
	mul r2, r2, r2
	add r0, r1, r2
	
	pop {pc}
;
		
	endp
	end