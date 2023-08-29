const
	LIM = 8;
type
	subGen: 1..LIM;
	pelicula = record
		codPeli = integer;
		codGenero = subGen;
		puntaje = real;
	end;
	
	lista = ^nodo
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vecPelis = array [subGen] of lista;
	
	codProm = record
		codPelicula: integer;
		puntajePromedio: real;
	end;
	
	vecP = array [subGen] of codProm;
	
procedure leer(var p: pelicula);
begin
	read(p.codPeli);
	read(p.codGenero);
	read(p.puntaje);
end;

procedure agregarAtras(var l: lista; p: pelicula);
var
	aux, ult: lista;
begin
	new(aux); aux^.dato:= p; aux^.sig:= nil;
	if(l = nil) then l:= aux
	else begin
		ult:= l;
		while (ult^.sig <> nil) do
			ult:= ult^.sig;
		ult^.sig:= aux;
		end;
end;

procedure inicializarVector(var v: vecPelis);
var
  i: subGen;
begin
  for i:= 1 to LIM do
    v[i]:= nil;
end;

procedure cargarVector(var v: vecPelis);
var
	p: pelicula;
begin
	leer(p);
	while(p.codPeli <> -1) do
		begin
			agregarAtras(v[p.codGenero], p);
		end;
end;

procedure inicializarPromedios(var v : vecP);
var
	i : subGen;
begin
	for i := 1 to LIM do
		begin
			v[i].codPelicula := 0;
			v[i].puntajePromedio := 0;
		end;
end;

procedure vectorPromedios(var vec : vecP; v : vecPelis);
var
	codemax, i : integer;
	aux : real;
begin
	for i := 1 to LIM do
		begin
			aux := 0;
			codemax := 0;
			while(v[i] <> niL) do
				begin
					if(v[i]^.dato.puntaje > aux) then
						aux := v[i]^.dato.puntaje;
						codemax := v[i]^.dato.codPeli;
					v[i] := v[i]^.sig;
				end;
			vec[i].codPelicula := codemax;
			vec[i].puntajePromedio := aux;
		end;
end;


procedure seleccion(var v : vecP);
var
	i, j, pos: integer;
	item : codProm;
begin
	for i := 1 to lim-1 do
		begin
			pos := i;
			j := i + 1;
			for j := 1 to diml	do
				if(v[j].puntajePromedio < v[pos].puntajePromedio) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;

var
	v : vecPelis;
	vp : vecP;
begin
	inicializarVector(v);
	inicializarPromedios(vp);
	cargarVector(v);
	vectorPromedios(vp, v);
	seleccion(vp);
	write(vp[1].codPelicula, vp[LIM].codPelicula);
end.