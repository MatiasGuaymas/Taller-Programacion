program parcial9;
type
	pedido = record
		dni: integer;
		nombre: string;
		fecha: integer;
		monto: real;
	end;
	data = record
		fecha: integer;
		monto: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: data;
		sig: lista;
	end;
	cliente = record
		dni: integer;
		nombre: string;
		l: lista;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: cliente;
		hi: arbol;
		hd: arbol;
	end;
{procedure leerPedido(var p: pedido);
begin
	writeln('Ingrese el monto a abonar por el pedido');
	readln(p.monto);
	if(p.monto <> 0) then
		begin
			writeln('Ingrese el DNI del cliente');
			readln(p.dni);
			writeln('Ingrese el nombre del cliente');
			readln(p.nombre);
			writeln('Ingrese la fecha del pedido');
			readln(p.fecha);
		end;
end;}
procedure agregarAdelante(var l: lista; d: data);
var
	aux: lista;
begin
	new(aux);
	aux^.sig:= l;
	l:= aux;
	aux^.dato:= d;
end;
procedure agregarArbol(var a: arbol; p: pedido);
var
	d: data;
begin
	if(a=nil) then
		begin
			new(a);
			a^.hi:= nil;
			a^.hd:= nil;
			a^.dato.dni:= p.dni;
			a^.dato.nombre:= p.nombre;
			a^.dato.l:= nil;
			d.fecha:= p.fecha;
			d.monto:= p.monto;
			agregarAdelante(a^.dato.l, d);
		end
	else
		if(p.dni = a^.dato.dni) then
			begin
				d.fecha:= p.fecha;
				d.monto:= p.monto;
				agregarAdelante(a^.dato.l, d);
			end
		else
			if(p.dni < a^.dato.dni) then
				agregarArbol(a^.hi, p)
			else
				agregarArbol(a^.hd, p);
end;
procedure leerPedido(var p: pedido);
begin
	p.monto:= Random(15) * 5;
	if(p.monto <> 0) then
		begin
			p.dni:= Random(3) + 1;
			p.nombre:= 'zzz';
			p.fecha:= Random(31)+1;
		end;
end;
procedure imprimirPedido(p: pedido);
begin
	writeln('DNI=', p.dni, ' FECHA=', p.fecha, ' MONTO=', p.monto:0:2);
end;
procedure cargarArbol(var a: arbol);
var
	p: pedido;
begin
	leerPedido(p);
	imprimirPedido(p);
	while(p.monto <> 0) do
		begin
			agregarArbol(a, p);
			leerPedido(p);
			imprimirPedido(p);
		end;
end;
procedure verificarListaFecha(l: lista; fecha: integer; var cant: integer);
begin
	while(l<>nil) do
		begin
			if(l^.dato.fecha = fecha) then
				cant:= cant+1;
			l:= l^.sig;
		end;
end;
procedure cantClientesFecha(a: arbol; fecha: integer; var cant: integer);
begin
	if(a<>nil) then
		begin
			verificarListaFecha(a^.dato.l, fecha, cant);
			cantClientesFecha(a^.hi, fecha, cant);
			cantClientesFecha(a^.hd, fecha, cant);
		end;
end;
procedure calcularInfo(l: lista; var monto: real; var cant: integer);
begin
	while(l<>nil) do
		begin
			cant:= cant+1;
			monto:= monto + l^.dato.monto;
			l:= l^.sig;
		end;
end;
procedure infoDNI(a: arbol; dni: integer; var monto: real; var cant: integer);
begin
	if(a <> nil) then
		begin
			if(a^.dato.dni = dni) then
				calcularInfo(a^.dato.l, monto, cant)
			else
				if (dni < a^.dato.dni) then
					infoDNI(a^.hi, dni, monto, cant)
				else
					infoDNI(a^.hd, dni, monto, cant);
		end;
end;
procedure imprimirLista(l: lista);
begin
	while(l<>nil) do
		begin
			write(' | FECHA=', l^.dato.fecha, ' MONTO=', l^.dato.monto:0:2);
			l:= l^.sig;
		end;
end;
procedure imprimirCliente(c: cliente);
begin
	write('DNI=', c.dni);
	imprimirLista(c.l);
	writeln();
end;
procedure imprimirArbol(a: arbol);
begin
	if(a<>nil) then 
		begin
			imprimirArbol(a^.hi);
			imprimirCliente(a^.dato);
			imprimirArbol(a^.hd);
		end;
end;
var
	a: arbol;
	fecha, dni, cant: integer;
	monto: real;
begin
	Randomize;
	cargarArbol(a);
	writeln('------------------');
	imprimirArbol(a);
	writeln('------------------');
	writeln('Ingrese una fecha');
	readln(fecha);
	cant:= 0;
	cantClientesFecha(a, fecha, cant);
	writeln('La cantidad de clientes que realizaron pedidos en la fecha ', fecha, ' es: ', cant);
	writeln('------------------');
	writeln('Ingrese un DNI');
	readln(dni);
	monto:= 0;
	cant:= 0;
	infoDNI(a, dni, monto, cant);
	writeln('El cliente con DNI ', dni, ' realizo ', cant, ' pedidos y gasto: ', monto:0:2);
end.

