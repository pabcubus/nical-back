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
		.then(function(roles){
			return res.json(roles);
		});
	});
});

// Return router
module.exports = router;
