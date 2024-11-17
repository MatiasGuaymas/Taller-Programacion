{3.- Implementar un programa que procese las ventas de un supermercado. El supermercado
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas.
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de
producto y retorne la cantidad de unidades vendidas de ese código de producto.}

program ejercicio3;
const 
    cantItems = 10;
type
    tipoitem = record  
        stock:integer;
        precio:real;
    end;

    tipoproducto = record 
        codigo:integer;
        cantidad:integer;
        precio:real;
    end;

    tipoinventario = array [1..cantItems] of tipoitem; 
    
    listaproducto =^ nodoproducto;
    nodoproducto = record 
        sig:listaproducto;
        dato:tipoproducto;
    end;

    tipoticket = record 
        codigo:integer;
        productos:listaproducto;
        total:real;
    end;

    listaticket = ^nodo;
    nodo = record 
        sig:listaticket;
        dato:tipoticket;
    end;

procedure inicializarInventario(var inventario:tipoinventario);
var 
    i:integer;
begin 
    for i:= 1 to cantItems do 
        begin
            inventario[i].stock:=random(99)+1;
            inventario[i].precio:=random(100);
        end;
end;
procedure imprimirInventario (inventario:tipoinventario);
var 
    i:integer;
begin 
    writeln('INVENTARIO:');
    for i:= 1 to cantItems do 
        begin
            writeln('tipoItem ',i,'. Precio=',inventario[i].precio:0:2,' Stock=',inventario[i].stock);
        end;
end;

procedure productoRandom (var producto:tipoproducto;var inventario:tipoinventario);
begin
    producto.codigo:=random(cantItems);
    producto.cantidad:=random(49)+1;
    if (producto.cantidad>inventario[producto.codigo].stock) then 
        begin 
            producto.cantidad:=inventario[producto.codigo].stock;
            inventario[producto.codigo].stock:=0;
        end
    else 
        inventario[producto.codigo].stock:=inventario[producto.codigo].stock-producto.cantidad;
    producto.precio:=inventario[producto.codigo].precio;
end;

procedure agregarProducto (var pri:listaproducto;producto:tipoproducto);
var
    aux:listaproducto;
begin 
    new(aux);
    aux^.dato:=producto;
    aux^.sig:=pri;
    pri:=aux;
end;

procedure agregarTicket (var pri:listaticket;ticket:tipoticket);
var
    aux:listaticket;
begin 
    new(aux);
    aux^.dato:=ticket;
    aux^.sig:=pri;
    pri:=aux;
end;

procedure ticketRandom (var ticket:tipoticket;var inventario:tipoinventario);
var 
    cantProductos,i:integer;
    producto:tipoproducto;
begin 
    ticket.total:=0;
    ticket.codigo:=random(50);
    cantProductos:=random(10);
    ticket.productos:=nil;
    for i:=1 to cantProductos do
        begin 
            productoRandom(producto,inventario);
            ticket.total:=ticket.total+(producto.cantidad*producto.precio);
            agregarProducto(ticket.productos,producto);
        end;
end;

procedure cargarRandom (var pri:listaticket;var inventario:tipoinventario);
var
    cantTickets,i:integer;
    ticket:tipoticket;
begin 
    cantTickets:=2;
    for i:=1 to cantTickets do 
        begin 
            ticketRandom(ticket,inventario);
            agregarTicket(pri,ticket);
        end;
end; 

procedure imprimirProducto (producto:tipoproducto);
begin 
    writeln('Codigo:',producto.codigo,' Cantidad:',producto.cantidad,' Precio:',producto.precio:0:2);
end;

procedure imprimirTicket (ticket:tipoticket);
begin 
    writeln();
    writeln('Ticket numero:',ticket.codigo);
    writeln('Productos comprados:');
    while (ticket.productos<>nil) do
        begin 
            imprimirProducto(ticket.productos^.dato);
            ticket.productos:=ticket.productos^.sig;
        end;
    writeln('Monto total:',ticket.total:0:2);
end;

procedure imprimirTickets (pri:listaticket);
begin 
    while (pri<>nil) do 
        begin 
            writeln();
            imprimirTicket(pri^.dato);
            pri:=pri^.sig;
        end;
end;

procedure itemsVendidos (pri:listaticket;codigo:integer);
var 
    cant:integer;
begin 
    cant:=0;
    while (pri<>nil) do 
        begin
            while (pri^.dato.productos<>nil) do 
                begin
                    if (pri^.dato.productos^.dato.codigo=codigo) then
                        cant:=cant+pri^.dato.productos^.dato.cantidad;
                    pri^.dato.productos:=pri^.dato.productos^.sig;
                end;
            pri:=pri^.sig;
        end;
    writeln('Se vendieron ',cant,' unidades del producto ',codigo,'.');
end;
            
var
    pri:listaticket;
    inventario:tipoinventario;
    codigo:integer;
begin
    pri:=nil;
    Randomize;
    inicializarInventario(inventario);
    imprimirInventario(inventario);
    cargarRandom(pri,inventario);
    imprimirTickets(pri);
    imprimirInventario(inventario);
    writeln();
    writeln('Ingrese un codigo de producto:');
    read(codigo);
    itemsVendidos(pri,codigo);
end.