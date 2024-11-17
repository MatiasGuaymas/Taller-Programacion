{5. Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un
mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI)}

program ejercicio5;
type
	reclamo = record
		codigo: integer;
		dni: integer;
		anio: integer;
		tipo: integer;
	end;
	reclamo2 = record
		codigo: integer;
		anio: integer;
		tipo: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: reclamo2;
		sig: lista;
	end;
	dniReclamo = record
		dni: integer;
		cant: integer;
		l: lista;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: dniReclamo;
		hi: arbol;
		hd: arbol;
	end;
procedure leerReclamo(var r: reclamo);
begin
	r.codigo:= Random(10)-1;
	if(r.codigo <> -1) then
		begin
			writeln('Ingrese un numero de DNI');
			readln(r.dni);
			r.anio:= Random(25)+2000;
			r.tipo:= Random(5)+1;
		end;
end;
procedure imprimirReclamo(r: reclamo);
begin
	writeln('CODIGO=', r.codigo, ' DNI=', r.dni, ' ANIO=', r.anio, ' TIPO=', r.tipo);
end;
procedure agregarAdelante(var l: lista; r: reclamo2);
var
	aux: lista;
begin
	new(aux);
	aux^.sig:= l;
	l:= aux;
	aux^.dato:= r;
end;
procedure agregarArbol(var a: arbol; r: dniReclamo);
begin
	if(a = nil) then
		begin
			new(a);
			a^.hi:= nil;
			a^.hd:= nil;
			a^.dato:= r;
		end
	else
		if(r.dni < a^.dato.dni) then
			agregarArbol(a^.hi, r)
		else
			agregarArbol(a^.hd, r);
end;
procedure cargarArbol(var a: arbol);
var
	r: reclamo;
	reclamoSinDni: reclamo2;
	rec: dniReclamo;
	cant, dniActual: integer;
	l: lista;
begin
	leerReclamo(r);
	imprimirReclamo(r);
	while(r.codigo <> - 1) do 
		begin
			cant:= 0;
			dniActual:= r.dni;
			l:= nil;
			while(r.codigo <> - 1) and (dniActual = r.dni) do
				begin
					cant:= cant+1;
					reclamoSinDni.codigo:=r.codigo;
					reclamoSinDni.anio:=r.anio;
					reclamoSinDni.tipo:=r.tipo;
					agregarAdelante(l, reclamoSinDni);
					leerReclamo(r);
					imprimirReclamo(r);
				end;
			rec.dni:= dniActual;
			rec.cant:= cant;
			rec.l:= l;
			agregarArbol(a, rec);
		end;
end;
procedure imprimirLista(l: lista);
begin
	while(l<>nil) do
		begin
			write(' | CODIGO=', l^.dato.codigo, ' ANIO=', l^.dato.anio, ' TIPO=', l^.dato.tipo);
			l:= l^.sig;
		end;
end;
procedure imprimirDNIReclamo(r: dniReclamo);
begin
	write('DNI=', r.dni, ' CANT=', r.cant);
	imprimirLista(r.l);
	writeln();
end;
procedure imprimirArbol(a: arbol);
begin
	if(a<>nil) then
		begin
			imprimirArbol(a^.hi);
			imprimirDNIReclamo(a^.dato);
			imprimirArbol(a^.hd);
		end;
end;
var
	a: arbol;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);
	writeln('-----------------');
	imprimirArbol(a);
end.