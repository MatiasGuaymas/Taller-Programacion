{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program ejercicio4;
const
	LIM = 8;
	LIMVEC = 30;
type
	subRubro = 1..LIM;
	producto = record
		cod: integer;
		codRubro: subRubro;
		precio: real;
	end;

	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vec = array[subRubro] of lista;
	
	vecR3 = array[1..LIMVEC] of producto;
	
{procedure leerProducto (var p: producto);
begin
	read(p.cod);
	read(p.codRubro);
	read(p.precio);
end;}

procedure inicializarVector(var v: vec);
var
  i: integer;
begin
  for i:= 1 to LIM do
      v[i]:= nil; 
end;

procedure insertar (var l: lista; p: producto); 
var
	aux, ant, act: lista;
begin
	new(aux); aux^.sig:= nil; aux^.dato:= p;
	if (l= nil) then l:= aux
	else begin
		ant:= l;
		act:= l;
		while (act <> nil) and (act^.dato.cod < aux^.dato.cod) do
			begin
				ant:= act;
				act:= act^.sig;
			end;
		if (l = act) then
			begin
				aux^.sig:= l;
				l:= aux;
			end
		else
			begin
				ant^.sig:= aux;
				aux^.sig:= act;
			end;
	end;
end;

{procedure cargarVector(var v: vec);
var
	p: producto;
begin
	leerProducto(p);
	while(p.precio <> 0) do
		begin
			insertar(v[p.codRubro], p);
		end;
end;}

procedure productoRandom(var p: producto);
begin
    p.cod:=random(200)+1;
    p.codRubro:=random(LIM)+1;
    p.precio:=((random(200)+1)/(random(200)+1));
end;

procedure cargarVector(var v: vec);
var
	p: producto;
    i: integer;
begin
	for i:= 1 to random((50)+1) do
        begin
            productoRandom(p);
            insertar(v[p.codRubro], p);
        end;
end;

procedure mostrar(v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			write(v[i]^.dato.cod);
			write(v[i]^.dato.codRubro);
			write(v[i]^.dato.precio);
		end;
end;	

procedure imprimirLista(L: lista);
begin
  if(L = nil)then
    Writeln('Lista vacia');
  While( L <> nil)do
    begin
      Writeln('Codigo producto = ',L^.dato.cod);
      Writeln('Precio de producto = ',L^.dato.precio:0:2);
      L:= L^.sig;
    end;
end;

procedure imprimirVLista(v: vec);
var
  i: integer;
begin
  for i:= 1 to LIM do
    begin
        writeln('Rubro ', i);
        imprimirLista(v[i]);
        writeln();
    end;
end; 

procedure rubro3(var vector : vecR3; v : vec; var diml : integer);
var
	i : integer;
begin
	i := 0;
	diml := 0;
	while(v[3] <> nil) and (i < 30) do
		begin
			i := i + 1;
			diml := diml + 1;
			vector[i] := v[3]^.dato;
			v[3] := v[3]^.sig;
		end;
end;

procedure seleccion (var v : vecR3; diml : integer);
var
	i, j, pos : integer;
	item : producto;
begin
	for i := 1 to diml - 1 do
		begin
			pos := i;
			for j := i + 1 to diml do
				if (v[j].precio < v[pos].precio) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;

procedure imprimirVectorYaOrdenado(v: vecR3; dimL: integer);
var
  i: integer;
begin
  writeln('Rubro 3:');
  for i:= 1 to dimL do
    begin
      Writeln(i, '. Codigo = ', v[i].cod, ' Precio = ', v[i].precio:0:2);
    end;
end;

function promedios(v : vecR3; diml : integer) : real;
var
	i : integer;
    total: real;
begin
    total:= 0;
	for i := 1 to diml do total := v[i].precio + total;
	promedios := total/diml;
end;
var
	v: vec;
	vR3: vecR3;
	diml: integer;
begin
    Randomize;
	inicializarVector(v);
	cargarVector(v);
	imprimirVLista(v); //Imprime un mensaje de lista vacia, si la categoria no fue usada
	rubro3(vR3, v, diml);
	seleccion(vR3, diml);
	imprimirVectorYaOrdenado(vR3, dimL);
	writeln('Promedio de los precios del vector del rubro 3 = ', promedios(vR3, diml):0:2);
end.
