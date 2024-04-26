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

    echo "Se ha realizado la conexión";

    $nif = $_POST['nif'];
    $nombre = $_POST['nombre'];
    $apellido1 = $_POST['apellido1'];
    $apellido2 = $_POST['apellido2'];
    $direccion = $_POST['direccion'];
    $codigo_postal = $_POST['codigo_postal'];
    $municipio = $_POST['municipio'];
    $provincia = $_POST['provincia'];
    $telefono = $_POST['telefomo'];
    $email = $_POST['email'];

    $sentenciaSQL="INSERT INTO Socio VALUES ('" . $nif . "', '" . $nombre . "', '" . $apellido1. "', '" . 
    $apellido2 . "', '" . $direccion . "', '" . $codigo_postal . "', '" . $municipio . "', '" . 
    $provincia . "', '" . $provincia . "', '" . $email . "', '" . ");";
 
    echo $sentenciaSQL;
    if (!$conn->query($sentenciaSQL))
    // ->query($sentenciaSQL)) 
    {
        echo "Ha fallado la inserción de datos";
    }

    echo "Se ha ejecutado correctamente la inserción de datos";

    echo $sentenciaSQL;
  
