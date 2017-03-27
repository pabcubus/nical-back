--CREATE USER midomadmin WITH PASSWORD 'midom2015';

drop schema public cascade;
create schema public;

CREATE TABLE regional
(
	id serial NOT NULL,
	descripcion character varying(500),
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT regional_pk PRIMARY KEY (id)
);

CREATE TABLE ciudad
(
	id serial NOT NULL,
	"regionalId" integer,
	descripcion character varying(500),
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT ciudad_pk PRIMARY KEY (id),
	CONSTRAINT ciudad_regional_fk FOREIGN KEY ("regionalId")
		REFERENCES regional (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE tienda
(
	id serial NOT NULL,
	"ciudadId" integer,
	codigo character varying(500),
	nombre character varying(500),
	presupuesto_tope integer,
	presupuesto_global integer,
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT tienda_pk PRIMARY KEY (id),
	CONSTRAINT tienda_ciudad_fk FOREIGN KEY ("ciudadId")
		REFERENCES ciudad (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE rol
(
	id serial NOT NULL,
	nombre character varying(30),
	codigo character varying(30),
	descripcion character varying(30),
	activo boolean,
	creado timestamp without time zone,
	CONSTRAINT rol_pk PRIMARY KEY (id)
);

insert into rol (id, nombre, codigo, activo, creado) values (1, 'Admin', 'ADM', true, current_timestamp);
insert into rol (id, nombre, codigo, activo, creado) values (2, 'Operador', 'OPR', true, current_timestamp);

CREATE TABLE pagina
(
	id serial NOT NULL,
	nombre character varying(30),
	activo boolean,
	creado timestamp without time zone,
	CONSTRAINT pagina_pk PRIMARY KEY (id)
);

insert into pagina (id, nombre, activo, creado) values (1, 'perfil', true, current_timestamp);
insert into pagina (id, nombre, activo, creado) values (2, 'carrito', true, current_timestamp);
insert into pagina (id, nombre, activo, creado) values (3, 'tienda', true, current_timestamp);
insert into pagina (id, nombre, activo, creado) values (4, 'pedido', true, current_timestamp);
insert into pagina (id, nombre, activo, creado) values (5, 'usuario', true, current_timestamp);
insert into pagina (id, nombre, activo, creado) values (6, 'producto', true, current_timestamp);

CREATE TABLE permiso
(
	id serial NOT NULL,
	"rolId" integer,
	"paginaId" integer,
	creado timestamp without time zone,
	CONSTRAINT permiso_pk PRIMARY KEY (id),
	CONSTRAINT permiso_rol_fk FOREIGN KEY ("rolId")
		REFERENCES rol (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT permiso_pagina_fk FOREIGN KEY ("paginaId")
		REFERENCES pagina (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

insert into permiso ("rolId", "paginaId", creado) values (1, 1, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (1, 2, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (1, 3, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (1, 4, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (1, 5, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (1, 6, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (2, 1, current_timestamp);
insert into permiso ("rolId", "paginaId", creado) values (2, 2, current_timestamp);

CREATE TABLE usuario
(
	id serial NOT NULL,
	"rolId" integer,
	"tiendaId" integer,
	nombre character varying(30),
	apellido character varying(30),
	username character varying(30),
	password character varying(500),
	email character varying(30),
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_username_uq UNIQUE (username),
	CONSTRAINT usuario_rol_fk FOREIGN KEY ("rolId")
		REFERENCES rol (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT usuario_tienda_fk FOREIGN KEY ("tiendaId")
		REFERENCES tienda (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO regional (id, descripcion, creado, activo) VALUES (1, 'ARMENIA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (2, 'BARRANQUILLA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (3, 'BOGOTÁ', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (4, 'CARTAGENA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (5, 'CUCUTA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (6, 'MANIZALES', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (7, 'MEDELLIN', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (8, 'MONTERÍA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (9, 'OCCIDENTE', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (10, 'PEREIRA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (11, 'QUINDIO', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (12, 'SANTA MARTA', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (13, 'SINCELEJO', current_timestamp, true);
INSERT INTO regional (id, descripcion, creado, activo) VALUES (14, 'VALLEDUPAR', current_timestamp, true);

INSERT INTO ciudad (id, "regionalId", descripcion, creado, activo) VALUES (1, 1, 'BARRANQUILLA', current_timestamp, true);

insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (1, 1, 'SAO1', 'SAO 53', 219968, 1187617, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (4, 1, 'STO4', 'STO GALAPA 2', 398409, 326992, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (5, 1, 'STO5', 'STO LAS TORRES', 325498, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (6, 1, 'STO6', 'STO BOSQUE', 302567, 280399, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (7, 1, 'STO7', 'STO MALAMBO', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (8, 1, 'STO8', 'STO CARRERA 8', 359100, 245633, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (9, 1, 'STO9', 'STO PUERTO  ', 281028, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (14, 1, 'STO14', 'STO 7 DE ABRIL', 359100, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (15, 1, 'STO15', 'STO LA PAZ', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (16, 1, 'STO16', 'STO GALAPA', 359100, 372776, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (17, 1, 'STO17', 'STO BARANOA', 359100, 310417, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (18, 1, 'STO18', 'STO SOLEDAD', 388679, 362150, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (19, 1, 'STO19', 'STO SANTO TOMAS', 266444, 279844, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (20, 1, 'STO20', 'STO 20 DE JULIO', 359100, 193543, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (21, 1, 'STO21', 'STO CARRERA 21', 234303, 399017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (22, 1, 'STO22', 'STO SABANALARGA', 398409, 376171, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (23, 1, 'STO23', 'STO LOS ROBLES', 321070, 354781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (24, 1, 'STO24', 'STO LAS NIEVES', 225145, 244409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (25, 1, 'STO25', 'STO LOS MANGOS', 333658, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (26, 1, 'STO26', 'STO SOLEDAD', 332795, 361665, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (27, 1, 'STO27', 'STO LOS OLIVOS', 259552, 336185, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (28, 1, 'STO28', 'STO SILENCIO', 361891, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (29, 1, 'STO29', 'STO SABANAGRANDE', 297504, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (30, 1, 'STO30', 'STO CALLE 30', 368513, 312254, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (31, 1, 'SAO31', 'SAO HIPODROMO', 386465, 1189153, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (32, 1, 'STO32', 'STO SABANALARGA 2', 454022, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (33, 1, 'STO33', 'STO SOLEDAD 2000', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (34, 1, 'STO34', 'STO PALMAR', 346766, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (35, 1, 'STO35', 'STO CONCORD', 453741, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (36, 1, 'STO36', 'STO CALLE 36', 261361, 431866, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (37, 1, 'SDO37', 'SDO PRADOMAR', 263544, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (38, 1, 'STO38', 'STO CAMPO ALEGRE', 216683, 296049, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (39, 1, 'STO39', 'STO CHIQUINQUIRÁ', 267744, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (40, 1, 'STO40', 'STO SIAPE', 252245, 260337, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (42, 1, 'STO42', 'STO EL UNIVERSAL', 228232, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (43, 1, 'SAO43', 'SAO MIRAMAR', 321080, 510048, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (45, 1, 'STO45', 'STO CIUDADELA', 253627, 356744, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (46, 1, 'STO46', 'STO MURILLO ', 143991, 250161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (47, 1, 'SAO47', 'SAO MACARENA', 260997, 331623, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (48, 1, 'SDO48', 'SDO SAGRADO CORAZÓ', 219048, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (49, 1, 'SDO49', 'SDO CARRERA 49C', 227130, 45241, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (51, 1, 'STO51', 'STO VILLA CAMPESTRE', 141278, 370731, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (52, 1, 'SDO52', 'STO TORRES DEL METRO', 254053, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (60, 1, 'STO60', 'STO TANGANAZO', 214137, 369773, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (61, 1, 'STO61', 'STO RECREO', 230415, 288391, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (63, 1, 'STO63', 'STO TERMINAL', 229168, 402101, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (68, 1, 'STO68', 'STO CALLE 68', 365342, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (72, 1, 'STO72', 'STO CALLE 72', 359100, 409459, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (73, 1, 'STO73', 'STO CALLE 73', 359100, 429405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (76, 1, 'STO76', 'STO CALLE 76', 359100, 504469, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (78, 1, 'STO78', 'STO CIUDAD JARDIN', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (82, 1, 'STO82', 'STO CALLE 82', 359100, 385296, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (84, 1, 'STO84', 'STO CALLE 84', 205415, 504157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (93, 1, 'SAO93', 'SAO 93', 239074, 1275847, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (94, 1, 'SAO94', 'SAO VILLA CAROLINA', 262224, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (98, 1, 'STO98', 'STO BUENAVISTA', 548253, 290401, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (99, 1, 'SDO99', 'SDO PLAZA DEL PARQUE', 311912, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (101, 1, 'STO101', 'STO BADILLO', 533242, 280272, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (102, 1, 'STO102', 'STO MATUNA', 440249, 253591, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (103, 1, 'STO103', 'STO BOCAGRANDE', 456454, 356756, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (104, 1, 'STO104', 'STO EJECUTIVOS', 323762, 281808, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (105, 1, 'SAO105', 'SAO PLAZUELA', 274739, 654827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (106, 1, 'STO106', 'STO TORICE', 475217, 159990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (107, 1, 'STO107', 'STO PIE DE POPA', 413949, 289997, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (108, 1, 'STO108', 'STO CRISANTO LUQUE', 717442, 243387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (109, 1, 'STO109', 'STO BUENOS AIRES', 329209, 252367, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (110, 1, 'STO110', 'STO BLAS DE LEZO', 328284, 156976, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (112, 1, 'SAO112', 'SAO SAN FELIPE', 367161, 493277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (113, 1, 'STO113', 'STO 13 DE JULIO', 388034, 282282, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (114, 1, 'STO114', 'STO CANDELARIA', 181881, 237930, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (115, 1, 'STO115', 'STO OULET', 340602, 256017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (116, 1, 'STO116', 'STO ARJONA', 342078, 254631, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (130, 1, 'STO130', 'STO GUADALUPE', 162931, 609170, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (131, 1, 'STO131', 'STO ALAMEDA', 187047, 346569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (132, 1, 'STO132', 'STO PORVENIR', 406590, 291360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (133, 1, 'STO133', 'STO LA QUINTA', 300166, 241291, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (134, 1, 'STO134', 'STO LA 26', 307130, 246430, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (135, 1, 'STO135', 'STO CAÑAVERAL', 383326, 363374, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (136, 1, 'STO136', 'STO SALOMIA', 380727, 350577, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (137, 1, 'STO137', 'STO VILLACOLOMBIA', 387691, 397389, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (138, 1, 'SAO138', 'SAO CARTAGO', 371407, 501743, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (139, 1, 'STO139', 'STO BASE AEREA', 370186, 427569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (140, 1, 'STO140', 'STO AV. TERCERA', 337962, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (201, 1, 'STO201', 'STO CENTRO', 105457, 327165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (202, 1, 'STO202', 'STO RODADERO', 391122, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (203, 1, 'SAO203', 'SAO SANTA MARTA', 359100, 954746, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (204, 1, 'STO204', 'STO AV. LIVERTADOR', 359100, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (205, 1, 'STO205', 'STO RECORD', 391122, 345067, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (206, 1, 'STO206', 'STO EL PANDO', 244864, 212427, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (207, 1, 'STO207', 'STO FUNDACIÓN', 359100, 261907, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (208, 1, 'STO208', 'STO TERMINAL', 359100, 251974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (209, 1, 'STO209', 'STO 209 GAIRA', 235717, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (210, 1, 'STO210', 'STO ESTACIÓN MOBIL', 359100, 117174, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (211, 1, 'SDO211', 'SDO CARRERA 24', 196184, 116989, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (212, 1, 'SAO212', 'STO RIOHACHA', 345924, 606178, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (214, 1, 'STO214', 'STO MANZANARES', 201850, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (215, 1, 'STO215', 'STO ARACATACA', 294292, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (216, 1, 'STO216', 'STO MINCA', 163347, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (217, 1, 'STO217', 'STO BONGA', 289521, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (251, 1, 'SAO251', 'SAO VALLEDUPAR', 297484, 1155000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (252, 1, 'STO252', 'STO CORTIJOS', 252910, 330537, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (253, 1, 'STO253', 'STO CODAZZI', 364615, 242781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (254, 1, 'STO254', 'STO SAN JUAN', 173450, 275975, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (255, 1, 'STO255', 'STO SIERRA NEVADA', 248378, 281011, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (256, 1, 'SAO256', 'SAO AGUACHICA', 392057, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (257, 1, 'STO257', 'STO BOSCONIA', 160041, 437918, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (259, 1, 'STO259', 'STO CURUMANÍ', 290602, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (301, 1, 'STO301', 'STO CENTRO', 398409, 217983, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (302, 1, 'SAO302', 'SAO CIRCUNVALAR', 252359, 923688, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (303, 1, 'STO303', 'STO C.C. DEL SUR', 359100, 224277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (304, 1, 'STO304', 'STO CAUCASIA', 221070, 181496, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (305, 1, 'STO305', 'STO LORICA', 398409, 321690, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (306, 1, 'STO306', 'STO SAHAGÚN', 308378, 405127, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (307, 1, 'STO307', 'STO PLANETA RICA', 398409, 331531, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (308, 1, 'STO308', 'STO MONTELIBANO', 359100, 409747, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (309, 1, 'STO309', 'STO CERETÉ 2', 335498, 384360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (310, 1, 'SAO310', 'SAO BUENAVISTA', 279376, 749860, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (311, 1, 'STO311', 'STO MONERIA ', 325935, 398775, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (312, 1, 'SAO312', 'SAO APARTADÓ', 319303, 794212, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (313, 1, 'STO313', 'STO CIENAGA DE ORO', 338554, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (321, 1, 'SAO321', 'SAO PA PAJUELA', 251829, 1138113, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (322, 1, 'STO322', 'STO COROZAL', 219573, 192723, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (323, 1, 'STO323', 'STO EURO', 221985, 435619, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (324, 1, 'SAO324', 'SAO MAGANGUE', 310561, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (325, 1, 'STO325', 'STO TOLU', 359100, 177823, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (326, 1, 'STO326', 'STO SAN CARLOS', 337546, 322891, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (327, 1, 'STO327', 'ARGELIA', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (328, 1, 'STO328', 'STO SAN MARCO', 359100, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (329, 1, 'STO329', 'STO CHINU', 359100, 279810, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (330, 1, 'STO330', 'STO PLATO', 244864, 375051, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (331, 1, 'STO331', 'STO SAN JUAN NEPO', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (332, 1, 'STO332', 'STO SAN ONOFRE', 191184, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (333, 1, 'STO333', 'STO ITAGUI 2', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (334, 1, 'STO334', 'STO RIO NEGRO 2', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (335, 1, 'STO335', 'STO LA CEJA', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (336, 1, 'STO336', 'STO COPACABANA', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (337, 1, 'STO337', 'STO SAN CRISTOBAL', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (338, 1, 'STO338', 'STO BELLO', 297504, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (339, 1, 'STO339', 'STO LA FLORESTA', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (340, 1, 'STO340', 'STO SAN LUCAS', 258793, 287548, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (341, 1, 'STO341', 'STO VILLANUEVA', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (342, 1, 'STO342', 'STO CARABOBO', 281870, 313189, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (343, 1, 'STO343', 'STO MILAGROSA', 328856, 365395, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (344, 1, 'STO344', 'STO COLOMBIA', 237899, 264333, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (345, 1, 'STO345', 'STO ITAGUI', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (346, 1, 'STO346', 'STO BELEN', 216122, 240136, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (347, 1, 'STO347', 'STO RIONEGRO', 309313, 343681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (348, 1, 'STO348', 'STO ENVIGADO', 284053, 315615, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (349, 1, 'STO349', 'STO MENRIQUE', 167785, 186428, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (350, 1, 'STO350', 'STO GAMMA', 634868, 341256, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (351, 1, 'STO351', 'STO PEREIRA', 202831, 425917, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (352, 1, 'STO352', 'STO DOSQUEBRADAS', 265804, 423030, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (353, 1, 'STO353', 'STO SANTA ROSA ', 428007, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (354, 1, 'STO354', 'STO LA VIRGINIA', 206428, 411318, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (355, 1, 'STO355', 'STO ARMENIA NORTE', 265721, 375513, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (356, 1, 'STO356', 'STO PEREIRA CENTRO', 536011, 420604, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (357, 1, 'STO357', 'STO CUBA', 326282, 323353, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (358, 1, 'SAO358', 'SAO PORTAL DEL QUINDIO', 232785, 571759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (359, 1, 'STO359', 'STO EL BOSQUE', 268382, 390990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (361, 1, 'STO361', 'STO CENTRO', 441906, 418179, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (362, 1, 'SDO362', 'SDO DROQUERIA', 396947, 94987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (364, 1, 'STO364', 'SDO AV. SANTANDER', 712643, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (365, 1, 'STO365', 'STO VILLA MARIA', 530456, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (366, 1, 'SAO366', 'SAO ARMENIA', 218122, 842052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (367, 1, 'STO367', 'STO LA COSECHA', 367124, 364471, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (368, 1, 'STO368', 'STO CHINCHINA', 440232, 318040, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (369, 1, 'STO369', 'STO ALTAVISTA', 273111, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (370, 1, 'STO370', 'STO LA UNIÓN', 373631, 358696, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (371, 1, 'STO371', 'STO BUGA REBAJON', 378544, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (380, 1, 'SAO380', 'SAO NEIVA', 196656, 1062138, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (381, 1, 'STO381', 'STO ESPINAL', 260575, 404393, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (382, 1, 'STO382', 'STO SANTA LOMA', 223985, 385007, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (383, 1, 'STO383', 'STO NEIVA', 221729, 398271, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (384, 1, 'SAO384', 'SAO IBAGUE', 218070, 1066681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (385, 1, 'STO385', 'STO JARDIN', 186968, 393155, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (386, 1, 'STO386', 'STO CENTRO', 268908, 422584, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (387, 1, 'STO387', 'STO SAN AGUSTIN', 317779, 435901, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (388, 1, 'STO388', 'STO PUERTO BOYACÁ', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (390, 1, 'STO390', 'STO TUNJA', 359100, 360965, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (391, 1, 'STO391', 'STO SOGAMOSO', 359100, 332321, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (393, 1, 'SAO393', 'SAO YOPAL', 359100, 1043115, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (394, 1, 'STO394', 'STO FUNZA', 359100, 346169, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (395, 1, 'STO395', 'STO SOACHA', 359100, 357015, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (396, 1, 'STO396', 'STO CAJICA', 359100, 326534, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (397, 1, 'STO397', 'STO BOSA', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (398, 1, 'STO398', 'STO CAMPO ALEGRE', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (401, 1, 'STO401', 'STO CASTELLANA', 359100, 319570, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (402, 1, 'STO402', 'STO CALLE 100', 359100, 841445, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (403, 1, 'STO403', 'STO VILLA MAGDALA', 359100, 412674, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (404, 1, 'STO404', 'STO SANTA ANA', 359100, 705409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (406, 1, 'STO406', 'STO STA. ISABEL', 359100, 225368, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (407, 1, 'STO407', 'STO ROSALES', 359100, 295338, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (408, 1, 'STO408', 'STO CONTADOR', 359100, 475564, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (409, 1, 'STO409', 'STO AV. 19', 359100, 229364, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (410, 1, 'STO410', 'STO CALLE 63', 359100, 295245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (411, 1, 'STO411', 'STO CHICÓ', 359100, 595568, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (412, 1, 'STO412', 'STO CENTRO NARIÑO', 359100, 362536, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (413, 1, 'STO413', 'STO PLAZA MAYOR', 359100, 258650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (414, 1, 'STO414', 'STO QUINTA RAMOS', 359100, 298202, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (415, 1, 'STO415', 'STO NORMANDIA', 359100, 491006, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (417, 1, 'STO417', 'STO UNISUR', 359100, 441052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (418, 1, 'STO418', 'STO COLINA CAMPESTRE', 359100, 791826, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (419, 1, 'STO419', 'STO AUTOPISTA NORTE', 359100, 589396, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (420, 1, 'STO420', 'STO CALLE 170', 359100, 242358, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (424, 1, 'STO424', 'STO CHICÓ 2', 359100, 407915, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (425, 1, 'STO425', 'STO MODELO', 359100, 489147, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (426, 1, 'STO426', 'STO JIMENEZ', 359100, 303457, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (427, 1, 'STO427', 'STO KENEDY 1', 359100, 415146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (428, 1, 'STO428', 'STO MAZUREN', 359100, 472954, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (429, 1, 'STO429', 'STO RESTREPO', 359100, 281905, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (431, 1, 'STO431', 'STO CALLE 56', 359100, 324790, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (433, 1, 'STO433', 'STO VILLACENTRO', 359100, 350962, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (434, 1, 'STO434', 'STO CAMINO REAL', 359100, 272815, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (435, 1, 'STO435', 'STO METRORECREO', 359100, 243559, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (436, 1, 'STO436', 'STO ISERRA 100', 359100, 311831, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (437, 1, 'STO437', 'STO HACIENDA STA. BARBARA', 359100, 431836, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (438, 1, 'STO438', 'STO CEDRITO', 359100, 320840, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (439, 1, 'STO439', 'STO 7 DE AGOSTO', 359100, 218507, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (451, 1, 'STO451', 'STO KENEDY 2', 359100, 289528, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (453, 1, 'STO453', 'STO RICAUTE', 359100, 248872, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (454, 1, 'STO454', 'STO COSMOS', 359100, 246366, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (455, 1, 'STO455', 'STO VENECIA', 359100, 242300, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (456, 1, 'STO456', 'STO AVENIDA CHILE', 359100, 207742, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (457, 1, 'STO457', 'STO PALATINO', 359100, 298786, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (499, 1, 'STO499', 'STO ZIPAQUIRÁ', 359100, 353088, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (503, 1, 'STO503', 'STO SIMON BOLIVAR', 217161, 292827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (510, 1, 'SDO510', 'SDO CALLE 76', 221787, 63998, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (514, 1, 'SDO514', 'SDO CALLE 73', 327037, 198440, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (515, 1, 'SDO515', 'SDO CALLE 84', 315519, 148405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (516, 1, 'STO516', 'STO CORDIALIDAD', 357650, 240759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (526, 1, 'SDO526', 'SDO CALLE 70', 384812, 42423, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (528, 1, 'SDO528', 'SDO CALLE 93', 391122, 71933, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (544, 1, 'STO544', 'STO CALLE 82', 359100, 297493, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (547, 1, 'STO547', 'STO PUERTO TEJADA', 291018, 592491, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (548, 1, 'SAO548', 'SAO BUENAVISTA', 351891, 837779, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (549, 1, 'STO549', 'STO CANEY', 376361, 489165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (550, 1, 'STO550', 'STO TEQUENDAMA', 387691, 507172, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (551, 1, 'STO551', 'STO MANZANARES', 277089, 359736, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (552, 1, 'STO552', 'STO VERSALLES', 328024, 305266, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (553, 1, 'STO553', 'STO BUGA', 286236, 528019, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (554, 1, 'STO554', 'STO TULUA TERMINAL', 387691, 459944, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (555, 1, 'STO555', 'STO CARTAGO 1', 425658, 289974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (556, 1, 'STO556', 'STO CARTAGO 2', 253714, 302494, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (557, 1, 'STO557', 'STO BUENAVENTURA', 322827, 797157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (558, 1, 'STO558', 'STO SEVILLA', 292311, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (560, 1, 'STO560', 'STO ZARZAL', 315866, 337387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (561, 1, 'STO561', 'STO QUIMBAYA', 245534, 446245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (562, 1, 'STO562', 'STO MONTENEGRO', 219203, 265777, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (563, 1, 'STO563', 'STO CALARCÁ', 280648, 319484, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (567, 1, 'STO567', 'STO RESTREPO', 260976, 365788, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (568, 1, 'STO568', 'STO GUAYAQUIL', 272245, 364760, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (569, 1, 'STO569', 'STO ACACIAS', 277089, 407957, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (570, 1, 'STO570', 'STO BARRANQUILLA', 303648, 431149, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (573, 1, 'STO573', 'STO CRISTALES', 401621, 202090, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (575, 1, 'STO575', 'STO CAICEDONIA', 388652, 384799, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (576, 1, 'STO576', 'STO PASOANCHO', 239199, 378447, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (577, 1, 'STO577', 'STO CAMPIÑA', 287536, 380087, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (579, 1, 'STO579', 'STO PALMIRA VERSALLES', 346319, 701188, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (580, 1, 'STO580', 'STO POP NORTE', 363953, 404146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (581, 1, 'SAO581', 'SAO POPAYAN CENTRO', 346506, 815510, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (582, 1, 'STO582', 'STO SANTANDER', 358444, 308408, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (585, 1, 'SAO585', 'SAO LA 47', 353839, 907148, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (586, 1, 'SAO586', 'SAO BOSQUE', 380326, 904191, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (587, 1, 'STO587', 'STO TULUA DELICIAS', 392311, 330052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (588, 1, 'STO588', 'STO GRANJAS', 359100, 313501, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (589, 1, 'STO589', 'STO LAGOS', 324868, 307888, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (590, 1, 'STO590', 'STO CANDELARIA', 299089, 369161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (591, 1, 'STO591', 'STO ALAMEDA', 311552, 331092, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (592, 1, 'STO592', 'STO UNICENTRO', 321313, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (593, 1, 'STO593', 'STO POBLADO', 293881, 355555, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (594, 1, 'STO594', 'STO GRANJAS 2', 359100, 181034, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (595, 1, 'STO595', 'STO PORVENIR', 359100, 207830, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (596, 1, 'STO596', 'STO GUACARI', 287613, 451766, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (598, 1, 'STO598', 'STO REBAJON POPAYAN', 757300, 333517, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (609, 1, 'STO609', 'STO BAZURTO', 332244, 228239, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (610, 1, 'STO610', 'STO 24 HORAS', 297983, 265638, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (613, 1, 'SDO613', 'SDO PLAZUELA ', 308378, 196557, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (616, 1, 'SDO616', 'SDO PIE DE LA POPA', 319999, 34499, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (641, 1, 'STO641', 'STO GUAIMARAL', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (642, 1, 'STO642', 'STO PINOS', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (643, 1, 'STO643', 'STO EXPRESS', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (644, 1, 'STO644', 'STO PRADO', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (702, 1, 'STO702', 'STO MAR CARIBE', 298378, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (704, 1, 'STO704', 'STO CIENAGA', 358897, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (752, 1, 'SDO752', 'SDO CRA NOVENA', 394126, 247632, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (754, 1, 'SDO754', 'SDO 794-NUEVO', 368773, 110521, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (760, 1, 'SDO760', 'SDO PETROMIL', 359100, 120351, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (790, 1, 'STO790', 'STO CENTRO', 359100, 243970, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (794, 1, 'STO794', 'STO BOSTON', 294448, 246650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (798, 1, 'STO798', 'STO CARMEN DE BOLIVAR', 226777, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (892, 1, 'SDO892', 'SDO MONTERIA 1', 251860, 56987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (893, 1, 'STO893', 'STO CERETÉ 1', 174189, 103719, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (895, 1, 'SDO895', 'SDO MONTERIA 2', 359116, 42145, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (117, 1, 'STO117', 'STO TURBACO', 631070, 405936, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (118, 1, 'STO118', 'STO PREDRO DE HEREDIA', 277567, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (119, 1, 'STO119', 'STO LOS CAMPANOS', 363731, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (120, 1, 'STO120', 'STO SAN FERNANDO', 297047, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (121, 1, 'STO121', 'STO OLAYA', 282151, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (122, 1, 'STO122', 'STO EL CARMELO', 277099, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (389, 1, 'SDO389', 'SDO PLAZA AVENTURA', 288756, 157500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, nombre, presupuesto_tope, presupuesto_global, creado, activo) values (701, 1, 'STO701', 'STO CIENAGA 2', 93347, 399000, current_timestamp, true);

insert into usuario ("rolId", "tiendaId", nombre, apellido, username, password, email, creado, activo)
values ((select id from rol where codigo = 'ADM'), 119, 'Pablo', 'Bassil', 'pabcubus', '202cb962ac59075b964b07152d234b70', 'pabcubus@gmail.com', current_timestamp, true);
insert into usuario ("rolId", "tiendaId", nombre, apellido, username, password, email, creado, activo)
values ((select id from rol where codigo = 'OPR'), 892, 'Nazli', 'Habibe', 'nhabibe', '202cb962ac59075b964b07152d234b70', 'nhabibe@gmail.com', current_timestamp, true);

/*
CREATE ROLE pqrs LOGIN
ENCRYPTED PASSWORD 'md5980c7dab8fa4c103ed75446298a98273'
SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
*/
