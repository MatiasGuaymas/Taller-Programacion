program ejparcial;
type

	DIA = 1..31;

	venta = record
		fecha : DIA;
		code : integer;
		cant : integer;
		monto : real;
		end;
		
	ventalista = record
		fecha : integer;
		cant : integer;
		monto : real;
		end;
		
	lis = ^nodolista;
	
	nodolista = record
		dato : ventalista;
		sig : lis;
		end;
		
	arb = ^nodo;
	
	nodo = record
		hi : arb;
		hd : arb;
		code : integer;
		monto : real;
		l : lis;
		end;
		
procedure leer(var v : venta);
begin
	writeln('ingrese codigo: ');
	readln(v.code);
	v.fecha := random(31) + 1;
	v.cant := random(100) + 1;
	v.monto := random(1000) + 10.50;
end;


procedure agregaradelante(var l : lis; elem : ventalista);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := elem;
	if(l =nil) then
		l := aux
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;

procedure agregarnodo(var a : arb; v : venta);
var
	vl : ventalista;
begin
	if(a = nil) then
		begin
			vl.fecha := v.fecha;
			vl.monto := v.monto;
			vl.cant := v.cant;
			new(a); a^.hi := nil; a^.hd := nil; a^.l := nil; a^.code := v.code; a^.monto := 0;
			agregaradelante(a^.l, vl);
		end
	else
		begin
			if(v.code > a^.code) then
				agregarnodo(a^.hd, v)
			else
				agregarnodo(a^.hi, v);
		end;
end;

procedure buscar(a : arb; var ok : boolean; var nodo : arb; codigo : integer);
begin
	if(a <> nil) then
		begin
			if(a^.code = codigo) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(codigo > a^.code) then
						buscar(a^.hd, ok, nodo, codigo)
					else
						buscar(a^.hi, ok, nodo, codigo);
				end;
		end
	else
		begin
			ok := false;
			nodo := nil;
		end;
end;

procedure cargararbol(var a : arb; v : venta);
var
	ok : boolean;
	nodo : arb;
	vl : ventalista;
begin
	buscar(a, ok, nodo, v.code);
	if(ok) then
		begin
			vl.fecha := v.fecha;
			vl.monto := v.monto;
			vl.cant := v.cant;
			agregaradelante(nodo^.l, vl);
		end
	else
		agregarnodo(a, v);
end;

procedure cargartodo(var a : arb);
var
	v : venta;
begin
	leer(v);
	if(v.code <> -1) then
		begin
			cargararbol(a, v);
			cargartodo(a);
		end;
end;


function montolista(l : lis) : real;
var
	cont : real;
begin
	cont := 0;
	while(l <> nil) do
		begin
			cont := cont + l^.dato.monto;
			l := l^.sig;
		end;
	montolista := cont;
end;


procedure cargarmontos(var a : arb);
begin
	if(a <> nil) then
		begin
			a^.monto := montolista(a^.l);
			cargarmontos(a^.hd);
			cargarmontos(a^.hi);
		end;
end;

procedure imprimirarbol(a: arb);
begin
	if(a <> nil) then
		begin
		    imprimirarbol(a^.hi);
			writeln(a^.code);
			writeln(a^.monto:0:2);
			imprimirarbol(a^.hd);
		end;
end;

function montomax(a : arb; code : integer) : real;
begin
	if(a <> nil) then
		begin
			if(a^.code > code) then
				begin
					montomax := montomax(a^.hd, code) + montomax(a^.hi,code) + a^.monto;
				end
			else
				montomax := montomax(a^.hd, code);
		end
	else
		montomax :=0;
end;


var
	code : integer;
	a : arb;
begin
	a := nil;
	randomize;
	cargartodo(a);
	cargarmontos(a);
	code := 3;
	imprimirarbol(a);
	writeln('la suma de todo lo vendido fue: ',montomax(a,code):0:2); 
end.