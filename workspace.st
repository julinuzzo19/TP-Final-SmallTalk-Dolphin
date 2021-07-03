"-----------------------Bucle para crear negocio y agregarle mercaderias al menu------------------------
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
negocioSim inspect.

------------------------------------------------------------------------------------------------------------------"
"Creacion de mercaderias"
negocio := Negocio
			crearNegocioNombre: 'FASTFOOD'
			Direccion: 'Av. San martin 1200'
			Telefono: '42569212'.
mercaderia1 := Comida
			crearComidaId: 1
			nombre: 'Pizza Mozzarella'
			descripcion: 'Pizza con queso mozzarella al horno'
			precio: 350
			categoria: 'Pizzas'.
mercaderia2 := Bebida
			crearBebidaId: 2
			nombre: 'Cocacola'
			descripcion: 'Botella de cocacola pequeña'
			precio: 1220
			Mililitros: 600.
mercaderia3 := Comida
			crearComidaId: 3
			nombre: 'Ravioles de ricota'
			descripcion: 'Ravioles de ricota con salsa filetto'
			precio: 600
			categoria: 'Pastas'.

"Agregar mercaderias al menu del negocio"
negocio agregarMercaderia: mercaderia1.
negocio agregarMercaderia: mercaderia2.
negocio agregarMercaderia: mercaderia3.


"Seleccionar mercaderias de menu y crear pedido"
lista := OrderedCollection new.
lista2 := OrderedCollection new.
lista3 := OrderedCollection new.
lista add: mercaderia1.
lista add: mercaderia2.
lista add: mercaderia3.
lista2 add: mercaderia2.
lista3 add: mercaderia1.
lista3 add: mercaderia2.
pedido1 := Pedido crearPedidoNumero: 1 Mercaderias: lista.
pedido2 := Pedido crearPedidoNumero: 2 Mercaderias: lista2.
pedido3 := Pedido crearPedidoNumero: 3 Mercaderias: lista3.
negocio guardarPedido: pedido1.
negocio guardarPedido: pedido2.
negocio guardarPedido: pedido3.
negocio inspect.

"Sort"
negocio ordenarMercaderiasPorMayorPrecio inspect.

"Diccionario"
negocio verOcurrenciasMercaderia inspect.

"Reject obtener mercaderias por tipo"
(negocio verMercaderiaTipo: 'Bebida') inspect.

"Select Pedidos mayores a $500"
(negocio verPedidosMayoresA: 500) inspect.

"Collect"

"Detect"



"Cómo mostrar cosas por consolita:"
Transcript show: 'Hola, el negocio se llama: '.
Transcript
	show: negocio verNombre;
	cr.
Transcript show: 'Cantidad de pedidos: '.
Transcript
	show: negocio verPedidos size printString;
	cr