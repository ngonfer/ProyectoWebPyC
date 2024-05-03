<?php
   
    $nombreServidor = "localhost";
    $baseDatos = "Cooperativa";
    $nombreUsuario = "usuario";
    $password = "usuario";
   
    // Se crea la conexión
   
    $conn = new mysqli($nombreServidor, $nombreUsuario, $password, $baseDatos);
   
    // Se comprueba que la conexión es correcta
   
    if (!$conn) 
    {
        die("Connection failed: " . mysqli_connect_error());
    }

    $numero_entrega = $_POST['numero_entrega'];
    $fecha_hora = date("Y-m-d H:i:s", strtotime($_POST['fecha_hora']));
    $nif_socio = $_POST['nif_socio'];
    $cantidad_aceituna = $_POST['cantidad_aceituna'];
    $tipo_aceituna = $_POST['tipo_aceituna'];
    $parcela_sigpac = $_POST['parcela_sigpac'];
    $recinto_sigpac = $_POST['recinto_sigpac'];

    $sentenciaSQL="INSERT INTO Entrega VALUES (NULL, " . $cantidad_aceituna . ", '" . $fecha_hora . "', '" . 
    $tipo_aceituna . "', " . $parcela_sigpac . ", " . $recinto_sigpac . ", '" . $nif_socio . "');";
 

    echo $sentenciaSQL;
    if (!$conn->query($sentenciaSQL))
    // ->query($sentenciaSQL)) 
    {
        echo "Ha fallado la inserción de datos";
    }
?>