#!/usr/bin/perl
use DBI;
use strict;
use warnings;
my ($imgname, $link, $title, $content) = @ARGV;
if (not defined $content) {
  die "Need imgname link title content four arg\n";
}
my $img1 = `cat $imgname | base64 > l`;
my $img = `tr -d '\n' < l`;
print $img;
print $link;
print $title;
print $content;

my $datafile = 'blog11.db';
my $dbh = DBI->connect("dbi:SQLite:dbname=$datafile", "", "", {RaiseError => 1, AutoCommit => 0});

#create table mainpage (id integer primary key, img text, link text, content text);
my $sth = $dbh->prepare("INSERT INTO mainpage VALUES ( NULL, ?, ?, ?, ?)");
$sth->bind_param(1, $img);
$sth->bind_param(2, $link );
$sth->bind_param(3, $title );
$sth->bind_param(4, $content);
$sth->execute();
$dbh->commit;
#$sth->execute($header);
#$sth->execute($footer);
$dbh->disconnect;
