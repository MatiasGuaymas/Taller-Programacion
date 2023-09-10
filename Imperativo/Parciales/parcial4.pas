program ejparcial;
type 

	pizzeria = record
		fecha : integer;
		monto : real;
		nombre : string;
		dni : integer;
		end;

	pedidos = record
		fecha : integer;
		monto : real;
		end;
	
	lis = ^nodoinformacion;
	
	nodoinformacion = record
		sig : lis;
		dato : pedidos;
		end;
	
	informacion = record
		nombre : string;
		dni : integer;
		l : lis;
		end;
		
	arb = ^nodoarbol;
	
	nodoarbol = record
		dato : informacion;
		hi : arb;
		hd : arb;
		end;
	
	
procedure leer(var p : pizzeria);
begin
	writeln('ingrese nombre');
	readln(p.nombre);
    writeln('Ingrese un DNI: ');
    readln(p.dni);
    writeln('Ingrese una fecha: ');
	readln(p.fecha);
	p.monto := random(999) + 1000;
end;


procedure agregaradelante(var l : lis; p : pedidos);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := p;
	if( l = nil) then
		l := aux
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;


procedure agregarnodo(var a : arb; i : informacion);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dato := i;
		end
	else
		begin
			if(i.dni > a^.dato.dni) then
				agregarnodo(a^.hd, i)
			else
				agregarnodo(a^.hi, i);
		end;
end;
		
procedure buscar(a : arb; var nodo : arb; var ok : boolean; dni : integer);
begin
	if(a <> nil) then
		begin
			if(a^.dato.dni = dni) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(dni > a^.dato.dni) then
						buscar(a^.hd, nodo, ok, dni)
					else
						buscar(a^.hi, nodo, ok, dni);
				end;
		end
	else
		ok := false;
		nodo := nil;	
end;

procedure cargararbol(var a : arb; i : informacion; p : pedidos);
var
	ok : boolean;
	nodo : arb;
begin
	buscar(a, nodo, ok, i.dni);
	if(ok = true) then
		agregaradelante(nodo^.dato.l, p)
	else
		agregarnodo(a, i);
end;

procedure carga(var a: arb);
var
	i : informacion;
	pz : pizzeria;
	p : pedidos;
begin
	leer(pz);
	if(pz.monto <> 0) then
		begin
			p.fecha := pz.fecha;
			p.monto := pz.monto;
			i.dni := pz.dni;
			i.nombre := pz.nombre;
			i.l := nil;
			cargararbol(a, i, p);
            carga(a);
		end;
end;

function fechalista(l : lis; fecha : integer) : integer;
var
	cant : integer;
begin
	cant := 0;
	while(l <> nil) do
		begin
			if(l^.dato.fecha = fecha) then
				cant := cant + 1;
			l := l^.sig;
		end;
	fechalista := cant;
end;

function cantfecha(a : arb ; fecha : integer) : integer;
begin
	if(a <> nil) then
		begin
			cantfecha := cantfecha(a^.hd, fecha) + cantfecha(a^.hi, fecha) + fechalista(a^.dato.l, fecha);
		end
	else
		cantfecha := 0;
end;

procedure procesarlista(l : lis; var cant: integer; var total : real);
begin
	while(l <> nil) do
		begin
			total := total + l^.dato.monto;
			cant := cant + 1;
			l := l^.sig;
		end;
end;

procedure procesararbol(a : arb; var cant: integer; var total : real; dni : integer);
begin
	if(a <> nil) then
		begin
			if(a^.dato.dni = dni) then
				procesarlista(a^.dato.l, cant, total)
			else
				begin
					if(dni > a^.dato.dni) then
						procesararbol(a^.hd, cant, total, dni)
					else
						procesararbol(a^.hi, cant, total, dni);
				end;
		end;
end;

var
	a : arb;
	dni,fecha, cant: integer;
    total: real;
begin
	a := nil;
	total := 0;
	cant := 0;
	carga(a);
	dni := 4;
	fecha := 5;
	Writeln('en el dia ',fecha, ' hubo ', cantfecha(a, fecha),' pedidos');
	procesararbol(a, cant, total, dni);
	writeln('el dni ',dni,' hizo ',cant,' pedidos y gasto ',total:0:2);
end.