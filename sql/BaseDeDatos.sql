CREATE TABLE Producto (
  Cod_Tipo varchar(4),
  Nombre enum('Aceite de oliva virgen extra', 'Aceite de oliva virgen', 'Aceite de orujo de oliva') NOT NULL,
  Precio float NOT NULL,
  CONSTRAINT Código_Tipo_pk PRIMARY KEY(Cod_Tipo)
);

CREATE TABLE Socio (
  NIF varchar(9) CHECK (
        NIF REGEXP '^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]'
        OR NIF REGEXP'^[KLMXYZ][0-9]{7}[TRWAGMYFPDXBNJZSQVHLCKE]'
        OR NIF REGEXP '^[TRWAGMYFPDXBNJZSQVHLCKE]{1}[0-9]{8}'),
  Nombre varchar(20) NOT NULL,
  Ap1 varchar(20) NOT NULL,
  Ap2 varchar(20),
  Dirección varchar(60) NOT NULL,
  Cod_Postal varchar(5) NOT NULL, 
  Municipio varchar(20),
  Provincia varchar(20),
  Teléfono varchar(9) CHECK(Teléfono regexp '^[6][0-9]{8}'),
  Correo varchar(30),
  CONSTRAINT NIF_pk PRIMARY KEY(NIF)
);

CREATE TABLE Entrega (
  Num_Entrega integer Auto_Increment,
  Cantidad integer NOT NULL,
  Fecha_y_hora timestamp NOT NULL,
  Tipo enum('Árbol', 'Suelo') NOT NULL,
  Parcela_Sigpac integer NOT NULL CHECK(Parcela_Sigpac>0),
  Recinto_Sigpac integer NOT NULL CHECK(Recinto_Sigpac>0),
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
  NIF_Socio varchar(9),
  CONSTRAINT Venta_NIF_Socio_fk FOREIGN KEY(NIF_Socio)
                        REFERENCES Socio(NIF)
                        ON UPDATE CASCADE
                        ON DELETE NO ACTION,
  CONSTRAINT Num_Factura_pk PRIMARY KEY(Num_Factura)
);

CREATE TABLE Producto_Venta (
  Num_Factura integer,
  Cod_Tipo varchar(4),
  Cantidad int NOT NULL,
  CONSTRAINT Producto_Venta_Factura_fk FOREIGN KEY(Num_Factura)
                                       REFERENCES Venta(Num_Factura)
                                       ON UPDATE CASCADE
                                       ON DELETE NO ACTION,
  CONSTRAINT Producto_Venta_Tipo_fk FOREIGN KEY(Cod_Tipo)
                                       REFERENCES Producto(Cod_Tipo)
                                       ON UPDATE CASCADE
                                       ON DELETE NO ACTION,
  CONSTRAINT Num_Factura_pk PRIMARY KEY(Num_Factura, Cod_Tipo)
);

INSERT INTO Producto VALUES ('0001', 'Aceite de oliva virgen extra', 12.50);
INSERT INTO Producto VALUES ('0002', 'Aceite de oliva virgen', 10.30);
INSERT INTO Producto VALUES ('0003', 'Aceite de orujo de oliva', 5.40);

INSERT INTO Socio VALUES ('11111111A', 'Paquito', 'Perez', 'Montalvo', 'Calle Alcalá', '23433', 'Jaen', 'Jaen', '631312442', 'paquitoperez@gmail.com');
INSERT INTO Socio VALUES ('22222222B', 'Juan', 'Gomez', 'Moya', 'Calle de los ciegos', '23439', 'Jaen', 'Jaen', '631834563', 'juangomez@gmail.com');
INSERT INTO Socio VALUES ('33333333C', 'Lucía', 'López', 'Pascual', 'Paseo de Gracia', '23434', 'Jaen', 'Jaen', '651213644', 'luciaperez@gmail.com');

INSERT INTO Entrega VALUES (NULL, 2, '2024-03-12 07:16:43', 'Árbol', 56, 42, '11111111A');
INSERT INTO Entrega VALUES (NULL, 3, '2024-03-24 06:19:46', 'Suelo', 102, 45, '22222222B');
INSERT INTO Entrega VALUES (NULL, 4, '2024-02-26 16:16:36', 'Árbol', 204, 12, '33333333C');

INSERT INTO Venta VALUES (NULL, '2024-02-12 12:16:43','22222222B');
INSERT INTO Venta VALUES (NULL, '2024-01-11 12:14:43','33333333C');
INSERT INTO Venta VALUES (NULL, '2024-01-23 12:18:46','11111111A');

INSERT INTO Producto_Venta VALUES (1, '0001', 2);
INSERT INTO Producto_Venta VALUES (2, '0002', 3);
INSERT INTO Producto_Venta VALUE (3, '0003', 4);

SELECT Precio FROM Producto WHERE Cod_Tipo='0002';
SELECT * FROM Entrega;
SELECT * FROM Socio;
SELECT * FROM Venta;
SELECT * FROM Producto_Venta;