| mercaderia1 mercaderia2 mercaderia3 negocio pedido1 |
negocio := Negocio
			crearNegocioNombre: 'FASTFOOD'
			Direccion: 'Av. San martin 1200'
			Telefono: '42569212'.
"Creacion de mercaderias"
mercaderia1 := Comida
			crearComidaId: 1
			nombre: 'Pizza Mozzarella'
			descripcion: 'Pizza con queso mozzarella al horno'
			precio: 300
			categoria: 'Pizzas'.
mercaderia2 := Bebida
			crearBebidaId: 2
			nombre: 'Cocacola'
			descripcion: 'Botella de cocacola pequeña'
			precio: 120
			Mililitros: 600.
mercaderia3 := Comida
			crearComidaId: 3
			nombre: 'Ravioles de ricota'
			descripcion: 'Ravioles de ricota con salsa filetto'
			precio: 400
			categoria: 'Pastas'.

"Agregar mercaderias al menu del negocio"
negocio agregarMercaderia: mercaderia1.
negocio agregarMercaderia: mercaderia2.
negocio agregarMercaderia: mercaderia3.


"Seleccionar mercaderias de menu y crear pedido"
lista := OrderedCollection new.
lista add: mercaderia1.
lista add: mercaderia2.
pedido1 := Pedido crearPedidoNumero: 1 Mercaderias: lista.
negocio guardarPedido: pedido1.
negocio inspect.
Inspector Transcript show.

"Cómo mostrar cosas por consolita:"
Transcript clear.
Transcript show: 'Hola, el negocio se llama: '.
Transcript
	show: negocio verNombre;
	cr.
Transcript show: 'Cantidad de pedidos: '.
Transcript
	show: negocio verPedidos size printString;
	cr.

"Bucle para crear negocio y agregarle mercaderias al menu"
nombreNegocio := Prompter prompt: 'Ingrese el nombre del negocio'.
dir := Prompter prompt: 'Ingrese la direccion del negocio'.
tel := Prompter prompt: 'Ingrese el telefono del negocio'.
negocio := Negocio
			crearNegocioNombre: nombreNegocio
			Direccion: dir
			Telefono: tel.
1 to: 2
	do: 
		[:i |
		tipo := Prompter prompt: 'Ingrese 1 si es bebida o 2 si es comida'.
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
				negocio agregarMercaderia: bebida]
			ifFalse: 
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
				negocio agregarMercaderia: comida]].
negocio inspect