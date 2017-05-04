<div >

  <ul >
     <?php

       //bata paging 

  require_once('inc/config.php');    

$query="SELECT * from warung order by id_warung desc";

$result=mysqli_query($query) or die(mysqli_error());

$no=1;

//proses menampilkan data

while($rows=mysqli_fetch_object($result)){
?>
  <li>
  <div>
  <h4><a href="#"><?php=$rows -> nama;?>&nbsp;<?php=$rows -> alamat;?></a></h4>
  <hr />
         <img src="image/<?=$rows->foto?>" alt=""/>
      </div>
    </li>
    <?
$no++;

}?>

</ul>

</div>
?>