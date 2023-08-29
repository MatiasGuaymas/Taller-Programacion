//INCISO C

program ej1sinconocerdeantemano;
const
	maximo = 36
type
	
	sub = 0..36;
	
	marks = 1..10;
	

	vect = [1..36] of marks;

	alumno = record
		ap : string;
		nroA : integer;
		anio : integer;
		notas: vect;
		dimensionL: integer;
		dimensionF: integer;
		end;
		
	lista = ^nodo;
	
	nodo = record
		a : alumno;
		sig : nodo;


procedure leerV(var v : vect, var diml : integer, var dimF : integer)
var 
	nota, i : integer;
	
begin
	dimF := 0;
	diml := 1;
	while(diml < dimF) and (dimf <> maximo);
		begin
			read(nota)
			dimf := dimF + 1
			if (nota >= 4)then
				v[diml] := nota;
				diml := diml + 1;
		end;
end;
	


procedure leer(var a : alumno);
begin
	read(a.ap);
	read(a.nroA);
	read(a.anio);
	leerV(a.notas, a.dimensionL, a.dimensionF);
end;



procedure agregar(var l: lista, a : alumno);
var
	aux : lista;
begin
	new(aux); aux^.sig := nil, aux^.a := a;
	if (l = nil) then
		l := aux;
	else
		aux^.sig := L;
		l := aux;
end;

procedure cargarLista(var l : lista);
var
	a : alumno
begin
	repeat
		leer(a);
		agregar(l, a);
	until(a.numA = 11111);
end;


function promedio(v : notas, diml : integer) : real;
var
	total, i : integer;
begin
	total := 0;
	for i := 1 to diml do
		begin
			total := total + v[i];
		end;
	promedio := total / diml;
end;

			
			
procedure procesar (l : lista);
begin
	while (l<>nil) do
		begin
			write(l^.a.numA);
			write(promedio(l^.a.notas, l^.a.dimensionL));
		end;
end;

var
	l : lista;
begin
	cargarlista(l);
	procesar(l);
end.