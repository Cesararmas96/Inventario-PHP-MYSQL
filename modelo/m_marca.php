<?php 
include_once('../nucleo/conexion.php');
class Marca extends Conexion{

    public $id, $nombre, $estado;


    function __construct(){
        $this->conectar();
    }

    function setDatos($n, $e){
        $this->nombre = $n;
        $this->estado = $e;

    }

    function dato($n){
    $this->nombre = $n;

    }
    function idDato($id){
        $this->id = $id;
    
        }
    function insertar_marca(){
        $query = "INSERT INTO t_marca (nombre, estado) VALUES (UPPER('$this->nombre'), '$this->estado')";
        $this->query($query);
        echo $query;
    }
    function modificar_marca(){
        $query = "UPDATE t_marca SET nombre = UPPER('$this->nombre'), estado = '$this->estado' WHERE idtmarca = '$this->id'";
        $this->query($query);
        echo $query;
    }
    function consultar_marca(){
        $query = "SELECT *FROM t_marca WHERE nombre = UPPER('$this->nombre')";
        return $this->query($query);
        echo $query;
    }

    function arreglos($rs){
        return $this->arreglo($rs);
    }
    function tabla_marca(){
        $query = "SELECT *FROM t_marca";
        return $this->query($query);
    }
}

?>