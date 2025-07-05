DROP DATABASE IF EXISTS Libreria;

CREATE DATABASE Libreria;

USE Libreria;


CREATE TABLE categoria (
idCategoria INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(100)
);

CREATE TABLE Producto(
idProducto INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(80),
descripcion VARCHAR(200),
precio FLOAT,
imagen VARCHAR(500),
idCategoria INT,
CONSTRAINT FK_Producto_Categoria FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);


INSERT INTO categoria (nombre) VALUES ('Ciencia Ficción');
INSERT INTO categoria (nombre) VALUES ('Programación');
INSERT INTO categoria (nombre) VALUES ('Historia');
INSERT INTO categoria (nombre) VALUES ('Filosofía');
INSERT INTO categoria (nombre) VALUES ('Literatura');

INSERT INTO Producto (nombre, descripcion, precio, imagen, idCategoria)
VALUES 
('Dune', 'Novela épica de ciencia ficción escrita por Frank Herbert.', 299.99, 'https://m.media-amazon.com/images/I/81TmnPZWb0L.jpg', 1),
('Neuromante', 'Ciberpunk clásico de William Gibson.', 250.50, 'neuromante.jpg', 1),

('C# Avanzado', 'Libro técnico sobre programación avanzada en C#.', 430.00, 'https://resources.sanborns.com.mx/imagenes-sanborns-ii/1200/9789871773961.jpg?scale=500&qlty=75', 2),
('Aprendiendo Python', 'Introducción al lenguaje Python paso a paso.', 380.00, 'https://m.media-amazon.com/images/I/71gX42iilbL._UF894,1000_QL80_.jpg', 2),

('Historia de México', 'Panorama completo de la historia mexicana.', 310.00, 'https://m.media-amazon.com/images/I/91YiZOO3QmL._UF894,1000_QL80_.jpg', 3),
('La Segunda Guerra Mundial', 'Crónica detallada del conflicto global.', 360.00, 'https://images.cdn3.buscalibre.com/fit-in/360x360/6e/d0/6ed0b78db531fdef08b1f42232d40001.jpg', 3),

('Meditaciones', 'Obra filosófica de Marco Aurelio.', 210.00, 'https://m.media-amazon.com/images/I/71yKLc3DRQS._UF894,1000_QL80_.jpg', 4),
('La República', 'Filosofía política escrita por Platón.', 245.00, 'https://m.media-amazon.com/images/I/91citIJeJLL._UF894,1000_QL80_.jpg', 4),

('Cien años de soledad', 'Obra maestra de Gabriel García Márquez.', 290.00, 'https://m.media-amazon.com/images/I/91S1vKWiZWL.jpg', 5),
('Don Quijote de la Mancha', 'Clásico de la literatura española por Cervantes.', 320.00, 'https://m.media-amazon.com/images/I/91tV-Bk+MBL._UF894,1000_QL80_.jpg', 5);
