#!/usr/bin/perl

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


# ULM YMX format
# 1 BYTE bitfield regs 13-6
# for each bit at 1, 1 byte of register data
# 1 BYTE bitfield regs 5-0 (top bits) 2 lower bits unused
# for each bit at 1, 1 byte of register data

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
for ($i=0;$i<16;$i++)
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
for ($i=0;$i<$Nb_frames;$i++)
{
  $bits=0;
  $output="";
  # do reg 13.
  # undocumented feature: r13=ff, don't write it
  if (substr($regvals[13],$i,1) ne $ff)
  {
#print "13: o=$o[13] n=".substr($regvals[13],$i,1)."\n";
    $bits=1;
    $o[13] = substr($regvals[13],$i,1);
    $output.=$o[13];
  }
  for ($r=12;$r>5;$r--)
  {
#print STDERR "$r '$o[$r]' -> '".substr($regvals[$r],$i,1)."'\n";
    $bits = $bits<<1;
    if($o[$r] ne substr($regvals[$r],$i,1))
    {
      # changed
      $bits |= 1;
      $o[$r] = substr($regvals[$r],$i,1);
      $output.=$o[$r];
    }
  }
  print pack("C",$bits).$output;

  $bits=0;
  $output="";
  for ($r=5;$r>=0;$r--)
  {
#print STDERR "$r\n";
    $bits = $bits<<1;
    if($o[$r] ne substr($regvals[$r],$i,1))
    {
      # changed
      $bits |= 0x4;
      $o[$r] = substr($regvals[$r],$i,1);
      $output.=$o[$r];
    }
  }
  print pack("C",$bits).$output;
}
  
  
