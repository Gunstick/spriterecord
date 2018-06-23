#!/usr/bin/perl

$debug=1;
$wavelen=36;    # demo value: 360
$nb_sprites=1; 
# first version: 80
# with 16 block column joined erase: 201
# with detailed column eraser: 215
# added unused move sprite instead of or: 218
# small non generated code cleanup: 220
# new curb (7*2 -4*2 6*2 -3*2 2*2 4*2 -2*2 4*2): 222
# move code for doing *-4 of deltab into deltab: 223
# that curb was bad, new one: 225
# activating exactly 16 move instead of or: 229
# activating crudely all possible moves: 229
# without music 228 with music 225
# music + incredible wobbly VBL ... 227 (but needs 3 screens)
# HBL interrupt added: 226
# scroll time simulator added: 225

print ";set a0 to screen base\n";
print ";set a6 to sprite curb start base\n";
print ";modifies d0-d7/a0-a4\n";
print ";sprite curb format:\n";
print ";number_of_deletes  ; table of 16xn stripes to erase\n";
print ";delete1.w,dellen1.w ;repeated number_of_deletes times\n";
print "; [...]\n";
print ";number_of_shift15.w\n";
print ";offset_1.w   ;repeated number_of_shift15 times\n";
print ";offset_2.w   ;distance to next sprite in screen coords\n";
print "; [...]\n";
print ";number_of_shift14.w\n";
print ";offset_1.w   ;repeated number_of_shift14 times\n";
print "; [...]\n";
print "; ... until shift 0\n";
print "\n";
print "writesprite:      ; bsr here with a0 & a6 set\n";

# TODO
# instead of move An,D7 with byte data use moveq
# try to carry over registers from oner routine to next
# use the move sprite code

print "\n";
print "\n";
print "\tlea clearcode,a2\n";
print "\tmove.w (a6)+,d0\n";
print "\tmoveq.l #0,d2\n";
print "\tmove.l a0,a1\n";
print "delsprite_l:\n";
print "\t adda.w (a6)+,a1\n";
print "\t move.w (a6)+,d1\n";
#print "\t lsl.w #2,d1\n";
#print "\t add.w d1,d1\n";
#print "\t add.w d1,d1\n";
#print "\t neg.w d1\n";
print "\t jmp (a2,d1)\n";
for ($i=200;$i>=0;$i--)
{
  print "\t move.l d2,$i*160(a1)\n";
  #print "\t adda.w #160,a1\n";
}
print "clearcode:\n";
print "\t dbra d0,delsprite_l\n";

print "\tmove.w #\$000,\$ffff8240.w\n";
print "\t add.w #1120,a0\n";

foreach $as (0..15)
{
$s=15-$as;
#$s=$as;
{
  my @sprite;
  my @writesprite;
  my @ORval;
  my @ORlen;
  my @ORoffset;
  my @ORindexes;
  my @patttab;
  my %pattern;
  my %reg;
  my @regcont;
  my $a0offset;
  my $bsetok;
  my $matched;
  my $need;

@sprite=(0b00000111111000000000000000000000,0,
         0b00011111111110000000000000000000,0, 
         0b00111111111111000000000000000000,0,
         0b01111111111111100000000000000000,0,
         0b01111111111111100001110000000000,0,
         0b11111111111111110011111000000000,0,
         0b11000111111111110111111100000000,0,
         0b11000111111111110111111100000000,0,
         0b11000111111111110111111100000000,0,
         0b11000111111111110111111100000000,0,
         0b11111111111111110011111000000000,0,
         0b01111111111111100001110000000000,0,
         0b01111111111111100000000000000000,0,
         0b00111111111111000000000000000000,0,
         0b00011111111110000000000000000000,0,
         0b00000111111000000000000000000000,0,
        );
# swap sprite planes
# invert colors 1&2
for ($i=0;$i<=$#sprite;$i++)
{
#  $sprite[$i]=($sprite[$i] & 0xffff) | (($sprite[$i] & 0xffff0000)>>16 ^ ($sprite[$i] & 0xffff))<<16
}
for ($i=0;$i<=$#sprite;$i+=2)
{
#  $sprite[$i]=(($sprite[$i] & 0xffff)<<16) + (($sprite[$i] & 0xffff0000) >>16)
}
;
# shift sprite
#$s=$ARGV[0];
for ($i=0;$i<=$#sprite;$i+=2)
{
  # planeshift
  $plane1=sprintf "%016b",($sprite[$i] & 0xffff0000)>>16;
  $plane2=sprintf "%016b",$sprite[$i] & 0xffff;
  $plane1 =~ /(.*)(.{$s})$/;
  $plane1a = '0'x$s.$1;
  $plane1b = $2.'0'x(16-$s);
  $plane2 =~ /(.*)(.{$s})$/;
  $plane2a = '0'x$s.$1;
  $plane2 =~ /(.*)(.{$s})$/;
  $plane2b = $2.'0'x(16-$s);
print "0b$plane1a$plane2a 0b$plane1b$plane2b\n" unless $debug;
  $sprite[$i]=oct("0b$plane1a$plane2a");
  $sprite[$i+1]=oct("0b$plane1b$plane2b");
}
# eliminate double lines
$patttab[0]="";
for ($i=0;$i<=$#sprite;$i++)
{
  $wo=$sprite[$i];
  printf "%032b \n",$wo unless $debug;
  if ($wo !~ /^0+$/) 
  {
    if ($pattern{$wo} eq "")
    {
      $patttab[$#patttab++]="$wo";
    }
    $pattern{$wo}.="$i ";
  }
}
$ORval[0]="";
$ORlen[0]="";
$ORoffset[0]="";
$ORindexes[0]="";
#for ($i=0;$i<$#patttab;$i++) 
for ($i=$#patttab-1;$i>=0;$i--) 
{
  $wo=$patttab[$i];
{
  my $pat=$wo;
  my $indexes=$pattern{$wo};
  ($idx=$indexes)=~s/^(\d+).*/$1/;
  my $offset=($idx % 2)*8;
  my $len="l";
  $p=sprintf "%032b",$pat;
  print "p=$p " unless $debug;
  $p =~ /^(.*)0{16}$/ && ($p=$1,$len="w"); # not write 2nd plane
  $p =~ /^0{16}(.*)$/ && ($p=$1,$len="w",$offset+=4); # not write 1st plane
  $p =~ /^(.{8})0{8}$/ && ($p=$1,$len="b");  # write as byte
  $p =~ /^0{8}(.{8})$/ && ($p=$1,$len="b",$offset+=1);  # write as byte
  print "m=$p.$len,$offset(a0) $indexes" unless $debug;
  $ORval[$#ORval++]="$p";
  $ORlen[$#ORlen++]="$len";
  $ORoffset[$#ORoffset++]="$offset";
  $ORindexes[$#ORindexes++]="$indexes";
  print "\n" unless $debug;
}
}
# find used words
for ($i=0;$i<=$#sprite;$i++)
{ 
  # 0 = not used
  # 1 = used byte
  # 2 = used word
  # 3 = used long
  $sp_used[$s][$i]=2;
  if($sprite[$i] == 0) {$sp_used[$s][$i]=0};
}
$need=0;

#for ($i=0;$i<$#ORval;$i++)
for ($i=$#ORval-1;$i>=0;$i--)
{
  print "$ORval[$i] , $ORlen[$i], $ORoffset[$i] \n" unless $debug;
  # search for matching
  $matched="";$bset="";$bsetok="";
  for ($j=0;$j<$#ORval;$j++)
  {
    if (($ORval[$j] =~ /$ORval[$i]$/) && ($i != $j))
    {
      print "match with $ORval[$j]" unless $debug;
      $need--;
      $matched=$ORval[$j];
      goto gotMatch;
    }
  }
gotMatch:
  if (($matched eq "") && ($ORval[$i] =~ /^0*1(0*)$/) && ($s!=15))
  {
    $bset=length($1);
    print "checking for bset bit $bset " unless $debug;
    $bset=sprintf("%03b",$bset);
    print "'$bset'\n" unless $debug;
    for ($j=0;$j<$#ORval;$j++)
    {
      if($ORval[$j] =~ /$bset$/) 
      {
        print "can use $ORval[$j]\n" unless $debug;
        $bsetok="$ORval[$j]";
        $matched=$bsetok;
#        goto gotBset
      }
    }
gotBset:
    $bsetok ne "" && $need--;
  }
  $ORcmd[$i]="or";
  if (($matched eq "") && ($bset eq ""))
  {
    print "attributing register $need\n" unless $debug;
    $reg{$ORval[$i]}=$need;
    $reg{$need}=$need;
    $regcont[$need]=sprintf("%032b",oct("0b$ORval[$i]"));
    print "reg $ORval[$i] = $reg{$ORval[$i]}\n" unless $debug;
  } else {
    $reg{$ORval[$i]}=$matched;
    print "reg $ORval[$i] = ($matched)\n" unless $debug;
    ($bsetok ne "") && ($ORcmd[$i]="bset");
  }
  $need++;
#  print "\n";
#  print "$ORindexes[$i]\n";
}
for ($i=0;$i<$#ORval;$i++)
{
  foreach $idx (split(" ",$ORindexes[$i]))
  {
    #$ws=sprintf "\tor.$ORlen[$i] d$reg{$reg{$ORval[$i]}},$ORoffset[$i]+$idx*160(a0) ; %032b\n",oct("0b$ORval[$i]")<<($ORlen[$i] eq "w"?16:($ORlen[$i] eq "b"?$ORoffset[$i]:0));
    $fill="";
    if($ORval[$i] eq "11111111") { $ORcmd[$i] = "move"}
    if (($ORlen[$i] eq "b") && ($ORoffset[$i] == 1) && ($ORcmd[$i] eq "or"))
    {
      $ORlen[$i]="w";$ORoffset[$i]=0;
    }
    if (($ORlen[$i] eq "w")&&(length($ORval[$i])==8)) {$fill="0"x8}
    #$ws=sprintf "\t%5s.$ORlen[$i] d$reg{$reg{$ORval[$i]}},$ORoffset[$i]+%02d*160(a0) ; %s$fill$ORval[$i]\n",$ORcmd[$i],$idx,' 'x(($ORoffset[$i]>7?$ORoffset[$i]-8:$ORoffset[$i])*8);
    $ws=sprintf "\t%5s.$ORlen[$i] d$reg{$reg{$ORval[$i]}},%04d(a0) ; %s$fill$ORval[$i]\n",$ORcmd[$i],$ORoffset[$i]+($idx>>1)*160,' 'x(($ORoffset[$i]>7?$ORoffset[$i]-8:$ORoffset[$i])*8);
#    print $ws;
#    $ws=~s/0\+00\*160\(a0\)/(a0)        /;
    $writesprite[$idx]=$ws;
  }
}
printf ";Shift $s\n";
printf ";Needs %2d registers",$need;
if ($need > 8) { print " REGS: ".'x'x($need-8) }
print "\n";
$data.="writesprite${s}_d:\n";
for ($i=0;$i<=$#regcont;$i++)
{
  if (($i>6) && ($need > 8))
  {
    print ";a".($i-6)."=$regcont[$i]\n";
  } else {
    print ";d$i=$regcont[$i]\n";
  }
  $data.="\tdc.l %$regcont[$i]\n";
}
print "\n";
$j=30;
for ($i=2;$i<16;$i+=1)
{
  if (($a0offset eq "") && ($writesprite[$i]=~ /,1120/))
  {
    if ($writesprite[$i]=~ /[wl] .*,([0-9]+)\(a0\)/ ||
    $writesprite[$i]=~ /b .*,([0-9]*[02468])\(a0\)/ )
    {
    $a0offset=$1 ;
    print ";a0 offset for shift $s: $a0offset\n";
    $writesprite[$i]=~ s/,[0-9]+\(a0\)/,(a0)         /;
    }
  }
}
$bss.="writesprite${s}_c:\n";
$bss.="\tds.w 0\n";
#print "\tnot.w \$ffff8240.w\n";
print "\tmove.w (a6)+,writesprite${s}_c\n";
#if ($a0offset != 0) { print "\tlea $a0offset(a0),a0\n" }
if ($need<=8)
{
  print "\tmovem.l writesprite${s}_d,d0-d".($need-1)."\n";
} else {
  print "\tmovem.l writesprite${s}_d,d0-d6/a1-a".($need-7)."\n";
}
#goto noMOVE;
print "\t bra writesprite${s}_ms\n";
print "writesprite${s}_ml:\n";

#   MOVE
print "\t adda.w (a6)+,a0\n";
#move.l (a5)+,$ffff8800;
for ($i=0;$i<16;$i+=1)
{
  $r="d";
  $writesprite[$i]=~/d([0-9]+)/;
  $rregister=$1;
  $register=$1;
  print " rc=$regcont[$register]\n" unless $debug;
  $j=30-($i&0xffe)+($i&1);
  if (($need>8)&&($writesprite[$i] =~ /(d[789])|(d1[0-4])/))
  {
    $register-=6;
    $r="a";
  }
  $writesprite[$i]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
  ($ws=$writesprite[$i])=~s/(d[789])|(d1[0-4])/$r$register/;
  ($regcont[$register] =~ /0{8}.{8}$/) &&
    $ws =~ s/(move|or).b (d|a)([0-7],0*)([0-9]*[13579])([^\d])/"$1.w $2$3".($4-1)."$5"/e;
  $ws=~s/or/move/;
  $ws=~s/move.b a/; NOT WORKING move.b a/;
  print "$ws";
  $writesprite[$j]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
  ($ws=$writesprite[$j])=~s/(d[789])|(d1[0-4])/$r$register/;
  ($regcont[$register] =~ /0{8}.{8}$/) &&
    $ws =~ s/(move|or).b (d|a)([0-7],0*)([0-9]*[13579])([^\d])/"$1.w $2$3".($4-1)."$5"/e;
  $ws=~s/or/move/;
  $ws=~s/move.b a/; NOT WORKING move.b a/;
  print "$ws";
}
print "\t subq #1,writesprite${s}_c\n";
print "writesprite${s}_ms:\n";
print "\t bgt writesprite${s}_ml\n";

print "\tmove.w (a6)+,writesprite${s}_c\n";
noMOVE:
print "\t bra writesprite${s}_s\n";

#   OR 
print "writesprite${s}_l:\n";
print "\t adda.w (a6)+,a0\n";
#move.l (a5)+,$ffff8800;

{
  my %a2d;
for ($i=0;$i<16;$i+=1)
{
  $j=30-($i&0xffe)+($i&1);
  if (($need>8) && ($writesprite[$i] =~ /(d[789])|(d1[0-4])/))
  {
    $writesprite[$i]=~/d([0-9]+)/;
    $register=$1-6;
    $writesprite[$i]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
    $writesprite[$i]=~s/(d[89])|(d1[0-4])/d7/;
    $a2d{"a$register"}.="$writesprite[$i]";
    $writesprite[$j]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
    $writesprite[$j]=~s/(d[89])|(d1[0-4])/d7/;
    $a2d{"a$register"}.="$writesprite[$j]";
  } else {
    $writesprite[$i]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
#    $writesprite[$i]=~s/(d[89])|(d1[0-4])/d7/;
    print "$writesprite[$i]";
    $writesprite[$j]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
#    $writesprite[$j]=~s/(d[89])|(d1[0-4])/d7/;
    print "$writesprite[$j]";
   }
}
foreach $ad (keys(%a2d))
{
  print "\t move.l $ad,d7\n";
  print "$a2d{$ad}";
}
print "\t subq #1,writesprite${s}_c\n";
print "writesprite${s}_s:\n";
print "\t bgt writesprite${s}_l\n";
}



}
}


print "\trts\n";
print "$data";
$pi = 4 * atan2(1,1);
for ($i=0;$i<360*2;$i++)
{
  $cosTab[$i]=int(cos($i/360*$pi)*(1<<15));
  $sinTab[$i]=int(cos($i/360*$pi)*(1<<15));
}
print "\nspritecode:\n";
{
  # math by Leonard
  my $pxa1=0;
  my $pxa2=0;
  my $pya1=0;
  my $pya2=0;
  my $pxa3=0;
  my $pya3=0;
  my $pxa4=0;
  my $pya4=0;
  my $RESX=320;
  my $RESY=192;
  my $PILEN=(360*2);
  my $RX1=(($RESX-16)/4); # 76
  my $RX2=(($RESX-16)/4); # 76
  my $RY1=(($RESY-16)/4); # 44
  my $RY2=(($RESY-16)/4); #44
  my $MNBSPRITE=$nb_sprites; # max 115
  my $i;
  $delframe1 = "DOUBLE_1_BUFFDEL";
  $delframe1_bin = "DOUBLE_1_BUFFDEL";
  $delframe2 = "DOUBLE_2_BUFFDEL";
  $delframe2_bin = "DOUBLE_2_BUFFDEL";
  $delframe3 = "DOUBLE_3_BUFFDEL";
  $delframe3_bin = "DOUBLE_3_BUFFDEL";
  #void waveStep(BLOCK_INFO *pInfo)
  foreach $frame (1..$wavelen)
  {
    my @bins = ( [],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[] );
    my @deltab ; # one list for each column (total 20)
    my $pxb1 = $pxa1;
    my $pxb2 = $pxa2;
    my $pyb1 = $pya1;
    my $pyb2 = $pya2;
    my $pyb3 = $pya3;
    my $pxb4 = $pxa4;
    my $pyb4 = $pya4;
    for ($i=0;$i<$MNBSPRITE;$i++)
    {
      my $rx1 = ($RX1 * $cosTab[$pxb3 % $PILEN])>>15;
      my $rx2 = ($RX2 * $cosTab[$pxb4 % $PILEN])>>15;
      my $ry1 = ($RY1 * $cosTab[$pyb3 % $PILEN])>>15;
      my $ry2 = ($RY2 * $cosTab[$pyb4 % $PILEN])>>15;
      my $x = $RX1 * $cosTab[$pxb1 % $PILEN] +
              $RX2 * $sinTab[$pxb2 % $PILEN];
      
      my $y = $RY1 * $cosTab[$pyb1 % $PILEN] +
              $RY2 * $sinTab[$pyb2 % $PILEN];
      $x = int($x/(1<<15));
      $y = int($y/(1<<15));
      $x += ($RESX-16)/2;
      $y += ($RESY-16)/2;
      
      # Draw sprite at x,y !!
      print "x=$x y=$y -> bin ".($x%16)." = ".($y*160)."\n" unless $debug;
      push @{$bins[$x%16]},$y*160+($x>>4)*8;
      {
        my $s=$x%16;   # which shift
        my $i;
        for($i=0;$i<16;$i+=1) 
        {
          if ($sp_used[$s][$i*2]!=0)
          {
            push @{$deltab[$x>>4]},$y+$i;
          }
          if ($sp_used[$s][$i*2+1]!=0)
          {
            push @{$deltab[($x>>4)+1]},$y+$i ;
          }
        }
      } 
      # Inc angles
      $pxb1 += 7*2;   # -7
      $pxb2 += -4*2;   #  4
      $pyb1 += 6*2;   # -6
      $pyb2 += -3*2;   #  3
      $pxb3 += 3;
      $pxb4 += 2;
      $pyb3 += 4;
      $pyb4 += 5;
    
    }
    # inc global angles for the frame
    $pxa1 += 2*2;    #  3
    $pxa2 += 4*2;    #  2
    $pya1 += -1*2;   # -1
    $pya2 += 4*2;    #  2
    $pxa3 += 3;
    $pxa4 += 5;
    $pya3 += 3;
    $pya4 += 2;

    my $curpos=0;
    my $delcount=0;
    my $curdel=0;
    my $spriteprog_vals = "";
    my $spriteprog_vals_bin = "";
    my $spriteprog_mvals = "";
    my $spriteprog_mvals_bin = "";
    my @movetab;
    my $spriteprog_all="";
    my $spriteprog_all_bin="";

    # loop through all bins
    for $i ( 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0 ) 
    {
#$debug=0;
      $aref = $bins[$i];
#      @$aref=sort(@$aref);
      $n = @$aref ;

      # first do the moves...
      # see if there is already something
      # $y*160+($x>>4)*8
      $spriteprog_mvals="";
        $spriteprog_mvals .= ";bin: $i has $n elements\n" unless $debug;
      $spriteprog_mvals_bin="";
      $m_n=0;
      $j_c=0;
      my @new_list;
      foreach $j ( @$aref ) 
      {
        my $col=($j-(int($j/160))*160)/8;
        my $y=int($j/160);
        if (($i == 8) || ($i==7))
        {
          $empty=1;  # shifts 7 & 8 can't be moved
        } else {
          $empty=0;  # assume possible
        }
        for($s_y=0;$s_y<16;$s_y++)
        { # check col1 and col2 for free space
          if(($movetab[$col][$y+$s_y]!=0)||($movetab[$col+1][$y+$s_y]!=0))
          {
            # there's a sprite. try next one
            $s_y=16;   # outta here
            $empty=1;
          }
        }
        if ($empty==0)  # no sprite found, so we can move this one
#        {
#          $spriteprog_mvals .= ",".($j-$curpos);
#          $curpos=$j;
#          $m_n++;
#          # $n--
#          # remove from bin
#          # $sp_used[$i][$i]
#        }
#        if (($m_n<1) && ($j_c==0))
        { 
          for($s_y=0;$s_y<16;$s_y++)
          { # make this spot occupied
            $movetab[$col][$y+$s_y]=1;
            $movetab[$col+1][$y+$s_y]=1;
#            if ($sp_used[0][$s_y]==2) { $eraser[$frame][$col][$y+$s_y]=0; }
#            if ($sp_used[1][$s_y]==2) { $eraser[$frame][$col+1][$y+$s_y]=0; }
          }
          $spriteprog_mvals .= ",".($j-$curpos);
          $spriteprog_mvals_bin.=pack("n",($j-$curpos));
          $curpos=$j;
          $n--;$m_n++;
        } else {
          push @new_list,$j;
        } 
        $j_c++;
      }
#      $bins[$i]=[ @new_list ];
#      $spriteprog .= ";\tdc.w $n". $spriteprog_mvals ."\n";
      # the rest is or
      $n = @$aref ;
      $n = @new_list;
      $spriteprog_vals = "";
        $spriteprog_vals .= ";bin: $i has $n elements\n" unless $debug;
      $spriteprog_vals_bin = "";
      #foreach $j ( sort {$a <=> $b} @$aref ) 
      $j_c=0;
#$debug=1;
#      foreach $j ( @$aref ) 
$o_curpos=$curpos;
      foreach $j ( @new_list ) 
      {
          my $col=($j-(int($j/160))*160)/8;
          my $y=int($j/160);
          for($s_y=0;$s_y<16;$s_y++)
          { # make this spot occupied
            $movetab[$col][$y+$s_y]=1;
            $movetab[$col+1][$y+$s_y]=1;
          }
         $j_c++;
	 # print "elt $i $j is $bins[$i][$j]\n";
#        print ",".$j;
         if (($j-$curpos) == 0)
         {
           print "found 100% overlap\n" unless $debug;
           $n--;
         } else {
           $spriteprog_vals .= ",".($j-$curpos);
           $spriteprog_vals_bin .= pack("n",($j-$curpos));
           $curpos=$j;
         }
#           $delframe .= " ".($j-$curdel).",16";
#           $curdel=$j+17*160;
#           $delcount++;
#           $delframe .= " ".($j+8-$curdel).",16\n";
#           $curdel=$j+8+17*160;
#           $delcount++;
      }
#$spriteprog_vals="";$spriteprog_vals_bin="";$n=0;$curpos=$o_curpos;
      $spriteprog_all .= "\tdc.w $m_n".$spriteprog_mvals."; mv \n"."\tdc.w $n". $spriteprog_vals ."; or\n";
      $spriteprog_all_bin .= pack("n",$m_n).$spriteprog_mvals_bin.pack("n",$n).$spriteprog_vals_bin;
    }

    # adapting previously calculated delframe code

    # saving to output
    $delframe4 .= "; erasing of: ".($frame-4)."\n";
    eee();
    $spriteprog .= $delframe4;
    $spriteprog_bin .= $delframe4_bin;
    for my $i (0..19) {for my $j (0..199) { $eraser4[$i][$j]=$eraser3[$i][$j] }}
    $delframe4 = $delframe3;
    $delframe4_bin = $delframe3_bin;
    for my $i (0..19) {for my $j (0..199) { $eraser3[$i][$j]=$eraser2[$i][$j] }}
    $delframe3 = $delframe2;
    $delframe3_bin = $delframe2_bin;
    for my $i (0..19) {for my $j (0..199) { $eraser2[$i][$j]=$eraser[$frame][$i][$j] }}
    $delframe2 = $delframe1;
    $delframe2_bin = $delframe1_bin;
    $delframe1="";
    $delframe1_bin="";
    $spriteprog[$frame] .= "; draw frame $frame\n";
    $spriteprog[$frame] .=$spriteprog_all;
    $spriteprog_bin[$frame] .= $spriteprog_all_bin;

    # analyse deletes
$curdel2=$curdel;
    for $i (0..19)  # 20 columns
    {
      for $j (0..199) { $eraser[$frame][$i][$j]=0 }
      $aref = $deltab[$i];
      $delstart=-1;$delend=-1;
      foreach $j ( sort {$a <=> $b} @$aref )
      {
        $delframe1 .= "del: $i,$j\n" unless $debug;
        if($delstart<0) {
          $delstart=$j;$delend=$j+1;     # 16
        } else {
          if ($delend < $j)
          {
            for (my $e=$delstart;$e<$delend;$e++) {$eraser[$frame][$i][$e]=1}
            $delframe1 .= "delete from: [ $delstart to $delend ] (".($delend-$delstart).")\n" unless $debug;
            $delframe1 .= "\t dc.w ".($i*8+($delstart)*160-$curdel).",".(-4*(1+$delend-$delstart))."; col $i [ $delstart to $delend ]\n";
            $delframe1_bin .= pack("n",($i*8+($delstart)*160-$curdel)).pack("n",-4*(1+$delend-$delstart));
            $delcount++;
            $curdel=$i*8+$delend*160+160;
        $curdel=$i*8+$delstart*160;
            $delstart=$j;$delend=$j+1; # 16
          } else {
            $delend=$j+1; # 16
          }
        }
      }
      if ($delstart>-1)
      {
        for (my $e=$delstart;$e<$delend;$e++) {$eraser[$frame][$i][$e]=1}
        $delframe1 .= "delete from: [ $delstart to $delend ] (".($delend-$delstart).")\n" unless $debug;
        $delframe1 .= "\t dc.w ".($i*8+($delstart)*160-$curdel).",".(-4*(1+$delend-$delstart))."; col $i [ $delstart to $delend ]\n";
        $delframe1_bin .= pack("n",($i*8+($delstart)*160-$curdel)).pack("n",-4*(1+$delend-$delstart));
#        $curdel=$i*8+$delend*160+160;
        $curdel=$i*8+$delstart*160;
        $delcount++;
        $delstart=$j;$delend=$j+1; # 16
      }
    } 
    $delcount--;
    $delframe1=";delete frame $frame\n\tdc.w $delcount\n$delframe1";
    $delframe1_bin=pack("n",$delcount).$delframe1_bin;
  }
}
 
$spriteprog .= "\tdc.w -1  ; end of sprite program\n"; 
$spriteprog_bin .= pack("n",-1)  ;; 
# $spriteprog =~ s/DOUBLE_1_BUFFDEL/$delframe1/;
$spriteprog_bin =~ s/DOUBLE_1_BUFFDEL/$delframe1_bin/;
# $spriteprog =~ s/DOUBLE_2_BUFFDEL/$delframe2/;
$spriteprog_bin =~ s/DOUBLE_2_BUFFDEL/$delframe2_bin/;
# $spriteprog =~ s/DOUBLE_3_BUFFDEL/$delframe3/;
$spriteprog_bin =~ s/DOUBLE_3_BUFFDEL/$delframe3_bin/;
open (O,">cblesprt2.bin");
print O $delframe4_bin;
print O $spriteprog_bin;
close O;
open (O,">spritab.s");
open (OB,">cblesprt.bin");
for $frame (1..$wavelen)
{
  $curdel=0;
  $curdel2=0;
  $df=$frame-4;
  if ($df <=0) {$df+=$wavelen}
  $delframe4="";
  $delframe4_bin="";
  for my $i (0..19) {for my $j (0..199) { $eraser4[$i][$j]=$eraser[$df][$i][$j] }}
  $delcount=0;
  eee();
  print O "; erase frame $df\n";
  print O "\tdc.w $delcount\n";
  print O $delframe4;
  print O $spriteprog[$frame];
  print OB pack("n",$delcount);
  print OB $delframe4_bin;
  print OB $spriteprog_bin[$frame];
}
close O;
close OB;
print "\tincbin \"cblesprt.bin\"\n";

print $bss;

sub eee
{
    for $i (0..19)
    {
#      $delframe4 .= "; col $i rows: ";
      $delstart=-1;$delend=-1;
      for $e (0..199)
      {
       if($eraser4[$i][$e]==1)
       {
        $j=$e;
        if($delstart<0) {
          $delstart=$j;$delend=$j+1;     # 16
        } else {
          if ($delend < $j)
          {
            $delframe4 .= "\t dc.w ".($i*8+($delstart)*160-$curdel2).",".(-4*(1+$delend-$delstart))."; col $i [ $delstart to $delend ]\n";
            $delframe4_bin .= pack("n",($i*8+($delstart)*160-$curdel)).pack("n",-4*(1+$delend-$delstart));
            $delcount++;
        $curdel2=$i*8+$delstart*160;
            $delstart=$j;$delend=$j+1; # 16
          } else {
            $delend=$j+1; # 16
          }
        }
       }
      }  
      if ($delstart>-1)
      {
        for (my $e=$delstart;$e<=$delend;$e++) {$eraser4[$i][$e]=1}
        $delframe4 .= "delete from: [ $delstart to $delend ] (".($delend-$delstart).")\n" unless $debug;
        $delframe4 .= "\t dc.w ".($i*8+($delstart)*160-$curdel2).",".(-4*(1+$delend-$delstart))."; col $i [ $delstart to $delend ]\n";
        $delframe4_bin .= pack("n",($i*8+($delstart)*160-$curdel)).pack("n",-4*(1+$delend-$delstart));
        $curdel2=$i*8+$delstart*160;
        $delcount++;
        $delstart=$j;$delend=$j+1; # 16
      }
#      $delframe4 .= "; \n ";
    } 

}
