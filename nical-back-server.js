// Dependencies
var express				= require('express');
var bodyParser 			= require('body-parser');
var sqlite3 			= require('sqlite3');
var Sequelize			= require('sequelize');
var propertiesReader	= require('properties-reader');
var md5					= require('./node_modules/blueimp-md5/js/md5');
var _					= require('lodash');

var app 				= express();
app.use(bodyParser.json());

// Set the params for the ORM (Sequelize)
var properties 	= propertiesReader('config/db.properties');
var db 			= properties.get('db.pqrs.db');
var port 		= properties.get('db.pqrs.port');
var user 		= properties.get('db.pqrs.user');
var password 	= properties.get('db.pqrs.password');

var connectionString = 'postgresql://' + user + ':' + password + '@localhost:'+ port +'/' + db;

var connection = new Sequelize(connectionString, {
	define: {
		timestamps: false
	}
});

// Configure the ORM
require('./persistence/config').start(Sequelize, connection);

app.set('connection', connection);

// Routes
app.use('/api/ciudad', require('./routes/Ciudad'));
app.use('/api/tienda', require('./routes/Tienda'));

// Start server
app.listen(3210);
console.log('API is running on port 3210');
