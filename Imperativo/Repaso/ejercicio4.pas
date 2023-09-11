program ej4;
type
	reclamo = record
		code : integer;
		fecha : integer;
		tipo : integer;
		end;
		
	arb = ^nodo;
	
	lis = ^nodolista;
	
	nodolista = record
		dato : reclamo;
		sig : lis;
		end;
	
	nodo = record
		l : lis;
		dni : integer;
		hd : arb;
		hi : arb;
		end;
		
	listafecha = ^nodofecha;
	
	nodofecha = record
		sig : listafecha;
		code : integer;
		end;
		
		
procedure leer(var r : reclamo; var dni : integer);
begin
	//r.code := random(10) - 1;
	writeln('ingrese codigo: ');
	readln(r.code);
	writeln('ingrese anio: ');
	readln(r.fecha);
	r.tipo := random(11);
    writeln('ingresa dni: ');
    readln(dni);
end;

		
procedure buscar(a : arb; var ok : boolean; var nodo : arb; dni : integer);
begin
	if(a <> nil) then
		begin
			if(a^.dni = dni) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(dni > a^.dni) then
						buscar(a^.hd, ok, nodo, dni)
					else
						buscar(a^.hi, ok, nodo, dni);
				end;
		end
	else
		ok := false;
		nodo := nil;
end;
					

procedure agregaradelante(var l : lis; r : reclamo);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := r;
	if(l = nil) then
		l := aux
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;

procedure agregarnodo(var a : arb; r : reclamo; dni : integer);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dni := dni; a^.l:= nil;
		end
	else
		begin
			if(dni <= a^.dni) then
				agregarnodo(a^.hi, r, dni)
			else
				agregarnodo(a^.hd, r, dni);
		end;
end;
					

		
procedure cargararbol(var a : arb; r : reclamo; dni : integer);		
var
	ok : boolean;
	nodo : arb;
begin
	buscar(a, ok, nodo, dni);
	if(ok = true) then
		agregaradelante(nodo^.l, r)
	else
		agregarnodo(a, r, dni);
end;
	
	

procedure cargageneral(var a : arb);
var
	r : reclamo;
	dni : integer;
begin
    leer(r,dni);
	if(r.code <> -1) then
		begin
			cargararbol(a, r, dni);
			cargageneral(a);
		end;
end;
					
			
procedure procesarlista(l : lis; var cant : integer);
begin
	while(l <> nil) do
		begin
			cant := cant + 1;
			l := l^.sig;
		end;
end;
			
					
function cantreclamos(a : arb; dni : integer) : integer;
var
	cant : integer;
begin
	if(a <> nil) then
		begin
			cant := 0;
			if(a^.dni = dni) then
				begin
					procesarlista(a^.l, cant);
					cantreclamos := cant;
				end
			else
				begin
					if(dni > a^.dni) then
						cantreclamos := cantreclamos(a^.hd, dni)
					else
						cantreclamos := cantreclamos(a^.hi, dni);
				end;
		end
	else
		cantreclamos := 0;
end;
					

					
function enrango(numero, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := aux;
		end;
	if(numero > num1) and (numero < num2) then
		enrango := true
	else
		enrango := false;
end;	


procedure rango(a : arb; num1, num2 : integer; var total : integer);//total incializado en 0
begin
	if(a <> nil) then
		begin
			if(enrango(a^.dni, num1, num2)) then
				begin
					procesarlista(a^.l, total);
					rango(a^.hi, num1, num2, total);
					rango(a^.hd, num1, num2, total);
				end
			else
				begin
					if(num1 > a^.dni) then
						rango(a^.hd, num1, num2, total)
					else
						rango(a^.hi, num1, num2, total);
				end;
		end
end;
			
			
procedure agregaratras(var l : listafecha; code : integer);
var
	aux, ult : listafecha;
begin
	new(aux); aux^.sig := nil; aux^.code := code;
	if(l = nil) then
		l := aux
	else
		begin
			ult := l;
			while(ult^.sig <> nil) do	
				begin
					ult := ult^.sig;
				end;
			ult^.sig := aux;
		end;
end;

		
procedure procesarlista(l : lis; fecha : integer; var listaf : listafecha);
begin
	while(l <> nil) do
		begin
			if(l^.dato.fecha = fecha) then
				agregaratras(listaf, l^.dato.code);
			l := l^.sig;
		end;
end;


procedure procesararbol(a : arb; var l : listafecha; fecha : integer);
begin
	if(a <> nil) then
		begin
			procesarlista(a^.l, fecha, l);
			procesararbol(a^.hi, l, fecha);
			procesararbol(a^.hd, l, fecha);
		end;
end;

procedure imprimirlistas(l : listafecha);
begin
	while (l <> nil) do
		begin
			write(l^.code);
			l := l^.sig;
		end;
end;


var
	l : listafecha;
	a : arb;
	num1, num2, cant,total, fecha, dni : integer;
begin
	randomize;
	a := nil;
	l := nil;
	num1 := random(10) + 1;
	num2 := random(10) + 1;
	dni := random(10) + 1;
	cant := 0;
	total := 0;
	fecha := 2018;
	cargageneral(a);
	writeln('la cantidad de reclamos del dni: ', dni,' fueron ',cantreclamos(a, dni));
	rango(a, num1, num2, total);
	writeln('el total de reclamos entre todos los dnis entre ', num1 , ' y ',num2,' es ', total);
	procesararbol(a, l, fecha);
	imprimirlistas(l);
end.