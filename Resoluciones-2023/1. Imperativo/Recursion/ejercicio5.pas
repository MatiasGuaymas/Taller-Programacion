{ 5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.}

program ej5;
const
	lim = 10;
type

	vec = array[1..lim] of integer;
	
procedure cargarvector(var v : vec; var diml : integer);
var
	aux : integer;
begin
	if(diml < lim) then
		begin
			//writeln('Ingrese num.');
			//readln(aux);
			aux:= Random(20);
			if(aux <> 0) then
				begin
				    diml := diml + 1;
					v[diml] :=aux;
					cargarvector(v, diml);
				end;
		end;
end;

procedure imprimir (v : vec; diml : integer);
begin
	if(diml > 0) then
		begin   
			imprimir(v, diml - 1);
			writeln(diml, '. ', v[diml]);
		end;
end;

procedure seleccion(var v: vec; dimL: integer);
var
	i, j, pos, item: integer;
begin
	for i:= 1 to dimL - 1 do begin
		pos:= i;
		for j:= i + 1 to dimL do
			if (v[j] < v[pos]) then pos:= j;
		item:= v[pos];
		v[pos] := v[i];
		v[i]:= item;
	end;
end;

procedure buscar (vector:vec;indiceI,indiceD,n:integer;var indiceN:integer);
var 
    medio:integer;
begin 
    medio:=(indiceI+indiceD) div 2;
    writeln('IndiceI: ',indiceI,' IndiceD: ',indiceD,' N: ',n,' IndiceN: ',indiceN,' Medio:',medio);
    if (indiceI<=indiceD) then 
        begin 
            if (vector[medio]=n) then 
                indiceN:=medio
            else 
                if (vector[medio]>n) then 
                    buscar(vector,indiceI,medio-1,n,indiceN)
                else
                    buscar(vector,medio+1,indiceD,n,indiceN);
        end 
    else 
        indiceN:=-1;
end;

function encontro(pos : integer) : boolean;
begin
    if(pos = -1) then   
        encontro := false
    else
        encontro := true;
end;

var
	v : vec;
	diml,  ini, fin, dato, pos : integer;
begin
	Randomize;
    ini := 1;
	dato := 5;
	cargarvector(v, diml);
	fin:= diml;
	seleccion(v, diml);
	imprimir(v, diml);
	buscar(v,ini, fin, dato, pos);
	if(encontro(pos)) then writeln ('Se encontro el dato (', dato ,') en la posicion: ', pos, ' del vector') else writeln('No se pudo encontar el dato');
end.