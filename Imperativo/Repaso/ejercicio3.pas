const
	PRODU = 10;
type

	PRODUCTOS = 1..PRODU;
	
	producto = record
		codigo : integer;
		stock : integer;
		precio : real;
		end;
		
	arb = ^nodo;
	
	nodo = record
		rubro : PRODUCTOS;
		dato : producto;
		hi : arb;
		hd : arb;
		end;
		
	vec = array[PRODUCTOS] of arb;

	max = record
		codigo : integer;
		stock : integer;
		end;
		
	vecmax = array[PRODUCTOS] of max;
	
	vecrango = array[PRODUCTOS] of integer;

procedure leer(var p : producto);
begin
	p.precio := random(101);
	p.codigo :=random(11) -1;
	p.stock := random (101);
	
end;


procedure inicializarvector(var v : vec);
var
	i : integer;
begin
	for i := 1 to PRODU do
		begin
			v[i] := nil;
		end;
end;



procedure cargararbol(var a : arb; elem : producto);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dato := elem;
		end
	else
		begin
			if(elem.codigo <= a^.dato.codigo) then
				cargararbol(a^.hi, elem)
			else
				cargararbol(a^.hd, elem);
		end;
end;


procedure cargarvector(var v : vec);
var
	p : producto;
	aux : PRODUCTOS;
begin
	aux := random(10) + 1;
	leer(p);
	if(p.codigo <> -1) then
		begin
			cargararbol(v[aux], p);
			cargarvector(v);
		end;
end;

function buscarenarboles(a : arb; codigo : integer) : boolean;
begin
	if(a <> nil) then
		begin
			if(a^.dato.codigo = codigo) then
				buscarenarboles := true
			else
				begin
					if(codigo > a^.dato.codigo) then
						buscarenarboles(a^.hd, codigo)
					else
						buscarenarboles(a^.hi, codigo);
				end;
		end
	else
		buscarenarboles := false;
end;
			

function buscar(v : vec; rubro : PRODUCTOS; codigo : integer) : boolean;
begin
	if(v[rubro]^.dato.codigo = codigo) then
		buscar := true
	else
		begin
			if(codigo > v[rubro]^.dato.codigo) then
				buscar := buscarenarboles(v[rubro]^.hd, codigo)
			else
				buscar := buscarenarboles(v[rubro]^.hi, codigo);
		end;
end;


procedure maximoarbol2(a : arb; var maxcode, maxstock : integer);//me marca error de compilacion aca
var 
	mcode, mstock : integer;
begin
	if(a <> nil) then
		begin
			if(a^.dato.codigo > maxcode) then	
				begin
					maxcode := a^.dato.codigo;
					maxstock := a^.dato.stock;
					mcode := maxcode;
					mstock := maxstock;
					maximoarbol2(a^.hd, mcode, mstock);//mal pasaje de parametros?
				end
			else
				maximoarbol2(a^.hd, mcode, mstock);
		end;
end;

procedure maximo(var vec : vecmax; v : vec); 
var
	code, stock, i : integer;
begin
	for i:= 1 to PRODU do
		begin
			maximoarbol2(v[i], code, stock);
			vec[i].stock := stock;
			vec[i].codigo := code;
		end;
end;



function entredosnum(valor, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := aux;
		end;
	if(valor >= num1) and (valor <= num2) then
		entredosnum := true
	else
		entredosnum := false;
end;


function rango(a : arb; num1, num2 : integer) : integer;
begin
	if( a <> nil) then
		begin
			if(entredosnum(a^.dato.codigo, num1, num2)) then
				rango := rango(a^.hi, num1, num2) + rango(a^.hd, num1, num2) + 1
			else
				begin
					if(num1 > a^.dato.codigo) then
						rango(a^.hd, num1, num2)
					else
						rango(a^.hi, num1, num2);
				end;
		end
	else
		rango := 0;
end;

procedure enrango(var vecrango : vecrango; v : vec; num1, num2 : integer);
var
	i : integer;
begin
	for i := 1 to PRODU do
		begin
			vecrango[i] := rango(v[i], num1, num2);
		end;
end;

procedure imprimir(v : vecrango; vec : vecmax);
var
	i  : integer;
begin
	for i := 1 to PRODU do 
		begin
			writeln(vec[i].stock);
			writeln(vec[i].codigo);
			writeln(v[i]);
		end;
end;
	
var
	v : vec;
	vrango : vecrango;
	codigo,num1, num2 : integer;
	vmax : vecmax;
	rubro : PRODUCTOS;
begin
	Randomize;
	inicializarvector(v);
	writeln('inico');
	cargarvector(v);
	writeln('vector cargado');
	rubro := 4;
	codigo := 05;
	writeln('esta este codigo en este rubro?: ', buscar(v, rubro, codigo));
	maximo(vmax, v);
	num1 := 2;
	num2 := 8;
	enrango(vrango, v, num1, num2);
	imprimir(vrango, vmax);
end.