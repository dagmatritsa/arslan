#!/usr/bin/perl
use DBI;
use strict;
use warnings;
my $datafile = 'blog11.db';
my $dbh = DBI->connect("dbi:SQLite:dbname=$datafile", "", "", {RaiseError => 1, AutoCommit => 0});




my $sth = $dbh->prepare("SELECT * FROM layout WHERE id = 1");
$sth->execute();
my $row = $sth->fetch;
$dbh->disconnect;
my $blobo = $row->[3];
print $blobo;
