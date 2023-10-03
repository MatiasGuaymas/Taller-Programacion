program ej2;
type

	z = 1..5;

	propiedad = record
		zona : z;
		codeP : integer;
		tipo : string;
		metros : real;
		precio : real;
		end;
		
	lis = ^nodo;
	
	
	nodo = record
		p : propiedad;
		sig : lis;
		end;
		
		
	lista2 = ^nodo2
	
	nodo2 = record
		codeprop : integer;
		sig : lista2;
		end;
		

procedure leer(var p : propiedad);
begin
	read(p.zona);
	read(p.codeP);
	read(p.tipo);
	read(p.metros);
	read(.precio);
end;


procedure insertar (var l : lis; elem : propiedad);
var
	aux, ant, act : lis;
begin
	new(aux); aux^.sig := nil; aux^.p := elem;
	if (l = nil) then
		l := aux;
	else
		begin
			act := l;
			ant := act;
			
			while (act <> nil) and (act^.p.zona < aux^.p.zona) and (act^.p.tipo <> aux^.p.tipo) do
				begin
					ant := act;
					act := act^.sig;
				end;
		end;
		
	if(act = l) then
		begin
			aux^.sig := l;
			l := aux;
		end;
	
	else
		begin
			ant^.sig := aux;
			aux^.sig := act;
		end;
end;


procedure cargarLista(var l : lis);
var
	aux := propiedad;
begin
	l := nil;
	leer(aux);
	while (aux.metro <> -1) do
		begin
			insertar(l, aux);
			leer(aux);
		end;
end;


procedure agregar ( var pri : lista2, elem : integer);
var
	aux : lista2;
begin
	new(aux); aux^.sig := nil; aux^.codeprop := elem;
	if (pri = nil) then
		pri := aux;
	else
		begin
			aux^.sig := pri;
			pri := aux;			
		end;
end;

procedure procesar (l : lis; numz : z; tipo : string; var pri : lista2);
begin
	while( l <> nil) do
		begin
			if (l^.p.zona = numz) and (l^.p.tipo = tipo) then
				agregar(pri, l^.p.codep);
			l := l^.sig;
		end;
end;


var
	l : lis;
	pri : lista2;
	numerozona : integer;
	tipo : string;
begin
	pri := nil;
	cargarLista(l);
	read(numerozona);
	read(tipo);
	procesar(l,numerozona,tipo,pri);
end;
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					

