Transcript clear.
|miNegocio|
miNegocio := Negocio
			crearNegocioNombre: 'FASTFOOD'
			Direccion: 'Av. San martin 1200'
			Telefono: '42569212'.	"Crear negocio"
"Crear mercaderías"
m1 := Comida
			crearComidaId: '1'
			nombre: 'Pizza Mozzarella'
			descripcion: 'Pizza con queso mozzarella al horno'
			precio: 350
			categoria: 'Pizzas'.
m2 := Bebida
			crearBebidaId: '2'
			nombre: 'Cocacola'
			descripcion: 'Botella de cocacola pequeña'
			precio: 120
			Mililitros: 600.
m3 := Comida
			crearComidaId: '3'
			nombre: 'Ravioles de ricota'
			descripcion: 'Ravioles de ricota con salsa filetto'
			precio: 600
			categoria: 'Pastas'.
m4 := Bebida
			crearBebidaId: '4'
			nombre: 'Sprite'
			descripcion: 'Botella grande'
			precio: 200
			Mililitros: 2000.
"Agregar mercaderias al menu del negocio"
miNegocio agregarMercaderia: m1.
miNegocio agregarMercaderia: m2.
miNegocio agregarMercaderia: m3.
miNegocio agregarMercaderia: m4.

| continuar |
"Opciones del negocio"
continuar := true.
[continuar] whileTrue: 
		[| opcion |
		opcion :=
			Prompter prompt: 'Elija que quiere hacer: 1.-Tomar pedido, 2.-Ver Pedidos, 3.-Salir'
			caption: 'Opciones del negocio ' , miNegocio verNombre printString.
		(opcion = '3') ifTrue: [continuar = false]].


"Tomar un pedido"
mercaderias := (Prompter prompt: 'Ingresa los números de mercaderías' caption: 'Ingresa tu pedido')
			subStrings.
unPedido := Pedido crearPedidoNumero: miNegocio verContadorPedidos Mercaderias: mercaderias.
valido := unPedido validar: miNegocio verMenu.
valido
	ifFalse: 
		[MessageBox notify: 'Tu pedido no se realizará, porque las maercaderias no son correctas'
			caption: 'Error en tu pedido']
	ifTrue: 
		[unPedido calcularPrecioTotal: miNegocio verMenu.
		miNegocio cobrarPedido: unPedido.
		MessageBox notify: 'Tu pedido fue cobrado' caption: 'Pedido exitoso'].
miNegocio inspect