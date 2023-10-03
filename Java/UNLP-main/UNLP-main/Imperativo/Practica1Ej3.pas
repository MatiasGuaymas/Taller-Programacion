program ej3;
const
	lim = 8;
type

	gen = 1..lim;

	pelicula = record
		code : integer;
		gen : gen;
		puntaje : real;
		end;
	
	lis = ^nodo;
	
	nodo = record
		p : pelicula;
		sig : lis;
		end;
		
		
	codigoprom = record
		codigo : integer;
		puntate : real;
		end;
		
	vec = array[gen] of lis;
	
	vecp = array[gen] of codigoprom;
	
procedure leer(var p : pelicula);
begin
	writeln('ingrese codigo');
	read(p.code);
	writeln('ingrese genero');
	read(p.gen);
	writeln('ingrese puntaje');
	read(p.puntaje);
end;

procedure agregarAtras(var l : lis; elem : pelicula);
var
	aux, ult: lis;
begin
	new(aux); aux^.sig := nil; aux^.p := elem;
	if ( l = nil ) then
		l = aux
	else
		begin
			ult := l;
			while (ult^.sig <>nil) do
				ult := ult^.sig;
			ult^.sig:= aux;
		end;
end;

procedure inicializarvector(var v : vec);
var
	i : integer;
begin
	for i := 1 to lim do
		v[i] := nil;
end;


procedure cargarvector(var v : vec);
var
	p : pelicula;
begin
	leer(p);
	while (p.code <> -1) do
		begin
			agregarAtras(v[p.gen], p);
			leer(p);
		end;
end;

	
procedure vectorpromedios(var vec : vecp; v : vec);
var
	codemax, i : integer;
	aux : real;
begin
	for i := 1 to lim do
		begin
			aux := 0;
			codemax := 0;
			while(v[i] <> niL) do
				begin
					if(v[i]^.puntaje > aux) then
						aux := v[i]^.puntaje;
						codemax := v[i]^.code;
				end;
			vec[i].codigo := codemax;
			vec[i].puntaje := aux;
		end;
end;


procedure seleccion(var v : vecp);
var
	i, j, pos: integer;
	item : codigoprom;
begin
	for i := 1 to lim-1 do
		begin
			pos := i;
			j := i + 1;
			for j := 1 to diml	do
				if(v[j].puntaje < v[pos].puntaje) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;


procedure inicializarpromedios(var v : vecp);
var
	i : integer;
begin
	for i := 1 to lim do
		begin
			v[i].codigo := 0;
			v[i].puntaje := 0;
		end;
end;


procedure insercion(var v : vecp);
var
	i, j: integer;
	actual : codigoprom;
begin
	for i := 2 to lim do
		begin
			actual := v[i];
			j := i -1;
			while ( j > 0 ) and (v[j].puntaje > actual.puntaje) do
				begin
					v[j + 1] := v[j];
					j := j-1;
				end;
			v[j+1] := actual;
		end;
end;

var
	v : vec;
	vp : vecp;
begin
	inicializarvector(v);
	inicializarpromedios(vp);
	cargarvector(v);
	vectorpromedios(vp, v);
	seleccion(vp);
	write(vp[1].codigo, vp[lim].codigo);
	insercion(vp);
	write(vp[1].codigo, vp[lim].codigo);
end.

