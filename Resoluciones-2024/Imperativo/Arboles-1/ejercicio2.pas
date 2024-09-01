{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.}

program ejercicio2;
type
    rangoFecha = 1..31;
    rangoCodigo = 0..100;

    regVenta = record
        codigo: rangoCodigo;
        fecha: rangoFecha;
        cantidad: integer;
    end;
    arbol = ^nodo;
    nodo = record
        dato: regVenta;
        HI: arbol;
        HD: arbol;
    end;

    regProductos = record
        codigo: rangoCodigo;
        cantidad: integer;
    end;
    arbolProductos = ^nodoProductos;
    nodoProductos = record
        dato: regProductos;
        HI: arbolProductos;
        HD: arbolProductos;
    end;

    regLista = record
        fecha: rangoFecha;
        cantidad: integer;
    end;
    lista = ^nodoLista;
    nodoLista = record
        dato: regLista;
        sig: lista;
    end;
    regVentasLista = record
        codigo: rangoCodigo;
        l: lista;
    end;
    arbolVentas = ^nodoVentas;
    nodoVentas = record
        dato: regVentasLista;
        HI: arbolVentas;
        HD: arbolVentas;
    end;
procedure leerVenta(var reg: regVenta);
begin
    reg.codigo:= random(101);
    if (reg.codigo <> 0) then
    begin
        reg.fecha:= random(31)+1;
        reg.cantidad:= random(100)+1;
    end;
end;
procedure insertarVenta(var a: arbol; reg: regVenta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato:= reg;
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else
    begin
        if (reg.codigo < a^.dato.codigo) then
            insertarVenta(a^.HI, reg)
        else
            insertarVenta(a^.HD, reg);
    end;
end;
procedure insertarProductos(var a: arbolProductos; codigo: rangoCodigo; cantidad: integer);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.codigo:= codigo;
        a^.dato.cantidad:= cantidad;
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else
    begin
        if (codigo = a^.dato.codigo) then
            a^.dato.cantidad:= a^.dato.cantidad + cantidad
        else
        if (codigo < a^.dato.codigo) then
            insertarProductos(a^.HI, codigo, cantidad)
        else
            insertarProductos(a^.HD, codigo, cantidad);
    end;
end;
procedure agregarVenta(var l: lista; fecha: rangoFecha; cantidad: integer);
var
    aux: lista;
begin
    new(aux);
    aux^.dato.fecha:= fecha;
    aux^.dato.cantidad:= cantidad;
    aux^.sig:= l;
    l:= aux;
end;
procedure insertarVentas(var a: arbolVentas; reg: regVenta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.codigo:= reg.codigo;
        a^.dato.l:= nil;
        agregarVenta(a^.dato.l, reg.fecha, reg.cantidad);
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else
    begin
        if (reg.codigo = a^.dato.codigo) then
        begin
            agregarVenta(a^.dato.l, reg.fecha, reg.cantidad);
        end
        else
        if (reg.codigo < a^.dato.codigo) then
            insertarVentas(a^.HI, reg)
        else
            insertarVentas(a^.HD, reg);
    end;
end;
procedure cargarArbol(var a: arbol; var arbTotal: arbolProductos; var arbVentas: arbolVentas);
var
    reg: regVenta;
begin
    leerVenta(reg);
    while (reg.codigo <> 0) do
    begin
        insertarVenta(a, reg);
        insertarProductos(arbTotal, reg.codigo, reg.cantidad);
        insertarVentas(arbVentas, reg);
        leerVenta(reg);
    end;
end;
procedure cantidadVentasFecha(a: arbol; fecha: rangoFecha; var cant: integer);
begin
    if (a <> nil) then
    begin
        if (a^.dato.fecha = fecha) then
            cant:= cant + a^.dato.cantidad;
        cantidadVentasFecha(a^.HI, fecha, cant);
        cantidadVentasFecha(a^.HD, fecha, cant);
    end;
end;
procedure maxVentas(a: arbolProductos; var cantMax: integer; var cod: rangoCodigo);
begin
    if (a <> nil) then
    begin
        if (a^.dato.cantidad > cantMax) then
        begin
            cantMax:= a^.dato.cantidad;
            cod:= a^.dato.codigo;
        end;
        maxVentas(a^.HI, cantMax, cod);
        maxVentas(a^.HD, cantMax, cod);
    end;
end;
procedure recorrerListaActualizar(l: lista; codigo: rangoCodigo; var cantMax: integer; var cod: rangoCodigo);
var
    cant: integer;
begin
    cant:= 0;
    while(l<>nil) do
        begin
            cant:= cant + 1;
            l:= l^.sig;
        end;
    if (cant > cantMax) then
    begin
        cantMax:= cant;
        cod:= codigo;
    end;
end;
procedure maxVentasLista(a: arbolVentas; var cantMax: integer; var cod: rangoCodigo);
begin
    if (a <> nil) then
    begin
        recorrerListaActualizar(a^.dato.l, a^.dato.codigo, cantMax, cod);
        maxVentasLista(a^.HI, cantMax, cod);
        maxVentasLista(a^.HD, cantMax, cod);
    end;
end;
procedure imprimirI(a:arbol);
begin 
    if (a<>nil) then 
        begin 
            imprimirI(a^.HI);
            writeln('Codigo=', a^.dato.codigo,' Dia=', a^.dato.fecha,' Cantidad=', a^.dato.cantidad);
            imprimirI(a^.HD);
        end;
end;
procedure imprimirII(a:arbolProductos);
begin 
    if (a<>nil) then 
        begin 
            imprimirII(a^.HI);
            writeln('Codigo=',a^.dato.codigo,' Cantidad=',a^.dato.cantidad);
            imprimirII(a^.HD);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write('Dia=', l^.dato.fecha , ' Cantidad=',l^.dato.cantidad, ' - ');
            l:= l^.sig;
        end;
end;
procedure imprimirNodo(r: regVentasLista);
begin
    write('CODIGO=', r.codigo, ' Lista:');
    imprimirLista(r.l);
    writeln();
end;
procedure imprimirIII(a:arbolVentas);
begin 
    if (a<>nil) then 
        begin 
            imprimirIII(a^.HI);
            imprimirNodo(a^.dato);
            imprimirIII(a^.HD);
        end;
end;
var
    a: arbol;
    arbTotal: arbolProductos;
    arbVentas: arbolVentas;
    fecha: rangoFecha;
    cod: rangoCodigo;
    cant, cantMax: integer;
begin
    randomize;
    a:= nil;
    arbTotal:= nil;
    arbVentas:= nil;
    cargarArbol(a, arbTotal, arbVentas);
    imprimirI(a);
    writeln();
    imprimirII(arbTotal);
    writeln();
    imprimirIII(arbVentas);
    writeln();
    write('Ingrese una fecha: ');
    readln(fecha);
    cant:= 0;
    cantidadVentasFecha(a, fecha, cant);
    writeln('La cantidad total de productos vendidos en la fecha ', fecha, ' es: ', cant);
    cantMax:= -1;
    maxVentas(arbTotal, cantMax, cod);
    writeln('El producto mas vendido es el codigo ', cod, ' con ', cantMax, ' unidades vendidas');
    cantMax:= -1;
    maxVentasLista(arbVentas, cantMax, cod);
    writeln('El producto mas vendido es el codigo ', cod, ' con ', cantMax, ' unidades vendidas');
end.

    
    