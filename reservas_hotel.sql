CREATE DATABASE proyecto_reservas_hotel;
CREATE TABLE  IF NOT EXISTS Reserva (
        idReserva INT PRIMARY KEY AUTO_INCREMENT,
        fechaReserva DATE NOT NULL,
        fechaLlegada DATE,
        fechaSalida DATE,
        idHabitacion INT,
        idHuesped INT,
        idRecepcionista INT,
        FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
        FOREIGN KEY (idHuesped) REFERENCES Huesped(idHuesped),
        FOREIGN KEY (idRecepcionista) REFERENCES Recepcionista(idRecepcionista)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Transaccion (
        idTransaccion INT PRIMARY KEY AUTO_INCREMENT,
        fechaTransac DATE,
        total INT UNSIGNED,
        idMetodoPago INT,
        idReserva INT,
        FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago(idMetodoPago),
        FOREIGN KEY (idReserva) REFERENCES Reserva (idReserva)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS MetodoPago (
        id_MetodoPago INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(50)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Servicio (
        idServicio INT PRIMARY KEY AUTO_INCREMENT:,
        nombre VARCHAR(50),
        descripcion VARCHAR(100),
        precio INT UNSIGNED
    ) ENGINE = InnoDB;

CREATE TABLE Reserva_Servicio (
  idReserva INT,
  idServicio INT,
  cantidad INT,
  precio_total INT,
  PRIMARY KEY (idReserva, idServicio),
  FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva),
  FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);
CREATE TABLE IF NOT EXISTS Huesped (
        idHuesped INT PRIMARY KEY AUTO_INCREMENT:,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS Recepcionista (
        idRecepcionista INT PRIMARY KEY AUTO_INCREMENT:,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS Hospeda (
        idHospeda INT PRIMARY KEY AUTO_INCREMENT:,
        idReserva INT,
        idHuesped INT,
        idHabitacion INT,
        fechaLlegada DATE,
        fechaSalida DATE,
        FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva),
        FOREIGN KEY (idHuesped) REFERENCES Huesped(idHuesped),
        FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS Habitacion (
        idHabitacion INT PRIMARY KEY AUTO_INCREMENT:,
        tipoHabitacion VARCHAR(50) NOT NULL,
        disponibilidad BOOLEAN NOT NULL,
        precioNoche INT UNSIGNED,
        numero INT (11) UNSIGNED
    ) ENGINE = InnoDB;



INSERT INTO Reserva  (idReserva PK, fechaReserva, fechaLlegada, fechaSalida, idHabitación FK, idHuesped FK, idRecepcionista FK)VALUES 

('1','2023-05-01','2023_05_10','2023-05-15','1','1','1'),
('2', '2023-05-03', '2023-05-08 20:37:53', '2023-05-12', '2', '2', '2'),
('3', '2023-05-04', '2023-05-10', '2023-05-14', '3','3', '3'),
('4', '2023-05-05', '2023-05-11', '2023-05-13', '4', '4', '4'),
('5', '2023-05-07', '2023-05-12', '2023-05-16', '5', '5', '5'),
('6', '2023-05-09', '2023-05-13', '2023-05-15', '6',  '6',  '6'),
('7', '2023-05-11', '2023-05-17', '2023-05-20',  '7', '7', '7'),
('8', '2023-05-12', '2023-05-19', '2023-05-23', '8', '8', '8'),
('9', '2023-05-13', '2023-05-20', '2023-05-24', '9', '9', '9'),
('10', '2023-05-15', '2023-05-22', '2023-05-25','10', '10', '10'),
('11', '2023-05-18', '2023-05-23', '2023-05-27', '11',  '11', '11'),
('12', '2023-05-20', '2023-05-26', '2023-05-29',  '12',  '12', '12'),
('13', '2023-05-22', '2023-05-27', '2023-05-30',  '13', '13', '13'),
('14', '2023-05-24', '2023-05-28', '2023-05-31', '14', '14', '14'),
('15', '2023-05-25', '2023-05-30', '2023-06-03',  '15',  '15',  '15');
-- Tabla Transaccion


INSERT INTO `transaccion`(`idTransaccion`, `fechaTransac`, `total`, `idMetodoPago`, `idReserva`) VALUES 
       ( 1, '2023-05-10', 500.00, 1,1),
       (2, '2023-05-12', 750.00, 2,2),
       (3, '2023-05-14', 825.00, 1,3),
       (4, '2023-05-15', 550.00, 1,4),
       (5, '2023-05-16', 625.00, 1,5),
       (6, '2023-05-19', 900.00, 1,6),
       (7, '2023-05-21', 675.00, 2,7),
      (8, '2023-05-23', 800.00, 1,8),
       (9, '2023-05-25', 600.00, 1,9),
       (10, '2022-01-10', 175, 1,10),
       (11, '2022-01-11', 120, 1,11),
       (12, '2022-01-12', 100, 2,12),
       (13, '2022-01-13', 95, 1,13),
       (14, '2022-01-14', 130, 1,14),
       (15, '2022-01-15', 180, 1,15 );

-- Insertar registros en la tabla de Método de Pago
INSERT INTO MetodoPago (idMetodoPago, nombre)VALUES

 ('1', 'Transferencia bancaria'),
('2', 'Efectivo');

      
INSERT INTO `servicio`(`idServicio`, `nombre`, `descripcion`, `precio`) VALUES
  ( '1', 'Desayuno', 'Desayuno continental con café, zumo y croissants', 10),
  ('2', 'Wi-Fi', 'Conexión a Internet de alta velocidad', 50),
  ('3', 'Lavandería', 'Servicio de lavandería y planchado', 15),
  ('4', 'Servicio de habitaciones', 'Servicio de habitaciones las 24 horas', 20),
  ('5', 'Spa', 'Acceso al spa con sauna, baño turco y jacuzzi', 30),
  ('6', 'Gimnasio', 'Acceso al gimnasio con equipos de última generación', 25),
  ('7', 'Piscina', 'Acceso a la piscina climatizada y zona de tumbonas', 15),
  ('8', 'Almuerzo', 'Menú del día con plato principal, postre y bebida', 12),
  ('9', 'Cena', 'Menú a la carta con platos internacionales y locales', 25),
  ('10', 'Transporte', 'Servicio de transporte en vehículo privado', 50),
  ('11',  'incluido todas las comidas (cena ,almuerzo, desayuno)', 'Servicio incluir todas las comida por día', 100),
  ('12', 'Tour guiado', 'Tour guiado por los principales lugares de interés de la ciudad', 35),
  ('13', 'Guardería', 'Servicio de guardería para niños de 3 a 12 años', 20),
  ('14', 'Mascotas', 'Permitimos mascotas en la habitación con un cargo adicional', 15),
  ('15', 'Estacionamiento', 'Estacionamiento privado para huéspedes con descuento', 10.);
INSERT INTO Reserva_Servicio (idServicio, idReserva, cantidad, precio_total)VALUES 

INSERT INTO `reserva_servicio`(`idReserva`, `idServicio`, `cantidad`, `precio_total`) VALUES
(1, 1, 1, 23000),
(2, 1, 1, 30.00),
(3, 1, 3, 90.00),
(1, 2, 2, 50.00),
(2, 2, 1, 30.00),
(4, 2, 1, 20.00),
(5, 2, 2, 80.00),
(1, 3, 3, 75.00),
(2, 3, 2, 60.00),
(4, 3, 2, 40.00),
(5, 3, 1, 40.00),
(1, 4, 2, 50.00),
(2, 4, 2, 60.00),
(3, 4, 1, 30.00),
(5, 4, 3, 120.00);


INSERT INTO Huesped (idHuesped, nombre, apellido, correo)
VALUES 
  (1, 'Juan', 'Pérez', 'juanperez@gmail.com'),
  (2, 'María', 'González', 'mariagonzalez@hotmail.com'),
  (3, 'Pedro', 'Martínez', 'pedromartinez@yahoo.com'),
  (4, 'Laura', 'Sánchez', 'laurasanchez@gmail.com'),
  (5, 'Carlos', 'Rodríguez', 'carlosrodriguez@hotmail.com'),
  (6, 'Ana', 'Fernández', 'anafernandez@yahoo.com'),
  (7, 'José', 'García', 'josegarcia@gmail.com'),
  (8, 'Carmen', 'López', 'carmenlopez@hotmail.com'),
  (9, 'Javier', 'Ruiz', 'javierruiz@yahoo.com'),
  (10, 'Elena', 'Pérez', 'elenaperez@gmail.com'),
  (11, 'Miguel', 'González', 'miguelgonzalez@hotmail.com'),
  (12, 'Lucía', 'Martínez', 'luciamartinez@yahoo.com'),
  (13, 'Antonio', 'Sánchez', 'antoniosanchez@gmail.com'),
  (14, 'Sofía', 'Rodríguez', 'sofiarodriguez@hotmail.com'),
  (15, 'Pablo', 'Fernández', 'pablofernandez@yahoo.com');
  INSERT INTO Recepcionista (idRecepcionista, nombre, apellido, correo) VALUES 
  (1, 'Laura', 'Martínez', 'lauramartinez@gmail.com'),
  (2, 'Carlos', 'García', 'carlosgarcia@hotmail.com'),
  (3, 'Ana', 'Fernández', 'anafernandez@yahoo.com'),
  (4, 'José', 'López', 'joselopez@gmail.com'),
  (5, 'Carmen', 'Ruiz', 'carmenruiz@hotmail.com'),
  (6, 'Javier', 'Pérez', 'javierperez@yahoo.com'),
  (7, 'Elena', 'González', 'elenagonzalez@gmail.com'),
  (8, 'Miguel', 'Martínez', 'miguelmartinez@hotmail.com'),
  (9, 'Lucía', 'Sánchez', 'luciasanchez@yahoo.com'),
  (10, 'Antonio', 'Rodríguez', 'antoniorodriguez@gmail.com'),
  (11, 'Sofía', 'Fernández', 'sofiafernandez@hotmail.com'),
  (12, 'Pablo', 'García', 'pablogarcia@yahoo.com'),
  (13, 'María', 'Martínez', 'mariamartinez@gmail.com'),
  (14, 'Pedro', 'López', 'pedrolopez@hotmail.com'),
  (15, 'Laura', 'Ruiz', 'lauraruiz@yahoo.com');
 
    INSERT INTO Hospeda (idHospeda, idReserva, idHuesped,idHabitacion, fechaLlegada, fechaSalida)VALUES
    
     ('1', '2','3', '1','2023-05-01', '2023-05-03'),
    ('2', '4','5', '2','2023-05-02', '2023-05-04'),
    ('3', '6', '7','3','2023-05-03', '2023-05-05'),
    ('4', '8', '9', '4','2023-05-04', '2023-05-06'),
    ('5', '10', '11','5', '2023-05-05', '2023-05-07'),
    ('6', '12', '13', '6','2023-05-06', '2023-05-08'),
    ('7', '14', '15','7','2023-05-07', '2023-05-09'),
    ('8', '15', '12', '8','2023-05-08', '2023-05-10'),
    ('9', '1', '10', '8','2023-05-09', '2023-05-11'),
    ('10', '3', '1', '12','2023-05-10', '2023-05-12'),
    ('11', '5', '2', '3','2023-05-11', '2023-05-13'),
    ('12', '6', '4', '3','2023-05-12', '2023-05-14'),
    ('13', '7', '6', '9','2023-05-13', '2023-05-15'),
    ('14', '9', '8', '10','2023-05-14', '2023-05-16'),
    ('15', '11', '14', '11','2023-05-15', '2023-05-17');
INSERT INTO Habitación (idHabitación, tipoHabitación, disponibilidad, precioNoche, numero)VALUES
    (1, 'Individual', 1, 50, 101),
    (2, 'Individual', 1, 50, 102),
    (3, 'Individual', 1, 50, 103),
    (4, 'Individual', 1, 50, 104),
    (5, 'Doble', 1, 75, 201),
    (6, 'Doble', 1, 75, 202),
    (7, 'Doble', 1, 75, 203),
    (8, 'Doble', 1, 75, 204),
    (9, 'Suite', 1, 100, 301),
    (10, 'Suite', 1, 100, 302),
    (11, 'Suite', 1, 100, 303),
    (12, 'Suite', 1, 100, 304),
    (13, 'Presidencial', 1, 200, 401),
    (14, 'Presidencial', 0, 200, 402),
    (15, 'Presidencial', 0, 200, 403);




---10 consultas de la base de datos





--Consultar todas las reservas realizadas por un huésped en particular:
--Esta consulta devuelve todas las reservas realizadas por el 2 huésped específico, identificado por su ID.
SELECT * FROM Reserva WHERE idHuesped = 2;

--muestra todos los registros que tiena la la tabla habitacion con todas las columnas  
SELECT * FROM  Habitacion ;

 -- Esta consulta selecciona el nombre de los métodos de pago disponibles en la base de datos.
SELECT met_pago.nombre FROM met_pago;

--Consultar el promedio de días de estadía de los huéspedes en el alojamiento
--Esta consulta devuelve el promedio de días de estadía de los huéspedes en el alojamiento, considerando la fecha de inicio y fin de cada reserva.
-- AVG = para sacr el promedio 
SELECT AVG(DATEDIFF(fechaSalida, fechaLlegada) + 1)FROM Reserva;

 
-- obtiene todas las columnas de la tabla habitacion donde el tipo de habitacion es Doble
 SELECT tipoHabitacion FROM  habitación WHERE tipoHabitacion = 'Doble';
-- Obtener todos los servicios ofrecidos por el hotel:

SELECT * FROM Servicio;

--Obtener todas las transacciones realizadas con un método de pago específico:

SELECT * FROM Transaccion WHERE idMétodoPago = 3;

--Obtener todas las reservas que han sido realizadas por un recepcionista específico:

SELECT * FROM Reserva WHERE idRecepcionista = 3;

-- Obtener todas las transacciones realizadas en una reserva específica:

SELECT * FROM Transaccion WHERE idReserva = 4
 
--solo se obtienen los datos que estan en las 2 columnas de la tabla servicios
SELECT idServicio, nombre FROM Servicio;

-- obtiene todas las columnas de la tabla habitacion donde el tipo de habitacion es individual
SELECT * FROM habitación WHERE tipoHabitacion = 'individual';










---10 consultas con empleando el uso de JOINS a la base de datos  -------------------------------------------------


1. SELECT recepcionista.id_recepcionista,recepcionista.nombre,recepcionista,apellido,recepcionista,telefono
FROM recepcionista
JOIN recepcionista.id_recepcionista ON recepcionista.nombre = recepcionista.telefono;

2 SELECT servicios.id_servicios,servicios.nombre
FROM servicios
JOIN servicios.id_servicios ON servicios.nombre = servicios.id_servicios

3. SELECT habitacion.id_habitacion, habitacion.id_huesped, habitacion.piso, habitacion.numero, habitacion.tipo_habitacion, habitacion.disponibilidad
FROM habitacion
JOIN habitacion.id_habitacion ON habitacion.piso = habitacion.disponibilidad;

4. SELECT reserva.fecha_reserva, reserva.id_reserva, reserva.nombre, reserva.id_huesped, reserva.id_habitacion, reserva.N_personas
FROM reserva
JOIN reserva.id_reserva ON reserva.nombre = reserva.fecha_reserva;

5. SELECT met_pago.id_met_pago, met_pago.nombre, met_pago.tipo
FROM met_pago
JOIN met_pago.id_met_pago ON met_pago.tipo = met_pago.nombre;

6. SELECT habitacion.id_habitacion, habitacion.id_huesped, habitacion.piso, habitacion.numero, habitacion.tipo_habitacion, habitacion.disponibilidad
FROM habitacion
JOIN habitacion.id_habitacion ON habitacion.numero =  habitacion.tipo_habitacion;

7. SELECT transaccion.id_transaccion_bancaria, id_reserva, id_efectivo, id_met_pago, valor
FROM transaccion
JOIN transaccion.id_met_pago ON transaccion.id_transaccion_bancaria = transaccion.valor;

8 SELECT huesped.id_huesped, huesped.nombre, huesped.apellido, huesped.telefono
FROM huesped
JOIN habitacion.id_huesped ON huesped.nombre = habitacion.id_huesped;
 
9  SELECT reserva.fecha_reserva, reserva.id_reserva, reserva.nombre, reserva.id_huesped, reserva.id_habitacion, reserva.N_personas
FROM reserva 
JOIN  reserva.id_reserva ON  reserva.nombre = reserva.N_personas;

10. SELECT transaccion.id_transaccion_bancaria, id_reserva, id_efectivo, id_met_pago, valor
FROM transaccion
JOIN transaccion.id_met_pago ON transaccion.id_efectivo = transaccion.valor;

