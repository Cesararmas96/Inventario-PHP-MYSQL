<?php 
include_once('../modelo/m_marca.php');
$operacion = $_POST['boton'];
switch ($operacion) {
    case 'Registrar':
        registra_marca();
        break;
    
    case 'Consultar':
        consulta_marca();
        break;

    case 'Modificar':
        modifica_marca();
        break;
}





function registra_marca()
{
$objeto = new Marca();
$objeto->setDatos($_POST['nom'], $_POST['estado']);
$objeto->insertar_marca();
header("location:../vista/v_marca.php");
}


function consulta_marca(){
$objeto = new Marca();
$objeto->dato($_POST['nom']);
$ordenar = $objeto->consultar_marca();
if($tupla = $objeto->arreglos($ordenar)){
    header("location:../vista/v_marca.php?idtmarca=".$tupla['idtmarca']."&nom=".$tupla['nombre']."&estado=".$tupla['estado']);

}
else{
		
		echo "<script> alert('No existe'); 
		destino = '../vista/v_marca.php';
		location.href=destino;

		</script>";
	}
}
function modifica_marca(){
$objeto = new Marca();
$objeto->idDato($_POST['idtmarca']);
$objeto->setDatos($_POST['nom'], $_POST['estado']);
$objeto->modificar_marca();
header("location:../vista/v_marca.php");
}
?>