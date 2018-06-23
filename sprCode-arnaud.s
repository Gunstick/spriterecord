; Code for sprite shit 15
; Data registers:
;  d0=$fffffffc    a0=$fffe7c00
;  d1=$00007ff8    a1=$fffc3800
;  d2=$00003ff0    a2=$8ffefe00
;  d3=$00000fc0    a3=$00000000
;  d4=$00000001    a4=$00000000
;  d5=$00000000    a5=$00000000
;  d6=$00000000    a6=$00000000
;  d7=$00000000    a7=$00000000
move15:
	move.l	a0,1608(a5)			; $fffe7c00
	move.l	a0,808(a5)			; $fffe7c00
	move.l	a1,1768(a5)			; $fffc3800
	move.l	a1,648(a5)			; $fffc3800
	move.l	a2,1448(a5)			; $8ffefe00
	move.l	a2,1288(a5)			; $8ffefe00
	move.l	a2,1128(a5)			; $8ffefe00
	move.l	a2,968(a5)			; $8ffefe00
	move.w	d0,1928(a5)			; $fffc
	move.w	d0,488(a5)			; $fffc
	move.w	d1,2088(a5)			; $7ff8
	move.w	d1,328(a5)			; $7ff8
	move.w	d2,2248(a5)			; $3ff0
	move.w	d2,168(a5)			; $3ff0
	move.w	d3,2408(a5)			; $0fc0
	move.w	d3,8(a5)			; $0fc0
	move.b	d4,1601(a5)			; $01
	move.b	d4,1441(a5)			; $01
	move.b	d4,1281(a5)			; $01
	move.b	d4,1121(a5)			; $01
	move.b	d4,961(a5)			; $01
	move.b	d4,801(a5)			; $01
	rts

; Code for sprite shit 14
; Data registers:
;  d0=$00030001    a0=$fffcf800
;  d1=$fffffff8    a1=$fff87000
;  d2=$fffffff0    a2=$1ffcfc00
;  d3=$00007fe0    a3=$00000000
;  d4=$00001f80    a4=$00000000
;  d5=$00000003    a5=$00000000
;  d6=$00000000    a6=$00000000
;  d7=$00000000    a7=$00000000
move14:
	move.l	a0,1608(a5)			; $fffcf800
	move.l	a0,808(a5)			; $fffcf800
	move.l	a1,1768(a5)			; $fff87000
	move.l	a1,648(a5)			; $fff87000
	move.l	a2,1448(a5)			; $1ffcfc00
	move.l	a2,1288(a5)			; $1ffcfc00
	move.l	a2,1128(a5)			; $1ffcfc00
	move.l	a2,968(a5)			; $1ffcfc00
	move.l	d0,1440(a5)			; $00030001
	move.l	d0,1280(a5)			; $00030001
	move.l	d0,1120(a5)			; $00030001
	move.l	d0,960(a5)			; $00030001
	move.w	d1,1928(a5)			; $fff8
	move.w	d1,488(a5)			; $fff8
	move.w	d2,2088(a5)			; $fff0
	move.w	d2,328(a5)			; $fff0
	move.w	d3,2248(a5)			; $7fe0
	move.w	d3,168(a5)			; $7fe0
	move.w	d4,2408(a5)			; $1f80
	move.w	d4,8(a5)			; $1f80
	move.b	d5,1601(a5)			; $03
	move.b	d5,801(a5)			; $03
	move.b	d0,1921(a5)			; $01
	move.b	d0,1761(a5)			; $01
	move.b	d0,641(a5)			; $01
	move.b	d0,481(a5)			; $01
	rts

; Code for sprite shit 13
; Data registers:
;  d0=$00070001    a0=$fff8f000
;  d1=$00060003    a1=$fff0e000
;  d2=$fffffff0    a2=$3ff8f800
;  d3=$ffffffe0    a3=$00000000
;  d4=$ffffffc0    a4=$00000000
;  d5=$0000003f    a5=$00000000
;  d6=$00000000    a6=$00000000
;  d7=$00000000    a7=$00000000
move13:
	move.l	a0,1608(a5)			; $fff8f000
	move.l	a0,808(a5)			; $fff8f000
	move.l	a1,1768(a5)			; $fff0e000
	move.l	a1,648(a5)			; $fff0e000
	move.l	a2,1448(a5)			; $3ff8f800
	move.l	a2,1288(a5)			; $3ff8f800
	move.l	a2,1128(a5)			; $3ff8f800
	move.l	a2,968(a5)			; $3ff8f800
	move.l	d0,1600(a5)			; $00070001
	move.l	d0,800(a5)			; $00070001
	move.l	d1,1440(a5)			; $00060003
	move.l	d1,1280(a5)			; $00060003
	move.l	d1,1120(a5)			; $00060003
	move.l	d1,960(a5)			; $00060003
	move.w	d2,1928(a5)			; $fff0
	move.w	d2,488(a5)			; $fff0
	move.w	d3,2088(a5)			; $ffe0
	move.w	d3,328(a5)			; $ffe0
	move.w	d4,2248(a5)			; $ffc0
	move.w	d4,168(a5)			; $ffc0
	move.b	d5,2408(a5)			; $3f
	move.b	d5,8(a5)			; $3f
	move.b	d1,1921(a5)			; $03
	move.b	d1,1761(a5)			; $03
	move.b	d1,641(a5)			; $03
	move.b	d1,481(a5)			; $03
	move.b	d0,2081(a5)			; $01
	move.b	d0,321(a5)			; $01
	rts

; Code for sprite shit 12
; Data registers:
;  d0=$000f0003    a0=$ffe0c000
;  d1=$000c0007    a1=$fff0e000
;  d2=$00070001    a2=$7ff0f000
;  d3=$ffffffe0    a3=$00000000
;  d4=$ffffffc0    a4=$00000000
;  d5=$ffffff80    a5=$00000000
;  d6=$0000007e    a6=$00000000
;  d7=$00000000    a7=$00000000
move12:
	move.l	a1,1608(a5)			; $fff0e000
	move.l	a1,808(a5)			; $fff0e000
	move.l	a0,1768(a5)			; $ffe0c000
	move.l	a0,648(a5)			; $ffe0c000
	move.l	a2,1448(a5)			; $7ff0f000
	move.l	a2,1288(a5)			; $7ff0f000
	move.l	a2,1128(a5)			; $7ff0f000
	move.l	a2,968(a5)			; $7ff0f000
	move.l	d0,1600(a5)			; $000f0003
	move.l	d0,800(a5)			; $000f0003
	move.l	d1,1440(a5)			; $000c0007
	move.l	d1,1280(a5)			; $000c0007
	move.l	d1,1120(a5)			; $000c0007
	move.l	d1,960(a5)			; $000c0007
	move.l	d2,1760(a5)			; $00070001
	move.l	d2,640(a5)			; $00070001
	move.w	d3,1928(a5)			; $ffe0
	move.w	d3,488(a5)			; $ffe0
	move.w	d4,2088(a5)			; $ffc0
	move.w	d4,328(a5)			; $ffc0
	move.w	d5,2248(a5)			; $ff80
	move.w	d5,168(a5)			; $ff80
	move.b	d6,2408(a5)			; $7e
	move.b	d6,8(a5)			; $7e
	move.b	d1,1921(a5)			; $07
	move.b	d1,481(a5)			; $07
	move.b	d0,2081(a5)			; $03
	move.b	d0,321(a5)			; $03
	move.b	d2,2241(a5)			; $01
	move.b	d2,161(a5)			; $01
	rts

; Code for sprite shit 11
; Data registers:
;  d0=$001f0007    a0=$ffe0e000
;  d1=$0018000f    a1=$ffe0c000
;  d2=$000f0003    a2=$ffc08000
;  d3=$ffffffff    a3=$00000000
;  d4=$ffffffc0    a4=$00000000
;  d5=$ffffff80    a5=$00000000
;  d6=$fffffffc    a6=$00000000
;  d7=$00000000    a7=$00000000
move11:
	move.l	a0,1448(a5)			; $ffe0e000
	move.l	a0,1288(a5)			; $ffe0e000
	move.l	a0,1128(a5)			; $ffe0e000
	move.l	a0,968(a5)			; $ffe0e000
	move.l	a1,1608(a5)			; $ffe0c000
	move.l	a1,808(a5)			; $ffe0c000
	move.l	a2,1768(a5)			; $ffc08000
	move.l	a2,648(a5)			; $ffc08000
	move.l	d0,1600(a5)			; $001f0007
	move.l	d0,800(a5)			; $001f0007
	move.l	d1,1440(a5)			; $0018000f
	move.l	d1,1280(a5)			; $0018000f
	move.l	d1,1120(a5)			; $0018000f
	move.l	d1,960(a5)			; $0018000f
	move.l	d2,1760(a5)			; $000f0003
	move.l	d2,640(a5)			; $000f0003
	move.w	d4,1928(a5)			; $ffc0
	move.w	d4,488(a5)			; $ffc0
	move.w	d5,2088(a5)			; $ff80
	move.w	d5,328(a5)			; $ff80
	move.b	d3,2248(a5)			; $ff
	move.b	d3,168(a5)			; $ff
	move.b	d6,2408(a5)			; $fc
	move.b	d6,8(a5)			; $fc
	move.b	d1,1921(a5)			; $0f
	move.b	d1,481(a5)			; $0f
	move.b	d0,2081(a5)			; $07
	move.b	d0,321(a5)			; $07
	move.b	d2,2241(a5)			; $03
	move.b	d2,161(a5)			; $03
	rts

; Code for sprite shit 10
; Data registers:
;  d0=$0031001f    a0=$ffc0c000
;  d1=$001f0007    a1=$003f000f
;  d2=$fffffffe    a2=$ffc08000
;  d3=$ffffffff    a3=$00000000
;  d4=$fffffff8    a4=$00000000
;  d5=$ffffff80    a5=$00000000
;  d6=$0000000f    a6=$00000000
;  d7=$00000001    a7=$00000000
move10:
	move.l	a0,1448(a5)			; $ffc0c000
	move.l	a0,1288(a5)			; $ffc0c000
	move.l	a0,1128(a5)			; $ffc0c000
	move.l	a0,968(a5)			; $ffc0c000
	move.l	a2,1608(a5)			; $ffc08000
	move.l	a2,808(a5)			; $ffc08000
	move.l	a1,1600(a5)			; $003f000f
	move.l	a1,800(a5)			; $003f000f
	move.l	d0,1440(a5)			; $0031001f
	move.l	d0,1280(a5)			; $0031001f
	move.l	d0,1120(a5)			; $0031001f
	move.l	d0,960(a5)			; $0031001f
	move.l	d1,1760(a5)			; $001f0007
	move.l	d1,640(a5)			; $001f0007
	move.w	d5,1928(a5)			; $ff80
	move.w	d5,1768(a5)			; $ff80
	move.w	d5,648(a5)			; $ff80
	move.w	d5,488(a5)			; $ff80
	move.b	d3,2088(a5)			; $ff
	move.b	d3,328(a5)			; $ff
	move.b	d2,2248(a5)			; $fe
	move.b	d2,168(a5)			; $fe
	move.b	d4,2408(a5)			; $f8
	move.b	d4,8(a5)			; $f8
	move.b	d0,1921(a5)			; $1f
	move.b	d0,481(a5)			; $1f
	move.b	d6,2081(a5)			; $0f
	move.b	d6,321(a5)			; $0f
	move.b	d1,2241(a5)			; $07
	move.b	d1,161(a5)			; $07
	move.b	d7,2401(a5)			; $01
	move.b	d7,1(a5)			; $01
	rts

; Code for sprite shit 9
; Data registers:
;  d0=$003f000e    a0=$ff808000
;  d1=$fffffffc    a1=$007f001f
;  d2=$fffffffe    a2=$0063003f
;  d3=$ffffffff    a3=$00000000
;  d4=$fffffff0    a4=$00000000
;  d5=$ffffff80    a5=$00000000
;  d6=$0000000f    a6=$00000000
;  d7=$0000003f    a7=$00000000
move9:
	move.l	a0,1448(a5)			; $ff808000
	move.l	a0,1288(a5)			; $ff808000
	move.l	a0,1128(a5)			; $ff808000
	move.l	a0,968(a5)			; $ff808000
	move.l	a1,1600(a5)			; $007f001f
	move.l	a1,800(a5)			; $007f001f
	move.l	a2,1440(a5)			; $0063003f
	move.l	a2,1280(a5)			; $0063003f
	move.l	a2,1120(a5)			; $0063003f
	move.l	a2,960(a5)			; $0063003f
	move.l	d0,1760(a5)			; $003f000e
	move.l	d0,640(a5)			; $003f000e
	move.w	d5,1608(a5)			; $ff80
	move.w	d5,808(a5)			; $ff80
	move.b	d3,1928(a5)			; $ff
	move.b	d3,1768(a5)			; $ff
	move.b	d3,648(a5)			; $ff
	move.b	d3,488(a5)			; $ff
	move.b	d2,2088(a5)			; $fe
	move.b	d2,328(a5)			; $fe
	move.b	d1,2248(a5)			; $fc
	move.b	d1,168(a5)			; $fc
	move.b	d4,2408(a5)			; $f0
	move.b	d4,8(a5)			; $f0
	move.b	d7,1921(a5)			; $3f
	move.b	d7,481(a5)			; $3f
	move.b	#$1f,2081(a5)			; $1f
	move.b	#$1f,321(a5)			; $1f
	move.b	d6,2241(a5)			; $0f
	move.b	d6,161(a5)			; $0f
	move.b	#$03,2401(a5)			; $03
	move.b	#$03,1(a5)			; $03
	rts

; Code for sprite shit 8
; Data registers:
;  d0=$fffffff8    a0=$00ff003e
;  d1=$fffffffc    a1=$00c7007f
;  d2=$fffffffe    a2=$007f001c
;  d3=$ffffffff    a3=$00000000
;  d4=$ffffffe0    a4=$00000000
;  d5=$0000007f    a5=$00000000
;  d6=$0000001f    a6=$00000000
;  d7=$0000003f    a7=$00000000
move8:
	move.l	a0,1600(a5)			; $00ff003e
	move.l	a0,800(a5)			; $00ff003e
	move.l	a1,1440(a5)			; $00c7007f
	move.l	a1,1280(a5)			; $00c7007f
	move.l	a1,1120(a5)			; $00c7007f
	move.l	a1,960(a5)			; $00c7007f
	move.l	a2,1760(a5)			; $007f001c
	move.l	a2,640(a5)			; $007f001c
	move.b	d3,1608(a5)			; $ff
	move.b	d3,1448(a5)			; $ff
	move.b	d3,1288(a5)			; $ff
	move.b	d3,1128(a5)			; $ff
	move.b	d3,968(a5)			; $ff
	move.b	d3,808(a5)			; $ff
	move.b	d2,1928(a5)			; $fe
	move.b	d2,1768(a5)			; $fe
	move.b	d2,648(a5)			; $fe
	move.b	d2,488(a5)			; $fe
	move.b	d1,2088(a5)			; $fc
	move.b	d1,328(a5)			; $fc
	move.b	d0,2248(a5)			; $f8
	move.b	d0,168(a5)			; $f8
	move.b	d4,2408(a5)			; $e0
	move.b	d4,8(a5)			; $e0
	move.b	d5,1921(a5)			; $7f
	move.b	d5,481(a5)			; $7f
	move.b	d7,2081(a5)			; $3f
	move.b	d7,321(a5)			; $3f
	move.b	d6,2241(a5)			; $1f
	move.b	d6,161(a5)			; $1f
	move.b	#$07,2401(a5)			; $07
	move.b	#$07,1(a5)			; $07
	rts

; Code for sprite shit 7
; Data registers:
;  d0=$fffffff8    a0=$01ff007c
;  d1=$fffffffc    a1=$018f00fe
;  d2=$fffffffe    a2=$00ff0038
;  d3=$ffffffff    a3=$00000000
;  d4=$fffffff0    a4=$00000000
;  d5=$0000007f    a5=$00000000
;  d6=$ffffffc0    a6=$00000000
;  d7=$0000003f    a7=$00000000
move7:
	move.l	a0,1600(a5)			; $01ff007c
	move.l	a0,800(a5)			; $01ff007c
	move.l	a1,1440(a5)			; $018f00fe
	move.l	a1,1280(a5)			; $018f00fe
	move.l	a1,1120(a5)			; $018f00fe
	move.l	a1,960(a5)			; $018f00fe
	move.l	a2,1760(a5)			; $00ff0038
	move.l	a2,640(a5)			; $00ff0038
	move.b	d3,1921(a5)			; $ff
	move.b	d3,481(a5)			; $ff
	move.b	d2,1608(a5)			; $fe
	move.b	d2,1448(a5)			; $fe
	move.b	d2,1288(a5)			; $fe
	move.b	d2,1128(a5)			; $fe
	move.b	d2,968(a5)			; $fe
	move.b	d2,808(a5)			; $fe
	move.b	d1,1928(a5)			; $fc
	move.b	d1,1768(a5)			; $fc
	move.b	d1,648(a5)			; $fc
	move.b	d1,488(a5)			; $fc
	move.b	d0,2088(a5)			; $f8
	move.b	d0,328(a5)			; $f8
	move.b	d4,2248(a5)			; $f0
	move.b	d4,168(a5)			; $f0
	move.b	d6,2408(a5)			; $c0
	move.b	d6,8(a5)			; $c0
	move.b	d5,2081(a5)			; $7f
	move.b	d5,321(a5)			; $7f
	move.b	d7,2241(a5)			; $3f
	move.b	d7,161(a5)			; $3f
	move.b	#$0f,2401(a5)			; $0f
	move.b	#$0f,1(a5)			; $0f
	rts

; Code for sprite shit 6
; Data registers:
;  d0=$fffffff8    a0=$03ff00f8
;  d1=$fffffffc    a1=$031f01fc
;  d2=$ffff01ff    a2=$01ff0070
;  d3=$ffffffff    a3=$00000000
;  d4=$fffffff0    a4=$00000000
;  d5=$0000007f    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move6:
	move.l	a0,1600(a5)			; $03ff00f8
	move.l	a0,800(a5)			; $03ff00f8
	move.l	a1,1440(a5)			; $031f01fc
	move.l	a1,1280(a5)			; $031f01fc
	move.l	a1,1120(a5)			; $031f01fc
	move.l	a1,960(a5)			; $031f01fc
	move.l	a2,1760(a5)			; $01ff0070
	move.l	a2,640(a5)			; $01ff0070
	move.w	d2,1920(a5)			; $01ff
	move.w	d2,480(a5)			; $01ff
	move.b	d3,2081(a5)			; $ff
	move.b	d3,321(a5)			; $ff
	move.b	d1,1608(a5)			; $fc
	move.b	d1,1448(a5)			; $fc
	move.b	d1,1288(a5)			; $fc
	move.b	d1,1128(a5)			; $fc
	move.b	d1,968(a5)			; $fc
	move.b	d1,808(a5)			; $fc
	move.b	d0,1928(a5)			; $f8
	move.b	d0,1768(a5)			; $f8
	move.b	d0,648(a5)			; $f8
	move.b	d0,488(a5)			; $f8
	move.b	d4,2088(a5)			; $f0
	move.b	d4,328(a5)			; $f0
	move.b	d6,2248(a5)			; $e0
	move.b	d6,168(a5)			; $e0
	move.b	d7,2408(a5)			; $80
	move.b	d7,8(a5)			; $80
	move.b	d5,2241(a5)			; $7f
	move.b	d5,161(a5)			; $7f
	move.b	#$1f,2401(a5)			; $1f
	move.b	#$1f,1(a5)			; $1f
	rts

; Code for sprite shit 5
; Data registers:
;  d0=$fffffff8    a0=$07ff01f0
;  d1=$ffff03ff    a1=$063f03f8
;  d2=$ffff01ff    a2=$03ff00e0
;  d3=$ffffffc0    a3=$00000000
;  d4=$fffffff0    a4=$00000000
;  d5=$0000003f    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move5:
	move.l	a0,1600(a5)			; $07ff01f0
	move.l	a0,800(a5)			; $07ff01f0
	move.l	a1,1440(a5)			; $063f03f8
	move.l	a1,1280(a5)			; $063f03f8
	move.l	a1,1120(a5)			; $063f03f8
	move.l	a1,960(a5)			; $063f03f8
	move.l	a2,1760(a5)			; $03ff00e0
	move.l	a2,640(a5)			; $03ff00e0
	move.w	d1,1920(a5)			; $03ff
	move.w	d1,480(a5)			; $03ff
	move.w	d2,2080(a5)			; $01ff
	move.w	d2,320(a5)			; $01ff
	move.b	d2,2241(a5)			; $ff
	move.b	d2,161(a5)			; $ff
	move.b	d0,1608(a5)			; $f8
	move.b	d0,1448(a5)			; $f8
	move.b	d0,1288(a5)			; $f8
	move.b	d0,1128(a5)			; $f8
	move.b	d0,968(a5)			; $f8
	move.b	d0,808(a5)			; $f8
	move.b	d4,1928(a5)			; $f0
	move.b	d4,1768(a5)			; $f0
	move.b	d4,648(a5)			; $f0
	move.b	d4,488(a5)			; $f0
	move.b	d6,2088(a5)			; $e0
	move.b	d6,328(a5)			; $e0
	move.b	d3,2248(a5)			; $c0
	move.b	d3,168(a5)			; $c0
	move.b	d5,2401(a5)			; $3f
	move.b	d5,1(a5)			; $3f
	rts

; Code for sprite shit 4
; Data registers:
;  d0=$ffff07ff    a0=$0fff03e0
;  d1=$ffff03ff    a1=$0c7f07f0
;  d2=$ffff01ff    a2=$07ff01c0
;  d3=$ffffffc0    a3=$00000000
;  d4=$fffffff0    a4=$00000000
;  d5=$0000007e    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move4:
	move.l	a0,1600(a5)			; $0fff03e0
	move.l	a0,800(a5)			; $0fff03e0
	move.l	a1,1440(a5)			; $0c7f07f0
	move.l	a1,1280(a5)			; $0c7f07f0
	move.l	a1,1120(a5)			; $0c7f07f0
	move.l	a1,960(a5)			; $0c7f07f0
	move.l	a2,1760(a5)			; $07ff01c0
	move.l	a2,640(a5)			; $07ff01c0
	move.w	d0,1920(a5)			; $07ff
	move.w	d0,480(a5)			; $07ff
	move.w	d1,2080(a5)			; $03ff
	move.w	d1,320(a5)			; $03ff
	move.w	d2,2240(a5)			; $01ff
	move.w	d2,160(a5)			; $01ff
	move.b	d4,1608(a5)			; $f0
	move.b	d4,1448(a5)			; $f0
	move.b	d4,1288(a5)			; $f0
	move.b	d4,1128(a5)			; $f0
	move.b	d4,968(a5)			; $f0
	move.b	d4,808(a5)			; $f0
	move.b	d6,1928(a5)			; $e0
	move.b	d6,1768(a5)			; $e0
	move.b	d6,648(a5)			; $e0
	move.b	d6,488(a5)			; $e0
	move.b	d3,2088(a5)			; $c0
	move.b	d3,328(a5)			; $c0
	move.b	d7,2248(a5)			; $80
	move.b	d7,168(a5)			; $80
	move.b	d5,2401(a5)			; $7e
	move.b	d5,1(a5)			; $7e
	rts

; Code for sprite shit 3
; Data registers:
;  d0=$ffff07ff    a0=$1fff07c0
;  d1=$ffff03ff    a1=$18ff0fe0
;  d2=$ffff0fff    a2=$0fff0380
;  d3=$ffffffc0    a3=$00000000
;  d4=$fffffffc    a4=$00000000
;  d5=$0000007e    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move3:
	move.l	a0,1600(a5)			; $1fff07c0
	move.l	a0,800(a5)			; $1fff07c0
	move.l	a1,1440(a5)			; $18ff0fe0
	move.l	a1,1280(a5)			; $18ff0fe0
	move.l	a1,1120(a5)			; $18ff0fe0
	move.l	a1,960(a5)			; $18ff0fe0
	move.l	a2,1760(a5)			; $0fff0380
	move.l	a2,640(a5)			; $0fff0380
	move.w	d2,1920(a5)			; $0fff
	move.w	d2,480(a5)			; $0fff
	move.w	d0,2080(a5)			; $07ff
	move.w	d0,320(a5)			; $07ff
	move.w	d1,2240(a5)			; $03ff
	move.w	d1,160(a5)			; $03ff
	move.b	d4,2401(a5)			; $fc
	move.b	d4,1(a5)			; $fc
	move.b	d6,1608(a5)			; $e0
	move.b	d6,1448(a5)			; $e0
	move.b	d6,1288(a5)			; $e0
	move.b	d6,1128(a5)			; $e0
	move.b	d6,968(a5)			; $e0
	move.b	d6,808(a5)			; $e0
	move.b	d3,1928(a5)			; $c0
	move.b	d3,1768(a5)			; $c0
	move.b	d3,648(a5)			; $c0
	move.b	d3,488(a5)			; $c0
	move.b	d7,2088(a5)			; $80
	move.b	d7,328(a5)			; $80
	rts

; Code for sprite shit 2
; Data registers:
;  d0=$ffff1fff    a0=$3fff0f80
;  d1=$ffff07fe    a1=$31ff1fc0
;  d2=$ffff0fff    a2=$1fff0700
;  d3=$ffffffc0    a3=$00000000
;  d4=$ffff01f8    a4=$00000000
;  d5=$0000007e    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move2:
	move.l	a0,1600(a5)			; $3fff0f80
	move.l	a0,800(a5)			; $3fff0f80
	move.l	a1,1440(a5)			; $31ff1fc0
	move.l	a1,1280(a5)			; $31ff1fc0
	move.l	a1,1120(a5)			; $31ff1fc0
	move.l	a1,960(a5)			; $31ff1fc0
	move.l	a2,1760(a5)			; $1fff0700
	move.l	a2,640(a5)			; $1fff0700
	move.w	d0,1920(a5)			; $1fff
	move.w	d0,480(a5)			; $1fff
	move.w	d2,2080(a5)			; $0fff
	move.w	d2,320(a5)			; $0fff
	move.w	d1,2240(a5)			; $07fe
	move.w	d1,160(a5)			; $07fe
	move.w	d4,2400(a5)			; $01f8
	move.w	d4,(a5)			; $01f8
	move.b	d3,1608(a5)			; $c0
	move.b	d3,1448(a5)			; $c0
	move.b	d3,1288(a5)			; $c0
	move.b	d3,1128(a5)			; $c0
	move.b	d3,968(a5)			; $c0
	move.b	d3,808(a5)			; $c0
	move.b	d7,1928(a5)			; $80
	move.b	d7,1768(a5)			; $80
	move.b	d7,648(a5)			; $80
	move.b	d7,488(a5)			; $80
	rts

; Code for sprite shit 1
; Data registers:
;  d0=$ffff3fff    a0=$7fff1f00
;  d1=$ffff0ffc    a1=$63ff3f80
;  d2=$ffff1ffe    a2=$3fff0e00
;  d3=$ffffffc0    a3=$00000000
;  d4=$ffff03f0    a4=$00000000
;  d5=$0000007e    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move1:
	move.l	a0,1600(a5)			; $7fff1f00
	move.l	a0,800(a5)			; $7fff1f00
	move.l	a1,1440(a5)			; $63ff3f80
	move.l	a1,1280(a5)			; $63ff3f80
	move.l	a1,1120(a5)			; $63ff3f80
	move.l	a1,960(a5)			; $63ff3f80
	move.l	a2,1760(a5)			; $3fff0e00
	move.l	a2,640(a5)			; $3fff0e00
	move.w	d0,1920(a5)			; $3fff
	move.w	d0,480(a5)			; $3fff
	move.w	d2,2080(a5)			; $1ffe
	move.w	d2,320(a5)			; $1ffe
	move.w	d1,2240(a5)			; $0ffc
	move.w	d1,160(a5)			; $0ffc
	move.w	d4,2400(a5)			; $03f0
	move.w	d4,(a5)			; $03f0
	move.b	d7,1608(a5)			; $80
	move.b	d7,1448(a5)			; $80
	move.b	d7,1288(a5)			; $80
	move.b	d7,1128(a5)			; $80
	move.b	d7,968(a5)			; $80
	move.b	d7,808(a5)			; $80
	rts

; Code for sprite shit 0
; Data registers:
;  d0=$ffff7ffe    a0=$ffff3e00
;  d1=$ffff1ff8    a1=$c7ff7f00
;  d2=$ffff3ffc    a2=$7ffe1c00
;  d3=$ffffffc0    a3=$00000000
;  d4=$ffff07e0    a4=$00000000
;  d5=$0000007e    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
move0:
	move.l	a0,1600(a5)			; $ffff3e00
	move.l	a0,800(a5)			; $ffff3e00
	move.l	a1,1440(a5)			; $c7ff7f00
	move.l	a1,1280(a5)			; $c7ff7f00
	move.l	a1,1120(a5)			; $c7ff7f00
	move.l	a1,960(a5)			; $c7ff7f00
	move.l	a2,1760(a5)			; $7ffe1c00
	move.l	a2,640(a5)			; $7ffe1c00
	move.w	d0,1920(a5)			; $7ffe
	move.w	d0,480(a5)			; $7ffe
	move.w	d2,2080(a5)			; $3ffc
	move.w	d2,320(a5)			; $3ffc
	move.w	d1,2240(a5)			; $1ff8
	move.w	d1,160(a5)			; $1ff8
	move.w	d4,2400(a5)			; $07e0
	move.w	d4,(a5)			; $07e0
	rts

; Code for sprite shit 15
; Data registers:
;  d0=$fffe7c00    a0=$ffff3e00
;  d1=$fffc3800    a1=$c7ff7f00
;  d2=$8ffefe00    a2=$7ffe1c00
;  d3=$fffffffc    a3=$00000000
;  d4=$ffff7ff8    a4=$00000000
;  d5=$00003ff0    a5=$00000000
;  d6=$ffff0fc0    a6=$00000000
;  d7=$00000001    a7=$00000000
or15:
	or.l	d0,1608(a5)			; $fffe7c00
	or.l	d0,808(a5)			; $fffe7c00
	or.l	d1,1768(a5)			; $fffc3800
	or.l	d1,648(a5)			; $fffc3800
	or.l	d2,1448(a5)			; $8ffefe00
	or.l	d2,1288(a5)			; $8ffefe00
	or.l	d2,1128(a5)			; $8ffefe00
	or.l	d2,968(a5)			; $8ffefe00
	or.w	d3,1928(a5)			; $fffc
	or.w	d3,488(a5)			; $fffc
	or.w	d4,2088(a5)			; $7ff8
	or.w	d4,328(a5)			; $7ff8
	or.w	d5,2248(a5)			; $3ff0
	or.w	d5,168(a5)			; $3ff0
	or.w	d6,2408(a5)			; $0fc0
	or.w	d6,8(a5)			; $0fc0
	or.b	d7,1601(a5)			; $01
	or.b	d7,1441(a5)			; $01
	or.b	d7,1281(a5)			; $01
	or.b	d7,1121(a5)			; $01
	or.b	d7,961(a5)			; $01
	or.b	d7,801(a5)			; $01
	rts

; Code for sprite shit 14
; Data registers:
;  d0=$fffcf800    a0=$ffff3e00
;  d1=$fff87000    a1=$c7ff7f00
;  d2=$1ffcfc00    a2=$7ffe1c00
;  d3=$00030001    a3=$00000000
;  d4=$fffffff8    a4=$00000000
;  d5=$fffffff0    a5=$00000000
;  d6=$ffff7fe0    a6=$00000000
;  d7=$00001f80    a7=$00000000
or14:
	or.l	d0,1608(a5)			; $fffcf800
	or.l	d0,808(a5)			; $fffcf800
	or.l	d1,1768(a5)			; $fff87000
	or.l	d1,648(a5)			; $fff87000
	or.l	d2,1448(a5)			; $1ffcfc00
	or.l	d2,1288(a5)			; $1ffcfc00
	or.l	d2,1128(a5)			; $1ffcfc00
	or.l	d2,968(a5)			; $1ffcfc00
	or.l	d3,1440(a5)			; $00030001
	or.l	d3,1280(a5)			; $00030001
	or.l	d3,1120(a5)			; $00030001
	or.l	d3,960(a5)			; $00030001
	or.w	d4,1928(a5)			; $fff8
	or.w	d4,488(a5)			; $fff8
	or.w	d5,2088(a5)			; $fff0
	or.w	d5,328(a5)			; $fff0
	or.w	d6,2248(a5)			; $7fe0
	or.w	d6,168(a5)			; $7fe0
	or.w	d7,2408(a5)			; $1f80
	or.w	d7,8(a5)			; $1f80
	or.b	#$03,1601(a5)			; $03
	or.b	#$03,801(a5)			; $03
	or.b	d3,1921(a5)			; $01
	or.b	d3,1761(a5)			; $01
	or.b	d3,641(a5)			; $01
	or.b	d3,481(a5)			; $01
	rts

; Code for sprite shit 13
; Data registers:
;  d0=$fff8f000    a0=$ffff3e00
;  d1=$fff0e000    a1=$c7ff7f00
;  d2=$3ff8f800    a2=$7ffe1c00
;  d3=$00070001    a3=$00000000
;  d4=$00060003    a4=$00000000
;  d5=$fffffff0    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffffc0    a7=$00000000
or13:
	or.l	d0,1608(a5)			; $fff8f000
	or.l	d0,808(a5)			; $fff8f000
	or.l	d1,1768(a5)			; $fff0e000
	or.l	d1,648(a5)			; $fff0e000
	or.l	d2,1448(a5)			; $3ff8f800
	or.l	d2,1288(a5)			; $3ff8f800
	or.l	d2,1128(a5)			; $3ff8f800
	or.l	d2,968(a5)			; $3ff8f800
	or.l	d3,1600(a5)			; $00070001
	or.l	d3,800(a5)			; $00070001
	or.l	d4,1440(a5)			; $00060003
	or.l	d4,1280(a5)			; $00060003
	or.l	d4,1120(a5)			; $00060003
	or.l	d4,960(a5)			; $00060003
	or.w	d5,1928(a5)			; $fff0
	or.w	d5,488(a5)			; $fff0
	or.w	d6,2088(a5)			; $ffe0
	or.w	d6,328(a5)			; $ffe0
	or.w	d7,2248(a5)			; $ffc0
	or.w	d7,168(a5)			; $ffc0
	or.b	#$3f,2408(a5)			; $3f
	or.b	#$3f,8(a5)			; $3f
	or.b	d4,1921(a5)			; $03
	or.b	d4,1761(a5)			; $03
	or.b	d4,641(a5)			; $03
	or.b	d4,481(a5)			; $03
	or.b	d3,2081(a5)			; $01
	or.b	d3,321(a5)			; $01
	rts

; Code for sprite shit 12
; Data registers:
;  d0=$ffe0c000    a0=$ffff3e00
;  d1=$fff0e000    a1=$c7ff7f00
;  d2=$7ff0f000    a2=$7ffe1c00
;  d3=$000f0003    a3=$00000000
;  d4=$000c0007    a4=$00000000
;  d5=$00070001    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$ffffffc0    a7=$00000000
or12:
	or.l	d1,1608(a5)			; $fff0e000
	or.l	d1,808(a5)			; $fff0e000
	or.l	d0,1768(a5)			; $ffe0c000
	or.l	d0,648(a5)			; $ffe0c000
	or.l	d2,1448(a5)			; $7ff0f000
	or.l	d2,1288(a5)			; $7ff0f000
	or.l	d2,1128(a5)			; $7ff0f000
	or.l	d2,968(a5)			; $7ff0f000
	or.l	d3,1600(a5)			; $000f0003
	or.l	d3,800(a5)			; $000f0003
	or.l	d4,1440(a5)			; $000c0007
	or.l	d4,1280(a5)			; $000c0007
	or.l	d4,1120(a5)			; $000c0007
	or.l	d4,960(a5)			; $000c0007
	or.l	d5,1760(a5)			; $00070001
	or.l	d5,640(a5)			; $00070001
	or.w	d6,1928(a5)			; $ffe0
	or.w	d6,488(a5)			; $ffe0
	moveq	#-128,d7
	or.w	d7,2248(a5)			; $ff80
	or.w	d7,168(a5)			; $ff80
	moveq	#$7e,d7
	or.b	d7,2408(a5)			; $7e
	or.b	d7,8(a5)			; $7e
	or.b	d4,1921(a5)			; $07
	or.b	d4,481(a5)			; $07
	or.b	d3,2081(a5)			; $03
	or.b	d3,321(a5)			; $03
	or.b	d5,2241(a5)			; $01
	or.b	d5,161(a5)			; $01
	moveq	#-64,d7
	or.w	d7,2088(a5)			; $ffc0
	or.w	d7,328(a5)			; $ffc0
	rts

; Code for sprite shit 11
; Data registers:
;  d0=$ffe0e000    a0=$ffff3e00
;  d1=$ffe0c000    a1=$c7ff7f00
;  d2=$ffc08000    a2=$7ffe1c00
;  d3=$001f0007    a3=$00000000
;  d4=$0018000f    a4=$00000000
;  d5=$000f0003    a5=$00000000
;  d6=$ffffff80    a6=$00000000
;  d7=$ffffffc0    a7=$00000000
or11:
	or.l	d0,1448(a5)			; $ffe0e000
	or.l	d0,1288(a5)			; $ffe0e000
	or.l	d0,1128(a5)			; $ffe0e000
	or.l	d0,968(a5)			; $ffe0e000
	or.l	d1,1608(a5)			; $ffe0c000
	or.l	d1,808(a5)			; $ffe0c000
	or.l	d2,1768(a5)			; $ffc08000
	or.l	d2,648(a5)			; $ffc08000
	or.l	d3,1600(a5)			; $001f0007
	or.l	d3,800(a5)			; $001f0007
	or.l	d4,1440(a5)			; $0018000f
	or.l	d4,1280(a5)			; $0018000f
	or.l	d4,1120(a5)			; $0018000f
	or.l	d4,960(a5)			; $0018000f
	or.l	d5,1760(a5)			; $000f0003
	or.l	d5,640(a5)			; $000f0003
	or.w	d6,2088(a5)			; $ff80
	or.w	d6,328(a5)			; $ff80
	moveq	#-1,d7
	move.b	d7,2248(a5)			; $ff
	move.b	d7,168(a5)			; $ff
	moveq	#-4,d7
	or.b	d7,2408(a5)			; $fc
	or.b	d7,8(a5)			; $fc
	or.b	d4,1921(a5)			; $0f
	or.b	d4,481(a5)			; $0f
	or.b	d3,2081(a5)			; $07
	or.b	d3,321(a5)			; $07
	or.b	d5,2241(a5)			; $03
	or.b	d5,161(a5)			; $03
	moveq	#-64,d7
	or.w	d7,1928(a5)			; $ffc0
	or.w	d7,488(a5)			; $ffc0
	rts

; Code for sprite shit 10
; Data registers:
;  d0=$ffc0c000    a0=$ffff3e00
;  d1=$003f000f    a1=$c7ff7f00
;  d2=$ffc08000    a2=$7ffe1c00
;  d3=$0031001f    a3=$00000000
;  d4=$001f0007    a4=$00000000
;  d5=$ffffffff    a5=$00000000
;  d6=$ffffff80    a6=$00000000
;  d7=$fffffffe    a7=$00000000
or10:
	or.l	d0,1448(a5)			; $ffc0c000
	or.l	d0,1288(a5)			; $ffc0c000
	or.l	d0,1128(a5)			; $ffc0c000
	or.l	d0,968(a5)			; $ffc0c000
	or.l	d2,1608(a5)			; $ffc08000
	or.l	d2,808(a5)			; $ffc08000
	or.l	d1,1600(a5)			; $003f000f
	or.l	d1,800(a5)			; $003f000f
	or.l	d3,1440(a5)			; $0031001f
	or.l	d3,1280(a5)			; $0031001f
	or.l	d3,1120(a5)			; $0031001f
	or.l	d3,960(a5)			; $0031001f
	or.l	d4,1760(a5)			; $001f0007
	or.l	d4,640(a5)			; $001f0007
	or.w	d6,1928(a5)			; $ff80
	or.w	d6,1768(a5)			; $ff80
	or.w	d6,648(a5)			; $ff80
	or.w	d6,488(a5)			; $ff80
	move.b	d5,2088(a5)			; $ff
	move.b	d5,328(a5)			; $ff
	or.b	d7,2248(a5)			; $fe
	or.b	d7,168(a5)			; $fe
	or.b	#$f8,2408(a5)			; $f8
	or.b	#$f8,8(a5)			; $f8
	or.b	d3,1921(a5)			; $1f
	or.b	d3,481(a5)			; $1f
	or.b	d1,2081(a5)			; $0f
	or.b	d1,321(a5)			; $0f
	or.b	d4,2241(a5)			; $07
	or.b	d4,161(a5)			; $07
	bset	d0,2401(a5)		; $00000001
	bset	d0,1(a5)		; $00000001
	rts

; Code for sprite shit 9
; Data registers:
;  d0=$ff808000    a0=$ffff3e00
;  d1=$007f001f    a1=$c7ff7f00
;  d2=$0063003f    a2=$7ffe1c00
;  d3=$003f000e    a3=$00000000
;  d4=$fffffffc    a4=$00000000
;  d5=$ffffffff    a5=$00000000
;  d6=$ffffff80    a6=$00000000
;  d7=$fffffffe    a7=$00000000
or9:
	or.l	d0,1448(a5)			; $ff808000
	or.l	d0,1288(a5)			; $ff808000
	or.l	d0,1128(a5)			; $ff808000
	or.l	d0,968(a5)			; $ff808000
	or.l	d1,1600(a5)			; $007f001f
	or.l	d1,800(a5)			; $007f001f
	or.l	d2,1440(a5)			; $0063003f
	or.l	d2,1280(a5)			; $0063003f
	or.l	d2,1120(a5)			; $0063003f
	or.l	d2,960(a5)			; $0063003f
	or.l	d3,1760(a5)			; $003f000e
	or.l	d3,640(a5)			; $003f000e
	or.w	d6,1608(a5)			; $ff80
	or.w	d6,808(a5)			; $ff80
	or.b	d7,2088(a5)			; $fe
	or.b	d7,328(a5)			; $fe
	or.b	d4,2248(a5)			; $fc
	or.b	d4,168(a5)			; $fc
	moveq	#-16,d5
	or.b	d5,2408(a5)			; $f0
	or.b	d5,8(a5)			; $f0
	or.b	d2,1921(a5)			; $3f
	or.b	d2,481(a5)			; $3f
	or.b	d1,2081(a5)			; $1f
	or.b	d1,321(a5)			; $1f
	moveq	#15,d5
	or.b	d5,2241(a5)			; $0f
	or.b	d5,161(a5)			; $0f
	moveq	#3,d5
	or.b	d5,2401(a5)			; $03
;	or.b	d5,1(a5)			; $03
	or.w	d5,(a5)				; [ARNAUD]

	moveq	#-1,d5
	move.b	d5,1928(a5)			; $ff
	move.b	d5,1768(a5)			; $ff
	move.b	d5,648(a5)			; $ff
	move.b	d5,488(a5)			; $ff
	rts

; Code for sprite shit 8
; Data registers:
;  d0=$00ff003e    a0=$ffff3e00
;  d1=$00c7007f    a1=$c7ff7f00
;  d2=$007f001c    a2=$7ffe1c00
;  d3=$fffffff8    a3=$00000000
;  d4=$fffffffc    a4=$00000000
;  d5=$ffffffff    a5=$00000000
;  d6=$ffffffe0    a6=$00000000
;  d7=$fffffffe    a7=$00000000
or8:
	or.l	d0,1600(a5)			; $00ff003e
	or.l	d0,800(a5)			; $00ff003e
	or.l	d1,1440(a5)			; $00c7007f
	or.l	d1,1280(a5)			; $00c7007f
	or.l	d1,1120(a5)			; $00c7007f
	or.l	d1,960(a5)			; $00c7007f
	or.l	d2,1760(a5)			; $007f001c
	or.l	d2,640(a5)			; $007f001c
	or.b	d7,1928(a5)			; $fe
	or.b	d7,1768(a5)			; $fe
	or.b	d7,648(a5)			; $fe
	or.b	d7,488(a5)			; $fe
	or.b	d4,2088(a5)			; $fc
	or.b	d4,328(a5)			; $fc
	or.b	d3,2248(a5)			; $f8
	or.b	d3,168(a5)			; $f8
	or.b	d6,2408(a5)			; $e0
	or.b	d6,8(a5)			; $e0
	or.b	d1,1921(a5)			; $7f
	or.b	d1,481(a5)			; $7f

	moveq	#$3f,d5
	or.b	d5,2081(a5)			; $3f
	or.b	d5,321(a5)			; $3f
	moveq	#$1f,d5
	or.b	d5,2241(a5)			; $1f
	or.b	d5,161(a5)			; $1f
	moveq	#7,d5
	or.b	d5,2401(a5)			; $07
;	or.b	d5,1(a5)			; $07
	or.w	d5,(a5)				; [ARNAUD]
	moveq	#-1,d5
	move.b	d5,1608(a5)			; $ff
	move.b	d5,1448(a5)			; $ff
	move.b	d5,1288(a5)			; $ff
	move.b	d5,1128(a5)			; $ff
	move.b	d5,968(a5)			; $ff
	move.b	d5,808(a5)			; $ff
	rts

; Code for sprite shit 7
; Data registers:
;  d0=$01ff007c    a0=$ffff3e00
;  d1=$018f00fe    a1=$c7ff7f00
;  d2=$00ff0038    a2=$7ffe1c00
;  d3=$fffffff8    a3=$00000000
;  d4=$fffffffc    a4=$00000000
;  d5=$ffffffff    a5=$00000000
;  d6=$fffffff0    a6=$00000000
;  d7=$ffffffc0    a7=$00000000
or7:
	or.l	d0,1600(a5)			; $01ff007c
	or.l	d0,800(a5)			; $01ff007c
	or.l	d1,1440(a5)			; $018f00fe
	or.l	d1,1280(a5)			; $018f00fe
	or.l	d1,1120(a5)			; $018f00fe
	or.l	d1,960(a5)			; $018f00fe
	or.l	d2,1760(a5)			; $00ff0038
	or.l	d2,640(a5)			; $00ff0038
	or.b	d1,1608(a5)			; $fe
	or.b	d1,1448(a5)			; $fe
	or.b	d1,1288(a5)			; $fe
	or.b	d1,1128(a5)			; $fe
	or.b	d1,968(a5)			; $fe
	or.b	d1,808(a5)			; $fe
	or.b	d4,1928(a5)			; $fc
	or.b	d4,1768(a5)			; $fc
	or.b	d4,648(a5)			; $fc
	or.b	d4,488(a5)			; $fc
	or.b	d3,2088(a5)			; $f8
	or.b	d3,328(a5)			; $f8
	or.b	d6,2248(a5)			; $f0
	or.b	d6,168(a5)			; $f0
	or.b	d7,2408(a5)			; $c0
	or.b	d7,8(a5)			; $c0

	moveq	#$7f,d5
	or.b	d5,2081(a5)			; $7f
	or.b	d5,321(a5)			; $7f
	moveq	#$3f,d5
	or.b	d5,2241(a5)			; $3f
	or.b	d5,161(a5)			; $3f
	moveq	#$f,d5
	or.b	d5,2401(a5)			; $0f
;	or.b	d5,1(a5)			; $0f
	or.w	d5,(a5)				; [ARNAUD]
	moveq	#-1,d5
	move.b	d5,1921(a5)			; $ff
	move.b	d5,481(a5)			; $ff
	rts

; Code for sprite shit 6
; Data registers:
;  d0=$03ff00f8    a0=$ffff3e00
;  d1=$031f01fc    a1=$c7ff7f00
;  d2=$01ff0070    a2=$7ffe1c00
;  d3=$ffff01ff    a3=$00000000
;  d4=$ffffffe0    a4=$00000000
;  d5=$0000007f    a5=$00000000
;  d6=$fffffff0    a6=$00000000
;  d7=$0000001f    a7=$00000000
or6:
	or.l	d0,1600(a5)			; $03ff00f8
	or.l	d0,800(a5)			; $03ff00f8
	or.l	d1,1440(a5)			; $031f01fc
	or.l	d1,1280(a5)			; $031f01fc
	or.l	d1,1120(a5)			; $031f01fc
	or.l	d1,960(a5)			; $031f01fc
	or.l	d2,1760(a5)			; $01ff0070
	or.l	d2,640(a5)			; $01ff0070
	or.w	d3,1920(a5)			; $01ff
	or.w	d3,480(a5)			; $01ff
	or.b	d1,1608(a5)			; $fc
	or.b	d1,1448(a5)			; $fc
	or.b	d1,1288(a5)			; $fc
	or.b	d1,1128(a5)			; $fc
	or.b	d1,968(a5)			; $fc
	or.b	d1,808(a5)			; $fc
	or.b	d0,1928(a5)			; $f8
	or.b	d0,1768(a5)			; $f8
	or.b	d0,648(a5)			; $f8
	or.b	d0,488(a5)			; $f8
	or.b	d6,2088(a5)			; $f0
	or.b	d6,328(a5)			; $f0
	or.b	d4,2248(a5)			; $e0
	or.b	d4,168(a5)			; $e0
	bset	d3,2408(a5)
	bset	d3,8(a5)
	or.b	d5,2241(a5)			; $7f
	or.b	d5,161(a5)			; $7f
	or.b	d7,2401(a5)			; $1f
;	or.b	d7,1(a5)			; $1f
	or.w	d7,(a5)							; [ARNAUD]
	move.b	d3,2081(a5)			; $ff
	move.b	d3,321(a5)			; $ff
	rts

; Code for sprite shit 5
; Data registers:
;  d0=$07ff01f0    a0=$ffff3e00
;  d1=$063f03f8    a1=$c7ff7f00
;  d2=$03ff00e0    a2=$7ffe1c00
;  d3=$ffff01ff    a3=$00000000
;  d4=$ffff03ff    a4=$00000000
;  d5=$ffffffc0    a5=$00000000
;  d6=$0000003f    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or5:
	or.l	d0,1600(a5)			; $07ff01f0
	or.l	d0,800(a5)			; $07ff01f0
	or.l	d1,1440(a5)			; $063f03f8
	or.l	d1,1280(a5)			; $063f03f8
	or.l	d1,1120(a5)			; $063f03f8
	or.l	d1,960(a5)			; $063f03f8
	or.l	d2,1760(a5)			; $03ff00e0
	or.l	d2,640(a5)			; $03ff00e0
	or.w	d4,1920(a5)			; $03ff
	or.w	d4,480(a5)			; $03ff
	or.w	d3,2080(a5)			; $01ff
	or.w	d3,320(a5)			; $01ff
	move.b	d3,2241(a5)			; $ff
	move.b	d3,161(a5)			; $ff
	or.b	d1,1608(a5)			; $f8
	or.b	d1,1448(a5)			; $f8
	or.b	d1,1288(a5)			; $f8
	or.b	d1,1128(a5)			; $f8
	or.b	d1,968(a5)			; $f8
	or.b	d1,808(a5)			; $f8
	or.b	d0,1928(a5)			; $f0
	or.b	d0,1768(a5)			; $f0
	or.b	d0,648(a5)			; $f0
	or.b	d0,488(a5)			; $f0
	or.b	d2,2088(a5)			; $e0
	or.b	d2,328(a5)			; $e0
	or.b	d5,2248(a5)			; $c0
	or.b	d5,168(a5)			; $c0
	or.b	d6,2401(a5)			; $3f
;	or.b	d6,1(a5)			; $3f
	or.w	d6,(a5)				; [ARNAUD]
	rts

; Code for sprite shit 4
; Data registers:
;  d0=$0fff03e0    a0=$ffff3e00
;  d1=$0c7f07f0    a1=$c7ff7f00
;  d2=$07ff01c0    a2=$7ffe1c00
;  d3=$ffff01ff    a3=$00000000
;  d4=$ffff03ff    a4=$00000000
;  d5=$ffff07ff    a5=$00000000
;  d6=$0000007e    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or4:
	or.l	d0,1600(a5)			; $0fff03e0
	or.l	d0,800(a5)			; $0fff03e0
	or.l	d1,1440(a5)			; $0c7f07f0
	or.l	d1,1280(a5)			; $0c7f07f0
	or.l	d1,1120(a5)			; $0c7f07f0
	or.l	d1,960(a5)			; $0c7f07f0
	or.l	d2,1760(a5)			; $07ff01c0
	or.l	d2,640(a5)			; $07ff01c0
	or.w	d5,1920(a5)			; $07ff
	or.w	d5,480(a5)			; $07ff
	or.w	d4,2080(a5)			; $03ff
	or.w	d4,320(a5)			; $03ff
	or.w	d3,2240(a5)			; $01ff
	or.w	d3,160(a5)			; $01ff
	or.b	d1,1608(a5)			; $f0
	or.b	d1,1448(a5)			; $f0
	or.b	d1,1288(a5)			; $f0
	or.b	d1,1128(a5)			; $f0
	or.b	d1,968(a5)			; $f0
	or.b	d1,808(a5)			; $f0
	or.b	d0,1928(a5)			; $e0
	or.b	d0,1768(a5)			; $e0
	or.b	d0,648(a5)			; $e0
	or.b	d0,488(a5)			; $e0
	or.b	d2,2088(a5)			; $c0
	or.b	d2,328(a5)			; $c0
	or.b	d7,2248(a5)			; $80
	or.b	d7,168(a5)			; $80
	or.b	d6,2401(a5)			; $7e
;	or.b	d6,1(a5)			; $7e
	or.w	d6,(a5)				; [ARNAUD]
	rts

; Code for sprite shit 3
; Data registers:
;  d0=$1fff07c0    a0=$ffff3e00
;  d1=$18ff0fe0    a1=$c7ff7f00
;  d2=$0fff0380    a2=$7ffe1c00
;  d3=$ffff0fff    a3=$00000000
;  d4=$ffff03ff    a4=$00000000
;  d5=$ffff07ff    a5=$00000000
;  d6=$fffffffc    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or3:
	or.l	d0,1600(a5)			; $1fff07c0
	or.l	d0,800(a5)			; $1fff07c0
	or.l	d1,1440(a5)			; $18ff0fe0
	or.l	d1,1280(a5)			; $18ff0fe0
	or.l	d1,1120(a5)			; $18ff0fe0
	or.l	d1,960(a5)			; $18ff0fe0
	or.l	d2,1760(a5)			; $0fff0380
	or.l	d2,640(a5)			; $0fff0380
	or.w	d3,1920(a5)			; $0fff
	or.w	d3,480(a5)			; $0fff
	or.w	d5,2080(a5)			; $07ff
	or.w	d5,320(a5)			; $07ff
	or.w	d4,2240(a5)			; $03ff
	or.w	d4,160(a5)			; $03ff
	or.b	d6,2401(a5)			; $fc
	or.b	d6,1(a5)			; $fc			!!! Can't use .w !
	or.b	d1,1608(a5)			; $e0
	or.b	d1,1448(a5)			; $e0
	or.b	d1,1288(a5)			; $e0
	or.b	d1,1128(a5)			; $e0
	or.b	d1,968(a5)			; $e0
	or.b	d1,808(a5)			; $e0
	or.b	d0,1928(a5)			; $c0
	or.b	d0,1768(a5)			; $c0
	or.b	d0,648(a5)			; $c0
	or.b	d0,488(a5)			; $c0
	or.b	d2,2088(a5)			; $80
	or.b	d2,328(a5)			; $80
	rts

; Code for sprite shit 2
; Data registers:
;  d0=$3fff0f80    a0=$ffff3e00
;  d1=$31ff1fc0    a1=$c7ff7f00
;  d2=$1fff0700    a2=$7ffe1c00
;  d3=$ffff0fff    a3=$00000000
;  d4=$ffff1fff    a4=$00000000
;  d5=$ffff07fe    a5=$00000000
;  d6=$ffff01f8    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or2:
	or.l	d0,1600(a5)			; $3fff0f80
	or.l	d0,800(a5)			; $3fff0f80
	or.l	d1,1440(a5)			; $31ff1fc0
	or.l	d1,1280(a5)			; $31ff1fc0
	or.l	d1,1120(a5)			; $31ff1fc0
	or.l	d1,960(a5)			; $31ff1fc0
	or.l	d2,1760(a5)			; $1fff0700
	or.l	d2,640(a5)			; $1fff0700
	or.w	d4,1920(a5)			; $1fff
	or.w	d4,480(a5)			; $1fff
	or.w	d3,2080(a5)			; $0fff
	or.w	d3,320(a5)			; $0fff
	or.w	d5,2240(a5)			; $07fe
	or.w	d5,160(a5)			; $07fe
	or.w	d6,2400(a5)			; $01f8
	or.w	d6,(a5)			; $01f8
	or.b	d1,1608(a5)			; $c0
	or.b	d1,1448(a5)			; $c0
	or.b	d1,1288(a5)			; $c0
	or.b	d1,1128(a5)			; $c0
	or.b	d1,968(a5)			; $c0
	or.b	d1,808(a5)			; $c0
	or.b	d0,1928(a5)			; $80
	or.b	d0,1768(a5)			; $80
	or.b	d0,648(a5)			; $80
	or.b	d0,488(a5)			; $80
	rts

; Code for sprite shit 1
; Data registers:
;  d0=$7fff1f00    a0=$ffff3e00
;  d1=$63ff3f80    a1=$c7ff7f00
;  d2=$3fff0e00    a2=$7ffe1c00
;  d3=$ffff1ffe    a3=$00000000
;  d4=$ffff3fff    a4=$00000000
;  d5=$ffff0ffc    a5=$00000000
;  d6=$ffff03f0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or1:
	or.l	d0,1600(a5)			; $7fff1f00
	or.l	d0,800(a5)			; $7fff1f00
	or.l	d1,1440(a5)			; $63ff3f80
	or.l	d1,1280(a5)			; $63ff3f80
	or.l	d1,1120(a5)			; $63ff3f80
	or.l	d1,960(a5)			; $63ff3f80
	or.l	d2,1760(a5)			; $3fff0e00
	or.l	d2,640(a5)			; $3fff0e00
	or.w	d4,1920(a5)			; $3fff
	or.w	d4,480(a5)			; $3fff
	or.w	d3,2080(a5)			; $1ffe
	or.w	d3,320(a5)			; $1ffe
	or.w	d5,2240(a5)			; $0ffc
	or.w	d5,160(a5)			; $0ffc
	or.w	d6,2400(a5)			; $03f0
	or.w	d6,(a5)			; $03f0
	or.b	d1,1608(a5)			; $80
	or.b	d1,1448(a5)			; $80
	or.b	d1,1288(a5)			; $80
	or.b	d1,1128(a5)			; $80
	or.b	d1,968(a5)			; $80
	or.b	d1,808(a5)			; $80
	rts

; Code for sprite shit 0
; Data registers:
;  d0=$ffff3e00    a0=$ffff3e00
;  d1=$c7ff7f00    a1=$c7ff7f00
;  d2=$7ffe1c00    a2=$7ffe1c00
;  d3=$ffff3ffc    a3=$00000000
;  d4=$ffff7ffe    a4=$00000000
;  d5=$ffff1ff8    a5=$00000000
;  d6=$ffff07e0    a6=$00000000
;  d7=$ffffff80    a7=$00000000
or0:
	or.l	d0,1600(a5)			; $ffff3e00
	or.l	d0,800(a5)			; $ffff3e00
	or.l	d1,1440(a5)			; $c7ff7f00
	or.l	d1,1280(a5)			; $c7ff7f00
	or.l	d1,1120(a5)			; $c7ff7f00
	or.l	d1,960(a5)			; $c7ff7f00
	or.l	d2,1760(a5)			; $7ffe1c00
	or.l	d2,640(a5)			; $7ffe1c00
	or.w	d4,1920(a5)			; $7ffe
	or.w	d4,480(a5)			; $7ffe
	or.w	d3,2080(a5)			; $3ffc
	or.w	d3,320(a5)			; $3ffc
	or.w	d5,2240(a5)			; $1ff8
	or.w	d5,160(a5)			; $1ff8
	or.w	d6,2400(a5)			; $07e0
	or.w	d6,(a5)			; $07e0
	rts

