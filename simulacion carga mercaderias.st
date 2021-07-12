| tipo |
nombreNegocio := Prompter prompt: 'Ingrese el nombre del negocio'.
dir := Prompter prompt: 'Ingrese la direccion del negocio'.
tel := Prompter prompt: 'Ingrese el telefono del negocio'.
negocioSim := Negocio
			crearNegocioNombre: nombreNegocio
			Direccion: dir
			Telefono: tel.
[tipo ~= '0'] whileTrue: 
		[tipo := Prompter prompt: 'Ingrese 1 si es bebida, 2 si es comida o 0 para terminar.'.
		tipo = '1'
			ifTrue: 
				[id := Prompter prompt: 'Ingrese el identificador de la mercaderia'.
				nombre := Prompter prompt: 'Ingrese el nombre de la bebida'.
				desc := Prompter prompt: 'Ingrese la descripcion la bebida'.
				precio := Prompter prompt: 'Ingrese el precio la bebida'.
				mililitros := Prompter prompt: 'Ingrese los mililitros la bebida'.
				bebida := Bebida
							crearBebidaId: id
							nombre: nombre
							descripcion: desc
							precio: precio
							Mililitros: mililitros.
				negocioSim agregarMercaderia: bebida].
		tipo = '2'
			ifTrue: 
				[id := Prompter prompt: 'Ingrese el identificador de la mercaderia'.
				nombre := Prompter prompt: 'Ingrese el nombre de la comida'.
				desc := Prompter prompt: 'Ingrese la descripcion de la comida'.
				precio := Prompter prompt: 'Ingrese el precio de la comida'.
				categoria := Prompter prompt: 'Ingrese la categoria de la comida'.
				comida := Comida
							crearComidaId: id
							nombre: nombre
							descripcion: desc
							precio: precio
							categoria: categoria.
				negocioSim agregarMercaderia: comida]].
negocioSim inspect