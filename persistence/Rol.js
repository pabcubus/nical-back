function init(Sequelize, connection){
	Rol = connection.define('rol', {
		nombre: Sequelize.BIGINT,
		codigo: Sequelize.BIGINT,
		descripcion: Sequelize.BIGINT,
		activo: Sequelize.BOOLEAN,
		creado: Sequelize.DATE
	}, {
		freezeTableName: true,
	});
}

module.exports.init = init;
