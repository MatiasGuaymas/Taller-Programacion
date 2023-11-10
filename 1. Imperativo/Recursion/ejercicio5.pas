{
5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando elsiguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentraen el vector.h    
}

program ej5;
const
	lim = 5;
type

	vec = array[1..lim] of integer;
	
procedure cargarvector(var v : vec; var diml : integer);
var
	aux : integer;
begin
	if(diml < lim) then
		begin
			writeln('ingrese num.');
			readln(aux);
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
			writeln(v[diml]);
		end;
end;

procedure busquedaD(v : vec; ini, fin, dato : integer; var pos : integer);
begin
	if(ini < fin) then
		begin
			pos := (fin + ini) div 2;
			if(dato > v[pos]) then
				begin
					ini := pos;
					busquedaD(v, ini, fin, dato, pos);
				end
			else
				if(dato < v[pos]) then
					begin
						fin := pos;
						busquedaD(v,ini,fin,dato,pos);
					end;
		end
	else
		pos := -1;
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
    ini := 1;
    fin := 5;
	dato := 5;
	cargarvector(v, diml);
	imprimir(v, diml);
	busquedaD(v,ini, fin, dato, pos);
	write('se encontro: ', encontro(pos));
end.