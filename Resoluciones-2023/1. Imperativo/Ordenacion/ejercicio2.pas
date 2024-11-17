{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ejercicio2;
const
	//dimF = 300;
    dimF = 10;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: real;
	end;
	
	vecEdificio = array [1..dimF] of oficina;
	
{procedure leerDatos(var o: oficina);
begin
	readln(o.codigo);
	readln(o.dni);
	readln(o.valor);
end;

procedure cargarVector (var v: vecEdificio; var dimL: integer);
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
end;}

procedure cargarVector(var v: vecEdificio; var dimL: integer);
var 
    i: integer;
begin
    diml:= Random(dimF) + 1;
    for i:= 1 to dimF do
        begin
            v[i].codigo:= random(30)+1;
            v[i].dni:= random(300)+1;
            v[i].valor:= random(5000)+1;
        end;
end;

procedure imprimir (v:vecEdificio;diml:integer);
var 
    i:integer;
begin 
    writeln();
    for i:=1 to diml do 
        writeln('Codigo=', v[i].codigo,' DNI=', v[i].dni,' Valor=', v[i].valor:0:2);
    writeln();
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
	for i:= 1 to dimL - 1 do begin
		pos:= i;
		for j:= i + 1 to dimL do
			if (v[j].codigo < v[pos].codigo) then pos:= j;
		item:= v[pos];
		v[pos] := v[i];
		v[i]:= item;
	end;
end;

var
	v: vecEdificio;
	dimL: integer;
begin
	Randomize;
	cargarVector(v, dimL);
    imprimir(v, dimL);
	insercion(v, dimL);
    imprimir(v, dimL);
	seleccion(v, dimL);
    imprimir(v, dimL);
end.