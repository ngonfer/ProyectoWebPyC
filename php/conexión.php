<?php
   
    $nombreServidor = "localhost";
    $baseDatos = "Cooperativa";
    $nombreUsuario = "usuario";
    $password = "usuario ";
   
    // Se crea la conexión
   
    $conn = new mysqli($nombreServidor, $nombreUsuario, $password, $baseDatos);
   
    // Se comprueba que la conexión es correcta
   
    if (!$conn) 
    {
        die("Connection failed: " . mysqli_connect_error());
    }

    echo "Se ha realizado la conexión";

    $sentenciaSQL="INSERT INTO Producto VALUES ('0004', 'Aceite de oliva virgen extra', 12.50);";

    $conn->query($sentenciaSQL);
 
    /*if (!$conn->query($sentenciaSQL))
    // ->query($sentenciaSQL)) 
    {
        echo "Ha fallado la inserción de datos";
    }
*/
    /*echo "Se ha ejecutado correctamente la inserción de datos";*/

    echo $sentenciaSQL;
  
    mysqli_close($conn);
?>