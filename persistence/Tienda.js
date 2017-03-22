function init(Sequelize, connection) {
	Tienda = connection.define('tienda', {
		ciudadId: Sequelize.BIGINT,
		codigo: Sequelize.STRING,
		nombre: Sequelize.STRING,
		presupuesto_tope: Sequelize.BIGINT,
		presupuesto_global: Sequelize.BIGINT,
		creado: Sequelize.DATE,
		activo: Sequelize.BOOLEAN
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
