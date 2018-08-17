#!/usr/bin/perl
use DBI;
use strict;
use warnings;
my ($num1, $num2, $num3) = @ARGV;
if (not defined $num3) {
  die "Need three arg\n";
}
my $datafile = 'blog11.db';
my $dbh = DBI->connect("dbi:SQLite:dbname=$datafile", "", "", {RaiseError => 1, AutoCommit => 0});




my $sth = $dbh->prepare("SELECT * FROM mainpage WHERE id = $num1");
$sth->execute();
my $row = $sth->fetch;
my $img1 = $row->[1];
my $link1 = $row->[2];
my $title1 = $row->[3];
my $content1 = $row->[4];


$sth = $dbh->prepare("SELECT * FROM mainpage WHERE id = $num2");
$sth->execute();
$row = $sth->fetch;
my $img2 = $row->[1];
my $link2 = $row->[2];
my $title2 = $row->[3];
my $content2 = $row->[4];


$sth = $dbh->prepare("SELECT * FROM mainpage WHERE id = $num3");
$sth->execute();
$row = $sth->fetch;
my $img3 = $row->[1];
my $link3 = $row->[2];
my $title3 = $row->[3];
my $content3 = $row->[4];


my $blog = qq(<div class="block31-main center-block-main clearfix">
	<article>
    	<img src="data:image/png;base64,$img1" alt="">
        <h2><a href="$link1">$title1</a></h2>
        <p>$content1</p>
    </article>
    <article>
    	<img src="data:image/png;base64,$img2" alt="">
        <h2><a href="$link2">$title2</a></h2>
        <p>$content2</p>
    </article>
    <article>
    	<img src="data:image/png;base64,$img3" alt="">
        <h2><a href="$link3">$title3</a></h2>
        <p>$content3</p>
    </article>
</div>);
print $blog;

$sth->finish;
$dbh->disconnect;
