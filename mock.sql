--CREATE USER midomadmin WITH PASSWORD 'midom2015';

drop schema public cascade;
create schema public;

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

CREATE TABLE usuario
(
	id serial NOT NULL,
	"rolId" integer,
	token character varying(500),
	token_valid timestamp without time zone,
	nombre character varying(30),
	apellido character varying(30),
	username character varying(30),
	password character varying(500),
	email character varying(30),
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_rol_fk FOREIGN KEY ("rolId")
		REFERENCES rol (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

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
	"""ciudadId""" integer,
	codigo character varying(500),
	presupuesto_tope integer,
	presupuesto_global integer,
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT tienda_pk PRIMARY KEY (id),
	CONSTRAINT tienda_ciudad_fk FOREIGN KEY ("""ciudadId""")
		REFERENCES ciudad (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

insert into rol (nombre, codigo, activo, creado) values ('Admin', 'ADM', true, current_timestamp);
insert into rol (nombre, codigo, activo, creado) values ('Operador', 'OPR', true, current_timestamp);

insert into usuario ("rolId", nombre, apellido, username, password, email, creado, activo)
values ((select id from rol where codigo = 'ADM'), 'Pablo', 'Bassil', 'pabcubus', '123', 'pabcubus@gmail.com', current_timestamp, true);
insert into usuario ("rolId", nombre, apellido, username, password, email, creado, activo)
values ((select id from rol where codigo = 'OPR'), 'Nazli', 'Habibe', 'nhabibe', '123', 'nhabibe@gmail.com', current_timestamp, true);

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

insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (1, 2, 'SAO1', 219968, 1187617, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (4, 2, 'STO4', 398409, 326992, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (5, 2, 'STO5', 325498, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (6, 2, 'STO6', 302567, 280399, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (7, 2, 'STO7', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (8, 2, 'STO8', 359100, 245633, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (9, 2, 'STO9', 281028, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (14, 2, 'STO14', 359100, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (15, 2, 'STO15', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (16, 2, 'STO16', 359100, 372776, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (17, 2, 'STO17', 359100, 310417, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (18, 2, 'STO18', 388679, 362150, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (19, 2, 'STO19', 266444, 279844, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (20, 2, 'STO20', 359100, 193543, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (21, 2, 'STO21', 234303, 399017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (22, 2, 'STO22', 398409, 376171, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (23, 2, 'STO23', 321070, 354781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (24, 2, 'STO24', 225145, 244409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (25, 2, 'STO25', 333658, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (26, 2, 'STO26', 332795, 361665, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (27, 2, 'STO27', 259552, 336185, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (28, 2, 'STO28', 361891, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (29, 2, 'STO29', 297504, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (30, 2, 'STO30', 368513, 312254, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (31, 2, 'SAO31', 386465, 1189153, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (32, 2, 'STO32', 454022, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (33, 2, 'STO33', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (34, 2, 'STO34', 346766, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (35, 2, 'STO35', 453741, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (36, 2, 'STO36', 261361, 431866, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (37, 2, 'SDO37', 263544, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (38, 2, 'STO38', 216683, 296049, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (39, 2, 'STO39', 267744, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (40, 2, 'STO40', 252245, 260337, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (42, 2, 'STO42', 228232, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (43, 2, 'SAO43', 321080, 510048, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (45, 2, 'STO45', 253627, 356744, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (46, 2, 'STO46', 143991, 250161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (47, 2, 'SAO47', 260997, 331623, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (48, 2, 'SDO48', 219048, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (49, 2, 'SDO49', 227130, 45241, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (51, 2, 'STO51', 141278, 370731, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (52, 2, 'SDO52', 254053, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (60, 2, 'STO60', 214137, 369773, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (61, 2, 'STO61', 230415, 288391, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (63, 2, 'STO63', 229168, 402101, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (68, 2, 'STO68', 365342, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (72, 2, 'STO72', 359100, 409459, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (73, 2, 'STO73', 359100, 429405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (76, 2, 'STO76', 359100, 504469, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (78, 2, 'STO78', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (82, 2, 'STO82', 359100, 385296, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (84, 2, 'STO84', 205415, 504157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (93, 2, 'SAO93', 239074, 1275847, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (94, 2, 'SAO94', 262224, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (98, 2, 'STO98', 548253, 290401, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (99, 2, 'SDO99', 311912, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (101, 4, 'STO101', 533242, 280272, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (102, 4, 'STO102', 440249, 253591, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (103, 4, 'STO103', 456454, 356756, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (104, 4, 'STO104', 323762, 281808, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (105, 4, 'SAO105', 274739, 654827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (106, 4, 'STO106', 475217, 159990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (107, 4, 'STO107', 413949, 289997, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (108, 4, 'STO108', 717442, 243387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (109, 4, 'STO109', 329209, 252367, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (110, 4, 'STO110', 328284, 156976, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (112, 4, 'SAO112', 367161, 493277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (113, 4, 'STO113', 388034, 282282, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (114, 4, 'STO114', 181881, 237930, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (115, 4, 'STO115', 340602, 256017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (116, 4, 'STO116', 342078, 254631, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (130, 9, 'STO130', 162931, 609170, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (131, 9, 'STO131', 187047, 346569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (132, 9, 'STO132', 406590, 291360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (133, 9, 'STO133', 300166, 241291, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (134, 9, 'STO134', 307130, 246430, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (135, 9, 'STO135', 383326, 363374, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (136, 9, 'STO136', 380727, 350577, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (137, 9, 'STO137', 387691, 397389, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (138, 10, 'SAO138', 371407, 501743, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (139, 9, 'STO139', 370186, 427569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (140, 9, 'STO140', 337962, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (201, 12, 'STO201', 105457, 327165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (202, 12, 'STO202', 391122, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (203, 12, 'SAO203', 359100, 954746, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (204, 12, 'STO204', 359100, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (205, 12, 'STO205', 391122, 345067, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (206, 12, 'STO206', 244864, 212427, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (207, 12, 'STO207', 359100, 261907, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (208, 12, 'STO208', 359100, 251974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (209, 12, 'STO209', 235717, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (210, 12, 'STO210', 359100, 117174, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (211, 12, 'SDO211', 196184, 116989, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (212, 12, 'SAO212', 345924, 606178, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (214, 12, 'STO214', 201850, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (215, 12, 'STO215', 294292, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (216, 12, 'STO216', 163347, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (217, 12, 'STO217', 289521, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (251, 14, 'SAO251', 297484, 1155000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (252, 14, 'STO252', 252910, 330537, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (253, 14, 'STO253', 364615, 242781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (254, 14, 'STO254', 173450, 275975, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (255, 14, 'STO255', 248378, 281011, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (256, 14, 'SAO256', 392057, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (257, 14, 'STO257', 160041, 437918, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (259, 14, 'STO259', 290602, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (301, 8, 'STO301', 398409, 217983, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (302, 8, 'SAO302', 252359, 923688, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (303, 8, 'STO303', 359100, 224277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (304, 8, 'STO304', 221070, 181496, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (305, 8, 'STO305', 398409, 321690, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (306, 13, 'STO306', 308378, 405127, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (307, 8, 'STO307', 398409, 331531, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (308, 8, 'STO308', 359100, 409747, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (309, 8, 'STO309', 335498, 384360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (310, 8, 'SAO310', 279376, 749860, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (311, 8, 'STO311', 325935, 398775, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (312, 8, 'SAO312', 319303, 794212, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (313, 8, 'STO313', 338554, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (321, 13, 'SAO321', 251829, 1138113, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (322, 13, 'STO322', 219573, 192723, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (323, 13, 'STO323', 221985, 435619, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (324, 13, 'SAO324', 310561, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (325, 13, 'STO325', 359100, 177823, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (326, 13, 'STO326', 337546, 322891, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (327, 13, 'STO327', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (328, 13, 'STO328', 359100, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (329, 13, 'STO329', 359100, 279810, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (330, 13, 'STO330', 244864, 375051, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (331, 13, 'STO331', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (332, 13, 'STO332', 191184, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (333, 7, 'STO333', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (334, 7, 'STO334', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (335, 7, 'STO335', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (336, 7, 'STO336', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (337, 7, 'STO337', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (338, 7, 'STO338', 297504, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (339, 7, 'STO339', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (340, 7, 'STO340', 258793, 287548, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (341, 7, 'STO341', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (342, 7, 'STO342', 281870, 313189, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (343, 7, 'STO343', 328856, 365395, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (344, 7, 'STO344', 237899, 264333, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (345, 7, 'STO345', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (346, 7, 'STO346', 216122, 240136, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (347, 7, 'STO347', 309313, 343681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (348, 7, 'STO348', 284053, 315615, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (349, 7, 'STO349', 167785, 186428, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (350, 10, 'STO350', 634868, 341256, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (351, 10, 'STO351', 202831, 425917, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (352, 10, 'STO352', 265804, 423030, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (353, 10, 'STO353', 428007, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (354, 10, 'STO354', 206428, 411318, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (355, 1, 'STO355', 265721, 375513, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (356, 10, 'STO356', 536011, 420604, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (357, 10, 'STO357', 326282, 323353, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (358, 1, 'SAO358', 232785, 571759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (359, 1, 'STO359', 268382, 390990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (361, 6, 'STO361', 441906, 418179, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (362, 6, 'SDO362', 396947, 94987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (364, 6, 'STO364', 712643, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (365, 6, 'STO365', 530456, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (366, 1, 'SAO366', 218122, 842052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (367, 6, 'STO367', 367124, 364471, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (368, 6, 'STO368', 440232, 318040, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (369, 10, 'STO369', 273111, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (370, 11, 'STO370', 373631, 358696, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (371, 9, 'STO371', 378544, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (380, 3, 'SAO380', 196656, 1062138, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (381, 3, 'STO381', 260575, 404393, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (382, 3, 'STO382', 223985, 385007, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (383, 3, 'STO383', 221729, 398271, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (384, 3, 'SAO384', 218070, 1066681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (385, 3, 'STO385', 186968, 393155, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (386, 3, 'STO386', 268908, 422584, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (387, 3, 'STO387', 317779, 435901, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (388, 3, 'STO388', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (390, 3, 'STO390', 359100, 360965, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (391, 3, 'STO391', 359100, 332321, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (393, 3, 'SAO393', 359100, 1043115, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (394, 3, 'STO394', 359100, 346169, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (395, 3, 'STO395', 359100, 357015, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (396, 3, 'STO396', 359100, 326534, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (397, 3, 'STO397', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (398, 3, 'STO398', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (401, 3, 'STO401', 359100, 319570, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (402, 3, 'STO402', 359100, 841445, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (403, 3, 'STO403', 359100, 412674, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (404, 3, 'STO404', 359100, 705409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (406, 3, 'STO406', 359100, 225368, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (407, 3, 'STO407', 359100, 295338, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (408, 3, 'STO408', 359100, 475564, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (409, 3, 'STO409', 359100, 229364, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (410, 3, 'STO410', 359100, 295245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (411, 3, 'STO411', 359100, 595568, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (412, 3, 'STO412', 359100, 362536, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (413, 3, 'STO413', 359100, 258650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (414, 3, 'STO414', 359100, 298202, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (415, 3, 'STO415', 359100, 491006, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (417, 3, 'STO417', 359100, 441052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (418, 3, 'STO418', 359100, 791826, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (419, 3, 'STO419', 359100, 589396, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (420, 3, 'STO420', 359100, 242358, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (424, 3, 'STO424', 359100, 407915, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (425, 3, 'STO425', 359100, 489147, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (426, 3, 'STO426', 359100, 303457, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (427, 3, 'STO427', 359100, 415146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (428, 3, 'STO428', 359100, 472954, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (429, 3, 'STO429', 359100, 281905, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (431, 3, 'STO431', 359100, 324790, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (433, 3, 'STO433', 359100, 350962, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (434, 3, 'STO434', 359100, 272815, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (435, 3, 'STO435', 359100, 243559, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (436, 3, 'STO436', 359100, 311831, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (437, 3, 'STO437', 359100, 431836, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (438, 3, 'STO438', 359100, 320840, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (439, 3, 'STO439', 359100, 218507, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (451, 3, 'STO451', 359100, 289528, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (453, 3, 'STO453', 359100, 248872, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (454, 3, 'STO454', 359100, 246366, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (455, 3, 'STO455', 359100, 242300, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (456, 3, 'STO456', 359100, 207742, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (457, 3, 'STO457', 359100, 298786, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (499, 3, 'STO499', 359100, 353088, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (503, 2, 'STO503', 217161, 292827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (510, 2, 'SDO510', 221787, 63998, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (514, 2, 'SDO514', 327037, 198440, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (515, 2, 'SDO515', 315519, 148405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (516, 2, 'STO516', 357650, 240759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (526, 2, 'SDO526', 384812, 42423, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (528, 2, 'SDO528', 391122, 71933, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (544, 2, 'STO544', 359100, 297493, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (547, 9, 'STO547', 291018, 592491, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (548, 9, 'SAO548', 351891, 837779, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (549, 9, 'STO549', 376361, 489165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (550, 9, 'STO550', 387691, 507172, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (551, 9, 'STO551', 277089, 359736, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (552, 9, 'STO552', 328024, 305266, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (553, 9, 'STO553', 286236, 528019, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (554, 9, 'STO554', 387691, 459944, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (555, 10, 'STO555', 425658, 289974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (556, 10, 'STO556', 253714, 302494, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (557, 9, 'STO557', 322827, 797157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (558, 11, 'STO558', 292311, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (560, 11, 'STO560', 315866, 337387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (561, 11, 'STO561', 245534, 446245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (562, 11, 'STO562', 219203, 265777, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (563, 11, 'STO563', 280648, 319484, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (567, 9, 'STO567', 260976, 365788, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (568, 9, 'STO568', 272245, 364760, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (569, 9, 'STO569', 277089, 407957, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (570, 9, 'STO570', 303648, 431149, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (573, 9, 'STO573', 401621, 202090, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (575, 11, 'STO575', 388652, 384799, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (576, 9, 'STO576', 239199, 378447, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (577, 9, 'STO577', 287536, 380087, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (579, 9, 'STO579', 346319, 701188, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (580, 9, 'STO580', 363953, 404146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (581, 9, 'SAO581', 346506, 815510, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (582, 9, 'STO582', 358444, 308408, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (585, 9, 'SAO585', 353839, 907148, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (586, 9, 'SAO586', 380326, 904191, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (587, 9, 'STO587', 392311, 330052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (588, 9, 'STO588', 359100, 313501, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (589, 9, 'STO589', 324868, 307888, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (590, 9, 'STO590', 299089, 369161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (591, 9, 'STO591', 311552, 331092, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (592, 9, 'STO592', 321313, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (593, 9, 'STO593', 293881, 355555, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (594, 9, 'STO594', 359100, 181034, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (595, 9, 'STO595', 359100, 207830, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (596, 9, 'STO596', 287613, 451766, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (598, 9, 'STO598', 757300, 333517, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (609, 4, 'STO609', 332244, 228239, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (610, 4, 'STO610', 297983, 265638, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (613, 4, 'SDO613', 308378, 196557, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (616, 4, 'SDO616', 319999, 34499, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (641, 5, 'STO641', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (642, 5, 'STO642', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (643, 5, 'STO643', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (644, 5, 'STO644', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (702, 12, 'STO702', 298378, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (704, 12, 'STO704', 358897, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (752, 14, 'SDO752', 394126, 247632, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (754, 12, 'SDO754', 368773, 110521, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (760, 14, 'SDO760', 359100, 120351, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (790, 13, 'STO790', 359100, 243970, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (794, 13, 'STO794', 294448, 246650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (798, 13, 'STO798', 226777, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (892, 8, 'SDO892', 251860, 56987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (893, 8, 'STO893', 174189, 103719, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (895, 8, 'SDO895', 359116, 42145, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (117, 4, 'STO117', 631070, 405936, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (118, 4, 'STO118', 277567, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (119, 4, 'STO119', 363731, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (120, 4, 'STO120', 297047, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (121, 4, 'STO121', 282151, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (122, 4, 'STO122', 277099, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (389, 3, 'SDO389', 288756, 157500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (701, 12, 'STO701', 93347, 399000, current_timestamp, true);
/*
CREATE ROLE pqrs LOGIN
ENCRYPTED PASSWORD 'md5980c7dab8fa4c103ed75446298a98273'
SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
*/
