program ejercicio4;
const
	LIM = 8;
	LIMVEC = 30;
type
	subRubro: 1..LIM;
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
	
procedure leerProducto (var p: producto);
begin
	read(p.cod);
	read(p.codRubro);
	read(p.precio);
end;

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
			aux^.sig:= l;
			l:= aux
		else
			begin
				ant^.sig:= aux;
				aux^.sig:= act;
			end;
end;

procedure cargarVector(var v: vec);
var
	p: producto;
begin
	leer(p);
	while(p.precio <> 0) do
		begin
			insertar(v[p.codRubro], p);
		end;
end;

procedure mostrar(v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			write(v[i]^.dato.code);
			write(v[i]^.dato.coderubro);
			write(v[i]^.dato.precio);
		end;
end;	

{
procedure imprimirLista(L: lista);
begin
  if(L = nil)then
    Writeln('Lista vacia');
  While( L <> nil)do
    begin
      Writeln('Cod producto ',L^.dato.codProducto);
      Writeln('Cod de rubro ',L^.dato.codRubro);
      Writeln('Precio de producto ',L^.dato.precio);
      L:= L^.sig;
    end;
end;

procedure imprimirVLista(v: vProductos);
var
  i: integer;
begin
  for i:= 1 to dimF8 do
    begin
      imprimirLista(v[i]);
    end;
end; 
}

procedure rubro3(var vector : vecR3; v : vec; var diml : integer;);
var
	i : integer;
	aux : lista;
begin
	i := 0;
	diml := 0;
	while(v[3] <> nil) and (i < 30) do
		begin
			i := i + 1;
			diml := diml + 1;
			vector[i] := v[3]^.producto;
			v[3] := v[3]^.sig;
		end;
end;

{Cargo mi vector con los productos de una Lista, corta por 2 cuestiones llegue al final de la lista o llegue a mi tope de 30, mantengo una dimL para saber hasta donde se cargo.
procedure cargarVectorNuevoCat3(L: lista;var vCat3: vecR3; var dimL: integer);
begin
  dimL:= 0;
  While(L <> nil) and (dimL < dimF30) do
    begin
      dimL:= dimL+1;
      vCat3[dimL]:= L^.dato;
      L:= L^.sig;
    end;
end;
}

procedure seleccion (var v : vecR3; diml : integer);
var
	i, j, pos : integer;
	item : producto;
begin
	for i := 1 to diml - 1 do
		begin
			pos := i;
			j := i + 1
			for j := 1 to diml do
				if (v[j] < v[pos]) then
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
  for i:= 1 to dimL do
    begin
      Writeln('El precio del campo precio',i, ' es: ',v[i].precio);
    end;
end;

function promedios(v : vecR3; diml : integer) : real;
var
	total, i : integer;
begin
	for i := 1 to diml do
			total := v[i].precio + total;
	promedios := total/diml;
end;

var
	v: vec;
	vR3: vecR3;
	diml: integer;
begin
	inicializarVector(v);
	cargarVector(v);
	//mostrar(v);
	//imprimirVLista(v); Imprime un mensaje de lista vacia, si la categoria no fue usada
	rubro3(vector, vec, diml);
	seleccion(vector, diml);
	imprimirVectorYaOrdenado(vector, dimL);
	write(promedios(vector, diml));
end; 
