// Dependencies
var express = require('express');
var _ = require('lodash');
var router = express.Router();
var Sequelize = require('sequelize');
var connection;

router.use(function(req, res, next) {
	connection = req.app.get('connection');
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
	next();
});

router.get('/', function(req, res) {
	connection.sync().then(function() {
		Usuario.findAll({
				include: [{
					model: Rol,
					as: 'rol',
					include: [{
						model: Permiso,
						as: 'permisos',
						include: [{
							model: Pagina,
							as: 'pagina'
						}]
					}]
				},{
					model: Tienda,
					as: 'tienda'
				}]
			})
		.then(function(usuarios){
			return res.json(usuarios);
		});
	});
});

router.post('/', function(req, res) {
	var user = req.body;

	connection.sync().then(function() {
		Usuario.create({
				rolId: user.rolId,
				tiendaId: user.tiendaId,
				nombre: user.nombre,
				apellido: user.apellido,
				username: user.username,
				password: user.password,
				email: user.email,
				creado: new Date(),
				activo: true
			})
			.then(function(task) {
				return res.json({
					message: 'Usuario Creado'
				});
			})
			.catch(function(data) {
				if (_.has(data, 'errors') && data.errors.length > 0 && data.errors[0].message.indexOf('unique') != -1) {
					return res.status(500).json({
						message: 'Este usuario ya existe.'
					});
				} else {
					return res.status(500).json({
						message: 'Error interno. Intente mas tarde.'
					});
				}
			});
	});
});

router.put('/', function(req, res) {
	var user = req.body;

	var updateStr = "UPDATE usuario " +
		"SET " +
		"\"rolId\" = " + user.rolId + ", " +
		"\"tiendaId\" = " + user.tiendaId + ", " +
		"nombre = '" + user.nombre + "', " +
		"apellido = '" + user.apellido + "', " +
		"username = '" + user.username + "', " +
		"password = '" + user.password + "', " +
		"email = '" + user.email + "', " +
		"activo = " + user.activo + " " +
		"WHERE " +
		"id = " + user.id;

	connection.query(updateStr)
		.then(function(task) {
			return res.json({
				message: 'Usuario actualizado'
			});
		})
		.catch(function() {
			return res.status(500).json({
				message: 'Error interno. Intente mas tarde.'
			});
		});
});

router.get('/:username', function(req, res) {
	var username = req.params.username;

	connection.sync()
		.then(function() {
			Usuario.findAll({
					where: {
						username: {
							$eq: username
						},
						activo: {
							$eq: true
						}
					},
					include: [{
						model: Rol,
						as: 'rol',
						include: [{
							model: Permiso,
							as: 'permisos',
							include: [{
								model: Pagina,
								as: 'pagina'
							}]
						}]
					},{
						model: Tienda,
						as: 'tienda'
					}]
				})
			.then(function(usuarios){
				if (usuarios.length > 0) {
					return res.json(usuarios[0]);
				} else {
					return res.status(406).json({
						message: 'Usuario no válido o inactivo'
					});
				}
			});
		});
});

// Return router
module.exports = router;
