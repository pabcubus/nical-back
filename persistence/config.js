function start(Sequelize, connection) {
	require('../persistence/Tienda').init(Sequelize, connection);
	require('../persistence/Ciudad').init(Sequelize, connection);

	Tienda.belongsTo(Ciudad);
}

module.exports.start = start;
