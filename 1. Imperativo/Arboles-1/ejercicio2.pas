{2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.}

program ejercicio2;
type
    subDia = 1..31;
    venta = record
        codigo: integer;
        fecha: subDia;
        cantVendidos: integer;
    end;
    arbol1 = ^nodoV;
    nodoV = record
        dato: venta;
        hi: arbol1;
        hd: arbol1;
    end;
    producto = record
        codigoP: integer;
        cantProdVendidos: integer;
    end;
    arbol2 = ^nodoP;
    nodoP = record
        dato: producto;
        hi: arbol2;
        hd: arbol2;
    end;
procedure inicializarArboles(var a1: arbol1; var a2: arbol2);
begin
    a1:= nil;
    a2:= nil;
end;

procedure agregarA1(var a: arbol1; v: venta);
begin
    if(a = nil) then
        begin
            new(a);
            a^.dato:= v;
            a^.hi:= nil;
            a^.hd:= nil;
        end
    else
    begin
        if(v.codigo <= a^.dato.codigo) then
            agregarA1(a^.hi, v)
        else
            agregarA1(a^.hd, v);
    end;
end;

procedure agregarA2(var a: arbol2; p: producto);
begin
    if(a = nil) then
        begin
            new(a);
            a^.dato:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
    else
    begin
        if(p.codigoP = a^.dato.codigoP) then	
			a^.dato.cantProdVendidos := a^.dato.cantProdVendidos + p.cantProdVendidos
		else
			if(p.codigoP <= a^.dato.codigoP)then
				agregarA2(a^.hi,p)
			else
				agregarA2(a^.hd,p);
			end;
    end;

{procedure leerVenta(var v: venta);
var
    f: fecha;
begin
    read(v.codigo);
    read(v.fecha.dia);
    read(v.fecha.mes);
    read(v.fecha.anio);
    read(v.cantVendidos);
end;
    
procedure leerTodo(var a0: arbol; var a1: arbol2);
var
    v: venta;
    p: producto;
begin
    leerVenta(v);
    while(v.codigo <> 0) do
        begin
            cargarArbol(a0, v);
            p.codigoP:= v.codigo;
            p.cantProdVendidos:= v.cantVendidos;
            cargarArbol2(a1, p);
            leerVenta(v);
        end;
end;}

procedure imprimirI(arbol:arbol1);
begin 
    if (arbol<>nil) then 
        begin 
            imprimirI(arbol^.hi);
            writeln('Codigo=',arbol^.dato.codigo,' Dia=',arbol^.dato.fecha,' Cantidad=',arbol^.dato.cantVendidos);
            imprimirI(arbol^.hd);
        end;
end;

procedure imprimirII(arbol:arbol2);
begin 
    if (arbol<>nil) then 
        begin 
            imprimirII(arbol^.hi);
            writeln('Codigo=',arbol^.dato.codigoP,' Cantidad=',arbol^.dato.cantProdVendidos);
            imprimirII(arbol^.hd);
        end;
end;

procedure cargarArboles(var a1: arbol1; var a2: arbol2);
var
    i: integer;
    v: venta;
    p: producto;
begin
    for i:= 1 to Random(10)+5 do
        begin
            v.codigo:= Random(100)+1;
            v.fecha:= Random(31)+1;
            v.cantVendidos:= Random(10)+1;
            agregarA1(a1, v);
            p.codigoP:= v.codigo;
            p.cantProdVendidos:= v.cantVendidos;
            agregarA2(a2, p);
        end;
end;

procedure cantidadProductosI(arbol:arbol1;codigo:integer;var cantidad:integer);
begin 
    if (arbol<>nil) then 
        begin
            if (arbol^.dato.codigo=codigo) then 
                cantidad:=cantidad+arbol^.dato.cantVendidos;
            if (codigo<=arbol^.dato.codigo) then
                cantidadProductosI(arbol^.HI,codigo,cantidad)
            else
                cantidadProductosI(arbol^.HD,codigo,cantidad);
        end;
end;
    
procedure cantidadProductosII(arbol:arbol2;codigo:integer;var cantidad:integer);
begin 
    if (arbol<>nil) then 
        begin
            if (arbol^.dato.codigoP=codigo) then 
                cantidad:=arbol^.dato.cantProdVendidos
            else 
                if (codigo<arbol^.dato.codigoP) then
                    cantidadProductosII(arbol^.HI,codigo,cantidad)
                else
                    cantidadProductosII(arbol^.HD,codigo,cantidad);
        end;
end;

var
    a1: arbol1;
    a2: arbol2;
    codBuscado, cantVendida, cantVendida1: integer;
begin
    Randomize;
    inicializarArboles(a1, a2);
    cargarArboles(a1, a2); //A

    writeln('-------------------');
    writeln('Arbol 1: ');
    imprimirI(a1);

    writeln('-------------------');
    writeln('Arbol 2: ');
    imprimirII(a2);

    writeln('-------------------');
    writeln('Ingrese un codigo de producto: ');
    readln(codBuscado);
    cantVendida:= 0;
    cantidadProductosI(a1, codBuscado, cantVendida); //B
    writeln('La cantidad de unidades vendidas del producto con codigo ', codBuscado ,' es: ', cantVendida);

    writeln('-------------------');
    writeln('Ingrese otro codigo de producto: ');
    readln(codBuscado);
    cantVendida:= 0;
    cantidadProductosII(a2, codBuscado, cantVendida); //C
    writeln('La cantidad de unidades vendidas del producto con codigo ', codBuscado ,' es: ', cantVendida);
end.