function get() {
	usuario = {
		'title': 'Usuario Schema',
		'type': 'object',
		'properties': {
			'nombre': { 'type': 'string' },
			'apellido': { 'type': 'string' },
			'username': { 'type': 'string' },
			'password': { 'type': 'string' },
			'email': { 'type': 'string' },
			'rolId': {
				'type': 'integer',
				'minimum': 0
			}
		},
		'required': ['nombre', 'apellido', 'username', 'password', 'email', 'rolId']
	};

	return usuario;
}

module.exports.get = get;
