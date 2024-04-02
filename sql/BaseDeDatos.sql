CREATE TABLE Producto (
  Tipo varchar(2) PRIMARY KEY,
  Nombre enum('Aceite de oliva virgen extra', 'Aceite de oliva virgen', 'Aceite de orujo de oliva') NOT NULL,
  Precio float NOT NULL
);

INSERT INTO Producto VALUES (0001, 'Aceite de oliva virgen extra', 12.50);
INSERT INTO Producto VALUES (0002, 'Aceite de oliva virgen', 10.30);
INSERT INTO Producto VALUES (0003, 'Aceite de orujo de oliva', 5.40);

SELECT * FROM Producto;