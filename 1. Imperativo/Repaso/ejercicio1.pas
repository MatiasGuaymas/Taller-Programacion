program ej1;
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