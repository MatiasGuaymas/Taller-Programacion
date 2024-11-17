{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}

program ejercicio3; 
type
	subRubro = 1..10;
	producto = record
		codigo: integer;
		rubro: subRubro;
		stock: integer;
		precio: real;
	end;
	prodRubro = record
		codigo: integer;
		stock: integer;
		precio: real;
	end;
	arbol = ^nodo;
	nodo = record
		dato: prodRubro;
		hi: arbol;
		hd: arbol;
	end;
	vecArboles = array[subRubro] of arbol;
	prodMaxCode = record
		codigo: integer;
		stock: integer;
	end;
	vecMaxCode = array[subRubro] of prodMaxCode;
	vecCant = array[subRubro] of integer;
procedure inicializarVector(var v: vecArboles);
var
	i: subRubro;
begin
	for i:= 1 to 10 do v[i]:= nil;
end;
procedure leerProducto(var p: producto);
begin
	p.codigo:= Random(30)-1;
	if(p.codigo <> -1) then
		begin
			p.rubro:= Random(10)+1;
			p.stock:= Random(50);
			p.precio:= (Random(20)+1)*p.rubro;
		end;
end;
procedure imprimirProducto(p: producto);
begin
	writeln('CODIGO=', p.codigo, ' RUBRO=',p.rubro, ' STOCK=', p.stock, ' PRECIO=', p.precio:0:2);
end;
procedure cargarArbol(var a: arbol; p: prodRubro);
begin
	if(a = nil) then
		begin
			new(a);
			a^.hi:= nil;
			a^.hd:= nil;
			a^.dato:= p;
		end
	else
		if(p.codigo <= a^.dato.codigo) then
			cargarArbol(a^.hi, p)
		else
			cargarArbol(a^.hd, p);
end;
procedure cargarVector(var v: vecArboles);
var
	p: producto;
	prod: prodRubro;
begin
	leerProducto(p);
	imprimirProducto(p);
	while(p.codigo <> -1 ) do
		begin
			prod.codigo:= p.codigo;
			prod.stock:= p.stock;
			prod.precio:= p.precio;
			cargarArbol(v[p.rubro], prod);
			leerProducto(p);
			imprimirProducto(p);
		end;
end;
procedure imprimirProdArb(p: prodRubro);
begin
	write(' | CODIGO=', p.codigo, ' STOCK=', p.stock, ' PRECIO=', p.precio:0:2);
end;
procedure imprimirArbol(a: arbol);
begin
	if(a<>nil) then
		begin
			imprimirArbol(a^.hi);
			imprimirProdArb(a^.dato);
			imprimirArbol(a^.hd);
		end;
end;
procedure imprimirVector(v: vecArboles);
var
	i: subRubro;
begin
	for i:= 1 to 10 do
		begin
			write(i, '. ');
			imprimirArbol(v[i]);
			writeln();
		end;
end;
procedure buscarProducto(a: arbol; codigo: integer; var ok: boolean);
begin
	if(a<>nil) then
		begin
			if(a^.dato.codigo = codigo) then
				ok:= true
			else
				if(codigo < a^.dato.codigo) then
					buscarProducto(a^.hi, codigo, ok)
				else
					buscarProducto(a^.hd, codigo, ok);
		end;
end;

function existeProducto(v: vecArboles; rubro: subRubro; codigo: integer): boolean;
var
	ok: boolean;
begin
	ok:= false;
	buscarProducto(v[rubro], codigo, ok);
	existeProducto:= ok;
end;

procedure obtenerProdMaxCode(a: arbol; var p: prodMaxCode);
begin
	if(a<>nil) then
		begin
			p.codigo:= a^.dato.codigo;
			p.stock:= a^.dato.stock;
			obtenerProdMaxCode(a^.hd, p);
		end;
end;

procedure obtenerRubroMaximos(v: vecArboles; var vecMax: vecMaxCode);
var
	i: subRubro;
	p: prodMaxCode;
begin
	for i:= 1 to 10 do 
		begin
			p.codigo:= -1;
			p.stock:= 0;
			obtenerProdMaxCode(v[i], p);
			vecMax[i]:= p;
		end;
end;

procedure imprimirVecMax(v: vecMaxCode);
var
	i: subRubro;
begin
	for i:= 1 to 10 do
		begin
			if(v[i].codigo <> -1) then
				writeln(i, '. CODIGO=', v[i].codigo, ' STOCK=', v[i].stock)
			else
				writeln(i, '. No habia productos para analizar en este rubro');
		end;
end;

procedure inicializarVectorCant(var v: vecCant);
var
	i: subRubro;
begin
	for i:= 1 to 10 do v[i]:= 0;
end;

procedure verificar(var num1, num2: integer);
var
	aux: integer;
begin
	if(num1 > num2) then
		begin
			aux:= num1;
			num1:= num2;
			num2:= aux;
		end;
end;

procedure entreDosValoresArb(a: arbol; var cant: integer; codigo1, codigo2: integer);
begin
	if(a<>nil) then
		begin
			if(a^.dato.codigo >= codigo1) and (a^.dato.codigo <= codigo2) then
				begin
					cant:= cant+1;
					entreDosValoresArb(a^.hi, cant, codigo1, codigo2);
					entreDosValoresArb(a^.hd, cant, codigo1, codigo2);
				end
			else
				if(a^.dato.codigo > codigo1) then
					entreDosValoresArb(a^.hi, cant, codigo1, codigo2)
				else
					entreDosValoresArb(a^.hd, cant, codigo1, codigo2);
		end;
end;

procedure entreDosValoresVecArb(v: vecArboles; var vecCant: vecCant; codigo1, codigo2: integer);
var
	cant: integer;
	i: subRubro;
begin
	for i:= 1 to 10 do
		begin
			cant:= 0;
			entreDosValoresArb(v[i], cant, codigo1, codigo2);
			vecCant[i]:= cant;
		end;
end;

procedure imprimirVecCant(v: vecCant);
var
	i: subRubro;
begin
	for i:= 1 to 10 do
		begin
			writeln(i, '. CANTIDAD=', v[i]);
		end;
end;

var
	v: vecArboles;
	vecMax: vecMaxCode;
	vecCantidades: vecCant;
	rubro: subRubro;
	codigo, codigo1, codigo2: integer;
begin
	Randomize;
	inicializarVector(v);
	cargarVector(v);

	writeln('----------------');
	imprimirVector(v);

	writeln('----------------');
	writeln('Ingrese un rubro'); //Se supone que el usuario ingresa un numero mayor o igual a 1 y menor o igual a 10
	readln(rubro);
	writeln('Ingrese un codigo de producto');
	readln(codigo);
	if(existeProducto(v, rubro, codigo)) then writeln('Existe el producto con el rubro ', rubro, ' y codigo ', codigo) else writeln('No existe el producto con el rubro ', rubro, ' y codigo ', codigo);

	writeln('----------------');
	obtenerRubroMaximos(v, vecMax);
	imprimirVecMax(vecMax);

	writeln('----------------');
	inicializarVectorCant(vecCantidades);
	writeln('Ingrese un codigo');
	readln(codigo1);
	writeln('Ingrese otro codigo');
	readln(codigo2);
	verificar(codigo1, codigo2);
	entreDosValoresVecArb(v, vecCantidades, codigo1, codigo2);
	writeln('----------------');
	imprimirVecCant(vecCantidades);
end.