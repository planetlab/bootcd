#!/usr/bin/perl
# $Id: now.pl,v 1.5 1999/09/17 07:28:45 hpa Exp $
#
# Print the time (possibly the mtime of a file) as a hexadecimal integer
# If more than one file, print the mtime of the *newest* file.
#

undef $now;

foreach $file ( @ARGV ) {
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,$atime,$mtime,
     $ctime,$blksize,$blocks) = stat($file);
    if ( !defined($now) || $now < $mtime ) {
	$now = $mtime;
    }
}

if ( !defined($now) ) {
    $now = time;
}

printf "0x%08x\n", $now;
