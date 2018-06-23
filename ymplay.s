	move.l musptr,a0
	lea $ffff8800.w,a1
	lea 2(a1),a2
	moveq #0,d0
	moveq #13,d1
playmus:
	move.b d0,(a1)
	move.b (a0)+,d2
	cmp.b (a1),d2
	beq.s noymchange
	move.b d2,(a2)
noymchange
	addq.w #1,d0
	dbra d1,playmus
	cmpa musbuffend,a0
	bge notmusend
	lea musbuff,a0
notmusend:
	move.l a0,musptr

musptr:
	dc.l musbuff
musbuff:
	incbin 'MUSIC.BIN'
musbuffend:

