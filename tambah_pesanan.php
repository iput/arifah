<?php
function random($panjang) {
    $karakter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $string = '';
    for ($i = 0; $i < $panjang; $i++) {
        $pos = rand(0, strlen($karakter) - 1);
        $string .= $karakter{$pos};
    }
    return $string;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Delivery Online | Tambah Pesanan</title>
	<meta charset="utf-8">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="layout.css"  type="text/css" >
        <?php include "koneksi.php"; ?>
</head>
<body>
<div class="container">
<h3>Tambah Pesanan anda</h3>
	<form action="tambah.php"  method="POST" class="form-horizontal">
		<div class="form-group">
			<label class="col-md-2 control-label">ID Anda</label>
			<div class="col-md-8">
				<input type="hidden" name="idpesan" value="<?php echo random(8); ?>">
				<input type="text" name="iduser" class="form-control" placeholder="masukan id anda">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Nama Warung</label>
			<div class="col-md-8">
				<select class="form-control" name="nama_warung">
					<option>Pilih Nama warung</option>
					<?php 
					$qwarung = "select * from warung";
					$rwarung = mysql_query($qwarung);
					while ($inWarung = mysql_fetch_array($rwarung)) {
					 	$idW = $inWarung['ID_WARUNG'];
					 	$namaW = $inWarung['NAMA_WAR'];

					 ?>
					 <option value="<?php echo $idW; ?>"><?php echo $namaW ?></option>
					 <?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">Nama Makanan</label>
			<div class="col-md-8">
				<select class="form-control" name="namaMakanan">
				<option value="">Pilih Nama Makanan</option>
				<?php 
				$query = "select ID_MAKANAN, NAMA_MAK FROM makanan";
				$data = mysql_query($query);
				while ($in=mysql_fetch_array($data)) {
					$idmk = $in['ID_MAKANAN'];
					$nama = $in['NAMA_MAK'];
				 ?>
					<option value="<?php echo $idmk; ?>"><?php echo $nama; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">Tanggal Pesan</label>
			<div class="col-md-8">
				<input type="date" name="tanggalPesan" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Jumlah Pesanan</label>
			<div class="col-md-8">
				<input type="text" name="jumlahPesanan" class="form-control" placeholder="masukan jumlah pesanan anda">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2 control-label">Keterangan</label>
			<div class="col-md-8">
				<textarea class="form-control" name="Keterangan" rows="4" placeholder="Masukan rincian pesanan"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-2"></label>
			<div class="col-md-8">
				<a href="index.php" class="btn btn-danger">Batal</a>
				<button class="btn btn-primary" type="submit">Pesan Sekarang</button>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>