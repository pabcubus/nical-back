function start(Sequelize, connection) {
	require('../persistence/Pagina').init(Sequelize, connection);
	require('../persistence/Rol').init(Sequelize, connection);
	require('../persistence/Permiso').init(Sequelize, connection);
	require('../persistence/Usuario').init(Sequelize, connection);
	require('../persistence/Tienda').init(Sequelize, connection);
	require('../persistence/Ciudad').init(Sequelize, connection);

	Usuario.belongsTo(Rol);
	Usuario.belongsTo(Tienda);

	Permiso.belongsTo(Pagina);

	Rol.hasMany(Permiso, {as: 'permisos'});

	Tienda.belongsTo(Ciudad);
}

module.exports.start = start;
