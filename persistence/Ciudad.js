function init(Sequelize, connection) {
	Ciudad = connection.define('ciudad', {
		regionalId: Sequelize.BIGINT,
		descripcion: Sequelize.STRING,
		creado: Sequelize.DATE,
		activo: Sequelize.BOOLEAN
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
