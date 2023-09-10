program ej2;
type
	prestamo = record
			isbn : integer;
			num ; integer;
			dia : integer;
			mes : integer;
			cant : integer;
			end;
		
		arb = ^nodo;
		
		nodo = record
			dato : prestamo;
			hi : arb;
			hd : arb;
			end;
			
	prestamo2 = record
		num : integer;
		dia : integer;
		mes : integer;
		cant : integer;
		end;
			
		lis = ^nodo2
		
		nodo2 = record
			dato : prestamo2;
			sig : lis;
			end;
		
	
		arboldelistas= ^nodo3;
	
		nodo3 = record
			l : lis;
			isbn : integer;
			hi : arboldelistas;
			hd : arboldelistas;
			end;
			
			
		arboldeisbn = ^nodo4; 
		
		nodo4 = record
			isbn : integer;
			cant : integer;
			hi : arboldeisbn;
			hd : arboldeisbn;
			end;

procedure leer(var p : prestamo);
begin
	writeln('ingrese isbn');
	readln(p.isbn);
	writeln('ingrese num');
	readln(p.num);
	writeln('ingrese dia');
	readln(p.dia);
	writeln('ingrese mes');
	readln(p.mes);
	writeln('ingrese cant');
	readln(p.cant);
end;

procedure leer2(var p : prestamo2);
begin
	writeln('ingrese num');
	readln(p.num);
	writeln('ingrese dia');
	readln(p.dia);
	writeln('ingrese mes');
	readln(p.mes);
	writeln('ingrese cant');
	readln(p.cant);
end;


procedure agregar(var a : arb; p : prestamo); //carga arbol comun y corriente
begin
	if(a=nil) then
		begin
			new(a); a^.hi:= nil; a^.hd:= nil; a^.dato := p;
		end
	else
		if(p.isnb <= a^.dato.isbn) theb
			agregar(a^.hi, p);
		else
			agregar(a^.hd, p);
end;


procedure buscar(a : arboldelistas; var ok : boolean; var nodo : arboldelistas; isbn : integer): //te dice si el isbn que busca esta, te devuelve el nodo, si no con la variable ok te dice si no esta.
begin
	if(a <> nil) then
		begin
			if(a^.isbn = isbn) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					buscar(a^.hi, ok, nodo. isbn);
					buscar(a^.hd, ok, nodo, isbn);
				end
		end
	else
		begin
			ok := false;
			nodo := nil;
		end;
end;


procedure agregarnodo(var a : arboldelistas; isbn : integer; p : prestamo2)//agrega una hoja si el isbn no estaba ya en el arbol.
begin
	if(a=nil) then
		begin
			new(a); a^.hi:= nil; a^.hd:= nil; new(a^.l);a^.l^.sig := nil; a^.isbn := isbn; a^.l^.dato := p;
		end
	else
		if(isnb <= a^.isbn) theb
			agregar(a^.hi, isbn, p);
		else
			agregar(a^.hd, isbn, p);
end;


procedure agregaradelante(var l : lis; prestamo : prest2);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := prestamo;
	if(l = nil) then
		l := aux
	else
		begin
			aux^.sig = l;
			l := aux;
		end;
end;


procedure cargararbol(var a : arboldelistas);//carga del arbol de listas.
var
	prest2 : prestamo2;
	isbn : integer;
	ok : boolean;
	nodo : arboldelistas
begin	
	writeln('ingrese ISBN: ');
	readln(isbn);
	if(isbn <> -1) then
		begin
			leer2(prest2);
			buscar(a, ok, nodo, isbn));
			if(ok = false) then
				agregarnodo(a, isbn, prest2)
			else
				agregaradelante(nodo^.l, prest2);
			cargararbol(a);
		end;
end;

function maximo(num1, num2 : integer) : integer;
begin
	if(num1 > num2 ) then
		maximo := num1
	else
		maximo := num2;
end;

function minimo(num1, num2 : integer) : integer;
begin
	if(num1 < num2 ) then
		minimo := num1
	else
		minimo := num2;
end;


function isbnmax(a : arb) : integer;
begin
	if(a <> nil) then
		begin
			isbnmax := isbnmax(maximo(a^.dato.isbn, maximo(a^.hi.dato.isbn, a^.hd.dato.isbn)));
		end
	else
		isbnmax := -1;
end;

function isbnmini(a : arboldelistas) : integer;
begin
	if(a <> nil) then
		begin
			isbnmin := isbnmin(minimo(a^.isbn, minimo(a^.hi.isbn, a^.hd.isbn)));
		end;
	else
		isbnmin := 99999999999;
end;

function prestamossocio(a : arb; numsocio : integer) : integer
begin
	if(a <> nil) then
		begin
			if(a^.dato.num = numsocio) then
				prestamosocio := prestamossocio(a^.hi, numsocio) + prestamossocio(a^.hd, numsocio) + 1)
			else
				begin
					prestamossocio(a^.hi, numsocio);
					prestamossocio(a^.hd, numsocio);
				end
		else
			prestamossocio := 0;
end;
				
		
procedure prestamossociolistas(a : arboldelistas; numsocio : integer; var cant : integer);
begin
	if(a <> nil) then
		begin
			while(a^.l <> nil) do
				begin
					if(a^.l.dato.num = numsocio) then
						begin
							cant := cant + 1;
							a^.l := a^l.sig;
						end;
					else
						a^.l := a^.l.sig;
				end;
			prestamossociolistas(a^.hi, numsocio, cant);
			prestamossociolistas(a^.hd, numsocio, cant);
		end;
end;
				

function contador(a : arb; actual : integer) : integer;
begin
	if(a <> nil) then
		begin
			if(a^.dato.isbn = actual) then
				contador := contador(a^.hd) + contador(a^.hi) + 1;
			else
				contador := 0;
		end;
	contador := 0;
end;
			
procedure agregararbolisbn(var a : arboldeisbn; isbn, cant : integer); //carga arbol comun y corriente
begin
	if(a=nil) then
		begin
			new(a); a^.hi:= nil; a^.hd:= nil; a^.isbn := isbn; a^.cant := cant;
		end
	else
		if(isbn <= a^.isbn) theb
			agregar(a^.hi, isbn, cant);
		else
			agregar(a^.hd, isbn, cant);
end;	
			

procedure cargararbolisbn(var arbolisbn: arboldeisbn; a : arb);
var
	cant : integer;
begin
	if(a <> nil) then
		begin
			cant := contador(a, a^.dato.isbn);
			agregararbolisbn(arbolisbn, a^.dato.isbn, cant);
			cargararbolisbn(a^.hd, a);
			cargararbolisbn(a^.hi, a);
		end;
end;
			
		
procedure cargararbolisbnlistas(var arbolisbn : arbolisbn, a : arboldelistas);
var
	cant : integer;
begin
	if(a <> nil) then
		begin
			cant := 0;
			while(a^.l <> nil) do
				begin
					cant := cant + 1;
					a^.l :+ a^.l.sig;
				end;
			agregararbolisbn(arbolisbn, a^.isbn, cant);
			cargararbolisbnlistas(a^.hi, a);
			cargararbolisbnlistas(a^.hd, a);
		end;
end;
	
	
procedure imprimir(a : arb);
begin
	if(a <> nil) then
		begin
			writeln(a^.dato.isbn);
			writeln(a^.dato.num);
			writeln(a^.dato.dia);
			writeln(a^.dato.mes);
			writeln(a^.dato.cant);
			imprimir(a^.hi);
			imprimir(a^hd);
		end;
end;
	
	
procedure imprimirlistas(a: arboldelistas);
begin
	if(a <> nil) then
		begin
			while( a^.l <> nil) then
				begin
					writeln(a^.l.dato.num);
					writeln(a^.l.dato.dia);
					writeln(a^.l.dato.mes);
					writeln(a^.l.dato.cant);
					a^.l := a^.l.sig;
				end;
			imprimirlistas(a^.hi);
			imprimirlistas(a^.hd);
		end;
end;

function entredosnum(numero, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			num1 := aux;
			num1 := num2;
			num2 := aux;
		end;
	if(numero >= num1) and (numero <= num2) then
		entredosnum := true;
	else
		entredosnum := false;
end;


function rango(a : arb; num1, num2 : integer) : integer;
begin
	if(a <> nil) then
		begin
			if(entredosnum(a^.dato.isbn, num1, num2)) then
				begin
					rango := rango(a^.hi, num1, num2) + rango(a^.hd, num1, num2) + 1;
				end
			else
				begin
					if(num1 > a^.dato.isbn) then
						rango(a^.hd, num1, num2)
					else
						rango(a^.hi, num1, num2);
				end;
		end
	else
		rango := 0;
end;
			
			
function rango(a : arboldelistas; num1, num2 : integer) : integer;
var
	cant : integer;
begin
	if(a <> nil) then
		begin
			if(entredosnum(a^.isbn, num1, num2)) then
				begin
					cant := 0;
					while(a^.l <> nil) do
						begin
							cant := cant + 1;
							a^.l := a^.l.sig;
						end;
					rango := rango(a^.hi, num1, num2) + rango(a^.hd, num1, num2) + cant);
				end
			else
				begin
					if(num1 > a^.isbn) then
						rango(a^.hd, num1, num2)
					else
						rango(a^.hi, num1, num2);
				end;
		end
	else
		rango := 0;
end;
				

var
	p : prestamo
	a : arb;
	arbol2 : arboldelistas;
begin
	leer(p);
	while(p.isbn <> -1) do
		begin
			agregar(a, p);
			leer(p);
		end;
	cargararbol(arbol2);