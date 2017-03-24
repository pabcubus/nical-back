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

router.get('/:username', function(req, res) {
	var username = req.params.username;

	connection.sync().then(function() {
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
