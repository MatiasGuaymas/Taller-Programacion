program parcial;
type
	pedido = record
		numero: integer;
		dia: integer;
		cant: integer;
		monto: real;
	end;
	
	pedido2 = record
		dia: integer;
		cant: integer;
		monto: real;
	end;
	
	lista = ^nodolista;
	nodolista = record
		dato: pedido2;
		sig: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		l: lista;
		numero: integer;
		hi: arbol;
		hd: arbol;
	end;
	
	
	
	
procedure leerCliente(var p: pedido);
begin
	writeln('ingrese num');
	readln(p.numero);
	if(p.numero <> 0) then
		begin
			p.dia:= random(31) + 1;
			p.monto:= random(100) + 500;
			p.cant:= random(20);
		end;
end;

procedure buscar (a: arbol; num: integer; var ok: boolean; var nodo: arbol);
begin
	if(a<> nil) then
		begin
			if(a^.numero = num) then
				begin
					ok:= true;
					nodo:= a;
				end
			else
				begin
					if(num > a^.numero) then
						buscar(a^.hd, num, ok, nodo)
					else
						buscar(a^.hi, num, ok, nodo);
				end;
		end
	else
		begin
			ok:= false;
			a:= nil;
		end;
end;

procedure agregaradelante(var l: lista; p: pedido2);
var
	aux: lista;
begin
	new(aux); aux^.sig:= nil; aux^.dato:= p;
	if(l = nil) then l:= aux
	else
		begin
			aux^.sig:= l;
			l:= aux;
		end;
end;

procedure agregarnodolista(var a: arbol; aux: pedido);
var
	ped2: pedido2;
begin
	if(a = nil) then
		begin
			ped2.dia := aux.dia;
			ped2.cant := aux.cant;
			ped2.monto:= aux.monto;
			new(a); a^.hi:= nil; a^.hd:= nil; a^.numero:= aux.numero; a^.l:= nil;
			agregaradelante(a^.l, ped2);
		end
	else
		begin
			if(aux.numero > a^.numero) then
				agregarnodolista(a^.hd, aux)
			else
				agregarnodolista(a^.hi, aux);
		end;
end;

procedure cargararbol(var a: arbol; p: pedido);
var
	ok: boolean;
	nodo: arbol;
	ped2: pedido2;
begin
	buscar(a, p.numero, ok, nodo);
	if(ok = true) then
		begin
			ped2.dia := p.dia;
			ped2.cant := p.cant;
			ped2.monto := p.monto;
			agregaradelante(nodo^.l, ped2);
		end
	else
		agregarnodolista(a, p);
end;

procedure cargarTodo (var a: arbol);
var
	aux: pedido;
begin
	leerCliente(aux);
	if(aux.numero <> 0) then
		begin
			cargararbol(a, aux);
			cargarTodo(a);
		end;
end;

procedure imprimirlista(l: lista);
begin
	while(l <> nil) do
		begin
			write(l^.dato.monto:0:2, ' ~ ');
			l:= l^.sig;
		end;
end;

procedure imprimirarbol(a: arbol);
begin
	if(a<> nil) then
		begin
            imprimirarbol(a^.hi);
            write(a^.numero, ': ');
            imprimirlista(a^.l);
            imprimirarbol(a^.hd);
		end;
end;

procedure procesararbol (a : arbol; num : integer; var l : lista);
begin
	if(a <> nil) then
		begin
			if(a^.numero = num) then
				l := a^.l
			else
				begin
					if(num > a^.numero) then
						procesararbol(a^.hd, num, l)
					else
						procesararbol(a^.hi, num, l);
				end;
		end
	else
		l := nil;
end;

function procesarlista(l : lista): real;
begin
	if(l <> nil) then
		begin
			procesarlista := procesarlista(l^.sig) + l^.dato.monto;
		end
	else
		procesarlista := 0;
end;

var
	a:arbol;
	lista2 : lista;
	num : integer;
begin
	randomize;
	a:= nil;
	cargarTodo(a);
	imprimirarbol(a);
	lista2 := nil;
	num := 2;
	procesararbol(a, num, lista2);
	imprimirlista(lista2);
	writeln('el cliente numero ',num,' pago un total ', procesarlista(lista2):0:2);
end.