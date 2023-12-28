{1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1;
const
	LIM = 3;
type
	oficina = record
		code : integer;
		dni : integer;
		monto : integer;
		end;
		
	vec = array[1..LIM] of oficina;
	

procedure leer(var o : oficina);
begin
	writeln('ingresar codigo: ');
	readln(o.code);
	writeln('ingrese dni: ');
	readln(o.dni);
	writeln ('ingrese valor: ');
	readln(o.monto);
end;


procedure cargarvector(var v : vec; var diml : integer; o : oficina);
begin	
	if(diml < LIM) and (o.code <> -1) then
		begin
			diml := diml + 1;
			v[diml] := o;
			leer(o);
			cargarvector(v, diml, o);
		end;
end;
	

procedure seleccion(var v : vec; diml : integer);
var
	pos, i, j  : integer;
	o : oficina;
begin
	if(diml > 0) then
		begin
			for i := 1 to diml -1 do
				begin
					pos := i;
					for j := i + 1 to diml do
						begin
							if(v[j].code < v[pos].code) then
								begin
									pos := j;
								end;
						end;
					o := v[pos];
					v[pos] := v[i];
					v[i] := o;
				end;
		end;
end;


function busquedadicotomica(v : vec; codigo : integer; diml, pri, fin: integer) : integer;
var
	medio: integer;
begin
	if(diml > 0) then
		begin
			medio:= (pri + fin) div 2;
			if(pri < fin) then
				begin
					if(codigo < v[medio].code) then
						begin
							fin := medio;
							busquedadicotomica := busquedadicotomica(v, codigo, diml, pri, fin);
						end
					else
						if(codigo > v[medio].code) then
							begin	
								pri := medio;
								busquedadicotomica := busquedadicotomica(v, codigo, diml, pri, fin);
							end;
					if(v[medio].code = codigo) then
						busquedadicotomica := medio;
				end
			else
				busquedadicotomica := 0;
		end
	else
		busquedadicotomica := 0;
end;
	
procedure montototal(v : vec; var cant : integer; diml : integer);
begin
    if(diml > 0) then 
        begin
            cant := v[diml].monto + cant;
            montototal(v, cant, diml -1);
        end;
end;


function montotalfd(v : vec; diml : integer): integer;
begin
	if(diml > 0) then
		begin
			montotalfd := v[diml].monto + montotalfd(v, diml - 1); 
		end
	else
		montotalfd := 0;
end;

var
	v : vec;
	aux,codigo, pri, fin, diml : integer;
	o : oficina;
begin
	diml := 0;
	codigo := 01;
	leer(o);
	cargarvector(v, diml, o);
	writeln(diml);
	seleccion(v, diml);
	pri := 1;
	fin := LIM;
	aux := busquedadicotomica(v, codigo, diml, pri, fin);
	if(aux = 0)then
		writeln('no se encontro el elemento')
	else
        writeln(v[aux].dni);
	writeln('monto total: ',montotalfd(v,diml));
end.