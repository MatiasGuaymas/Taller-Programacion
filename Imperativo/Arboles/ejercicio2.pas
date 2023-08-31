{ EJERCICIO2
2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
1TALLER DE PROGRAMACIÓN – Módulo Imperativo 2023
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
}

program ejercicio2;
type

    fecha1 = record 
        dia: integer;
        mes: integer;
        anio: integer;
    end;    

    venta = record
        codigo: integer;
        fecha: fecha1;
        cantVendidos: integer;
    end;

    arbol = ^nodoV;
    nodoV = record
        dato: venta;
        hi: arbol;
        hd: arbol;
    end;

    producto = record
        codigoP: integer;
        cantProdVendidos: integer;

    arbol2 = ^nodoP;
    nodoP = record
        dato: producto;
        hi: arbol2;
        hd: arbol2;
    end;

procedure inicializarArboles(var a0: arbol; var a1: arbol2);
begin
    a0:= nil;
    a1:= nil;
end;

procedure leerVenta(var v: venta);
var
    f: fecha;
begin
    read(v.codigo);
    read(v.fecha.dia);
    read(v.fecha.mes);
    read(v.fecha.anio);
    read(v.cantVendidos);
end;

procedure cargarArbol(var a: arbol; v: venta);
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
        if(v.codigo < a^.dato.codigo) then
            cargarArbol(a^.hi, v)
        else
            cargarArbol(a^.hd, v);
    end;
end;

procedure cargarArbol2(var a0: arbol; p: producto);
begin
    if(a0 = nil) then
        begin
            new(a0);
            a0^.dato:= p;
            a0^.hi:= nil;
            a0^.hd:= nil;
        end
    else
    begin
        if(p.codigoP = a0^.dato.codigoP)then	//si estas aca ya tiene un X en la cantidadVendidaTotal
				a0^.dato.cantProdVendidos := a0^.dato.cantProdVendidos + p.cantProdVendidos
			else
				begin
					if(p.codigoP < a0^.dato.codigoP)then
						cargarArbol1(a0^.hi,p)
					else
						cargarArbol1(a0^.hd,p);
				end;
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
end;

procedure informarCantUniVendidas(a0: arbol; codBuscado: integer; var cantVendida0: integer);
begin
	if(a0 = nil)then
		begin	
			cantVendida0:= 0; //ya estaria en 0
		end
	else
		begin
			if(a0^.dato.codigo = codBuscado)then
				cantVendida0:= cantVendida0 + a0^.dato.cantVendidos
			else
				begin
					if(codBuscado < a0^.dato.codigo)then
						informarCantUniVendidas(a0^.hi,codBuscado,cantVendida0)
					else
						informarCantUniVendidas(a0^.hd,codBuscado,cantVendida0);
				end;
		end;
end;

//falta c.

var
    a: arbol;
    a1: arbol2;
    codBuscado0, cantVendida0, cantVendida1: integer;
begin
    inicializarArboles(a, a1);
    leerTodo(a, a1);
    read(codBuscado0);
    cantVendida0:= 0;
    informarCantUniVendidas(a, codBuscado0, cantVendida0);
    write(cantVendida0);
end.