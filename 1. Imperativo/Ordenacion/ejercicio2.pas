program ejercicio2;
const
	dimF = 300;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vecEdificio = array [1..dimF] of oficina;
	
procedure leerDatos(var o: oficina);
begin
	readln(o.codigo);
	readln(o.dni);
	readln(o.valor);
end;

procedure cargarVector (var v: vecEdificio, var dimL: integer);
var
	o: oficina;
begin
	dimL:= 0;
	leerDatos(o);
	while (dimL < dimF) and(o.codigo <> -1) do
	begin
		dimL:= dimL + 1;
		v[dimL] := o;
		leerDatos(o);
	end;
end;

procedure insercion(var v: vecEdificio; dimL: integer);
var
	i, j: integer; 
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= v[i];
		j:= i-1;
		while(j > 0) and (v[j].codigo > actual.codigo) do
		begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1] := actual;
	end;
end;

procedure seleccion(var v: vecEdificio; dimL: integer);
var
	i, j, pos: integer;
	item: oficina;
begin
	for i:= 1 to dimLog -1 do begin
		pos:= i;
		for j:= i + 1 to dimL do
			if (v[j].codigo < v[a].codigo) then pos:= j;
		item:= v[pos];
		v[pos] := v[i];
		v[i]:= item;
	end;
end;

var
	v: vecEdificio;
	dimL: integer;
begin
	cargarVector(v, dimL);
	insercion(v, dimL);
	seleccion(v, dimL);
end;