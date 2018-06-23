#!/usr/bin/perl
@sprite=(0b00000111111000000000000000000000,0,
         0b00011111111110000000000000000000,0, 
         0b00111111111111000000000000000000,0,
         0b01111111111111100000000000000000,0,
         0b01111111111111100001111000000000,0,
         0b11111111111111110011111100000000,0,
         0b11000011111111110111111110000000,0,
         0b11000011111111110111111110000000,0,
         0b11000011111111110111111110000000,0,
         0b11000011111111110111111110000000,0,
         0b11111111111111110011111100000000,0,
         0b01111111111111100001111000000000,0,
         0b01111111111111100000000000000000,0,
         0b00111111111111000000000000000000,0,
         0b00011111111110000000000000000000,0,
         0b00000111111000000000000000000000,0,
        );

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
$s=$ARGV[0];
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
#print "0b$plane1a$plane2a 0b$plane1b$plane2b\n";
  $sprite[$i]=oct("0b$plane1a$plane2a");
  $sprite[$i+1]=oct("0b$plane1b$plane2b");
}
# eliminate double lines
$patttab[0]="";
for ($i=0;$i<=$#sprite;$i++)
{
  $wo=$sprite[$i];
#  printf "%032b \n",$wo;
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
  write_patt($wo,$pattern{$wo});
}
$need=0;
for ($i=0;$i<$#ORval;$i++)
{
#  print "$ORval[$i] , $ORlen[$i], $ORoffset[$i] \n";
  # search for matching
  $matched="";$bset="";
  for ($j=0;$j<$#ORval;$j++)
  {
    if (($ORval[$j] =~ /$ORval[$i]$/) && ($i != $j))
    {
      print "match with $ORval[$j]";
      $need--;
      $matched=$ORval[$j];
    }
  }
  if (($matched eq "") && ($ORval[$i] =~ /^0*1(0*)$/))
  {
    $bset=length($1);
    print "checking for bset bit $bset ";
    $bset=sprintf("%03b",$bset);
    print "'$bset'\n";
    for ($j=0;$j<$#ORval;$j++)
    {
      if($ORval[$j] =~ /$bset$/)
      {
        print "can use $ORval[$j]\n";
        $bsetok="$ORval[$j]";
        $matched=$bsetok;
        goto gotBset
      }
    }
gotBset:
    $bsetok ne "" && $need--;
  }
  $ORcmd[$i]="or";
  if (($matched eq "") && ($bset eq ""))
  {
#    print "attributing register $need\n";
    $reg{$ORval[$i]}=$need;
    $reg{$need}=$need;
    $regcont[$need]=sprintf("%032b",oct("0b$ORval[$i]"));
    print "reg $ORval[$i] = $reg{$ORval[$i]}\n";
  } else {
    $reg{$ORval[$i]}=$matched;
    print "reg $ORval[$i] = ($matched)\n";
    ($bsetok ne "") && ($ORcmd[$i]="bset");
  }
  $need++;
  print "\n";
  print "$ORindexes[$i]\n";
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
    $ws=sprintf "\t%5s.$ORlen[$i] d$reg{$reg{$ORval[$i]}},%04d(a0) ; %s$fill$ORval[$i]\n",$ORcmd[$i],$ORoffset[$i]+$idx*160,' 'x(($ORoffset[$i]>7?$ORoffset[$i]-8:$ORoffset[$i])*8);
#    print $ws;
#    $ws=~s/0\+00\*160\(a0\)/(a0)        /;
    $writesprite[$idx]=$ws;
  }
}
printf "Needs %2d registers",$need;
if ($need > 8) { print " REGS: ".'x'x($need-8) }
print "\n";
for ($i=0;$i<=$#regcont;$i++)
{
  if ($i>6)
  {
    print "a".($i-6)."=$regcont[$i]\n";
  } else {
    print "d$i=$regcont[$i]\n";
  }
}
print "\n";
$j=30;
for ($i=0;$i<16;$i+=1)
{
  if ($a0offset eq "")
  {
    if ($writesprite[$i]=~ /[wl] .*,([0-9]+)\(a0\)/ ||
    $writesprite[$i]=~ /b .*,([0-9]*[02468])\(a0\)/ )
    {
    $a0offset=$1 ;
    print "a0 offset for shift $s: $a0offset\n";
    }
#    $writesprite[$i]=~ s/,[0-9]+\(a0\)/,(a0)         /;
  }
}
for ($i=0;$i<16;$i+=1)
{
  if (($need>8) && ($writesprite[$i] =~ /(d[789])|(d1[0-4])/))
  {
    $writesprite[$i]=~/d([0-9]+)/;
    $register=$1;
    print "\t move.l a".($register-6).",d7\n";
  }
  $writesprite[$i]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
  $writesprite[$i]=~s/(d[89])|(d1[0-4])/d7/;
  print "$writesprite[$i]";
  $j=30-($i&0xffe)+($i&1);
  $writesprite[$j]=~s/,([0-9]+)\(a0\)/,$1-$a0offset(a0)/;
  $writesprite[$j]=~s/(d[89])|(d1[0-4])/d7/;
  print "$writesprite[$j]";
}


sub write_patt
{
  my $pat=shift;
  my $indexes=shift;
  ($idx=$indexes)=~s/^(\d+).*/$1/;
  my $offset=($idx % 2)*8;
  my $len="l";
  $p=sprintf "%032b",$pat;
#  print "p=$p ";
  $p =~ /^(.*)0{16}$/ && ($p=$1,$len="w"); # not write 2nd plane
  $p =~ /^0{16}(.*)$/ && ($p=$1,$len="w",$offset+=4); # not write 1st plane
  $p =~ /^(.{8})0{8}$/ && ($p=$1,$len="b");  # write as byte
  $p =~ /^0{8}(.{8})$/ && ($p=$1,$len="b",$offset+=1);  # write as byte
#  print "m=$p.$len,$offset(a0) $indexes";
  $ORval[$#ORval++]="$p";
  $ORlen[$#ORlen++]="$len";
  $ORoffset[$#ORoffset++]="$offset";
  $ORindexes[$#ORindexes++]="$indexes";
#  print "\n";
}
