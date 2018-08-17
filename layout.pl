#!/usr/bin/perl
use DBI;
#use strict;
use warnings;
my $datafile = 'blog1.db';
my $dbh = DBI->connect("dbi:SQLite:dbname=$datafile", "", "", {RaiseError => 1, AutoCommit => 0});


my $head = qq(<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='https://fonts.googleapis.com/css?family=Roboto|Roboto+Condensed' rel='stylesheet' type='text/css'>
<title>Учимся Линукс</title>
<style type="text/css">
/* --------------- reset.css --------------- */
html, body, div, span, h1, h2, h3, h4, h5, h6, p, em, img, strong, sub, sup, b, u, i,  dl, dt, dd, ol, ul, li, fieldset, form, label, table, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;                               
	vertical-align: baseline;          
	background: transparent;      
	font-size: 100%;                    
}
a {                                      	    
	margin:0;
	padding:0;
	font-size:100%;
	vertical-align:baseline;
	background:transparent;
	outline:none;
}
table {					
	border-collapse: collapse; 
	border-spacing: 0;
}
td, td img {
	vertical-align: top;		
} 
input, select, button, textarea {
	margin: 0; 				
	font-size: 100%; 			
	outline: none;
}
input[type="text"], input[type="password"], textarea {
	padding: 0; 			
}
input[type="checkbox"] { 		
	vertical-align: bottom;
}
input[type="radio"] {
	vertical-align: text-bottom;
}
sub {
	vertical-align: sub;
	font-size: smaller;
}
sup {
	vertical-align: super;
	font-size: smaller;
}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
	display:block;
}
nav ul {
	 list-style:none;
}
/* --------------- /reset.css --------------- */

/* --------------- базовые настройки ---------*/
html {
	min-height:100%;
}
body {
	color: #7e7f84;
	text-align: left;
	font-size: 1em;
	min-height:100%;
	font-family: 'Roboto', sans-serif; 
	text-rendering: optimizeLegibility;
}
a, a:visited { 
	color: #f45a40;
	text-decoration: underline;
}
a:hover {
	color: #f45a40;
	text-decoration:none;
}
a:focus, a:active {
	color: #f45a40;
	text-decoration: underline;
}
h1, h2, h3, h4, h5, h6{
	font-weight:normal;
}
img{

	max-width:100%;
}
.clr{
	clear:both;
}
.clearfix:after {
    clear: both;
    content: "";
    display: table;
}
/* --------------- /базовые настройки ---------*/

.center-block-main{
	max-width:1170px; margin:0 auto;
}
.header-top{
	padding:30px 0; border-bottom:1px solid #eee;
}

	.logo{
		float:left; font-size:1.375em; font-family: 'Roboto Condensed', sans-serif;
	}
	.contakt-basket{
		float:right;block
	}
		.contakt-basket p{
			float:left; font-size:0.75em; font-weight:600;
		}
			.contakt-basket p img{
				vertical-align:middle; margin-right:3px;
			}
		.header-phone{
			padding-top:8px;
		}
		.header-basket{
			border:1px solid #eee; padding:7px 25px; margin-left:20px;
		}
			.header-basket a{
				text-transform: uppercase; color:#7e7f84; text-decoration:none; margin-left:20px;
			}
			.header-basket a:hover{
				color:#f45a40;
			}
.header-bottom{
	padding:10px 0;
}
	.menu{
		float:left;
	}
		.menu li{
			float:left; text-transform:uppercase; margin-right:30px; font-size:0.875em;
		}
			.menu li a{
				color:#7e7f84; text-decoration:none;
			}
			.menu li a:hover{
				color:#f45a40;
			}
	.search-block{
		float:left; margin-top:-3px;
	}
		.search-btn{
			float:left; margin:5px 5px 0 0;
		}
		.search{
			float:left; font-size:0.875em; color:#7e7f84; border:none; line-height:1.4;
		}

.my-slider{
}
	.my-slider ul li{
		position:relative; color:#f45a40;
	}
	.my-slider ul li h2{
		position:absolute; top:220px; left:30px; font-size:3.6875em; font-weight:bold; line-height:1.1;
	}
	.my-slider ul li p{
		position:absolute; top:370px; left:30px; font-size:0.875em; 
	}
	.unslider-nav{
		max-width:1170px; margin:0 auto; position:relative; top:-40px;
	}
	
.block3-main{
	margin-bottom:50px;
}
	.block3-main article{
		width:31.6%; float:left; margin-left:2.6%;
	}
	.block3-main article:first-child{
		margin-left:0;
	}
	.block3-main article img{
		display:block; margin:0 auto 20px auto;
	}
	.block3-main article h2{
		font-family: 'Roboto Condensed', sans-serif; font-size:1.375em; margin-bottom:20px;
	}
	.block3-main article p{
		font-size:0.875em;
	}
.block4-section{
	margin-bottom:60px;
}
	.block4-section>h2{
		text-align:center; font-family: 'Roboto Condensed', sans-serif; color:#67686d; font-size:1.375em; margin-bottom:30px;
	}
	.block4-main{
	}
		.block4-main article{
			width:23%; margin-left:2.6666666666666666666666666666667%; float:left;
		}
		.block4-main article:first-child{
			margin-left:0;
		}
		.block4-main article img{
			display:block; margin:0 auto;
		}
		.block4-main-content{
			padding:20px 20px 0 20px; border:1px solid #eee; border-top:0;
		}
		.block4-main-content h2{
			color:#67686d; font-size:1.125em; text-transform:uppercase; margin-bottom:5px;
		}
		.block4-main-content h3{
			font-size:0.875em; text-transform:uppercase; margin-bottom:10px; font-style:italic;
		}
		.block4-main-content p{
			font-size:0.625em; margin-bottom:15px;
		}
		p.price-basket{
			border-top:1px solid #eee; font-size:0.875em; color:#f45a40; padding:15px 0; margin-bottom:0;
		}
		.price{
			float:left;
		}
		.basket-btn{
			float:right;
		}
	
.about{
	margin-bottom:60px;
}
	.about article{
		float:left; width:60%;
	}
	.about article h2{
		font-size:1.325em; font-weight:bold; margin-bottom:30px; color:#67686d;
	}
	.about article p{
		font-size:0.875em; margin-bottom:25px; font-style:italic;
	}
	
	.about .map{
		float:right; width:35%;
	}
	.mapin{
		position:relative;
		padding-bottom:75%; /*		450/600		*/
		height:0;
		overflow:hidden;
	}
	.mapin iframe{
		position:absolute; top:0; left:0; width:100%; height:100%;
	}
	
.subscribe{
	background:#f45a40; color:#fff; padding:30px 0;
}
	.subscribe h2{
		float:left; font-size:1.325em; text-transform:uppercase; margin-top:5px;
	}
	.subscribe-form{
		float:right;
	}
	.email-inpt{
		text-transform:uppercase; font-size:0.875em; float:left; width:200px; padding:7px 20px; border:none;
	}
	.submit-inpt{
		background:#ff674f; float:left; margin-left:20px; border:none; color:#fff; text-transform:uppercase; padding:7px 20px; cursor:pointer; font-size:0.875em;
	}
	
.ftr{
	background:#2a2d34; padding:40px 0;
}
	.ftr h2{
		color:#fff; font-size:1.325em; font-family: 'Roboto Condensed', sans-serif; margin-bottom:10px; text-transform:uppercase;
	}
	.ftr p{
		font-size:0.875em; margin-bottom:20px;
	}
	.ftr h3{
		font-size:0.875em; margin-bottom:5px;
	}
		.ftr h3 a{
			color:#fff; text-decoration:none;
		}
		.ftr h3 a:hover{
			text-decoration: underline;
		}
	.support{
		float:left; width:47%; margin-right:3%;
	}
		.support a{
			display:block; margin-bottom:5px; text-decoration:none; color:#7e7f84;
		}
		.support a:hover{
			text-decoration:underline;
		}
	.ftrmail{
		width:100%; text-transform:uppercase; font-size:0.75em; margin-bottom:15px; padding:7px 20px; border:none; box-sizing: border-box;
	}
	.ftrtext{
		width:100%; text-transform:uppercase; font-size:0.75em; margin-bottom:15px; padding:7px 20px; border:none; box-sizing: border-box;
	}
	.ftrsubmit{
		text-transform:uppercase; font-size:0.875em; border:none; background:#f45a40; padding:7px 20px; color:#fff; cursor:pointer;
	}
	
\@media screen and (max-width:900px){
	.my-slider ul li h2{
		top:150px; font-size:3em;
	}
	.my-slider ul li p{
		top:270px;
	}
	.block4-main article{
			width:45%; margin:0 2.5% 30px 2.5%; float:left;
		}
		.block4-main article:first-child{
			margin:0 2.5% 30px 2.5%;
		}
	.subscribe h2{
		float:none; text-align:center; margin:0 0 20px 0;
	}
	.subscribe-form{
		float:none; display:table; margin:0 auto;
	}	
}
\@media screen and (max-width:740px){
	.my-slider ul li h2{
		top:100px; font-size:2em;
	}
	.my-slider ul li p{
		top:180px;
	}
	.search-block{
		border-top:1px solid #eee; border-bottom:1px solid #eee; margin-top:10px; padding:5px 0 7px 0; float:right;
	}
}
\@media screen and (max-width:600px){
	.block3-main article{
		width:95%; float:none; margin:0 2.5% 30px 2.5%;
	}
	.block3-main article:first-child{
		 margin:0 2.5% 30px 2.5%;
	}
	.about article{
		float:none; width:95%; margin:0 2.5% 30px 2.5%;
	}
	.about .map{
		float:none; width:95%; margin:0 2.5% 30px 2.5%;
	}
}
\@media screen and (max-width:480px){
	.my-slider ul li h2{
		top:50px; font-size:1.275em;
	}
	.my-slider ul li p{
		top:110px;
	}
	.block4-main article{
			width:95%; margin:0 2.5% 30px 2.5%; float:none; overflow:hidden;
		}
		.block4-main article:first-child{
			width:95%; margin:0 2.5% 30px 2.5%; float:none;
		}
}
\@media screen and (max-width:410px){
	.header-top{
		padding:10px 0;
	}
	.logo{
		float:none; text-align:center; margin-bottom:10px;
	}
	.contakt-basket{
		float:none; display:table; margin:0 auto;
	}
}
\@media screen and (max-width:360px){
	.email-inpt{
		float:none; width:95%; margin:0 2.5% 20px 2.5%; box-sizing:border-box;
	}
	.submit-inpt{
		margin-left:2.5%;
	}
	.my-slider ul li h2{
		top:30px; font-size:1em;
	}
	.my-slider ul li p{
		top:80px;
	}
}
header{
	background:#292929; overflow:hidden; margin-bottom: 20px;
}
	.center-block-main{
		max-width:1170px; margin:0 auto;
	}
	
	.logo1{
		float:left; margin-top:45px;font-weight:600;
	}
	.logo1 a{
		color:#fff; text-decoration:none;
	}
	.logo1 a:hover{
		color:#58c93a; border-bottom:3px
		}
	.manu{
		float:right;
	}
	.manu li{
		float:left; font-weight:600;
	}
	.manu li a{
		color:#fff; text-decoration:none; padding:50px 35px; display:block; border-bottom:3px solid #292929;
	}
	.manu li a:hover{
		color:#58c93a; border-bottom:3px solid #58c93a;
	}
.topbut {
width:50px;
border:2px solid #ccc;
background:#f7f7f7;
text-align:center;
padding:10px;
position:fixed;
bottom:20px;
right:50%;
cursor:pointer;
color:#333;
font-family: 'Roboto Condensed', sans-serif;
font-size:12px;
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
-khtml-border-radius: 5px;
}

</style>
</head>);
my $header = qq(<body>
<header>
	<div class="center-block-main">
    	 <nav>
    	 <ul class="logo1">
    <li><a href="<\$BlogURL\$>">
	Учимся Линуксу <br> dagmatritsa
	</a></li>
  </ul>
        	<ul class="manu">
            	<li><a href="#">Новости</a></li>
                <li><a href="#">Заметки</a></li>
                <li><a href="#">Работа</a></li>
                <li><a href="#">Контакт</a></li>
            </ul>
        </nav> 
    </div>
</header>


<div>
<Blogger>

   
<p>
      <\$BlogItemBody\$>
    </p>           
    </Blogger>        </div>);
my $footer = qq(<footer class="ftr">
	<div class="block4-main center-block-main clearfix">
    	  <article>
        	<h2>Подпишись</h2>
            <div class="ftr-block-content">
  
<p id="blogfeeds"><\$BlogFeedsVertical\$></p>     	
            </div>
        </article>
        <article>
				<h2>Рубрики</h2>        	   
        	   <div class="ftr-block-content">
            	<p class="support">
                    <a href="#">Новости</a>
                    <a href="#">Заметки</a>
                    <a href="#">Работа</a>
                    <a href="#">Контакт</a>
                    
				</p>
                
            </div>
        </article>
        <article>
        	<h2>Контакт</h2>
            <div class="ftr-block-content">
            	<p>
						Копирование разрешается.
						Ссылка на материал приветствуется.					            	
            	</p>
            </div>
        </article>
        <article>
        	<h2>Ремарка</h2>
            <div class="ftr-block-content">
					<p>...Рожденный ползать, летать не может...</p>
<p>Born to crawl can not fly</p>
<a href="#" title="Вернуться к началу" class="topbut">^Наверх</a>
                
              
            </div>
        </article>
    </div>
</footer>






</body>

</html>
);
my $sth = $dbh->prepare("INSERT INTO layout VALUES ( NULL, ?, ?, ?)");
$sth->bind_param(1, $head);
$sth->bind_param(2, $header );
$sth->bind_param(3, $footer);
$sth->execute();
$dbh->commit;
#$sth->execute($header);
#$sth->execute($footer);
$dbh->disconnect;

#print $head;
#print $header;
#cdprint $footer;
