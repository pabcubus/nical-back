function init(Sequelize, connection) {
	Usuario = connection.define('usuario', {
		rolId: Sequelize.BIGINT,
		tiendaId: Sequelize.BIGINT,
		nombre: Sequelize.STRING,
		apellido: Sequelize.STRING,
		username: Sequelize.STRING,
		password: Sequelize.STRING,
		email: Sequelize.STRING,
		creado: Sequelize.DATE,
		activo: Sequelize.BOOLEAN
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
