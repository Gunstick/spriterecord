;  by Gunstick of ULM (c) 2004 and for all eternity...

def_version equ 10
d0_for_mcp equ 0
mcp_adr equ $00000500

;        >PART 'my sync'

;        default 1

;        opt X+,D+
;        output 'E:\PROGRAMS\X.PRG'

        ifeq def_version
;        opt X-,D-
;        default 3
;        output 'E:\PACK\X.BIN'
;        org $00002500
        endc

        text
x:
        ifne def_version
        pea     start(pc)
        move.w  #38,-(sp)
        trap    #14
        addq.l  #6,sp

        clr.w   -(sp)
        trap    #1
        endc

start:
        lea     oldcpu(pc),a0
        move.l  sp,(a0)+
        lea     my_stack,sp
        move    sr,(a0)+
        move    #$2700,sr
        move    usp,a1
        move.l  a1,(a0)+

        ifne def_version
        moveq   #$12,d0
        bsr     ikbd_wrt
        moveq   #$1a,d0
        bsr     ikbd_wrt

        move.l  $00000408.w,old_408
        move.l  #exit_with_408,$00000408.w
        endc

        bsr     get_st_type
        bsr     get_mfp_type

        bsr.s   save_system


        bsr     video_init
;        bsr     vect_mfp_init
        bsr     sound_init

        bra     screen
back:
        lea     my_stack,sp

        bsr     sound_init

        bsr     restore_system

        bsr     video_init2

        ifne def_version
        moveq   #$14,d0
        bsr     ikbd_wrt
        moveq   #$08,d0
        bsr     ikbd_wrt
        endc

        lea     oldcpu(pc),a0
        movea.l (a0)+,sp
        move    (a0)+,sr
        movea.l (a0)+,a1
        move    a1,usp

        ifne def_version
        move.l  old_408(pc),$00000408.w
        rts
        endc

        ifeq def_version
        moveq   #d0_for_mcp,d0
        jsr     mcp_adr.w
        endc

save_system:
        lea     oldpsg(pc),a0
        moveq   #15,d0
save_psg_loop:
        move.b  d0,$ffff8800.w
        move.b  $ffff8800.w,(a0)+
        dbra    d0,save_psg_loop

        lea     oldvideo(pc),a0
        move.b  $ffff8260.w,(a0)+
        move.b  $ffff820a.w,(a0)+
        move.l  $ffff8200.w,(a0)+

        tst.w   st_type
        beq.s   save_system_no_ste

        move.b  $ffff8209.w,(a0)+
        move.b  $ffff820d.w,(a0)+
        move.b  $ffff820f.w,(a0)+
        move.b  $ffff8265.w,(a0)+

save_system_no_ste:
        movem.l $ffff8240.w,d0-d7
        movem.l d0-d7,(a0)

        lea     oldvectors(pc),a0
        move.l  $00000068.w,(a0)+
        move.l  $00000070.w,(a0)+
        move.l  $00000114.w,(a0)+
        move.l  $00000118.w,(a0)+
        move.l  $00000120.w,(a0)+
        move.l  $00000134.w,(a0)+

        lea     oldmfp(pc),a0
        move.b  $fffffa07.w,(a0)+
        move.b  $fffffa09.w,(a0)+
        move.b  $fffffa13.w,(a0)+
        move.b  $fffffa15.w,(a0)+
        move.b  $fffffa17.w,(a0)+
        move.b  $fffffa19.w,(a0)+
        move.b  $fffffa1b.w,(a0)+
        move.b  $fffffa1d.w,(a0)+

        rts

restore_system:
        lea     oldmfp(pc),a0
        move.b  (a0)+,$fffffa07.w
        move.b  (a0)+,$fffffa09.w
        move.b  (a0)+,$fffffa13.w
        move.b  (a0)+,$fffffa15.w
        move.b  (a0)+,$fffffa17.w
        move.b  (a0)+,$fffffa19.w
        move.b  (a0)+,$fffffa1b.w
        move.b  (a0)+,$fffffa1d.w

        lea     oldvectors(pc),a0
        move.l  (a0)+,$00000068.w
        move.l  (a0)+,$00000070.w
        move.l  (a0)+,$00000114.w
        move.l  (a0)+,$00000118.w
        move.l  (a0)+,$00000120.w
        move.l  (a0)+,$00000134.w

        lea     oldvideo(pc),a0
        move.b  (a0)+,$ffff8260.w
        move.b  (a0)+,$ffff820a.w
        move.l  (a0)+,$ffff8200.w

        tst.w   st_type
        beq.s   restore_system_no_ste

        move.b  (a0)+,$ffff8209.w
        move.b  (a0)+,$ffff820d.w
        move.b  (a0)+,$ffff820f.w
        move.b  (a0)+,$ffff8265.w

restore_system_no_ste:
        movem.l (a0),d0-d7
        movem.l d0-d7,$ffff8240.w

        lea     oldpsg(pc),a0
        moveq   #15,d0
restore_psg_loop:
        move.b  d0,$ffff8800.w
        move.b  (a0)+,$ffff8802.w
        dbra    d0,restore_psg_loop

        rts

video_init:
        movem.l black(pc),d0-d7
;        movem.l d0-d7,$ffff8240.w

        bsr     waitvbl
        move.b  #0,$ffff8260.w
        move.b  #2,$ffff820a.w

        tst.w   st_type
        beq.s   videoinit_no_ste
        clr.b   $ffff8209.w
        clr.b   $ffff820d.w
        clr.b   $ffff820f.w
        clr.b   $ffff8265.w
videoinit_no_ste:

        rts

video_init2:
        move.b  #2,$ffff820a.w
        bsr     waitvbl
        move.b  #0,$ffff820a.w
        bsr     waitvbl
        move.b  #2,$ffff820a.w
        bsr     waitvbl
        rts

sound_init:
        moveq   #10,d0
        lea     $ffff8800.w,a0
nextinit:
        move.b  d0,(a0)
        move.b  #0,2(a0)
        dbra    d0,nextinit
        move.b  #7,(a0)
        move.b  #$7f,2(a0)
        move.b  #14,(a0)
        move.b  #$26,2(a0)

        tst.w   st_type
        beq.s   sound_init_no_ste

        clr.w   $ffff8900.w

        move.w  #$07ff,$ffff8924.w
        move.w  #%0000010011101000,$ffff8922.w ;set volume
        move.w  #%0000010101010100,$ffff8922.w ;set left channel volume
        move.w  #%0000010100010100,$ffff8922.w ;set right channel volume
        move.w  #%0000010010000110,$ffff8922.w ;set treble
        move.w  #%0000010001000110,$ffff8922.w ;set bass
        move.w  #%0000010000000001,$ffff8922.w ;set mix GI sound chip output

sound_init_no_ste:
        rts

vect_mfp_init:
        move.l  #nix,$00000068.w
        move.l  #nix,$00000070.w
        move.l  #nix,$00000114.w
        move.l  #nix,$00000118.w
        move.l  #nix,$00000120.w
        move.l  #nix,$00000134.w

        bclr    #3,$fffffa17.w
        clr.b   $fffffa07.w
        clr.b   $fffffa09.w

        rts

waitvbl:
        movem.l d0-d1/a0,-(sp)
        lea     $ffff8209.w,a0
        movep.w -8(a0),d0
waitvblx1:
        tst.b   (a0)
        beq.s   waitvblx1
waitvblx2:
        tst.b   (a0)
        bne.s   waitvblx2
        movep.w -4(a0),d1
        cmp.w   d0,d1
        bne.s   waitvblx2
        movem.l (sp)+,d0-d1/a0
        rts

ikbd_wrt:
        lea     $fffffc00.w,a0
ik_wait:
        move.b  (a0),d1
        btst    #1,d1
        beq.s   ik_wait
        move.b  d0,2(a0)
        rts

get_mfp_type:
        move.b  #0,$fffffa19.w
        move.b  #255,$fffffa1f.w
        move.b  #1,$fffffa19.w

        moveq   #-1,d0
mfp_test_loop:
        dbra    d0,mfp_test_loop

        moveq   #0,d0
        move.b  $fffffa1f.w,d0
        move.b  #0,$fffffa19.w
        cmp.w   #$009b,d0
        ble.s   mfp_of_my_st
        move.w  #-1,mfp_type
mfp_of_my_st:
        rts

get_st_type:
        clr.w   st_type
        move.l  sp,gst_sp
        move.l  $00000008.w,gst_bussi
        move.l  #gst_bussibus,$00000008.w
        tst.w   $ffff8900
        move.w  #-$0001,st_type
gst_bussibus:
gst_sp  equ *+2
        lea     0,sp
gst_bussi equ *+2
        move.l  #0,$00000008.w
        rts

        ifne def_version
        dc.l 'XBRA'
        dc.l 'TFSY'
old_408:
        dc.l 0
exit_with_408:
        bsr.s   exit
        movea.l old_408(pc),a0
        jmp     (a0)
        endc

exit:
        clr.b   $ffff8207.w
        clr.b   $ffff8209.w
        move    #$2700,sr

        movem.l black(pc),d0-d7
        movem.l d0-d7,$ffff8240.w

        bra     back

load_file:
        move    sr,-(sp)
        move    #$2700,sr

        moveq   #15,d0
save_psg_loop_lf:
        move.b  d0,$ffff8800.w
        move.b  $ffff8800.w,-(sp)
        dbra    d0,save_psg_loop_lf

        lea     $fffffa00.w,a1
        movep.w $0007(a1),d0
        move.w  d0,-(sp)
        movep.l $0013(a1),d0
        move.l  d0,-(sp)
        movep.w $001b(a1),d0
        move.w  d0,-(sp)

        move.l  $00000068.w,-(sp)
        move.l  $00000070.w,-(sp)
        move.l  $00000114.w,-(sp)
        move.l  $00000118.w,-(sp)
        move.l  $00000120.w,-(sp)
        move.l  $00000134.w,-(sp)

        lea     oldpsg(pc),a0
        moveq   #15,d0
restore_psg_loop_lf:
        move.b  d0,$ffff8800.w
        move.b  (a0)+,$ffff8802.w
        dbra    d0,restore_psg_loop_lf

        lea     oldmfp(pc),a0
        move.b  (a0)+,$fffffa07.w
        move.b  (a0)+,$fffffa09.w
        move.b  (a0)+,$fffffa13.w
        move.b  (a0)+,$fffffa15.w
        move.b  (a0)+,$fffffa17.w
        move.b  (a0)+,$fffffa19.w
        move.b  (a0)+,$fffffa1b.w
        move.b  (a0)+,$fffffa1d.w

        lea     oldvectors(pc),a0
        move.l  (a0)+,$00000068.w
        move.l  (a0)+,$00000070.w
        move.l  (a0)+,$00000114.w
        move.l  (a0)+,$00000118.w
        move.l  (a0)+,$00000120.w
        move.l  (a0)+,$00000134.w

        move    #$2300,sr

        clr.w   -(sp)
        pea     (a5)
        move.w  #$003d,-(sp)
        trap    #1
        addq.l  #8,sp

        tst.w   d0
        bmi     exit

        move.w  d0,d7

        pea     (a6)
        move.l  #500000,-(sp)
        move.w  d7,-(sp)
        move.w  #$003f,-(sp)
        trap    #1
        lea     $000c(sp),sp

        move.w  d7,-(sp)
        move.w  #$003e,-(sp)
        trap    #1
        addq.l  #4,sp

        move    #$2700,sr

        move.l  (sp)+,$00000134.w
        move.l  (sp)+,$00000120.w
        move.l  (sp)+,$00000118.w
        move.l  (sp)+,$00000114.w
        move.l  (sp)+,$00000070.w
        move.l  (sp)+,$00000068.w

        lea     $fffffa00.w,a1
        move.w  (sp)+,d0
        movep.w d0,$001b(a1)
        move.l  (sp)+,d0
        movep.l d0,$0013(a1)
        move.w  (sp)+,d0
        movep.w d0,$0007(a1)

        moveq   #15,d0
restore_psg_loop_lf_:
        move.b  d0,$ffff8800.w
        move.b  (sp)+,$ffff8802.w
        dbra    d0,restore_psg_loop_lf_

        move    (sp)+,sr

        rts

nix:
        rte

oldcpu: ds.w 4
oldvideo:ds.w 21
oldpsg: ds.b 16
oldvectors:ds.l 6
oldmfp: ds.w 5
mfp_type:ds.w 1
st_type:ds.w 1
black:  ds.l 16

;        endpart

;        PART 'prepare'

screen:
        lea     bss_start,a0
        lea     bss_end,a1
        movem.l black(pc),d1-d7/a2-a6
clear_loop:
        movem.l d1-d7/a2-a6,(a0)
        movem.l d1-d7/a2-a6,12*4(a0)
        movem.l d1-d7/a2-a6,24*4(a0)
        lea     36*4(a0),a0
        cmpa.l  a0,a1
        bpl.s   clear_loop

        move.l  #screenmem,d0
        add.l   #255,d0
        and.l   #$00ffff00,d0
        move.l  d0,screenad
        ror.l   #8,d0
        lea     $ffff8201.w,a0
        movep.w d0,0(a0)

        lea     my_stack,sp
        bsr     waitvbl
        movem.l pal,d0-d7
        movem.l d0-d7,$ffff8240.w

       lea spritecode,a6
;        endpart

;        PART 'main loop'

        move.l screenad,d0
        add.l #32000,d0
        move.l d0,screenad+4

loop:
        
        cmpi.b  #57,$fffffc02.w
        beq     exit
       move.w  #$070,$ffff8240.w

no_key:
wait_end_of_video:
        lea     $ffff8209.w,a0
        move.b  (a0),d7

;put musics here, don't change d7
        dcb 97-7-7-4-4,$00004e71
        moveq   #30,d2
        cmp.b   (a0),d7
        bne   wait_end_of_video
       move.w  #$000,$ffff8240.w
;        dcb 4500,$00004e71
sync:
;        move.b  (a0),d7
;        beq.s   sync
;        sub.w   d7,d2
;        lsl.l   d2,d2

        move.l screenad+4,d0     ; load non displaying
        move.l d0,a0  ; draw on this screen     
   
        move.l screenad,screenad+4 ; swap
        move.l d0,screenad
        ror.l   #8,d0
        lea     $ffff8201.w,a1
        movep.w d0,0(a1)


;        moveq   #0,d0

;        move.w  #911,$ffff8240.w
;        move.w  #0,$ffff8240.w
;        dcb 97-7-7-4-4,$00004e71
;        move.w  d0,(a0)         ;~2
;        or.w    d0,(a0)         ;~3
;        or.l    d0,(a0)         ;~5
;        or.l    d0,8(a0)        ;~6
;        move.l  d0,(a0)         ;~3
;        move.l  d0,8(a0)        ;~4
;        or.l    d0,0(a0,d0.w)   ;~7
;        move.l  d0,0(a0,d0.w)   ;~5
;        ori.l   #%00000000000000000001111011011101,(a0) ;~7
;        addq.l  #2,a0           ;~2
;        move.l  a0,d0           ;~1
;        move.w  #$0777,$ffff8240.w
;        move.w  #0,$ffff8240.w

;        move.w  #$0707,$ffff8240.w
        movea.l screenad+4,a0
    
        tst.w (a6)
        bge  notwaveend
        lea spritecode,a6
notwaveend:
;        move.w  #$0707,$ffff8240.w
        bsr     drawallsprt
 
;        bsr     waitvbl

        bra     loop

drawallsprt:
        include 'CBLESPRT.S'




        

;        endpart

        data

;        PART 'data'
pal:
        dc.w $0000,$0003,$0007,$0004,$0444,$0555,$0666,$0777
        dc.w $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
sprite:
        dc.w %0000011111100000,%0000000000000000 ;d0,xx
        dc.w %0001111111111000,%0000000000000000 ;d1,xx
        dc.w %0011111111111100,%0000000000000000 ;d2,xx
        dc.w %0111111111111110,%0000000000000000 ;d3,xx
        dc.w %0111111111111110,%0001111000000000 ;d3,d4
        dc.w %1111111111111111,%0011111100000000 ;d5,d6
        dc.w %1100001111111111,%0111111110000000 ;d7,d8
        dc.w %1100001111111111,%0111111110000000 ;d7,d8
        dc.w %1100001111111111,%0111111110000000
        dc.w %1100001111111111,%0111111110000000
        dc.w %1111111111111111,%0011111100000000
        dc.w %0111111111111110,%0001111000000000
        dc.w %0111111111111110,%0000000000000000
        dc.w %0011111111111100,%0000000000000000
        dc.w %0001111111111000,%0000000000000000
        dc.w %0000011111100000,%0000000000000000


spritecode_tst:
        include 'wave.s'
   dc.w 1
plopp:
   dc.w 160*5,16
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 1
         dc.w 160+8*5
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 0
        dc.w 1
hopp:    dc.w 160*5+8
       dc.w -1


spritedat0:
        dc.w %0000011111100000  ;d0,xx
        dc.w %0001111111111000  ;d1,xx
        dc.w %0011111111111100  ;d2,xx
        dc.w %0111111111111110  ;d3,xx
        dc.w %0001111000000000  ;..,d4
        dc.w %1111111111111111,%0011111100000000 ;d5,d6
        dc.w %1100001111111111,%0111111110000000 ;d7,a6


        dc.w %0000011111100000,%0000000000000000 ;d0,xx
        dc.w %0001111111111000,%0000000000000000 ;d1,xx
        dc.w %0011111111111100,%0000000000000000 ;d2,xx
        dc.w %0111111111111110,%0000000000000000 ;d3,xx
        dc.w %0110000111111110,%0001111000000000 ;d4,d5
        dc.w %1100000011111111,%0011111100000000 ;d6,d7
        dc.w %1011110001111111,%0111111110000000 ;d8,d9
        dc.w %1011110001111111,%0111111110000000 ;
        dc.w %1011110001111111,%0111111110000000
        dc.w %1011110001111111,%0111111110000000
        dc.w %1100000011111111,%0011111100000000
        dc.w %0110000111111110,%0001111000000000
        dc.w %0111111111111110,%0000000000000000
        dc.w %0011111111111100,%0000000000000000
        dc.w %0001111111111000,%0000000000000000
        dc.w %0000011111100000,%0000000000000000

font:

        dc.l $ffffffff


;        endpart

        bss

bss_start:                      ;here starts the bss

;        PART 'bss'

screenad:ds.l 1
 ds.l 1

screenmem:ds.l 64
        ds.l 8000
        ds.l 8000
        ds.l 100
my_stack:

;        endpart

bss_end:                        ;here ends the bss
        end
