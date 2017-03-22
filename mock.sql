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
	"ciudadId" integer,
	codigo character varying(500),
	presupuesto_tope integer,
	presupuesto_global integer,
	creado timestamp without time zone,
	activo boolean,
	CONSTRAINT tienda_pk PRIMARY KEY (id),
	CONSTRAINT tienda_ciudad_fk FOREIGN KEY ("ciudadId")
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

insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (1, 1, 'SAO1', 219968, 1187617, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (4, 1, 'STO4', 398409, 326992, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (5, 1, 'STO5', 325498, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (6, 1, 'STO6', 302567, 280399, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (7, 1, 'STO7', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (8, 1, 'STO8', 359100, 245633, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (9, 1, 'STO9', 281028, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (14, 1, 'STO14', 359100, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (15, 1, 'STO15', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (16, 1, 'STO16', 359100, 372776, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (17, 1, 'STO17', 359100, 310417, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (18, 1, 'STO18', 388679, 362150, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (19, 1, 'STO19', 266444, 279844, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (20, 1, 'STO20', 359100, 193543, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (21, 1, 'STO21', 234303, 399017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (22, 1, 'STO22', 398409, 376171, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (23, 1, 'STO23', 321070, 354781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (24, 1, 'STO24', 225145, 244409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (25, 1, 'STO25', 333658, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (26, 1, 'STO26', 332795, 361665, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (27, 1, 'STO27', 259552, 336185, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (28, 1, 'STO28', 361891, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (29, 1, 'STO29', 297504, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (30, 1, 'STO30', 368513, 312254, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (31, 1, 'SAO31', 386465, 1189153, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (32, 1, 'STO32', 454022, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (33, 1, 'STO33', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (34, 1, 'STO34', 346766, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (35, 1, 'STO35', 453741, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (36, 1, 'STO36', 261361, 431866, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (37, 1, 'SDO37', 263544, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (38, 1, 'STO38', 216683, 296049, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (39, 1, 'STO39', 267744, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (40, 1, 'STO40', 252245, 260337, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (42, 1, 'STO42', 228232, 442676, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (43, 1, 'SAO43', 321080, 510048, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (45, 1, 'STO45', 253627, 356744, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (46, 1, 'STO46', 143991, 250161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (47, 1, 'SAO47', 260997, 331623, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (48, 1, 'SDO48', 219048, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (49, 1, 'SDO49', 227130, 45241, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (51, 1, 'STO51', 141278, 370731, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (52, 1, 'SDO52', 254053, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (60, 1, 'STO60', 214137, 369773, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (61, 1, 'STO61', 230415, 288391, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (63, 1, 'STO63', 229168, 402101, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (68, 1, 'STO68', 365342, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (72, 1, 'STO72', 359100, 409459, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (73, 1, 'STO73', 359100, 429405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (76, 1, 'STO76', 359100, 504469, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (78, 1, 'STO78', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (82, 1, 'STO82', 359100, 385296, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (84, 1, 'STO84', 205415, 504157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (93, 1, 'SAO93', 239074, 1275847, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (94, 1, 'SAO94', 262224, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (98, 1, 'STO98', 548253, 290401, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (99, 1, 'SDO99', 311912, 262500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (101, 1, 'STO101', 533242, 280272, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (102, 1, 'STO102', 440249, 253591, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (103, 1, 'STO103', 456454, 356756, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (104, 1, 'STO104', 323762, 281808, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (105, 1, 'SAO105', 274739, 654827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (106, 1, 'STO106', 475217, 159990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (107, 1, 'STO107', 413949, 289997, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (108, 1, 'STO108', 717442, 243387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (109, 1, 'STO109', 329209, 252367, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (110, 1, 'STO110', 328284, 156976, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (112, 1, 'SAO112', 367161, 493277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (113, 1, 'STO113', 388034, 282282, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (114, 1, 'STO114', 181881, 237930, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (115, 1, 'STO115', 340602, 256017, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (116, 1, 'STO116', 342078, 254631, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (130, 1, 'STO130', 162931, 609170, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (131, 1, 'STO131', 187047, 346569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (132, 1, 'STO132', 406590, 291360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (133, 1, 'STO133', 300166, 241291, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (134, 1, 'STO134', 307130, 246430, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (135, 1, 'STO135', 383326, 363374, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (136, 1, 'STO136', 380727, 350577, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (137, 1, 'STO137', 387691, 397389, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (138, 1, 'SAO138', 371407, 501743, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (139, 1, 'STO139', 370186, 427569, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (140, 1, 'STO140', 337962, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (201, 1, 'STO201', 105457, 327165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (202, 1, 'STO202', 391122, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (203, 1, 'SAO203', 359100, 954746, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (204, 1, 'STO204', 359100, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (205, 1, 'STO205', 391122, 345067, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (206, 1, 'STO206', 244864, 212427, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (207, 1, 'STO207', 359100, 261907, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (208, 1, 'STO208', 359100, 251974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (209, 1, 'STO209', 235717, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (210, 1, 'STO210', 359100, 117174, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (211, 1, 'SDO211', 196184, 116989, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (212, 1, 'SAO212', 345924, 606178, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (214, 1, 'STO214', 201850, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (215, 1, 'STO215', 294292, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (216, 1, 'STO216', 163347, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (217, 1, 'STO217', 289521, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (251, 1, 'SAO251', 297484, 1155000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (252, 1, 'STO252', 252910, 330537, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (253, 1, 'STO253', 364615, 242781, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (254, 1, 'STO254', 173450, 275975, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (255, 1, 'STO255', 248378, 281011, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (256, 1, 'SAO256', 392057, 945000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (257, 1, 'STO257', 160041, 437918, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (259, 1, 'STO259', 290602, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (301, 1, 'STO301', 398409, 217983, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (302, 1, 'SAO302', 252359, 923688, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (303, 1, 'STO303', 359100, 224277, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (304, 1, 'STO304', 221070, 181496, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (305, 1, 'STO305', 398409, 321690, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (306, 1, 'STO306', 308378, 405127, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (307, 1, 'STO307', 398409, 331531, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (308, 1, 'STO308', 359100, 409747, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (309, 1, 'STO309', 335498, 384360, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (310, 1, 'SAO310', 279376, 749860, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (311, 1, 'STO311', 325935, 398775, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (312, 1, 'SAO312', 319303, 794212, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (313, 1, 'STO313', 338554, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (321, 1, 'SAO321', 251829, 1138113, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (322, 1, 'STO322', 219573, 192723, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (323, 1, 'STO323', 221985, 435619, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (324, 1, 'SAO324', 310561, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (325, 1, 'STO325', 359100, 177823, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (326, 1, 'STO326', 337546, 322891, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (327, 1, 'STO327', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (328, 1, 'STO328', 359100, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (329, 1, 'STO329', 359100, 279810, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (330, 1, 'STO330', 244864, 375051, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (331, 1, 'STO331', 267941, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (332, 1, 'STO332', 191184, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (333, 1, 'STO333', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (334, 1, 'STO334', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (335, 1, 'STO335', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (336, 1, 'STO336', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (337, 1, 'STO337', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (338, 1, 'STO338', 297504, 330561, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (339, 1, 'STO339', 267941, 297712, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (340, 1, 'STO340', 258793, 287548, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (341, 1, 'STO341', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (342, 1, 'STO342', 281870, 313189, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (343, 1, 'STO343', 328856, 365395, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (344, 1, 'STO344', 237899, 264333, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (345, 1, 'STO345', 265758, 295287, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (346, 1, 'STO346', 216122, 240136, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (347, 1, 'STO347', 309313, 343681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (348, 1, 'STO348', 284053, 315615, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (349, 1, 'STO349', 167785, 186428, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (350, 1, 'STO350', 634868, 341256, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (351, 1, 'STO351', 202831, 425917, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (352, 1, 'STO352', 265804, 423030, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (353, 1, 'STO353', 428007, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (354, 1, 'STO354', 206428, 411318, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (355, 1, 'STO355', 265721, 375513, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (356, 1, 'STO356', 536011, 420604, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (357, 1, 'STO357', 326282, 323353, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (358, 1, 'SAO358', 232785, 571759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (359, 1, 'STO359', 268382, 390990, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (361, 1, 'STO361', 441906, 418179, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (362, 1, 'SDO362', 396947, 94987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (364, 1, 'STO364', 712643, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (365, 1, 'STO365', 530456, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (366, 1, 'SAO366', 218122, 842052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (367, 1, 'STO367', 367124, 364471, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (368, 1, 'STO368', 440232, 318040, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (369, 1, 'STO369', 273111, 430768, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (370, 1, 'STO370', 373631, 358696, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (371, 1, 'STO371', 378544, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (380, 1, 'SAO380', 196656, 1062138, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (381, 1, 'STO381', 260575, 404393, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (382, 1, 'STO382', 223985, 385007, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (383, 1, 'STO383', 221729, 398271, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (384, 1, 'SAO384', 218070, 1066681, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (385, 1, 'STO385', 186968, 393155, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (386, 1, 'STO386', 268908, 422584, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (387, 1, 'STO387', 317779, 435901, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (388, 1, 'STO388', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (390, 1, 'STO390', 359100, 360965, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (391, 1, 'STO391', 359100, 332321, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (393, 1, 'SAO393', 359100, 1043115, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (394, 1, 'STO394', 359100, 346169, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (395, 1, 'STO395', 359100, 357015, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (396, 1, 'STO396', 359100, 326534, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (397, 1, 'STO397', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (398, 1, 'STO398', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (401, 1, 'STO401', 359100, 319570, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (402, 1, 'STO402', 359100, 841445, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (403, 1, 'STO403', 359100, 412674, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (404, 1, 'STO404', 359100, 705409, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (406, 1, 'STO406', 359100, 225368, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (407, 1, 'STO407', 359100, 295338, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (408, 1, 'STO408', 359100, 475564, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (409, 1, 'STO409', 359100, 229364, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (410, 1, 'STO410', 359100, 295245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (411, 1, 'STO411', 359100, 595568, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (412, 1, 'STO412', 359100, 362536, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (413, 1, 'STO413', 359100, 258650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (414, 1, 'STO414', 359100, 298202, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (415, 1, 'STO415', 359100, 491006, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (417, 1, 'STO417', 359100, 441052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (418, 1, 'STO418', 359100, 791826, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (419, 1, 'STO419', 359100, 589396, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (420, 1, 'STO420', 359100, 242358, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (424, 1, 'STO424', 359100, 407915, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (425, 1, 'STO425', 359100, 489147, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (426, 1, 'STO426', 359100, 303457, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (427, 1, 'STO427', 359100, 415146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (428, 1, 'STO428', 359100, 472954, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (429, 1, 'STO429', 359100, 281905, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (431, 1, 'STO431', 359100, 324790, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (433, 1, 'STO433', 359100, 350962, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (434, 1, 'STO434', 359100, 272815, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (435, 1, 'STO435', 359100, 243559, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (436, 1, 'STO436', 359100, 311831, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (437, 1, 'STO437', 359100, 431836, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (438, 1, 'STO438', 359100, 320840, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (439, 1, 'STO439', 359100, 218507, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (451, 1, 'STO451', 359100, 289528, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (453, 1, 'STO453', 359100, 248872, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (454, 1, 'STO454', 359100, 246366, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (455, 1, 'STO455', 359100, 242300, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (456, 1, 'STO456', 359100, 207742, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (457, 1, 'STO457', 359100, 298786, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (499, 1, 'STO499', 359100, 353088, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (503, 1, 'STO503', 217161, 292827, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (510, 1, 'SDO510', 221787, 63998, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (514, 1, 'SDO514', 327037, 198440, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (515, 1, 'SDO515', 315519, 148405, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (516, 1, 'STO516', 357650, 240759, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (526, 1, 'SDO526', 384812, 42423, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (528, 1, 'SDO528', 391122, 71933, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (544, 1, 'STO544', 359100, 297493, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (547, 1, 'STO547', 291018, 592491, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (548, 1, 'SAO548', 351891, 837779, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (549, 1, 'STO549', 376361, 489165, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (550, 1, 'STO550', 387691, 507172, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (551, 1, 'STO551', 277089, 359736, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (552, 1, 'STO552', 328024, 305266, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (553, 1, 'STO553', 286236, 528019, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (554, 1, 'STO554', 387691, 459944, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (555, 1, 'STO555', 425658, 289974, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (556, 1, 'STO556', 253714, 302494, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (557, 1, 'STO557', 322827, 797157, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (558, 1, 'STO558', 292311, 307876, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (560, 1, 'STO560', 315866, 337387, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (561, 1, 'STO561', 245534, 446245, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (562, 1, 'STO562', 219203, 265777, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (563, 1, 'STO563', 280648, 319484, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (567, 1, 'STO567', 260976, 365788, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (568, 1, 'STO568', 272245, 364760, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (569, 1, 'STO569', 277089, 407957, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (570, 1, 'STO570', 303648, 431149, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (573, 1, 'STO573', 401621, 202090, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (575, 1, 'STO575', 388652, 384799, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (576, 1, 'STO576', 239199, 378447, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (577, 1, 'STO577', 287536, 380087, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (579, 1, 'STO579', 346319, 701188, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (580, 1, 'STO580', 363953, 404146, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (581, 1, 'SAO581', 346506, 815510, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (582, 1, 'STO582', 358444, 308408, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (585, 1, 'SAO585', 353839, 907148, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (586, 1, 'SAO586', 380326, 904191, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (587, 1, 'STO587', 392311, 330052, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (588, 1, 'STO588', 359100, 313501, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (589, 1, 'STO589', 324868, 307888, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (590, 1, 'STO590', 299089, 369161, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (591, 1, 'STO591', 311552, 331092, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (592, 1, 'STO592', 321313, 342642, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (593, 1, 'STO593', 293881, 355555, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (594, 1, 'STO594', 359100, 181034, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (595, 1, 'STO595', 359100, 207830, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (596, 1, 'STO596', 287613, 451766, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (598, 1, 'STO598', 757300, 333517, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (609, 1, 'STO609', 332244, 228239, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (610, 1, 'STO610', 297983, 265638, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (613, 1, 'SDO613', 308378, 196557, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (616, 1, 'SDO616', 319999, 34499, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (641, 1, 'STO641', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (642, 1, 'STO642', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (643, 1, 'STO643', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (644, 1, 'STO644', 359100, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (702, 1, 'STO702', 298378, 434580, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (704, 1, 'STO704', 358897, 272071, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (752, 1, 'SDO752', 394126, 247632, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (754, 1, 'SDO754', 368773, 110521, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (760, 1, 'SDO760', 359100, 120351, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (790, 1, 'STO790', 359100, 243970, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (794, 1, 'STO794', 294448, 246650, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (798, 1, 'STO798', 226777, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (892, 1, 'SDO892', 251860, 56987, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (893, 1, 'STO893', 174189, 103719, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (895, 1, 'SDO895', 359116, 42145, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (117, 1, 'STO117', 631070, 405936, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (118, 1, 'STO118', 277567, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (119, 1, 'STO119', 363731, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (120, 1, 'STO120', 297047, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (121, 1, 'STO121', 282151, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (122, 1, 'STO122', 277099, 399000, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (389, 1, 'SDO389', 288756, 157500, current_timestamp, true);
insert into tienda (id, "ciudadId", codigo, presupuesto_tope, presupuesto_global, creado, activo) values (701, 1, 'STO701', 93347, 399000, current_timestamp, true);
/*
CREATE ROLE pqrs LOGIN
ENCRYPTED PASSWORD 'md5980c7dab8fa4c103ed75446298a98273'
SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
*/
