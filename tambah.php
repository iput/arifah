<?php 
include 'koneksi.php';

$idpesan = $_POST['idpesan'];
$iduser = $_POST['iduser'];
$tgl_pesan = $_POST['tanggalPesan'];
$ket_pesan = $_POST['Keterangan'];
$total_pesan = $_POST['jumlahPesanan'];
$id_makan = $_POST['namaMakanan'];
$id_warung = $_POST['nama_warung'];

$query = mysql_query("INSERT INTO pemesanan(ID_PEMESANAN, ID_CUSTOMER, ID_DRIVER, TGL_PESAN,KET_PESAN, TOTAL_PESAN, id_makanan, id_warung) VALUES ('$idpesan','1','1','$tgl_pesan','$ket_pesan','$total_pesan','$id_makan','$id_warung')");

if ($query) {
	echo "<script>alert('Data Karyawan Berhasil dimasukan!'); window.location = 'index.php'</script>";	
}else{
	echo "<script>alert('Data Karyawan gagal dimasukan!".mysql_error()."'); window.location = 'index.php'</script>";	
 }
 ?>
