{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program ejercicio3;
const
    dimF = 20;
type
    subRango = 1..dimF;
    vector = array [subRango] of integer;
procedure cargarVector(var v: vector);
var
    i: subRango;
begin
    for i:= 1 to dimF do
        v[i]:= random(1251) + 300;
end;
procedure insercion(var v: vector);
var
	i, j, actual: integer; 
begin
	for i:= 2 to dimF do begin
		actual:= v[i];
		j:= i-1;
		while(j > 0) and (v[j]> actual) do
		begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1] := actual;
	end;
end;
procedure imprimirVector(v: vector);
var
    i: subRango;
begin
    for i:= 1 to dimF do
        write(v[i], ' ');
    writeln;
end;
procedure busquedaDicotomica (v:vector;ini,fin: subRango; dato:integer; var pos:integer);
var 
    medio:integer;
begin
    medio:=(ini+fin) div 2;
    writeln('ini: ',ini,' fin: ',fin,' N: ',dato,' pos: ',pos,' Medio:',medio);
    if (ini<=fin) then 
        begin 
            if (v[medio]=dato) then 
                pos:=medio
            else 
                if (v[medio]>dato) then 
                    busquedaDicotomica(v,ini,medio-1,dato,pos)
                else
                    busquedaDicotomica(v,medio+1,fin,dato,pos);
        end 
    else 
        pos:=-1;
end;
var
    v: vector;
    pos, n: integer;
begin
    randomize;
    cargarVector(v);
    writeln('Vector generado: ');
    imprimirVector(v);
    insercion(v);
    writeln('Vector ordenado: ');
    imprimirVector(v);
    writeln('Ingrese el numero a buscar: ');
    readln(n);
    busquedaDicotomica(v,1,dimF,n,pos);
    if (pos <> -1) then
        writeln('El numero se encuentra en la posicion: ',pos)
    else
        writeln('El numero no se encuentra en el vector');
end.