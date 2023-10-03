program ej2;
const
	lim = 300;
type
	
	oficina = record
		code : integer;
		Dni : integer;
		exp : real;
		end;
		
		
	vec = array[1..lim] of oficina

procedure leer(var o : oficina);
begin
	read(o.code);
	read(o.dni);
	read(o.exp);
end;

procedure cargarV(var v : vec; var diml : integer)
var
	o : oficina
begin
	diml := 0;
	leer(o);
	while (o.code <> -1) and (diml <= lim) do 
		begin
			diml := diml + 1;
			v[diml] := o;
			leer(o);
		end;
end;


procedure insercion(var v : vec; diml : integer);
var
	i, j : integer;
	act : o;
begin
	for i := 2 to diml  do
		begin
			actual := v[i];
			j := i - 1;
			while (j > 0) and (v[j].code > actual.code) do 
				begin
					v[j+1] := v[j];
					j := j-1;
				end;
			v[j+1] := actual;
		end;
end;


procedure seleccion (var v : vec; diml : integer);
var
	i, j, pos : integer;
	act : o;
begin
	for i := 1 to diml - 1 do 
		begin
			pos := i;
			for j := i + 1 to diml do 
				begin
					if v[j].code < v[pos].code then
						pos := j;
				end;	
			act := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;









	
	

