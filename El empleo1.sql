CREATE TABLE tipoTelefonos(
    idTipoTelefono SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT tipo_Telefono_Valido CHECK (nombre IN ('Fijo', 'Movil'))
);
-------------------------------
INSERT INTO tipoTelefonos (nombre)
VALUES
('Fijo'),
('Movil');
----------------------------------

CREATE TABLE tipoDocumentos(
	idTipoDocumento SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idTipoDocumento),
	CONSTRAINT tipo_Documento_Valido CHECK 
	(nombre IN('Cedula extranjeria','Cedula','Pasaporte', 'Permiso especial de permanencia'))
);
-------------------------------------
INSERT INTO tipoDocumentos (nombre)
VALUES
('Cedula extranjeria'),
('Cedula'),
('Pasaporte'),
('Permiso especial de permanencia');
-------------------------------------

CREATE TABLE estadosCiviles(
	idEstadoCivil SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idEstadoCivil),
	CONSTRAINT tipo_Estado_Civil_Valido CHECK 
	(nombre IN ('Soltero','Casado','Union libre', 'Divorciado', 'Viudo'))
);
------------------------------------
INSERT INTO estadosCiviles (nombre)
VALUES
('Soltero'),
('Casado'),
('Union libre'),
('Divorciado'),
('Viudo');
------------------------------------

CREATE TABLE modalidadDeTrabajos(
	idModalidad SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	descripcion VARCHAR(500) NULL, 
	PRIMARY KEY(idModalidad),
	CONSTRAINT tipo_Modalidad_valido CHECK(nombre IN 
	('Hibrido', 'Presencial','Remoto'))
);
-----------------------------------------------------------------------
INSERT INTO modalidadDeTrabajos (nombre, descripcion)
VALUES
('Hibrido', 'Trabajo combinado entre remoto y presencial'),
('Presencial', 'Trabajo realizado en un lugar físico específico'),
('Remoto', 'Trabajo realizado desde cualquier ubicación con conexión');
------------------------------------------------------------------------

CREATE TABLE tipoDeContratos(
	idTipoContrato SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idTipoContrato),
	CONSTRAINT tipo_Contrato_Valido CHECK(nombre IN 
	('Por obra o labor', 'termino indefinido','Termino Fijo','Aprendizaje','Temporal'))
);
----------------------------------------
INSERT INTO tipoDeContratos (nombre)
VALUES
('Por obra o labor'),
('termino indefinido'),
('Termino Fijo'),
('Aprendizaje'),
('Temporal');
----------------------------------------

CREATE TABLE areaDeEstudios(
	idAreaDeEstudio SERIAL,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR(500) NULL,
	PRIMARY KEY(idAreaDeEstudio)
);
-- --------------------------
INSERT INTO areaDeEstudios (nombre, descripcion)
VALUES
('Ingeniería', 'Estudios relacionados con la ingeniería y sus especializaciones'),
('Ciencias Sociales', 'Carreras relacionadas con la sociología, psicología, y otras ciencias sociales'),
('Arte y Diseño', 'Programas educativos enfocados en el arte, diseño gráfico, y medios visuales'),
('Ciencias de la Salud', 'Carreras relacionadas con la medicina, enfermería y otras áreas de la salud'),
('Derecho', 'Estudios de leyes y ciencias jurídicas'),
('Administración de Empresas', 'Carreras enfocadas en la gestión y administración de negocios'),
('Educación', 'Estudios para formación de maestros y especialistas en educación'),
('Tecnologías de la Información', 'Estudios relacionados con el desarrollo de software y sistemas informáticos');
-----------------------------


CREATE TABLE estadosDeEstudios(
	idEstadoEstudio SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idEstadoEstudio),
	CONSTRAINT tipo_Estado_Valido_Estudio CHECK(nombre IN 
	('Culminado', 'En curso','Abandonado','Aplazado'))
);
-- --------------------------
INSERT INTO estadosDeEstudios (nombre)
VALUES
('Culminado'),
('En curso'),
('Abandonado'),
('Aplazado');
-- --------------------------

CREATE TABLE estadoDeOfertas(
	idestadoDeOferta SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idestadoDeOferta),
	CONSTRAINT tipo_Estado_Valido_Oferta CHECK(nombre IN 
	('Vigente', 'Culminada'))
);
-- --------------------------
INSERT INTO estadoDeOfertas (nombre)
VALUES
('Vigente'),
('Culminada');
-- --------------------------


CREATE TABLE habilidades(
	idHabilidad SERIAL,
	nombre VARCHAR(100) NOT NULL,
	descripcion VARCHAR (500) NULL,
	PRIMARY KEY(idHabilidad)	
);
-- --------------------------
INSERT INTO habilidades (nombre, descripcion)
VALUES
('JavaScript', 'Lenguaje de programación utilizado para desarrollo web interactivo'),
('Python', 'Lenguaje de programación utilizado en ciencia de datos, desarrollo web, y automatización'),
('SQL', 'Lenguaje utilizado para la gestión y manipulación de bases de datos relacionales'),
('Comunicación efectiva', 'Habilidad para transmitir ideas y conceptos de manera clara y eficiente'),
('Trabajo en equipo', 'Capacidad de colaborar eficazmente con otros para alcanzar objetivos comunes'),
('Gestión del tiempo', 'Capacidad para organizar y planificar el tiempo de manera efectiva'),
('Resolución de problemas', 'Habilidad para identificar y resolver problemas de manera creativa y eficiente'),
('Creatividad', 'Habilidad para generar ideas nuevas y útiles');
-- --------------------------

CREATE TABLE tipoArchivos(
	idTipoArchivo SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idTipoArchivo),
	CONSTRAINT tipo_Archivo_Valido CHECK (nombre IN('PDF','DOCX'))
);
-- --------------------------
INSERT INTO tipoArchivos (nombre)
VALUES
('PDF'),
('DOCX');
-- --------------------------


CREATE TABLE sectoresEmpresariales(
	idSectorEmpresarial SERIAL,
	nombre VARCHAR(100) NOT NULL,
	PRIMARY KEY(idSectorEmpresarial)
);
-- --------------------------
INSERT INTO sectoresEmpresariales (nombre)
VALUES
('Tecnología'),
('Salud'),
('Educación'),
('Finanzas'),
('Retail'),
('Construcción'),
('Transporte'),
('Energía');
-- --------------------------

CREATE TABLE institucionesEducativas(
	idInstitucion SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idInstitucion)
);
-- --------------------------
INSERT INTO institucionesEducativas (nombre)
VALUES
('Universidad Nacional'),
('Primaria San jose'),
('Universidad de los Andes'),
('Universidad del Rosario'),
('Politécnico Grancolombiano'),
('Instituto Tecnológico de Monterrey'),
('Escuela Superior de Administración de Negocios'),
('Fundación Universitaria Los Libertadores'),
('Universidad de Bogotá Jorge Tadeo Lozano');
-- --------------------------


CREATE TABLE paises(
	idPais SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idPais)
);
-- --------------------------
INSERT INTO paises (nombre)
VALUES
('Colombia'),
('México'),
('Argentina'),
('Chile'),
('Perú'),
('España'),
('Ecuador'),
('Brasil');
-- --------------------------


CREATE TABLE departamentos(
	idDepartamento SERIAL,
	idPais INT,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idDepartamento),
	FOREIGN KEY(idPais) REFERENCES paises(idPais)
);
-- --------------------------
INSERT INTO departamentos (idPais, nombre)
VALUES
(1, 'Antioquia'),
(1, 'Cundinamarca'),
(1, 'Valle del Cauca'),
(2, 'CDMX'),
(2, 'Jalisco'),
(3, 'Buenos Aires'),
(4, 'Santiago'),
(5, 'Lima');
-- --------------------------


CREATE TABLE ciudades(
	idCiudad SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	idPais INT NOT NULL ,
	idDepartamento INT NOT NULL,
	PRIMARY KEY (idCiudad),
	FOREIGN KEY(idPais) REFERENCES paises(idPais),
	FOREIGN KEY(idDepartamento) REFERENCES departamentos(idDepartamento)
);
-- --------------------------
INSERT INTO ciudades (nombre, idPais, idDepartamento)
VALUES
('Medellín', 1, 1),
('Bogotá', 1, 2),
('Cali', 1, 3),
('Guadalajara', 2, 5),
('México City', 2, 4),
('Buenos Aires', 3, 6),
('Santiago', 4, 7),
('Lima', 5, 8);
-- --------------------------


CREATE TABLE estadosExperiencias(
	idEstadoExperiencia SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	PRIMARY KEY(idEstadoExperiencia),	
	CONSTRAINT experienciaValida CHECK (nombre IN('En proceso','Culminada'))
);
-- --------------------------
INSERT INTO estadosExperiencias (nombre)
VALUES 
('En proceso'),
('Culminada');
-- --------------------------


CREATE TABLE institucionesPorCiudad(
    idInstitucionCuidad SERIAL,
	idCiudad INT NOT NULL,
	idInstitucion INT NOT NULL,
	PRIMARY KEY(idCiudad,idInstitucion),
	FOREIGN KEY(idCiudad) REFERENCES ciudades(idCiudad),
	FOREIGN KEY(idInstitucion) REFERENCES institucionesEducativas(idInstitucion)
);
-- --------------------------
INSERT INTO institucionesPorCiudad (idCiudad, idInstitucion)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);
-- --------------------------

----------------------------- 
CREATE TABLE nivelesDeEstudio(
	idNivelEstudio SERIAL,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	descripcion VARCHAR(500) NULL,
	PRIMARY KEY(idNivelEstudio),
	CONSTRAINT Nivel_Valido_Estudio CHECK (
    nombre IN ('Preescolar', 'Básica Primaria', 'Básica Secundaria',
              'Bachillerato', 'Técnico Laboral', 'Formación Tec profesional',
              'Tecnológica', 'Universitaria', 'Especialización', 'Maestría', 'Doctorado'))
);

-- --------------------------
INSERT INTO nivelesDeEstudio (nombre, descripcion)
VALUES
('Preescolar', 'Educación temprana para niños pequeños'),
('Básica Primaria', 'Educación primaria para niños de 6 a 11 años'),
('Básica Secundaria', 'Educación secundaria para jóvenes de 12 a 15 años'),
('Bachillerato', 'Educación media para jóvenes de 16 a 18 años'),
('Técnico Laboral', 'Formación técnica para el trabajo'),
('Formación Tec profesional', 'Formación técnica profesional de nivel superior'),
('Tecnológica', 'Carreras tecnológicas a nivel de formación superior'),
('Universitaria', 'Educación superior a nivel universitario'),
('Especialización', 'Estudios avanzados en un área específica'),
('Maestría', 'Programa de posgrado avanzado'),
('Doctorado', 'Nivel más alto de estudios académicos');
-- --------------------------


CREATE TABLE usuarios(
	idUsuario SERIAL,
	contraseña VARCHAR(100) NOT NULL,
	correoElectronico VARCHAR(500) NOT NULL UNIQUE,
	fechaDeRegistro DATE NOT NULL  DEFAULT CURRENT_DATE,
	PRIMARY KEY(idUsuario),
	CONSTRAINT fecha_Registro_Valida CHECK (fechaDeRegistro< CURRENT_DATE)
); 
-- Insertar 20 usuarios
INSERT INTO usuarios (contraseña, correoElectronico, fechaDeRegistro)
VALUES
  ('pass1234', 'gestor2@empresa.com', '2024-10-02'),
  ('pass1233', 'gestor3@empresa.com', '2020-11-03'),
  ('pass12333', 'gestor4@empresa.com', '2023-11-04'),
  ('pass12453', 'gestor5@empresa.com', '2023-11-05'),
  ('pass12553', 'gestor6@empresa.com', '2023-11-06'),
  ('pass4556', 'aspirante1@ejemplo.com', '2023-10-15'),
  ('pass4536', 'aspirante3@ejemplo.com', '2007-10-17'),
  ('pass456', 'aspirante4@ejemplo.com', '2023-10-18'),
  ('pass45644', 'aspirante5@ejemplo.com', '2011-10-19'),
  ('pass4564', 'aspirante6@ejemplo.com', '2023-10-20'),
  ('pass456', 'aspirante7@ejemplo.com', '2013-10-21'),
  ('pass4546', 'aspirante8@ejemplo.com', '2000-10-22'),
  ('pass456', 'aspirante9@ejemplo.com', '2023-10-23'),
  ('pass426', 'aspirante10@ejemplo.com', '2004-10-24'),
  ('pass4526', 'aspirante11@ejemplo.com', '2022-10-25'),
  ('pass45622', 'aspirante12@ejemplo.com', '2010-10-26'),
  ('pass45611', 'aspirante13@ejemplo.com', '2021-10-27'),
  ('pass45633', 'aspirante14@ejemplo.com', '2022-10-28');



CREATE TABLE telefonos(
	idTelefono SERIAL,
	idtipoTelefono INT NOT NULL,
	idUsuario INT NOT NULL,
	numero VARCHAR(15) NOT NULL UNIQUE, 
	PRIMARY KEY(idTelefono),
	FOREIGN KEY(idTipoTelefono) REFERENCES tipoTelefonos(idTipoTelefono),
	FOREIGN KEY(idUsuario) REFERENCES usuarios(idUsuario)
);
INSERT INTO telefonos (idTipoTelefono, idUsuario, numero)
VALUES
(1, 2, '3001234567'),
(2, 4, '3202345678'),
(1, 5, '3003456789'),
(2, 6, '3204567890'),
(1, 7, '3005678901'),
(2, 8, '3206789012'),
(1, 9, '3006789012'),
(2, 10, '3207890123'),
(1, 11, '3007890123'),
(2, 12, '3208901234'),
(1, 13, '3008901234'),
(2, 14, '3209012345'),
(1, 15, '3009012345'),
(2, 16, '3209123456'),
(1, 17, '3009123456'),
(2, 18, '3209234567'),
(1, 2, '3009234567'),
(2, 1, '3209345678');
-- --------------------------


CREATE TABLE personas (
	idPersona SERIAL,
	idUsuario INT NOT NULL,
	idTipoDocumento INT NOT NULL,
	idEstadoCivil INT NOT NULL,
	idCiudadNacimiento INT NOT NULL,
	idCiudadResidencia INT NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	genero CHAR,
	fechaNacimiento DATE NOT NULL,
	numeroDocumento varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idTipoDocumento) REFERENCES tipoDocumentos(idTipoDocumento),
	FOREIGN KEY(idEstadoCivil) REFERENCES estadosCiviles(idEstadoCivil),
	FOREIGN KEY(idUsuario) REFERENCES usuarios(idUsuario),
	FOREIGN KEY(idCiudadNacimiento) REFERENCES ciudades(idCiudad),
	FOREIGN KEY(idCiudadResidencia) REFERENCES ciudades(idCiudad),
	CONSTRAINT generos_validos CHECK(genero IN('F','M')),
	CONSTRAINT edad_minima CHECK (fechaNacimiento <= CURRENT_DATE - INTERVAL '18 years'),
	CONSTRAINT fecha_nacimiento_valida CHECK (fechaNacimiento < CURRENT_DATE)
);
-- Insertar aspirantes
INSERT INTO personas (idUsuario, idTipoDocumento, idEstadoCivil, idCiudadNacimiento, idCiudadResidencia, nombre, apellido, genero, fechaNacimiento, numeroDocumento)
VALUES
  (1, 2, 1, 1, 1, 'Carlos', 'Pérez', 'M', '1990-05-10', 1234567890),
  (2,4, 2, 2, 2, 'Ana', 'García', 'F', '1985-03-22', 1234567891),
  (3,4, 1, 1, 1, 'Luis', 'Ramírez', 'M', '1988-08-15', 1234567892),
  (4, 2, 2, 2, 2, 'María', 'Torres', 'F', '1992-12-05', 1234567893),
  (5, 1, 1, 3, 1, 'Juan', 'Sánchez', 'M', '1980-07-20', 1234567894),
  (6, 1, 1, 1, 3, 'Claudia', 'Lopez', 'F', '1993-09-14', 1234567895),
------------------------------------------------------------------------
  (7, 1, 1, 2, 4, 'José', 'Martínez', 'M', '1997-06-12', 2345678901),
  (8, 2, 2, 3, 3, 'Laura', 'Fernández', 'F', '1992-03-11', 2345678902),
  (9, 1, 1, 4, 4, 'Miguel', 'Domínguez', 'M', '1989-02-19', 2345678903),
  (10, 1, 1, 5, 3, 'Sofía', 'Gómez', 'F', '1995-01-29', 2345678904),
  (11, 2, 2, 6, 1, 'Andrés', 'Vargas', 'M', '1987-11-30', 2345678905),
  (12, 1, 1, 7, 1, 'Paula', 'Castro', 'F', '1991-04-10', 2345678906),
  (13, 1, 3, 8, 2, 'David', 'Ortiz', 'M', '1993-05-15', 2345678907),
  (14, 2, 2, 3, 1, 'Sara', 'Rojas', 'F', '1994-08-21', 2345678908),
  (15, 1, 1, 5, 1, 'Jorge', 'López', 'M', '1990-12-01', 2345678909),
  (16, 2, 2, 1, 3, 'Mónica', 'Mendoza', 'F', '1998-09-03', 2345678910),
  (17, 1, 1, 2, 4, 'Fernando', 'Jiménez', 'M', '1999-07-19', 23456789),
  (18, 2, 3, 3, 3, 'Adriana', 'Castillo', 'F', '1996-03-28', 2345678912);



--------------------------------------------actualizada
CREATE TABLE empresas(
	idEmpresa SERIAL,
	idSectorEmpresarial INT,
	nombre VARCHAR(100) NOT NULL UNIQUE,
	NIT INT NOT NULL UNIQUE,
	razonSocial VARCHAR(100),
	PRIMARY KEY(idEmpresa),
	FOREIGN KEY(idSectorEmpresarial) REFERENCES sectoresEmpresariales(idSectorEmpresarial)
);
-----------empresas
INSERT INTO empresas (idSectorEmpresarial, nombre, NIT, razonSocial)
VALUES
(1, 'Tech Solutions', 100001, 'Tech Solutions S.A.'),
(2, 'Green Energy', 100002, 'Green Energy Corp'),
(3, 'EduLearn', 100003, 'EduLearn Institute'),
(4, 'Health First', 100004, 'Health First Clinics'),
(5, 'Global Logistics', 100005, 'Global Logistics Ltd.'),
(6, 'Constructiva', 100006, 'Constructiva S.A.'),
(7, 'Creative Design', 100007, 'Creative Design Co.'),
(8, 'FinancePro', 100008, 'FinancePro Consulting');


CREATE TABLE empresasPorCiudad(
	--idEmpresaPorCiudad Serial,
	idCiudad INT NOT NULL,
	idEmpresa INT NOT NULL,
	PRIMARY KEY(idCiudad,idEmpresa),
	FOREIGN KEY (idCiudad) REFERENCES ciudades(idCiudad),
	FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa)
);
INSERT INTO empresasPorCiudad (idCiudad, idEmpresa)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(8, 8);
-- --------------------------


CREATE TABLE aspirantes (
	idPersona INT,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idPersona) REFERENCES personas(idPersona)
);
INSERT INTO aspirantes(idPersona)
VALUES
  (7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18);
  
CREATE TABLE gestorEmpresa (
    idPersona INT,
	idEmpresa INT,
	PRIMARY KEY (idPersona),
	FOREIGN KEY (idEmpresa) REFERENCES empresas(idEmpresa),
	FOREIGN KEY (idPersona) REFERENCES personas(idPersona)
	
);

INSERT INTO GestorEmpresa(idPersona,idEmpresa)
VALUES
  (1,1),(2,1),(3,2),(4,2),(5,2),(6,8);


CREATE TABLE hojasDeVida (
	idHojaDeVida SERIAL,
	idAspirante INT NOT NULL,
	añosDeExperiencia INT,
	salarioDeAspiracion INT,
	movilidadLaboral BOOLEAN,
	PRIMARY KEY(IdHojaDeVida),
	FOREIGN KEY(idAspirante) REFERENCES aspirantes(idPersona)	
);
-------------------------------------
INSERT INTO hojasDeVida (idAspirante, añosDeExperiencia, salarioDeAspiracion, movilidadLaboral)
VALUES 
(7, 5, 2500000, true),
(8, 3, 2200000, true),
(9, 8, 3500000, false),
(10, 2, 1800000, true),
(11, 6, 3000000, true),
(12, 4, 2700000, false),
(13, 10, 4000000, true),
(14, 7, 3200000, true),
(15, 1, 1600000, false),
(16, 9, 3800000, true),
(17, 5, 2500000, false),
(18, 4, 2200000, true);
-- --------------------------


-- bueno
CREATE TABLE permisosDeTrabajo(
    idHojaDeVida INT,
    idPais INT,
    PRIMARY KEY (idHojaDeVida, idPais),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida),
    FOREIGN KEY (idPais) REFERENCES paises(idPais)
);
INSERT INTO permisosDeTrabajo (idHojaDeVida, idPais)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 1),
(10, 2),
(11, 3),
(12, 4);
-- --------------------------

CREATE TABLE listaHabilidades (
    idHabilidad  INT,
    idHojaDeVida INT,
    PRIMARY KEY (idHabilidad,idHojaDeVida),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida),
    FOREIGN KEY (idHabilidad) REFERENCES habilidades(idHabilidad)
);
INSERT INTO listaHabilidades (idHabilidad, idHojaDeVida)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(1, 4),
(2, 4),
(3, 5),
(4, 5),
(5, 6),
(6, 6),
(1, 7),
(2, 7),
(3, 8),
(4, 8),
(5, 9),
(6, 9),
(1, 10),
(2, 10),
(3, 11),
(4, 11),
(5, 12),
(6, 12);
-- --------------------------


CREATE TABLE redesSociales (
    idRedSocial SERIAL,
    url VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    idHojaDeVida INT,
	PRIMARY KEY(idRedSocial),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida)
);
INSERT INTO redesSociales (url, nombre, idHojaDeVida)
VALUES
('https://www.linkedin.com/in/usuario1', 'LinkedIn', 1),
('https://www.twitter.com/usuario1', 'Twitter', 1),
('https://www.instagram.com/usuario2', 'Instagram', 2),
('https://www.linkedin.com/in/usuario2', 'LinkedIn', 2),
('https://www.twitter.com/usuario3', 'Twitter', 3),
('https://www.instagram.com/usuario3', 'Instagram', 3),
('https://www.linkedin.com/in/usuario4', 'LinkedIn', 4),
('https://www.twitter.com/usuario4', 'Twitter', 4),
('https://www.instagram.com/usuario5', 'Instagram', 5),
('https://www.linkedin.com/in/usuario5', 'LinkedIn', 5),
('https://www.twitter.com/usuario6', 'Twitter', 6),
('https://www.instagram.com/usuario6', 'Instagram', 6),
('https://www.linkedin.com/in/usuario7', 'LinkedIn', 7),
('https://www.twitter.com/usuario7', 'Twitter', 7),
('https://www.instagram.com/usuario8', 'Instagram', 8),
('https://www.linkedin.com/in/usuario8', 'LinkedIn', 8),
('https://www.twitter.com/usuario9', 'Twitter', 9),
('https://www.instagram.com/usuario9', 'Instagram', 9),
('https://www.linkedin.com/in/usuario10', 'LinkedIn', 10),
('https://www.twitter.com/usuario10', 'Twitter', 10),
('https://www.instagram.com/usuario11', 'Instagram', 11),
('https://www.linkedin.com/in/usuario11', 'LinkedIn', 11),
('https://www.twitter.com/usuario12', 'Twitter', 12),
('https://www.instagram.com/usuario12', 'Instagram', 12);
-- --------------------------

CREATE TABLE idiomas (
    idIdiomas SERIAL,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (idIdiomas)
);
INSERT INTO idiomas (nombre)
VALUES
('Inglés'),
('Español'),
('Francés'),
('Alemán'),
('Italiano'),
('Portugués'),
('Ruso'),
('Chino');
-- --------------------------


CREATE TABLE idiomasHojasDeVida(
      idIdiomas INT,
	  idHojaDeVida INT,
	  nivelHablado VARCHAR(100) NOT NULL,
      nivelLeido VARCHAR(100),
      nivelEscucha VARCHAR(100),
      nivelEscrito VARCHAR(100),
	  esLenguaNativa BOOLEAN,
	  PRIMARY KEY(idIdiomas,idHojaDeVida),
	  FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida),
	  FOREIGN KEY (idIdiomas) REFERENCES idiomas(idIdiomas)
);
INSERT INTO idiomasHojasDeVida (idIdiomas, idHojaDeVida, nivelHablado, nivelLeido, nivelEscucha, nivelEscrito, esLenguaNativa)
VALUES
(1, 1, 'Avanzado', 'Intermedio', 'Intermedio', 'Intermedio', TRUE),
(2, 1, 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', FALSE),
(3, 2, 'Básico', 'Básico', 'Básico', 'Básico', TRUE),
(4, 3, 'Intermedio', 'Intermedio', 'Intermedio', 'Intermedio', FALSE),
(5, 4, 'Avanzado', 'Avanzado', 'Avanzado', 'Avanzado', TRUE),
(6, 5, 'Básico', 'Básico', 'Básico', 'Básico', FALSE),
(1, 6, 'Intermedio', 'Avanzado', 'Avanzado', 'Avanzado', TRUE),
(2, 7, 'Básico', 'Básico', 'Básico', 'Básico', FALSE),
(3, 8, 'Intermedio', 'Básico', 'Intermedio', 'Básico', TRUE),
(4, 9, 'Avanzado', 'Avanzado', 'Avanzado', 'Avanzado', FALSE),
(5, 10, 'Intermedio', 'Básico', 'Intermedio', 'Básico', TRUE),
(6, 11, 'Básico', 'Básico', 'Básico', 'Básico', FALSE);
-- --------------------------
CREATE TABLE archivos (
    idArchivo SERIAL,
    idHojaDeVida INT,
    idTipoArchivo INT,
    nombre VARCHAR(100) NOT NULL,
    url VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (idArchivo),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida),
    FOREIGN KEY (idTipoArchivo) REFERENCES tipoArchivos(idTipoArchivo)
);
INSERT INTO archivos (idHojaDeVida, idTipoArchivo, nombre, url)
VALUES
(1, 1, 'Hoja de vida - Juan Perez', 'https://example.com/hojadevida_juanperez.pdf'),
(2, 2, 'Certificado de estudios - Maria Lopez', 'https://example.com/certificado_estudios_marialopez.docx'),
(3, 1, 'Hoja de vida - Carlos Garcia', 'https://example.com/hojadevida_carlosgarcia.pdf'),
(4, 2, 'Certificado de experiencia - Ana Martinez', 'https://example.com/certificado_experiencia_anamartinez.docx'),
(5, 1, 'Hoja de vida - Pedro Ramirez', 'https://example.com/hojadevida_pedroramirez.pdf'),
(6, 2, 'Certificado de estudios - Laura Gonzalez', 'https://example.com/certificado_estudios_lauragonzalez.docx'),
(7, 1, 'Hoja de vida - Roberto Hernandez', 'https://example.com/hojadevida_robertohernandez.pdf'),
(8, 2, 'Certificado de experiencia - Teresa Perez', 'https://example.com/certificado_experiencia_teresaperez.docx'),
(9, 1, 'Hoja de vida - Sergio Torres', 'https://example.com/hojadevida_sergiotorres.pdf'),
(10, 2, 'Certificado de estudios - Marta Ruiz', 'https://example.com/certificado_estudios_martaruiz.docx'),
(11, 1, 'Hoja de vida - Oscar Vargas', 'https://example.com/hojadevida_oscarmvargas.pdf'),
(12, 2, 'Certificado de experiencia - Julia Castillo', 'https://example.com/certificado_experiencia_juliacastillo.docx');
-- --------------------------

CREATE TABLE experienciaLaboral (
    idExperienciaLaboral SERIAL,
    idSectorEmpresarial INT,
    idCiudad INT,
    idHojaDeVida INT,
    nombreCargoExperiencia VARCHAR(100) NOT NULL,
    nombreEmpresaExperiencia VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NULL,
    PRIMARY KEY (idExperienciaLaboral),
    --FOREIGN KEY (idSectorEmpresarial) REFERENCES sectoresEmpresariales(idSectorEmpresarial)duda,
	FOREIGN KEY (idSectorEmpresarial) REFERENCES sectoresEmpresariales(idSectorEmpresarial),
    FOREIGN KEY (idCiudad) REFERENCES ciudades(idCiudad),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida)
);
INSERT INTO experienciaLaboral (idSectorEmpresarial, idCiudad, idHojaDeVida, nombreCargoExperiencia, nombreEmpresaExperiencia, descripcion)
VALUES
(1, 1, 1, 'Desarrollador de software', 'TechCorp', 'Desarrollo de aplicaciones móviles y soluciones empresariales.'),
(2, 2, 2, 'Gerente de marketing', 'MarketPro', 'Gestión de campañas de marketing digital y posicionamiento de marca.'),
(3, 3, 3, 'Ingeniero civil', 'ConstrucTech', 'Supervisión de proyectos de construcción y desarrollo de infraestructuras.'),
(4, 4, 4, 'Analista financiero', 'FinanzasGlobal', 'Análisis de estados financieros y planificación estratégica de inversiones.'),
(5, 5, 5, 'Jefe de operaciones', 'LogisticPlus', 'Gestión de logística y distribución para grandes empresas.'),
(6, 6, 6, 'Diseñador gráfico', 'Creativos Studio', 'Diseño de identidad corporativa y material publicitario.'),
(7, 7, 7, 'Project Manager', 'Innovative Solutions', 'Planificación y ejecución de proyectos tecnológicos innovadores.'),
(8, 8, 8, 'Asesor comercial', 'SalesUp', 'Estrategia comercial y asesoría de ventas para clientes corporativos.'),
(8, 2, 9, 'Administrador de sistemas', 'TechSys', 'Administración de servidores y redes para empresas tecnológicas.'),
(1, 1, 10, 'Consultor de negocios', 'BizConsult', 'Consultoría en crecimiento empresarial y optimización de recursos.'),
(3, 1, 11, 'Especialista en SEO', 'WebMasters', 'Optimización de motores de búsqueda para mejorar el posicionamiento web.'),
(2, 2, 12, 'Gerente de proyectos', 'BuildPro', 'Liderazgo en proyectos de construcción y remodelación industrial.');
-- --------------------------



CREATE TABLE trayectoriaLaboral (
    idTrayectoriaLaboral SERIAL,
    idExperienciaLaboral INT,
    idEstadoExperiencia INT,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NULL,
    PRIMARY KEY (idTrayectoriaLaboral),
    FOREIGN KEY (idExperienciaLaboral) REFERENCES experienciaLaboral(idExperienciaLaboral),
    FOREIGN KEY (idEstadoExperiencia) REFERENCES estadosExperiencias(idEstadoExperiencia),
	CONSTRAINT check_fechas CHECK (fechaInicio < fechaFin OR fechaFin IS NULL)
);
INSERT INTO trayectoriaLaboral (idExperienciaLaboral, idEstadoExperiencia, fechaInicio, fechaFin)
VALUES
(1, 1, '2020-01-15', '2023-03-20'),
(2, 2, '2019-06-01', '2022-12-31'),
(3, 1, '2021-05-10', '2024-05-10'),
(4, 2, '2018-09-01', '2022-09-01'),
(5, 1, '2020-03-01', NULL),
(6, 2, '2019-07-15', '2022-05-10'),
(7, 1, '2022-01-01', NULL),
(8, 2, '2021-03-25', '2023-10-10'),
(9, 1, '2017-04-15', '2020-04-15'),
(10, 2, '2020-06-10', '2022-08-01'),
(11, 1, '2018-11-20', '2021-11-20'),
(12, 2, '2023-05-01', NULL);
-- --------------------------
CREATE TABLE estudios (
    idEstudio SERIAL,
    tituloOtorgado VARCHAR(100) NOT NULL,
    idNivelEstudio INT,
    idHojaDeVida INT,
    idInstitucion INT,
	idAreaDeEstudio INT null,
    PRIMARY KEY (idEstudio),
	FOREIGN KEY (idAreaDeEstudio) REFERENCES areaDeEstudios(idAreaDeEstudio),
    FOREIGN KEY (idNivelEstudio) REFERENCES nivelesDeEstudio(idNivelEstudio),
    FOREIGN KEY (idHojaDeVida) REFERENCES hojasDeVida(idHojaDeVida),
    FOREIGN KEY (idInstitucion) REFERENCES institucionesEducativas(idInstitucion)
);
INSERT INTO estudios (tituloOtorgado, idNivelEstudio, idHojaDeVida, idInstitucion, idAreaDeEstudio)
VALUES
('Licenciatura en Ciencias de la Computación', 9, 1, 1,2),
('Técnico en Redes y Comunicaciones', 5, 2, 2,8),
('Maestría en Inteligencia Artificial', 10, 3, 3,8),
('Bachillerato en Ciencias Sociales', 4, 4, 4,2),
('Diplomado en Big Data', 9, 5, 5,8),
('Tecnólogo en Desarrollo de Software', 7, 6, 6,8),
('Especialización en Seguridad Informática', 10, 7, 7,8),
('Técnico en Electrónica', 5, 8, 8,8),
('Doctorado en Ciencias de la Información', 11, 9, 9,8),
('Licenciatura en Administración de Empresas', 9, 10, 4,6),
('Bachillerato Técnico', 4, 11, 1,null),
('Maestría en Gestión de Proyectos', 10, 12, 2, 6);
-- --------------------------
-- --------------------------

CREATE TABLE trayectoriaEstudiantil (
    idTrayectoriaEstudiantil SERIAL,
    idEstadoEstudio INT,
    idEstudio INT,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NULL,
    PRIMARY KEY (idTrayectoriaEstudiantil),
    FOREIGN KEY (idEstadoEstudio) REFERENCES estadosDeEstudios(idEstadoEstudio),
    FOREIGN KEY (idEstudio) REFERENCES estudios(idEstudio),
	CONSTRAINT check_fechas1 CHECK (fechaInicio < fechaFin OR fechaFin IS NULL)
);
INSERT INTO trayectoriaEstudiantil (idEstadoEstudio, idEstudio, fechaInicio, fechaFin)
VALUES
(1, 1, '2015-01-01', '2019-12-01'),
(2, 2, '2016-06-01', NULL),
(1, 3, '2020-01-01', '2022-12-01'),
(1, 4, '2014-02-01', '2017-11-01'),
(1, 5, '2021-03-01', '2022-06-01'),
(2, 6, '2017-07-01', NULL),
(1, 7, '2020-08-01', '2023-05-01'),
(2, 8, '2018-05-01', NULL),
(1, 9, '2019-09-01', '2022-09-01'),
(1, 10, '2014-03-01', '2018-04-01'),
(1, 11, '2015-01-01', '2018-12-01'),
(1, 12, '2016-09-01', '2020-09-01');
-- --------------------------


CREATE TABLE ofertaTrabajo (
    idOferta SERIAL,
    idSectorEmpresarial INT,
    nombre VARCHAR(100) NOT NULL,
    salarioOfertado FlOAT,
    descripcion VARCHAR(100) NULL,
    numeroVacantes INT NOT NULL,
    experienciaBuscadaEnAños INT NOT NULL,
    idModalidad INT,
    idTipoContrato INT,
    estudioBuscado VARCHAR (100),
    idNivelEstudio INT  DEFAULT 0,
    idGestor INT,
    PRIMARY KEY (idOferta),
    FOREIGN KEY (idSectorEmpresarial) REFERENCES sectoresEmpresariales(idSectorEmpresarial),
    FOREIGN KEY (idModalidad) REFERENCES modalidadDeTrabajos(idModalidad),
    FOREIGN KEY (idTipoContrato) REFERENCES tipoDeContratos(idTipoContrato),
    FOREIGN KEY (idNivelEstudio) REFERENCES nivelesDeEstudio(idNivelEstudio),
    FOREIGN KEY (idGestor) REFERENCES gestorEmpresa(idPersona)
);
INSERT INTO ofertaTrabajo (idSectorEmpresarial, nombre, salarioOfertado, descripcion, numeroVacantes, experienciaBuscadaEnAños, idModalidad, idTipoContrato, estudioBuscado, idNivelEstudio, idGestor)
VALUES
(1, 'Desarrollador de Software', 3500000, 'Desarrollar soluciones de software para clientes', 5, 3, 1, 2, 'Ingeniería de Sistemas', 5, 1),
(2, 'Gerente de Ventas', 4500000, 'Gestionar equipo de ventas en la región', 3, 5, 2, 1, 'Administración de Empresas', 4, 2),
(3, 'Analista de Marketing', 2500000, 'Análisis de campañas publicitarias', 4, 2, 3, 3, 'Marketing', 1, 3),
(4, 'Asesor de Recursos Humanos', 3000000, 'Gestionar procesos de selección de personal', 2, 4, 1, 1, 'Psicología Organizacional', 4, 4),
(5, 'Contador', 4000000, 'Gestionar la contabilidad de la empresa', 2, 4, 2, 2, 'Contabilidad', 2, 5),
(6, 'Ingeniero de Sistemas', 5000000, 'Desarrollar y mantener sistemas informáticos', 3, 5, 1, 2, 'Ingeniería de Sistemas', 5, 6),
(7, 'Director de Marketing', 6000000, 'Diseñar estrategias de marketing para aumentar ventas', 2, 6, 2, 1, 'Marketing Estratégico', 3, 4),
(8, 'Especialista en Recursos Humanos', 3800000, 'Diseñar estrategias de selección y retención de talento', 3, 4, 3, 3, 'Psicología Organizacional', 4, 6);
-----------------------------------------------

--revisar
CREATE TABLE ofertasPorCiudad (
    idOferta INT NOT NULL,
    idCiudad INT NOT NULL,
	PRIMARY KEY(idOferta, idCiudad),
    FOREIGN KEY (idOferta) REFERENCES ofertaTrabajo(idOferta),
    FOREIGN KEY (idCiudad) REFERENCES ciudades(idCiudad)
);
INSERT INTO ofertasPorCiudad (idOferta, idCiudad)
VALUES
(1, 1), 
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 8),
(8, 8);
------------------------------------------------------------

CREATE TABLE postulaciones (
    idAspirante INT NOT NULL,
    idOferta INT NOT NULL,
    fechaPostulacion DATE NOT NULL DEFAULT CURRENT_DATE,
	seleccionado boolean,
    PRIMARY KEY (idAspirante,idOferta),
    FOREIGN KEY (idAspirante) REFERENCES aspirantes(idPersona),
    FOREIGN KEY (idOferta) REFERENCES ofertaTrabajo(idOferta)
);
INSERT INTO postulaciones (idAspirante, idOferta, fechaPostulacion,seleccionado)
VALUES
(7, 1, '2024-11-01',true),
(8, 2, '2024-11-02',true),
(9, 3, '2024-11-03',false),
(10, 4, '2024-11-04',false),
(11, 5, '2024-11-05',false),
(12, 6, '2024-11-06',false),
(13, 7, '2024-11-07',false),
(14, 8, '2024-11-08',true),
(7, 2, '2024-11-01',true),
(7, 4, '2024-11-02',true),
(7, 5, '2024-11-03',false),
(10, 6, '2024-11-04',false),
(10, 7, '2024-11-05',false),
(13, 5, '2024-11-06',false),
(13, 8, '2024-11-07',false),
(13, 6, '2024-11-08',true);

CREATE TABLE tipoMembresias(
	idTipoMembresia SERIAL PRIMARY KEY,
	nombre VARCHAR(100) UNIQUE NOT NULL,
	CONSTRAINT tipo_Membresias_Validas CHECK (nombre IN ('Empresarial', 'Personal'))
);

INSERT INTO tipoMembresias (nombre) VALUES 
('Empresarial'),
('Personal');

CREATE TABLE membresias(
	idMembresia SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	idTipoMembresia INT NOT NULL,
	FOREIGN KEY (idTipoMembresia) REFERENCES tipoMembresias(idTipoMembresia),
    CONSTRAINT membresias_Validas CHECK (nombre IN ('Gold', 'Silver')),
    CONSTRAINT combinacion_valida CHECK (
        (nombre = 'Gold' AND idTipoMembresia = 1) OR
        (nombre = 'Silver' AND idTipoMembresia = 1) OR
        (nombre = 'Gold' AND idTipoMembresia = 2) OR
        (nombre = 'Silver' AND idTipoMembresia = 2)
    ),
    CONSTRAINT unicas_combinaciones UNIQUE (nombre, idTipoMembresia)
);

INSERT INTO membresias (nombre, idTipoMembresia) VALUES 
('Gold', 1),  
('Silver', 1), 
('Gold', 2),  
('Silver', 2); 

CREATE TABLE membresiasPorUsuario(
	idMembresiaPorUsuario SERIAL PRIMARY KEY,
	idMembresia INT NOT NULL,
	idUsuario INT NOT NULL,
	fechaInicio DATE,
	fechaFin DATE,
	FOREIGN KEY (idMembresia) REFERENCES membresias(idMembresia),
	FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
	CONSTRAINT check_fechas_validas CHECK (fechaInicio < fechaFin OR fechaFin IS NULL)
);

INSERT INTO membresiasPorUsuario (idMembresia, idUsuario, fechaInicio, fechaFin) 
VALUES
(1, 1, '2024-01-01', '2025-01-01'),  
(2, 1, '2025-02-01', '2026-02-01'),  
(3, 7, '2024-03-01', '2025-03-01'),  
(1, 3, '2024-05-01', '2025-05-01'), 
(3, 10, '2024-06-01', '2025-06-01'),  
(4, 9, '2024-08-01', '2025-08-01');

CREATE TABLE CicloVidaOferta(
     idciclooferta  SERIAL PRIMARY KEY,
     idestadodeoferta INT,
	 idoferta INT,
	 fechainicio DATE,
	 fechafin DATE NULL,
	 FOREIGN KEY(idestadodeoferta) REFERENCES estadodeofertas(idestadodeoferta),
	 FOREIGN KEY(idoferta) REFERENCES ofertatrabajo(idoferta),
	 CHECK (fechainicio < fechafin OR fechafin IS NULL)
);
-- Inserciones de datos en CicloVidaOferta
INSERT INTO CicloVidaOferta (idestadodeoferta, idoferta, fechainicio, fechafin)
VALUES
(1, 1, '2024-01-01', '2025-01-31'),
(2, 2, '2024-02-01', '2025-02-28'),
(1, 3, '2024-03-01', '2025-03-31'),
(2, 4, '2024-04-01', '2025-04-30'),
(1, 5, '2024-05-01', '2025-05-31'),
(2, 6, '2024-06-01', '2025-06-30'),
(1, 7, '2024-07-01', '2025-07-31'),
(2, 8, '2024-08-01', '2025-08-31');

