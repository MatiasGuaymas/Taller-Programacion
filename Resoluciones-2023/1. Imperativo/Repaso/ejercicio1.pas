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
	LIM = 300;
type
	oficina = record
		code : integer;
		dni : integer;
		monto : real;
		end;
		
	vecOficinas = array[1..LIM] of oficina;

procedure leerOficina(var o : oficina);
begin
	o.code:= Random(700)-1;
	o.dni:= Random(1000)+300;
	o.monto:= o.dni * (Random(30)+1);
end;

procedure cargarVector(var v : vecOficinas; var diml : integer);
var
	o: oficina;
begin	
	leerOficina(o);
	while (diml < LIM) and (o.code <> -1) do
		begin
			diml := diml + 1;
			v[diml] := o;
			leerOficina(o);
		end;
end;
	
procedure seleccion(var v : vecOficinas; diml : integer);
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
						if(v[j].code < v[pos].code) then
							pos := j;
					o := v[pos];
					v[pos] := v[i];
					v[i] := o;
				end;
		end;
end;

function busquedadicotomica(v : vecOficinas; codigo : integer; diml, pri, fin: integer) : integer;
var
	medio: integer;
begin
	if(diml > 0) then
		begin
			if(pri <= fin) then
				begin
					medio:= (pri + fin) div 2;
					if(v[medio].code = codigo) then
						busquedadicotomica := medio
					else if(codigo < v[medio].code) then
						busquedadicotomica := busquedadicotomica(v, codigo, diml, pri, medio-1)
					else
						busquedadicotomica := busquedadicotomica(v, codigo, diml, medio+1, fin);
				end
			else
				busquedadicotomica := 0;
		end
	else
		busquedadicotomica := 0;
end;
	
function montoTotal(v : vecOficinas; diml : integer): real;
begin
	if(diml > 0) then
		begin
			montoTotal := v[diml].monto + montoTotal(v, diml - 1); 
		end
	else
		montoTotal := 0;
end;

procedure imprimirVector(v: vecOficinas; diml: integer);
var
	i: integer;
begin
	for i:= 1 to diml do writeln(i, '. CODIGO=', v[i].code, ' DNI=', v[i].dni, ' MONTO=', v[i].monto:0:2);
end;

var
	v : vecOficinas;
	aux, codigo, pri, fin, diml : integer;
	o : oficina;
begin
	Randomize;
	diml := 0;
	cargarvector(v, diml);
	imprimirVector(v, diml);

	writeln('--------------');
	seleccion(v, diml);
	imprimirVector(v, diml);

	writeln('--------------');
	writeln('Ingrese un codigo de identificacion de oficina');
	readln(codigo);
	pri := 1;
	fin := diml;
	aux := busquedadicotomica(v, codigo, diml, pri, fin);
	if(aux = 0)then
		writeln('No se encontro la oficina con el codigo de identificacion ', codigo, ' en el vector')
	else
		writeln('Se encontro la oficina con el codigo de identificacion ', codigo, ' en la posicion ', aux, ' del vector, su DNI es: ', v[aux].dni);
	
	writeln('--------------');
	writeln('El monto total de las expensas es: ', montoTotal(v,diml):0:2);
end.