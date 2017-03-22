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

/*
router.get('/getTiendasByCodigo/:codigo', function(req, res) {
	var codigo = req.params.codigo;

	connection.sync().then(function() {
		Tienda.findAll({
				include: [{
					model: Ciudad,
					as: 'ciudad'
				}]
			})
		.then(function(tiendas){
			var result = _.filter(tiendas, function(tienda){
				return tienda.id.toString.indexOf
			});

			return res.json(result);
		});
	});
});
*/

// Return router
module.exports = router;
