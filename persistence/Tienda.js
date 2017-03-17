function init(Sequelize, connection) {
	Tienda = connection.define('tienda', {
		rolId: Sequelize.BIGINT,
		nombre: Sequelize.STRING,
		apellido: Sequelize.STRING,
		username: Sequelize.STRING,
		password: Sequelize.STRING,
		token: Sequelize.STRING,
		token_valid: Sequelize.DATE,
		email: Sequelize.STRING,
		creado: Sequelize.DATE,
		activo: Sequelize.BOOLEAN
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
