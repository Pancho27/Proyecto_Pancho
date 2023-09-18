CREATE DATABASE  BD_BIBLIOTECA
USE BD_BIBLIOTECA 
DROP DATABASE BD_BIBLIOTECA
CREATE TABLE ALUMNO
(
	Cve_Alumno VARCHAR(4),
	Nombre_Alumno VARCHAR(50),
	Direccion VARCHAR(50),
	Telefono VARCHAR(4),
	Carrera VARCHAR(50),
	Grupo VARCHAR(20),
	CONSTRAINT pk_cvalum PRIMARY KEY (Cve_Alumno)
)

CREATE TABLE AUTOR
(
	Cve_Autor VARCHAR(4),
	Nombre_Autor VARCHAR(50),
	Direccion VARCHAR(50),
	Edad VARCHAR(3),
	CONSTRAINT pk_cvaut PRIMARY KEY (Cve_Autor)  
)

CREATE TABLE PRESTAMO
(
	Cve_Alumno1 VARCHAR(4),
	Cve_Libro2 VARCHAR(4),
	Fecha DATE,
	CONSTRAINT fk_cval FOREIGN KEY (Cve_Alumno1) REFERENCES ALUMNO (Cve_Alumno),
	CONSTRAINT fk_cvlib FOREIGN KEY (Cve_Libro2) REFERENCES LIBRO (Cve_Libro)
)
CREATE TABLE EDITORIAL
(
	Cve_Editorial VARCHAR(4),
	Nombre_Editorial VARCHAR(50),
	Direccion VARCHAR(50),
	Telefono VARCHAR(12), 
	CONSTRAINT pk_cvedit PRIMARY KEY (Cve_Editorial)
)

CREATE TABLE CATEGORIA
(
	Cve_Categoria VARCHAR(4),
	Nombre_Categoria VARCHAR(50),
	CONSTRAINT pk_cvecat PRIMARY KEY (Cve_Categoria)
)

CREATE TABLE LIBRO
(
	Cve_Libro VARCHAR(4),
	Nombre_Libro VARCHAR(50),
	Descripcion VARCHAR(50),
	Costo VARCHAR(5),
	Observacion VARCHAR(50),
	Cve_Categoria1 VARCHAR(4),
	Cve_Editorial2 VARCHAR(4),
	Cve_Autor3 VARCHAR(4),
	CONSTRAINT pk_cvelibro PRIMARY KEY (Cve_Libro),
	CONSTRAINT fk_cvcateg FOREIGN KEY (Cve_Categoria1) REFERENCES CATEGORIA (Cve_Categoria),
	CONSTRAINT fk_cvedito FOREIGN KEY (Cve_Editorial2) REFERENCES EDITORIAL (Cve_Editorial),
	CONSTRAINT fk_cvaut FOREIGN KEY (Cve_Autor3) REFERENCES AUTOR (Cve_Autor)
)

INSERT INTO alumno VALUES 
('AL1','Jose','Pinal','123','Programacion','A'),
('AL2','Carlos','Bucareli','321','Filosofia','B'),
('AL3','Angel','Dinamita','456','PGA','C'),
('AL4','Gustavo','Puerto A','654','Medicina','C'),
('AL5','Victor','Puerto Oro','987','Administracion','A'),
('AL6','Alberto','La Loma','159','Computacion','B'),
('AL7','Rodrigo','Escondida','951','Contabilidad','C'),
('AL8','Rogelio','Centro','357','Diseño Grafico','C'),
('AL9','Martin','Magueysitos','753','Programacion','A'),
('AL10','Alvaro','Epazotes','741','Filosofia','B')
SELECT * FROM alumno 

INSERT INTO categoria VALUES
('CT1','Fantasia'),
('CT2','Terror'),
('CT3','Sexo'),
('CT4','Literatura'),
('CT5','Dibulgativo'),
('CT6','Amor'),
('CT7','Historia'),
('CT8','Ciencia'),
('CT9','Religion'),
('CT10','Arte')
SELECT * FROM  categoria 

INSERT INTO editorial VALUES 
('CE1','Lo que la gente cuenta','Guerrero','789'),
('CE2','Lo mas curioso','Queretaro','987'),
('CE3','Los grillos','San Luis','456'),
('CE4','Los mas chismosos','Chile','654'),
('CE5','Lo relativo','Pinal','123'),
('CE6','Sercana','La Cañada','321'),
('CE7','Chismosa','Chiapas','159'),
('CE8','La fresa','Durango','951'),
('CE9','La black','Yucatan','357'),
('CE10','La fresca','Cancun','852')
SELECT * FROM editorial

INSERT INTO libro VALUES 
('LB1','A 2 metros de ty','350 paginas','$850','Buen estado','CT6','CE5','AT7'),
('LB2','Jugos del hambre','900 paginas','$493','Mal estado','CT1','CE7','AT4'),
('LB3','Bajo la misma estrella','285 paginas','$1500','Mal estado','CT5','CE9','AT1'),
('LB4','Un nuevo amanecer','760 paginas','$700','Buen estado','CT9','CE1','AT8'),
('LB5','La monja','365 paginas','$900','Mal estado','CT2','CE3','AT9'),
('LB6','Crepusculo','400 paginas','$960','Buen estado','CT10','CE6','AT2'),
('LB7','Blancanieves','800 paginas','$2500','Buen estado','CT4','CE10','AT3'),
('LB8','Crimen y castigo','500 paginas','$300','Mal estado','CT8','CE4','AT5'),
('LB9','100 años de soledad','605 paginas','$600','Buen estado','CT3','CE8','AT10'),
('LB10','A sangre fria','536 paginas','$750','Buen Mal','CT7','CE2','AT6')
SELECT * FROM libro 

INSERT INTO prestamo VALUES 
('AL9','LB1','2023/03/09'), 
('AL2','LB7','2023/04/07'),
('AL7','LB2','2023/01/06'),
('AL3','LB10','2023/03/15'),
('AL5','LB3','2023/03/30'),
('AL8','LB9','2023/07/22'),
('AL6','LB5','2023/06/14'),
('AL1','LB8','2023/05/17'),
('AL4','LB4','2023/08/27'),
('AL10','LB6','2023/02/19')
SELECT * FROM prestamo

INSERT INTO autor VALUES 
('AT1','Arquimides','Queretaro','50'),
('AT2','Manuel','Jalpan','68'),
('AT3','Elias','Paris','79'),
('AT4','Daniel','Francia','33'),
('AT5','Cristian','China','49'),
('AT6','Alfredo','Australia','73'),
('AT7','Felipe','Chicago','59'),
('AT8','Uriel','Texas','40'),
('AT9','Camila','Oaxaca','48'),
('AT10','Rebeca','Puebla','67')
SELECT * FROM autor 

/*Que alumnos tienen prestados libros*/
SELECT Nombre_Alumno, Nombre_Libro
FROM alumno INNER JOIN prestamo 
ON alumno.Cve_Alumno = prestamo.Cve_Alumno1
INNER JOIN libro
ON prestamo.Cve_Libro2 = libro.Cve_Libro

/*Que libros fueron prestados desde enero hasta junio*/
SELECT Nombre_Libro,Fecha
FROM libro INNER JOIN prestamo
ON libro.Cve_Libro = prestamo.Cve_Libro2
WHERE Fecha = fecha


/*Que libros tienen prestados los alumnos de programacion y en que fecha los sacaron*/
SELECT Nombre_Alumno, Fecha, Nombre_Libro
FROM alumno INNER JOIN prestamo
ON alumno.Cve_Alumno = prestamo.Cve_Alumno1
INNER JOIN libro
ON prestamo.Cve_Libro2 = libro.Cve_Libro
WHERE Carrera ='Programacion'

/*Libro, Categoria, Autor, Editorial y fecha en que fue prestado el libro LB9 y
a que alumno se le presto*/
SELECT Cve_Libro,Nombre_Libro, Nombre_Categoria, Nombre_Editorial,Nombre_Autor,Cve_Alumno1,Fecha, Nombre_Alumno
FROM libro INNER JOIN categoria
ON libro.Cve_Categoria1 = categoria.Cve_Categoria
INNER JOIN editorial
ON libro.Cve_Editorial2= editorial.Cve_Editorial
INNER JOIN autor
ON libro.Cve_Autor3 = autor.Cve_Autor
INNER JOIN prestamo
ON libro.Cve_Libro = prestamo.Cve_Libro2
INNER JOIN alumno
ON alumno.Cve_Alumno = prestamo.Cve_Alumno1
WHERE Cve_Libro = 'LB9'

/*Que libros con un costo mayor a $1000 se le prestaron y aque alumno se le presto*/
SELECT Nombre_Libro, Nombre_Alumno,Costo
FROM libro INNER JOIN prestamo 
ON libro.Cve_Libro = prestamo.Cve_Libro2
INNER JOIN alumno
ON alumno.Cve_Alumno = prestamo.Cve_Alumno1
WHERE Cve_Libro = 'LB3'

SELECT Nombre_Libro, Nombre_Alumno,Costo
FROM libro INNER JOIN prestamo 
ON libro.Cve_Libro = prestamo.Cve_Libro2
INNER JOIN alumno
ON alumno.Cve_Alumno = prestamo.Cve_Alumno1
WHERE Cve_Libro = 'LB7'