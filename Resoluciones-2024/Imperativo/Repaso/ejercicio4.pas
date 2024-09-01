{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.}

program ejercicio4;
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
	listaAnio = ^nodoLista;
	nodoLista = record
		dato: integer;
		sig: listaAnio;
	end;
procedure leerReclamo(var r: reclamo);
begin
	r.codigo:= Random(30);
	if(r.codigo <> 0) then
		begin
			r.dni:= Random(15)+1;
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
procedure agregarArbol(var a: arbol; r: reclamo);
var
	rec: reclamo2;
begin
	if(a = nil) then
		begin
			new(a);
			a^.hi:= nil;
			a^.hd:= nil;
			a^.dato.l:= nil;
			a^.dato.cant:= 1;
			a^.dato.dni:= r.dni;
			rec.codigo:= r.codigo;
			rec.anio:= r.anio;
			rec.tipo:= r.tipo;
			agregarAdelante(a^.dato.l, rec);
		end
	else
		if(a^.dato.dni = r.dni) then
			begin
				a^.dato.cant:= a^.dato.cant + 1;
				rec.codigo:= r.codigo;
				rec.anio:= r.anio;
				rec.tipo:= r.tipo;
				agregarAdelante(a^.dato.l, rec);
			end
		else
			if(r.dni < a^.dato.dni) then
				agregarArbol(a^.hi, r)
			else
				agregarArbol(a^.hd, r)
end;
procedure cargarArbol(var a: arbol);
var
	r: reclamo;
begin
	leerReclamo(r);
	imprimirReclamo(r);
	while(r.codigo <> -1) do
		begin
			agregarArbol(a, r);
			leerReclamo(r);
			imprimirReclamo(r);
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
procedure contarCantDNI(a: arbol; dni: integer; var cant: integer);
begin
	if(a<>nil) then
		begin
			if(a^.dato.dni = dni) then
				cant:= a^.dato.cant
			else
				if(dni < a^.dato.dni) then
					contarCantDNI(a^.hi, dni, cant)
				else
					contarCantDNI(a^.hd, dni, cant);
		end;
end;
procedure entreDosDNI(a: arbol; dni1, dni2: integer; var cant: integer);
begin
	if (a<>nil) then
		begin
			if(a^.dato.dni >= dni1) and (a^.dato.dni <= dni2) then
				begin
					cant:= a^.dato.cant + cant;
					entreDosDNI(a^.hi, dni1, dni2, cant);
					entreDosDNI(a^.hd, dni1, dni2, cant);
				end
			else
				if(a^.dato.dni > dni1) then
					entreDosDNI(a^.hi, dni1, dni2, cant)
				else
					entreDosDNI(a^.hd, dni1, dni2, cant);
		end;
end;
procedure verificar(var num1, num2: integer);
var
	aux: integer;
begin
	if(num1 > num2) then
		begin
			aux:= num1;
			num1:= num2;
			num2:= aux;
		end;
end;
procedure agregarAdelanteII(var l: listaAnio; codigo: integer);
var
	aux: listaAnio;
begin
	new(aux);
	aux^.sig:= l;
	l:= aux;
	aux^.dato:= codigo;
end;
procedure generarListaAnioDNI(l: lista; anio: integer; var lis: listaAnio);
begin
	while(l <> nil) do
		begin
			if(l^.dato.anio = anio) then
				agregarAdelanteII(lis, l^.dato.codigo);
			l:= l^.sig;
		end;
end;
procedure generarListaAnioArb(a: arbol; anio: integer; var l: listaAnio);
begin
	if(a<>nil) then
		begin
			generarListaAnioDNI(a^.dato.l, anio, l);
			generarListaAnioArb(a^.hi, anio, l);
			generarListaAnioArb(a^.hd, anio, l);
		end;
end;
procedure imprimirListaAnio(l: listaAnio);
begin
	while(l<>nil) do
		begin
			write(' | CODIGO=', l^.dato);
			l:= l^.sig;
		end;
end;
var
	a: arbol;
	cant, dni, dni1, dni2, anio: integer;
	l: listaAnio;
begin
	Randomize;
	a:= nil;
	cargarArbol(a);

	writeln('-----------------');
	imprimirArbol(a);

	writeln('-----------------');
	writeln('Ingrese un DNI');
	readln(dni);
	cant:= 0;
	contarCantDNI(a, dni, cant);
	writeln('La persona con DNI ', dni, ' realizo ', cant, ' reclamos');

	writeln('-----------------');
	writeln('Ingrese un primer DNI');
	readln(dni1);
	writeln('Ingrese un segundo DNI');
	readln(dni2);
	verificar(dni1, dni2);
	cant:= 0;
	entreDosDNI(a, dni1, dni2, cant);
	writeln('La cantidad de reclamos total efectuados por las personas entre el DNI ', dni1, ' y DNI ', dni2, ' es: ', cant);
	
	writeln('-----------------');
	writeln('Ingrese un anio');
	readln(anio);
	l:= nil;
	generarListaAnioArb(a, anio, l);
	write('Lista para el anio ', anio, ': ');
	imprimirListaAnio(l);
end.