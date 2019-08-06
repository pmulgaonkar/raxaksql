#!/usr/bin/perl
use strict;
use warnings;
use lib  '/root/.perl/lib/perl5/x86_64-linux-gnu-thread-multi';
use DBI;

my ( $line, $cmd , $retval , $flag );
my ($infile) = @ARGV;
my $user = 'raxak3';             # Change me
my $pass = 'raxak3';             # Change me
my $conn = 'DBI:Oracle:xe';        # Change me
my $dbh = DBI->connect('dbi:Oracle:host=127.0.0.1;sid=XE;port=1522',
               $user, $pass , { RaiseError => 1, AutoCommit => 0 });

open(SQLFILE, $infile) or die("Could not open  $infile.");
$line = $cmd = "";$flag=-2;

foreach $line (<SQLFILE>)  {
    $line =~ s/;//g;
    if ($flag == -2) { $cmd = $line; }
    if ( $line =~ m/^select/ ) { $flag++; }
    else { $cmd = $cmd . $line; }
    if ($flag == 0)  {
## print "$cmd\n";
       my $sth = $dbh->prepare($cmd);
       $sth->execute() or die "couldn't execute statement";
       $dbh->commit;
       while (($retval) = $sth->fetchrow()) {
          print "$retval \n";
       }
       $cmd = $line; $flag=-1;
    }
}
    my $sth = $dbh->prepare($cmd);
    $sth->execute() or die "couldn't execute statement";
    $dbh->commit;
    while (($retval) = $sth->fetchrow()) {
       print "$retval \n";
    }
close(SQLFILE);
$dbh->disconnect;
1;
