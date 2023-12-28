{3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
}
program ejercicio3;
const
	LIM = 10;
type

	TIPO = 1..10;
	
	producto = record
		code : integer;
		precio : real;
		stock : integer;
		rubro : TIPO;
		end;
		
	informacion = record
		code : integer;
		precio : real;
		stock : integer;
		end;
		
	arb = ^nodo;

	
	nodo = record
		hi : arb;
		hd : arb;
		dato : informacion;
		end;
		
	vec = array[TIPO] of arb;
	
	maxcode = record
		code : integer;
		stock : integer;
		end;
	
	vecmaxcode= array[TIPO] of maxcode;
	
	vecrango = array[TIPO] of integer;
	
procedure leer(var p : producto);
begin
	{writeln('ingresar code: ');
	readln(p.code);}
	p.code := random(11) - 1;
	p.precio := random(100)+1;
	p.stock := random(100)+1;
	p.rubro := random(10) + 1;
	{writeln('ingrese rubro: ');
	readln(p.rubro);}
end;

procedure inicializarvector(var v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		v[i] := nil;
end;

procedure agregarnodo(var a : arb; i : informacion);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dato := i;
		end
	else	
		begin
			if(i.code <= a^.dato.code) then
				agregarnodo(a^.hi, i)
			else
				agregarnodo(a^.hd, i);
		end;
end;

procedure cargarvector(var v : vec);
var
	p : producto;
	i : informacion;
begin
	leer(p);
	if(p.code <> -1) then
		begin
			i.stock := p.stock;
			i.code := p.code;
			i.precio := p.precio;
			agregarnodo(v[p.rubro], i);
			cargarvector(v);
		end;
end;

procedure imprimirarbol(a : arb);
begin
	if(a<>nil) then
		begin
			writeln(a^.dato.code);
			imprimirarbol(a^.hd);
			imprimirarbol(a^.hi);
		end;
end;


procedure imprimirvector(v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			imprimirarbol(v[i]);
		end;
end;

function buscararbol(a : arb; codigo : integer) : boolean;
begin
	if(a <> nil) then
		begin
			if(a^.dato.code = codigo) then
				buscararbol := true
			else
				begin
					if(codigo > a^.dato.code) then
						buscararbol := buscararbol(a^.hd, codigo)
					else
						buscararbol := buscararbol(a^.hi, codigo);
				end;
		end
	else
		buscararbol := false;	
end;
			


function codigoexiste(v : vec; rubro : TIPO; codigo : integer) : boolean;
begin
	codigoexiste := buscararbol(v[rubro], codigo);
end;


procedure maxcodearbol(a : arb; var codemax, maxstock : integer);
begin
	if(a <> nil) then
		begin
			if(codemax < a^.dato.code) then
				begin
					codemax := a^.dato.code;
					maxstock := a^.dato.stock;
					maxcodearbol(a^.hd, codemax, maxstock);
				end
			else
				maxcodearbol(a^.hd, codemax, maxstock);
		end;
end;

procedure codigomaximo(var vm : vecmaxcode; v : vec; var codemax, stockmax : integer);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			codemax := 0;
			stockmax := 0;
			maxcodearbol(v[i], codemax, stockmax);
			vm[i].code := codemax;
			vm[i].stock := stockmax;
		end;
end;
			
procedure imprimirvectormax(v : vecmaxcode);
var
	i : integer;
begin
	for i := 1 to LIM do
		writeln(v[i].code);
end;

function enrango(numero, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := num1;
		end;
	if(numero >= num1) and (numero <= num2) then
		enrango := true
	else
		enrango := false;
end;

function rango(a : arb; num1, num2 : integer) : integer;
begin
    if(a <> nil) then  
        begin
        	if(enrango(a^.dato.code, num1, num2)) then	
        	    begin
        		    rango := rango(a^.hd, num1, num2) + rango(a^.hi, num1, num2) + 1;
        		end;
        end
    else
        rango := 0;
end;
        
procedure rangovector(var vecr : vecrango; num1, num2 : integer; v : vec);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			vecr[i] := rango(v[i], num1, num2);
		end;
end;

procedure imprimirvectorrango(v : vecrango);
var
	i : integer;
begin
	for i := 1 to LIM do
		write(' | ',v[i],' | ');
end;

procedure seleccion (var v: vecrango);
var
	i, j, pos, cant: integer; 
begin
	for i := 1 to LIM-1 do begin
		pos:= i;
		for j:= i + 1 to 10 do
			if v[j] < v[pos] then pos:= j;
		cant:= v[pos];
		v[pos] := v[i];
		v[i] := cant;
	end;
end;

var
	v : vec;
	rubro : TIPO;
	num1, num2, codemax, stockmax, codigo : integer;
	vmax : vecmaxcode;
	vrango : vecrango;
begin
	randomize;
	cargarvector(v);
	imprimirvector(v);
	rubro := 2;
	codigo := 7;
	writeln(codigoexiste(v, rubro, codigo));
	codigomaximo(vmax, v, codemax, stockmax);
	imprimirvectormax(vmax);
	num1 := 2;
	num2 := 9;
	rangovector(vrango, num1, num2, v);
	imprimirvectorrango(vrango);
	seleccion(vrango);
	writeln('_________________________');
	imprimirvectorrango(vrango);
end.