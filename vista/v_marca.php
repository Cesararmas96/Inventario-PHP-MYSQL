<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marcas</title>
    <link rel='stylesheet' href='../css/estilo.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src='../js/botones.js'></script>
</head>
<body>
 <div class="container">
    <form name='formulario_marca' id='formulario_marca' action="../controlador/c_marca.php" method='POST'>
    
    <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Nombre</label>
  <input type="text" class="form-control" name='nom' id="exampleFormControlInput1" placeholder="Escriba aca" required value='<?php if(isset($_GET['nom'])){echo $_GET['nom'];}?>'>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="estado" id="flexRadioDefault1" checked value='1' <?php if (isset($_GET['estado'])){ if($_GET['estado'] == '1'){echo 'checked=checked';}} ?>>
  <label class="form-check-label" for="flexRadioDefault1">
    Activo
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="estado" id="flexRadioDefault2"  value='0' <?php if (isset($_GET['estado'])){ if($_GET['estado'] == '0'){echo 'checked=checked';}} ?>>
  <label class="form-check-label" for="flexRadioDefault2">
    Inactivo
  </label>
  </div>
  <div>
    <input type="hidden" name='idtmarca' value='<?php if(isset($_GET['idtmarca'])){echo $_GET['idtmarca'];}?>'>
    <input type="hidden" name="boton" id='boton'>
  <input type="submit" class="btn btn-outline-primary" value="Registrar" onClick='botones(this.value)' <?php if(isset($_GET['idtmarca'])) {?> disabled <?php }?> >
   
  
  <input type="submit" class="btn btn-outline-secondary" value="Modificar" onClick='botones(this.value)'>
  
  <input type="submit" class="btn btn-outline-secondary" value="Consultar" onClick='botones(this.value)'>
  </div>
</form>
<table class="table table-hover">
  <thead>
    <tr>
        <th>N#</th>
        <th>Nombre</th>
        <th>Estado</th>
</tr>
</thead>
<?php 
include_once('../modelo/m_marca.php');
$objeto = new Marca();
$ordenar = $objeto->tabla_marca();
while ($fila = $objeto->arreglos($ordenar)){


?>

<tr>
    <td><?php echo $fila['idtmarca']?></td>
    
    <td><?php echo $fila['nombre']?></td>



    <td><?php if($fila['estado']==1) echo'<a class="btn btn-primary" title="Inactivo">'; else echo '<a class="btn btn-danger" title="Inactivo">'?></td>


</tr>
<?php }?>
</table>
</div>


</body>
</html>