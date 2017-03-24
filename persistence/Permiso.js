function init(Sequelize, connection) {
	Permiso = connection.define('permiso', {
		creado: Sequelize.DATE
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
