<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Food Delivery Online</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="layout.css"  type="text/css" >
        <?php include "koneksi.php"; ?>
		<style type="text/css">

.dropmenu {
    background: #111111;
    height: 30px;
    list-style-type: none;
    margin: 0;
    padding: 0px;
	float:center;
	width:100%;
}
.dropmenu li {
    border-right: solid 1px white;
    float: left;
    height: 30px;
}
.dropmenu li a {
    color: #fff;
    display: block;
    font: 12px arial, verdana, sans-serif;
    font-weight: bold;
    padding: 9px 20px;
    text-decoration: none;
}
.dropmenu li:hover { background: #778899; position: relative; }
.dropmenu li:hover a { text-decoration: underline; }
.dropmenu li:hover ul {
    background-color: #3f4a54;
    border: 1px solid grey;
    left: 0px;
    padding: 3px;
    top: 30px;
    width: 160px;
}
.dropmenu li:hover ul li { border: none; height: 18px; }
.dropmenu li:hover ul li a {
    background-color: #778899;
    border: 1px solid transparent;
    color: #fff;
    display: block;
    font-size: 11px;
    height: 18px;
    line-height: 18px;
    padding: 0px;
    text-decoration: none;
    text-indent: 5px;
    width: 158px;
    padding: 3px;
}
.dropmenu li:hover ul li a:hover {
    background: silver;
    border: solid 1px #444;
    color: #000;
    height: 18px;
    padding: 3px;
}
.dropmenu ul {
    left: -9999px;
    list-style-type: none;
    position: absolute;
    top: -9999px;
}


</style>
	</head>
	<body>
		<div id="header">
					<img src="head.png" width="90%" height="100%" />
				
		</div>
			<div>
			<ul class ="dropmenu">
			<li><a href ="home.html">Beranda</a></li>
            <li ><a href ="#"> Info</a> <ul>
			<li><a href ="carapesan.html">Cara Pesan</a></li>			
				<li><a href ="tentang.html">Tentang</a></li></ul>
                <li ><a href ="#"> Akun</a> 
  <ul>
    <li ><a href ="profil.html"> Profil</a> </li>
	<li ><a href ="index.php"> Logout</a>	</li>	
		</ul></li>
		</ul>
	
       <form id="cari">
				<input id="search" type="text" placeholder="Apa yang Anda cari?" >
				<input id="tombol" type="button" value="Cari">
			</form>
		</div>
				<div id="content">

<table width="50%" border="1" align="center" class="table table-striped table-bordered table-hover" style="margin-top: 50px;">
<tr >

<td width="100">Nama Warung</td>
<td width="100">Alamat Warung</td>
<td width="100">Kontak</td>
</tr>
<tr>
    <?php $query = "select * from warung";
    $hasil = mysql_query($query) or die(mysql_error());
     while ($data = mysql_fetch_array($hasil)) {
      echo '<td>'.$data['NAMA_WAR'].'</td>';
      echo '<td>'.$data['ALAMAT_WAR'].'</td>';
      echo '<td>'.$data['KONTAK_WAR'].'</td>';
     }?>
</tr>
</table>
<a href="tambah_pesanan.php" class="btn btn-primary">Tambah Pesanan</a>
				</div>
			<div id="footer">@Food Delivery Online 2017</div>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
		</body>

        </html>