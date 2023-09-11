{ Una obra social dispone de un árbol binario de búsqueda con la información de sus 
afiliados. De cada afiliado se conoce: Número de afiliado, Nro de DNI, Plan (1..5) y año de
anio af la obra social. El árbol se encuentra ordenado por número de afiliado. Se 
solicita:
Implementar un módulo que reciba el árbol de afiliados, Nro de DNI Num1, Nro de DNI 
Num2 y un número de Plan, y retorne un vector ordenado por Nro de DNI del afiliado. El 
vector debe contener el número de afiliado y DNI de aquellos afiliados cuyo Nro de DNI se
encuentra comprendido entre Num1 y Num2 (siendo Num1 menor que Num2) y el Plan se
corresponda con el recibido por parámetro. Por norma de la obra social, cada Plan puede 
contar con af lo sumo 500 afiliados.}

program ejparcial2;
const
	LIM = 10;
type
	TIPO = 1..5;
	
	afiliado = record
		num : integer;
		dni : integer;
		plan : TIPO;
		fecha : integer;
		end; 
		
	arb = ^nodo;
	
	nodo = record
		hi : arb;
		hd : arb;
		dato : afiliado;
		end;
		
	afiliadovec = record
		num : integer;
		dni : integer;
		end;
		
	vec = array[1..LIM] of afiliadovec;
	
procedure leer(var a : afiliado);
begin
	{writeln('ingrese num: ');
	readln(a.num);}
	a.num := random(20) -1;
	if(a.num <> -1) then
		begin
			a.dni := random(20) + 1;
			a.plan := random(5) + 1;
			a.fecha := random(24) + 2000;
		end;
end;

procedure agregarnodo(var a : arb; aux : afiliado);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dato := aux;
		end
	else
		begin
			if(aux.num > a^.dato.num) then
				agregarnodo(a^.hd, aux)
			else
				agregarnodo(a^.hi, aux);
		end;
end;
		
procedure cargararbol(var a : arb);
var
	aux : afiliado;
begin
	leer(aux);
	if(aux.num <> -1) then
		begin
			agregarnodo(a, aux);
			cargararbol(a);
		end;
end;

procedure imprimirarbol( a : arb);
begin
	if(a <> nil) then
		begin
			imprimirarbol(a^.hi);
			write(' | ', a^.dato.num, ' | ');
            //write(' = ', a^.dato.plan, ' = ');
			imprimirarbol(a^.hd);
		end;
end;

function enrango(numero, num1, num2 : integer) : boolean;
begin
	if(num1 < numero) and (num2 > numero)then
		enrango := true
	else
		enrango := false;
end;
		
procedure seleccion(var v : vec; diml : integer);
var
	i, j, pos : integer;
	item : afiliadovec;
begin
	for i := 1 to diml-1 do
		begin
			pos := i;
			for j := i + 1 to diml do
				if(v[j].dni < v[pos].dni) then
					pos := j;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;


procedure cargarvector(a : arb; num1, num2 : integer; numeroplan : TIPO; var v : vec; var diml : integer);
begin
	if(a <> nil) then
		begin
			if(enrango(a^.dato.num, num1, num2))and (numeroplan = a^.dato.plan) then	
				begin
					diml := diml + 1;
					v[diml].num := a^.dato.num;
					v[diml].dni := a^.dato.dni;
				end;
			cargarvector(a^.hi, num1, num2, numeroplan, v, diml);
			cargarvector(a^.hd, num1, num2, numeroplan, v, diml);
		end;
	seleccion(v, diml);
end;

procedure imprimirvector(v : vec; diml : integer);
var
	i : integer;
begin
	for i := 1 to diml do
		begin
			writeln(' / ', v[i].dni, ' / ');
		end;
end;

var
	a : arb;
	v : vec;
	num1, num2, diml : integer;
	numerop : TIPO;
begin
    randomize;
	cargararbol(a);
	imprimirarbol(a);
	numerop := 2;
	num1 := 3;
	num2 := 9;
	diml := 0;
	cargarvector(a, num1, num2, numerop, v, diml);
    writeln('________________________');
	imprimirvector(v, diml);
end.