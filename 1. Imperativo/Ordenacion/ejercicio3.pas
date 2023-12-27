{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a).
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program ejercicio3;
const
	LIM = 8;
type
	subGen = 1..LIM;
	pelicula = record
		codPeli : integer;
		codGenero : subGen;
		puntaje : real;
	end;
	
	lista = ^nodo;
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
	Writeln('Ingrese el codigo de la pelicula: ');
  	readln(p.codPeli);
	if(p.codPeli <> -1)then
    	begin
      		Writeln('Ingrese el codigo de genero de la pelicula: ');
      		readln(p.codGenero);
      		Writeln('Ingrese el puntaje promedio obtenido de la critica para esta pelicula: ');
      		readln(p.puntaje);
    	end;  
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
	{p.codPeli:= Random(100);
	p.codGenero:= Random(8)+1;
	p.puntaje:= ((random(10)+1)/(random(10)+1));}
	while(p.codPeli <> -1) do
		begin
			agregarAtras(v[p.codGenero], p);
			leer(p);
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
	for i := 1 to LIM-1 do
		begin
			pos := i;
			for j := i+1 to LIM do
				if(v[j].puntajePromedio < v[pos].puntajePromedio) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;

procedure imprimir (v:vecP);
var 
    i:integer;
begin 
    writeln();
    for i:=1 to LIM do 
        writeln('Genero=', i, ' Codigo=', v[i].codPelicula,' PUNTAJE=', v[i].puntajePromedio:0:2);
    writeln();
end;

var
	v : vecPelis;
	vp : vecP;
begin
	Randomize;
	inicializarVector(v);
	inicializarPromedios(vp);
	cargarVector(v);
	vectorPromedios(vp, v);
	imprimir(vp);
	seleccion(vp);
	imprimir(vp);
	Writeln('El codigo de pelicula de mayor puntaje es: ',vp[LIM].codPelicula);
    Writeln('El codigo de pelicula de menor puntaje por la critica es: ',vp[1].codPelicula);
end.