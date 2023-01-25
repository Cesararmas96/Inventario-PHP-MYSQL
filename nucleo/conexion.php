<?php 
class Conexion{
    private $host ='localhost';
    private $user ='root';
    private $pass ='';
    private $bd = 'inventario';
    private $conn;

protected function conectar(){
    $this->conn = mysqli_connect($this->host, $this->user, $this->pass, $this->bd);
    if ($this->conn){
        return true;
    }
    else{
        die('no conecto'. mysqli_connect_error());
    }
}
protected function query($sql){
    $this->conectar();
    return mysqli_query($this->conn, $sql);
}
protected function arreglo($rs){
    return mysqli_fetch_array($rs);
}
}
?>