#!/usr/bin/perl

# new ymx format: interleaved bit field

# format of ym file:
# it's LZH compressed.
# uncompressed format
# 0 LWORD 4 File ID "YM6!" 
# 4 STRING[8] 8 Check string "LeOnArD!"
# 12 LWORD 4 Nb of frame in the file
# 16 LWORD 4 Song attributes
# 20 WORD 2 Nb of digidrum samples in file (can be 0)
# 22 LWORD 4 YM master clock implementation in Hz .(ex:2000000 for ATARI-ST version, 1773400 for ZX-SPECTRUM)
# 26 WORD 2 Original player frame in Hz (traditionnaly 50)
# 28 LWORD 4 Loop frame (traditionnaly 0 to loop at the beginning)
# 32 WORD 2 Size, in bytes, of futur additionnal data. You have to skip these bytes. (always 0 for the moment)
# Then, for each digidrum: (nothing if no digidrum)
# 34 LWORD 4 Sample size
# 38 BYTES n Sample data (8 bits sample)
# Then some additionnal informations
# ?  NT-String ?  Song name
# ?  NT-String ?  Author name
# ?  NT-String ?  Song comment
# ?  BYTES ?  YM register data bytes. (r0,r1,r2....,r15 for each frame). Order depend on the "interleaved" bit. It takes 16*nbFrame bytes.
# ?  LWORD 4 End ID marker. Must be "End!"


# ULM YMX2 format
# Each VBL we read a byte, if none of the top 3 bits is set, 
# there is no frequency register to be modified.
#   If a bit is set (7,6 or 5), we store the data into register 1,3 or 5
#   and then copy the next byte into 0,2 or 4 respectively.
#   If there's still another bit set (6 or 5) do the same again.
#   This means if frequency A and C has to be modified, the first byte 
#   will have top bits like 101. If it's B and C it will be 011 etc...
# And finally if bit 4 is set, there's more data, else we have finished. 
# BYTE: abcnxxxx   abc: bitfield for freq registers n: more data to follow
# if a=1; xxxx->reg1; read BYTE->reg0; if n=1; read BYTE: 0bcnxxxx
# if b=1; xxxx->reg3; read BYTE->reg2; if n=1; read BYTE: 00cnxxxx
# if c=1; xxxx->reg5; read BYTE->reg4; 
# if n=1; read BYTE: ABCNSFEn
#                    ABC=volumes for channels a b and c
#                       N=noise (reg6)
#                        S=status (on/off channels)
#                         F=envelope frequency
#                          E=envelope form (reg13)
#                           n=future extension (SID, DRUM)

read STDIN,$ID,4;
read STDIN,$Check,8;
read STDIN,$Nb_frames,4;$Nb_frames=unpack("N",$Nb_frames);
read STDIN,$Attributes,4;$Attributes=unpack("n",$Attributes);
read STDIN,$Nb_digidrum,2;$Nb_digidrum=unpack("n",$Nb_digidrum);
read STDIN,$YMmasterclock,4;$YMmasterclock=unpack("N",$YMmasterclock);
read STDIN,$Hz,2;$Hz=unpack("n",$Hz);
read STDIN,$Loop_frame,4;$Loop_frame=unpack("N",$Loop_frame);
read STDIN,$AddDataSize,2;$AddDataSize=unpack("n",$AddDataSize);
read STDIN,$dummy,$AddDataSize;
for ($i=0;$i<$Nb_digidrum;$i++)
{
  read STDIN,$dummy,4;$dummy=unpack("N",$dummy);  # drum len
  read STDIN,$dummy,$dummy;
}
{
  local $/ = "\0";
  $Song_name=<STDIN>;
  $Author_name=<STDIN>;
  $Song_comment=<STDIN>;
}
for ($i=0;$i<16;$i++)      # read each register sequence into string
{
  read STDIN,$regvals[$i],$Nb_frames;
}
read STDIN,$EndID,4;

print STDERR "id=$ID check=$Check frames=$Nb_frames attr=$Attributes\n";
print STDERR "drums=$Nb_digidrum clock=$YMmasterclock HZ=$Hz\n";
print STDERR "loop at=$Loop_frame opt data=$AddDataSize\n";
print STDERR "Song: $Song_name\nAuthor: $Author_name\nComment: $Song_comment\n";
print STDERR "EndID=$EndID\n";

for ($i=0;$i<14;$i++)
{
  $o[$i]=-1;
}
$ff=pack("C",0xff);
for ($i=0;$i<$Nb_frames;$i++)  # loop through all frames of the song
{
  $bits=0;
  $output=pack('C',0).pack('C',0);

  print "O='".$output . "'\n";
  # first check main channels frequency
  if ((substr($regvals[0],$i,1) ne $o[0]) ||
      (substr($regvals[1],$i,1) ne $o[1]))
      {  # set freq reg A
	$o[0]=substr($regvals[0],$i,1);
	$o[1]=substr($regvals[1],$i,1);
      print "setting A: $o[0] $o[1] output[".(length($output)-1)."]\n";
#        $output[length[$output]-1] = pack('C',(unpack('C',$output[length[$output]-1]) | 0b00010000));
	$output[length($output)-1] = 'X';
        $output.=pack('C',(unpack('C',$o[1]) | 0b10000000)).$o[0];
      }
  print "O='".$output . "'\n";
  if ((substr($regvals[2],$i,1) ne $o[2]) ||
      (substr($regvals[3],$i,1) ne $o[3]))
      {  # set freq reg B
	$o[2]=substr($regvals[2],$i,1);
	$o[3]=substr($regvals[3],$i,1);
        $output[length[$output]-1]|= 0b00010000;
        $output.=($o[3] | 0b01000000).$o[2];
      }
  if ((substr($regvals[4],$i,1) ne $o[4]) ||
      (substr($regvals[5],$i,1) ne $o[5]))
      {  # set freq reg C
	$o[4]=substr($regvals[4],$i,1);
	$o[5]=substr($regvals[5],$i,1);
        $output[length[$output]-1]|= 0b00010000;
        $output.=($o[5] | 0b00100000).$o[4];
      }
  if (length($output) > 2)
  {
    $output=substr($output,2,length($output)-2);
  }
  exit;
  # now volumes ABC...
  $bits=0;
  $output2="";
  foreach $r (8,9,10,6,7)
  {
#print STDERR "$r '$o[$r]' -> '".substr($regvals[$r],$i,1)."'\n";
    $bits = $bits<<1;
    if($o[$r] ne substr($regvals[$r],$i,1))
    {
      # changed
      $bits |= 1;
      $o[$r] = substr($regvals[$r],$i,1);
      $output2.=$o[$r];
    }
  }
  $bits = $bits<<1;
  if (($o[11] ne substr($regvals[$r],$i,11)) ||
      ($o[12] ne substr($regvals[$r],$i,12)))
      {  # envelope frequency
        $bits |= 1;
	$o[11] = substr($regvals[$r],$i,11);
	$o[12] = substr($regvals[$r],$i,12);
	$output2.=$o[11].$o[12];
      }
  $bits = $bits<<1;

  # do reg 13.
  # undocumented feature: r13=ff, don't write it
  if (substr($regvals[13],$i,1) ne $ff)
  {
#print "13: o=$o[13] n=".substr($regvals[13],$i,1)."\n";
    $bits|=1;
    $o[13] = substr($regvals[13],$i,1);
    $output2.=$o[13];
  }

  if ($bits != 0)
  {
    $output[length[$output]-1]|= 0b00010000;
  }
  print $output.pack("C",$bits).$output2;
}
  
  
