{5. Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un
mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI)}

program ejercicio5;
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
			
		
		
procedure leer(var r : reclamo; var dni : integer);
begin
	r.code := random(10) - 1;
	{writeln('ingrese codigo: ');
	readln(r.code);}
	{writeln('ingrese anio: ');
	readln(r.fecha);}
	r.fecha := random(30) + 1;
	r.tipo := random(11);
    writeln('ingresa dni: ');
    readln(dni);
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
			new(a); a^.hi := nil; a^.hd := nil; a^.dni := dni; new(a^.l); a^.l^.dato := r;a^.l^.sig := nil;
		end
	else
		begin
			if(dni <= a^.dni) then
				agregarnodo(a^.hi, r, dni)
			else
				agregarnodo(a^.hd, r, dni);
		end;
end;
		
		
	
	
procedure cargar2(var a : arb);
begin
	leer(r, dni);
	if(a <> nil) then
		begin
			if(dni <> -1) then
				begin
					actual := dni;
					while(dni = actual) do
						begin
							agregaradelante(a^.l, r)
							leer(r, dni);
						end;
					if(dni > a^.dni) then
						cargar(a^.hd)
					else
						cargar(a^.hi);
				end;
		end
	else
		if(dni <> -1) then
			begin
				agregarnodo(a, r, dni);
				cargar2(a);
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

procedure imprimir(a : arb);
begin
	if(a <> nil) then
		begin
			imprimirlistas(a^.l);
			imprimir(a^.hd);
			imprimir(a^.hi);
		end;
end;
	
	
var
	a : arb;
begin
	cargar2(a);
	imprimir(a);
end.