CREATE DATABASE libreria;

CREATE TABLE libro (

      id_libro int  primary key ,
      nombre varchar(50),
        id_libro_prestamo integer(11), 
          FOREIGN KEY(id_libro_prestamo) REFERENCES libro_prestamos (id_libro_prestamo)
        id_autor integer (11) FOREIGN KEY,
          FOREIGN KEY(id_autor)REFERENCES autores(id_autor)
        id_usuario ineger (11) FOREIGN KEY
           FOREIGN KEY(id_usuario )REFERENCES usuario(id_usuario )
);

CREATE TABLE autor (
        id_autor integer(11) primary key,
        nombre varchar(50),
             id_libro interger(11)
                FOREIGN KEY(id_libro) REFERENCES libro (id_libro)
 ), 
CREATE TABLE usuario(
         id_usuario integer(11) primary key,
         nombre varchar(50),
         direccion varchar(50),
         telefono varchar(50),
             id_libro interger(11)
                FOREIGN KEY(id_libro) REFERENCES libro (id_libro)
             id_prestamo integer(11), 
                 FOREIGN KEY(id_prestamo) REFERENCES prestamo (id_prestamo)
);

CREATE TABLE prestamo (
          id_prestamo integer(11) primary key,
          fecha_prestamo date,
          fecha_entrega datetime,
          id_usuario integer (11)
         FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario)
);