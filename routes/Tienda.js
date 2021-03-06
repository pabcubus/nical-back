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
		Tienda.findAll({
				include: [{
					model: Ciudad,
					as: 'ciudad'
				}]
			})
		.then(function(tiendas){
			return res.json(tiendas);
		});
	});
});

router.get('/:id', function(req, res) {
	var id = req.params.id;

	connection.sync().then(function() {
		Tienda.findAll({
				where: {
					id: {
						$eq: id
					}
				},
				include: [{
					model: Ciudad,
					as: 'ciudad'
				}]
			})
		.then(function(tiendas){
			if (tiendas.length > 0) {
				return res.json(tiendas[0]);
			} else {
				return res.status(406).json({
					message: 'Tienda no válida'
				});
			}
		});
	});
});

// Return router
module.exports = router;
