function init(Sequelize, connection){
	Pagina = connection.define('pagina', {
		nombre: Sequelize.BIGINT,
		activo: Sequelize.BOOLEAN,
		creado: Sequelize.DATE
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
