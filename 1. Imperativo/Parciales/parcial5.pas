program parcial;
type
	compra = record
		dni: integer;
		dia: integer;
		cant: integer;
		monto: real;
	end;
	
	compra2 = record
		dia: integer;
		cant: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: compra2;
		sig: lista;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		l: lista;
		dni: integer;
		hi: arbol;
		hd: arbol;
	end;

procedure leerCompra(var c: compra);
begin
	c.cant := random(30);
	if(c.cant <> 0) then
		begin
			c.dni := random(20) + 1;
			c.dia := random (31) + 1;
			c.monto := random(100) + 10.50;
		end;
end;

procedure buscar(a: arbol; dni: integer; var ok: boolean; var nodo: arbol);
begin
	if(a <> nil) then
		begin
			if(a^.dni = dni) then
				begin
					ok:= true;
					nodo:= a;
				end
			else
				begin
					if(dni > a^.dni) then
						buscar(a^.hd, dni, ok, nodo)
					else
						buscar(a^.hi, dni, ok, nodo);
				end;
		end
	else
		begin
			ok:= false;
			a:= nil;
		end;
end;

procedure agregaradelante(var l: lista; c: compra2);
var
	aux: lista;
begin
	new(aux); aux^.sig:= nil; aux^.dato := c;
	if (l = nil) then l:= aux
	else
		begin
			aux^.sig:= l;
			l:= aux;
		end;
end;

procedure agregarnodolista(var a: arbol; aux: compra);
var
	compraDNI : compra2;
begin
	if(a = nil) then
		begin
			compraDNI.dia:= aux.dia;
			compraDNI.monto := aux.monto;
			compraDNI.cant := aux.cant;
			new(a); a^.hi:= nil; a^.hd:= nil; a^.dni := aux.dni; a^.l:= nil;
			agregaradelante(a^.l, compraDNI);
		end
	else
		begin
			if(aux.dni > a^.dni) then
				agregarnodolista(a^.hd, aux)
			else
				agregarnodolista(a^.hi, aux);
		end;
end;

procedure cargararbol(var a: arbol; aux: compra);
var
	ok: boolean;
	nodo: arbol;
	compraDNI : compra2;
begin
	buscar(a, aux.dni, ok, nodo);
	if(ok = true) then
		begin
			compraDNI.dia:= aux.dia;
			compraDNI.cant := aux.cant;
			compraDNI.monto := aux.monto;
			agregaradelante(nodo^.l, compraDNI);
		end
	else
		agregarnodolista(a, aux);
end;

procedure cargarTodo(var a: arbol);
var
	aux: compra;
begin
	leerCompra(aux);
	if(aux.cant <> 0) then
		begin
			cargararbol(a, aux);
			cargarTodo(a);
		end;
end;

procedure imprimirlista(l: lista);
begin
	while(l <> nil) do
		begin
			write(l^.dato.cant, ' ~ ');
			l:= l^.sig;
		end;
end;

procedure imprimirarbol(a: arbol);
begin
	if(a<> nil) then
		begin
			write(a^.dni, ': ');
			imprimirlista(a^.l);
			imprimirarbol(a^.hd);
			imprimirarbol(a^.hi);
		end;
end;

procedure procesarCliente(a: arbol; code: integer; var l2: lista);
begin
    if(a <> nil) then
        begin
            if(a^.dni = code) then
                begin
                    l2:= a^.l;
                end
            else
                begin
                   if(code > a^.dni) then
                        procesarCliente(a^.hd, code, l2)
                    else
                        procesarCliente(a^.hi, code, l2);
                end;
        end
    else
        l2:= nil;
end;

procedure procesarLista(l: lista; var monto : real);
var
    cantMaxProd: integer;
begin
    cantMaxProd:= -1;
    while(l<>nil) do 
        begin
            if(l^.dato.cant > cantMaxProd) then
                begin
                    cantMaxProd:= l^.dato.cant;
                    monto:= l^.dato.monto;
                end;
            l:= l^.sig;
        end;
end;

{procedure procesarLista(l: lista; var max: integer; var monto: real);
begin
    if(l<>nil) then
        begin
            if(l^.dato.cant > max) then
                begin
                    max:= l^.dato.cant;
                    monto:= l^.dato.monto;
                    procesarLista(l^.sig, max, monto);
                end
            else
                procesarLista(l^.sig, max, monto);
        end;
end;}


var
	a: arbol;
    dni: integer;
    l2: lista;
    monto: real;
begin
    randomize;
	a:= nil;
	cargarTodo(a);
	imprimirarbol(a);
    dni:= 20;
    l2:= nil;
    procesarCliente(a, dni, l2);
    imprimirLista(l2);
    monto:= 0;
    procesarLista(l2, monto);
    writeln('________________________');
    writeln(monto:0:2);
end.
