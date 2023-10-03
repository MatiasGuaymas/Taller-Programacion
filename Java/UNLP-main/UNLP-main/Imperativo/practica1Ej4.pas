program ej4;
const
	lim = 8;
	rubro3 = 30;
type
	
	codigo = 1..lim;
	
	
	producto = record
		code : integer;
		coderubro : codigo;
		precio : real;
		end;
		
	lis = ^nodo
	
	nodo = record
		p : producto;
		sig : lis;
		end;
		
	vec = array[codigo] of lis
	
	vecr3 = array[1..rubro3] of producto
	
	
procedure leer(var p : producto):
begin
	read(p.code);
	read(p.coderubro);
	read(p.precio);
end;

procedure insertar(var l : lis, elem : producto);
var
	aux, act, ant : lis;
begin
	new(aux); aux^.sig := nil; aux^.p := elem;
	if (l = nil) then
		l := aux;
	else
		act := l;
		ant := act;
		while(act <> nil) and (act^.p.code < aux.code) do
			begin
				ant := act;
				act := act^.sig;
			end;
		if (l = act) then
			aux^.sig := l;
			l := aux;
		else
			begin
				ant^.sig := aux;
				aux^.sig := act;
			end;
end;

procedure cargarvector(var v : vec);
var
	p : producto;
begin
	leer(p);
	while(p.precio <> 0) do
		begin
			insertar(v[p.coderubro], p);
			leer(p);
		end;
end;


procedure mostrar(v : vec);
var
	i : integer;
begin
	for i := 1 to lim do
		begin
			read(v[i]^.code);
			read(v[i]^.coderubro);
			read(v[i]^.precio);
		end;
end;	


procedure rubro3(var vector : vecr3; v : vec; var diml : integer;);
var
	i : integer;
	aux : lis;
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


procedure seleccion (var v : vecr3; diml : integer);
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

procedure mostrarrubro(v : vecr3);
var
	i : integer;
begin
	for i := 1 to rubro3 do
		begin
			read(v[i]^.code);
			read(v[i]^.coderubro);
			read(v[i]^.precio);
		end;
end;	

function promedios(v : vecr3; diml : integer) : real;
var
	total, i : integer;
begin
	for i := 1 to diml do
			total := v[i].precio + total;
	promedios := total/diml;
end;

var
	v : vec;
	vector : vecr3;
	diml : integer;
begin
	cargavector(v);
	mostrar(v);
	rubro3(vector, vec, diml);
	seleccion(vector, diml);
	mostrarrubro(vector);
	write(promedios(vector, diml));
end.
			
			












