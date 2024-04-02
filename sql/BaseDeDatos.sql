CREATE TABLE Producto (
  Código_Tipo varchar(4),
  Nombre enum('Aceite de oliva virgen extra', 'Aceite de oliva virgen', 'Aceite de orujo de oliva') NOT NULL,
  Precio float NOT NULL,
  CONSTRAINT Código_Tipo_pk PRIMARY KEY(Código_Tipo)
);

CREATE TABLE Socio (
  NIF varchar(9),
  Nombre varchar(20) NOT NULL,
  Ap1 varchar(20) NOT NULL,
  Ap2 varchar(20),
  Dirección varchar(60) NOT NULL,
  Cod_Postal varchar(5) NOT NULL,
  Municipio varchar(20),
  Provincia varchar(20),
  Teléfono varchar(9),
  Correo varchar(30),
  CONSTRAINT NIF_pk PRIMARY KEY(NIF)
);

CREATE TABLE Entrega (
  Num_Entrega integer Auto_Increment,
  Cantidad integer NOT NULL,
  Fecha_y_hora timestamp NOT NULL,
  Tipo enum('Árbol', 'Suelo') NOT NULL,
  Parcela_Sigpac integer NOT NULL,
  Recinto_Sigpac integer NOT NULL,
  NIF_Socio varchar(9),
  CONSTRAINT Entrega_NIF_Socio_fk FOREIGN KEY(NIF_Socio)
                        REFERENCES Socio(NIF)
                        ON UPDATE CASCADE
                        ON DELETE NO ACTION,
  CONSTRAINT Num_Entrega_pk PRIMARY KEY(Num_Entrega)
);

CREATE TABLE Venta (
  Num_Factura integer Auto_Increment,
  Fecha_y_hora timestamp NOT NULL,
  CONSTRAINT Num_Factura_pk PRIMARY KEY(Num_Factura)
);

INSERT INTO Producto VALUES (0001, 'Aceite de oliva virgen extra', 12.50);
INSERT INTO Producto VALUES (0002, 'Aceite de oliva virgen', 10.30);
INSERT INTO Producto VALUES (0003, 'Aceite de orujo de oliva', 5.40);
INSERT INTO Socio VALUES ('AAAAAAAAM', 'Paquito', 'Perez', 'Montalvo', 'Calle', '23433', 'Jaen', 'Jaen', '23131244', 'fpef@gmail.com');
INSERT INTO Entrega VALUES (NULL, 2, '2024-03-12 07:16:43', 'Árbol', 56, 42, 'AAAAAAAAM');

SELECT * FROM Producto;
SELECT * FROM Entrega;
SELECT * FROM Socio;