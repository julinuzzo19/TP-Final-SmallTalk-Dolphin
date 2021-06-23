| menu mercaderia1 mercaderia2 mercaderia3 negocio |

"Creacion del negocio"
negocio:=Negocio crearNegocioNombre: 'FASTFOOD' Direccion: 'Av. San martin 1200' Telefono:'42569212'.

"Creacion de mercaderias"
mercaderia1:= Comida crearComidaId: 1 nombre: 'Pizza Mozzarella' descripcion: 'Pizza con queso mozzarella al horno' precio: 300 Categoria: 'Pizzas'.
mercaderia1 inspect.
mercaderia2:= Bebida crearBebidaId: 2 nombre: 'Cocacola' descripcion: 'Botella de cocacola pequeña' precio: 120 Mililitros: 600.
mercaderia3:= Comida crearComidaId: 3 nombre: 'Ravioles de ricota' descripcion: 'Ravioles de ricota con salsa filetto' precio: 400 Categoria: 'Pastas'.

"Agregar mercaderias al menu del negocio"
negocio agregarMercaderia: mercaderia1.
negocio agregarMercaderia: mercaderia2.
negocio agregarMercaderia: mercaderia3.

negocio inspect.