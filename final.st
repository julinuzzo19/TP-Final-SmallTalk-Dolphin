Transcript clear.
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

"Opciones del negocio"
continuar := true.
[continuar] whileTrue: 
		[| opcion |
		opcion := Prompter
					prompt: 'Elija que quiere hacer: 1.-Tomar pedido, 2.-Ver Pedidos, 3.-Ver Estadísticas, 4.-Salir'
					caption: 'Opciones del negocio ' , miNegocio verNombre printString.
		opcion = '1'
			ifTrue: 
				["Tomar un pedido"
				mercaderias := (Prompter prompt: 'Ingresa los números de mercaderías' caption: 'Ingresa tu pedido')
							subStrings.
				unPedido := Pedido crearPedidoNumero: miNegocio verContadorPedidos Mercaderias: mercaderias.
				valido := unPedido validar: miNegocio verMenu.
				valido
					ifFalse: 
						[MessageBox notify: 'Tu pedido no se realizará, porque las marcaderias no son correctas'
							caption: 'Error en tu pedido']
					ifTrue: 
						[unPedido calcularPrecioTotal: miNegocio verMenu.
						miNegocio cobrarPedido: unPedido.
						"unPedido verMercaderias inspect."
						MessageBox
							notify: 'Detalles del pedido:' , Character cr , 'Nro.:' , unPedido verNumero printString
									, '  Total $' , unPedido verPrecioTotal printString
							caption: 'Pedido exitoso']].
		opcion = '2'
			ifTrue: 
				["Mostrar los pedidos"
				n := miNegocio verPedidos size.
				mensaje := ''.
				n = 0
					ifFalse: 
						[mensaje := 'El total de pedidos es:' , n printString , Character cr.
						ped := miNegocio buscarPedidoPorNumero: n.
						mensaje := mensaje , 'El último pedido es:' , Character cr.
						mensaje := mensaje , 'Nro.: ' , ped verNumero printString , '  a las ' , ped verHora printString
									, 'hs  $' , ped verPrecioTotal printString]
					ifTrue: [mensaje := 'No hay pedidos todavía'].
				MessageBox notify: mensaje caption: 'Viendo los Pedidos'].
		opcion = '3'
			ifTrue: 
				["Mostrar estadísticas"
				Transcript show.
				Transcript
					cr;
					cr.
				Transcript
					show: 'Estadística de día: ' , Date today printString , ' a las ' , Time now printString;
					cr.
				Transcript
					show: 'Contador de Pedidos: ' , miNegocio verContadorPedidos printString;
					cr.
				Transcript
					show: 'Total de pedidos: ' , miNegocio verPedidos size printString;
					cr.
				Transcript
					show: 'Total recaudado $' , miNegocio verRecaudacion printString;
					cr.
				pedidosMayoresA := miNegocio verPedidosMayoresA: 600.
				Transcript
					show: 'Total pedidos mayores a $600: ' , pedidosMayoresA size printString;
					cr.
				(miNegocio verMercaderiaTipo: 'Comida') inspect.
				pedidosM600 inspect.
				miNegocio verOcurrenciasMercaderia inspect.
				miNegocio verCategoriasComidas inspect.
				miNegocio ordenarMercaderiasPorMayorPrecio inspect].
		opcion = '4' ifTrue: [continuar := false]].
miNegocio inspect