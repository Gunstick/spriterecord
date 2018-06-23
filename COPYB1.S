*
*  NEOchrome V2.20 cut buffer contents (left justified):
*  by Chaos, Inc. of the Delta Force (member of The Union)
*
*    pixels/scanline    = $0020 (bytes/scanline: $0010)
*  # scanlines (height) = $0012
*
*  Hardware color pallet  (color 0 to 15):
*
*      $0000,$0555,$0222,$0777,$0000,$0000,$0000,$0000
*      $0000,$0000,$0000,$0000,$0000,$0000,$0555,$0557
*
*
		dc.w	$FFFF,$FFFF,$0000,$0000,$FFFF,$FFFF,$0000,$0000
		dc.w	$FFFF,$FFFF,$0000,$0000,$FFFE,$FFFF,$0000,$0000
		dc.w	$FFFF,$FFFF,$0000,$0000,$FFFC,$FFFF,$0000,$0000
		dc.w	$FFFF,$E000,$0000,$0000,$FFF8,$0007,$0000,$0000
		dc.w	$FFFF,$E000,$0000,$0000,$FFF8,$0007,$0000,$0000
		dc.w	$FFFF,$E336,$0000,$0000,$FFF8,$18C7,$0000,$0000
		dc.w	$FF76,$E3BF,$0000,$0000,$FFD8,$1DE7,$0000,$0000
		dc.w	$FF76,$E3BF,$0000,$0000,$FFD8,$1FE7,$0000,$0000
		dc.w	$FF76,$E3BF,$0000,$0000,$FAD8,$1FE7,$0000,$0000
		dc.w	$FF76,$E3BF,$0000,$0000,$FAD8,$1DE7,$0000,$0000
		dc.w	$FFF7,$E3FF,$0000,$0000,$FBD8,$DCE7,$0000,$0000
		dc.w	$FFE7,$E1FF,$0000,$0000,$DBD8,$FCE7,$0000,$0000
		dc.w	$FF0C,$E0F3,$0000,$0000,$1318,$ECE7,$0000,$0000
		dc.w	$FFFF,$E000,$0000,$0000,$FFF8,$0007,$0000,$0000
		dc.w	$E000,$FFFF,$0000,$0000,$0000,$FFFF,$0000,$0000
		dc.w	$C000,$FFFF,$0000,$0000,$0000,$FFFF,$0000,$0000
		dc.w	$8000,$FFFF,$0000,$0000,$0000,$FFFF,$0000,$0000
		dc.w	$8000,$FFFF,$0000,$0000,$0000,$FFFF,$0000,$0000
