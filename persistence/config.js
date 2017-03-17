function start(Sequelize, connection) {
	require('../persistence/Tienda').init(Sequelize, connection);
}

module.exports.start = start;
