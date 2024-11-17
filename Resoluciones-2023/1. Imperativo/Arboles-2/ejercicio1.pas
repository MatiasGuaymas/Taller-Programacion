{1. Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}

program ejercicio1;
type
    producto = record
        codigo: integer;
        cantidad: integer;
        total: real;
    end;
    venta = record
        codigo: integer;
        cantidad: integer;
        precio: real;
    end;
    arbol = ^nodo;
    nodo = record
        dato: producto;
        hi: arbol;
        hd: arbol;
    end;
procedure agregarVenta(var a: arbol; v: venta);
var
    p: producto;
begin
    if(a=nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            p.codigo:= v.codigo;
            p.cantidad:= v.cantidad;
            p.total:= v.precio*v.cantidad;
            a^.dato:= p;
        end
    else
        if(a^.dato.codigo = v.codigo) then
            begin
                a^.dato.cantidad:= a^.dato.cantidad + v.cantidad;
                a^.dato.total:= a^.dato.total + (v.precio*v.cantidad);
            end
        else
            if(v.codigo < a^.dato.codigo) then
                agregarVenta(a^.hi, v)
            else
                agregarVenta(a^.hd, v);
end;
procedure cargarArbol(var a: arbol);
var
    i: integer;
    v: venta;
begin
    for i:= 1 to Random(12)+3 do //Leer previamente el registro venta y con un while verificar que ese codigo sea <> -1
        begin
            {write('Venta ', i, ': ');
            writeln('Codigo=', v.codigo,' Cantidad=',v.cantidad,' Precio=',v.precio:0:2);}
            v.codigo:= random(20)+1;
            v.cantidad:= random(30)+1;
            v.precio:= v.cantidad * (random(5)+1);
            agregarVenta(a, v);
        end;
end;
procedure imprimirProducto(p: producto);
begin
    writeln('Codigo=', p.codigo,' Cantidad=',p.cantidad,' Total=',p.total:0:2);
end;
procedure imprimirArbol(a: arbol);
begin
    if (a<>nil) then 
        begin
            imprimirArbol(a^.hi);
            imprimirProducto(a^.dato);
            imprimirArbol(a^.hd);
        end;
end;
procedure maxVendidos(a: arbol; var max, codMax:integer);
begin 
    if (a <> nil) then 
        begin 
            if (a^.dato.cantidad > max) then 
                begin
                    max:= a^.dato.cantidad;
                    codMax:= a^.dato.codigo;
                end;
            maxVendidos(a^.hi,max, codMax);
            maxVendidos(a^.hd,max, codMax);
        end;
end;
function cantMenores(a: arbol; code: integer): integer;
begin
    if(a = nil) then
        cantMenores:= 0
    else
        begin
            if(a^.dato.codigo < code) then
                cantMenores:= cantMenores(a^.hi, code)+ cantMenores(a^.hd, code) + 1
            else
                cantMenores:= cantMenores(a^.hi, code);
        end;
end;
function dosvalores(num1, num2, dato : integer) : boolean;
begin
	if(dato > num1) and (dato < num2) then
		dosvalores := true
	else
		dosvalores := false;
end;
function entredosvalores(a : arbol; num1, num2: integer): real;
begin
	if(a = nil) then 
		entredosvalores:= 0
	else
		begin
			if(dosvalores(num1, num2, a^.dato.codigo)) then
				entredosvalores := entredosvalores(a^.hi, num1, num2) + entredosvalores(a^.hd, num1, num2) + a^.dato.total
            else
                if(a^.dato.codigo > num1) then
                    entredosvalores:= entredosvalores(a^.hi, num1, num2)
                else
                    entredosvalores:= entredosvalores(a^.hd, num1, num2);
		end;
end;
procedure verificar(var num1, num2: integer);
var
    aux: integer;
begin
    if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := aux;
		end;
end;
var
    a: arbol;
    max, codeMax, code, num1, num2: integer;
begin
    Randomize;
    a:= nil;
    cargarArbol(a); //A

    imprimirArbol(a); //B

    writeln('-----------------------');
    codeMax:= 0;
    max:= -1;
    maxVendidos(a, max, codeMax); //C
    writeln('El codigo de producto con mayor cantidad de unidades vendidas es: ', codeMax);

    writeln('-----------------------');
    writeln('Ingrese un codigo de producto: ');
    readln(code);
    writeln('La cantidad de codigos menores a ', code, ' es: ', cantMenores(a, code)); //D

    writeln('-----------------------');
	writeln('Ingrese un primer codigo de producto como limite izquierdo: ');
	readln(num1);
	writeln('Ingrese un segundo numero de socio como limite derecho: ');
	readln(num2);
    verificar(num1, num2);
	writeln('El monto total entre esos dos codigos de productos es: ', entredosvalores(a, num1, num2):0:2); //E
end.