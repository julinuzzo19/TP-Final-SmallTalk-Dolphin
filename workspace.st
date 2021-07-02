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



lista:=OrderedCollection new.
lista add: mercaderia1.
lista add: mercaderia2.
pedido1:= Pedido crearPedidoNumero: 1 Mercaderias:lista.

"pedido1 verPrecioTotal: lista."

negocio guardarPedido: pedido1.

negocio inspect.

"Cómo mostrar cosas por consolita:"
Transcript show.
Transcript clear.
Transcript show: 'Hola, el negocio se llama: '.
Transcript show: negocio verNombre; cr.
Transcript show: 'Cantidad de pedidos: '.
Transcript show: negocio verPedidos size printString; cr