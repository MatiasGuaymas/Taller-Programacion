{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program ejercicio2;
type

	ANIO = 2010..2018;
	
	auto = record
		patente : integer;
		fecha : ANIO;
		marca : string;
		modelo : string;
		end;
		
	
	automarca = record
		patente : integer;
		fecha : ANIO;
		modelo : string;
		end;
	
	
	arbpatente = ^nodopatente;
	
	nodopatente = record
		hi : arbpatente;
		hd : arbpatente;
		dato : auto;
		end;
	
	
	lis = ^nodolista;
	
	nodolista = record
		sig :lis;
		dato : automarca;
		end;
	
	arboldelista = ^nodoarbollista;
	
	nodoarbollista = record
		hi : arboldelista;
		hd : arboldelista;
		marca : string;
		l : lis;
		end;
		
		
	infofabricacion = record
			marca : string;
			modelo : string;
			patente : integer;
			end;
	
	listafabricacion = ^nodofabricacion;
	
	nodofabricacion = record
		sig : listafabricacion;
		fecha : ANIO;
		info : infofabricacion;
		end;
	
	
procedure leer(var a : auto);
begin
	writeln('ingrese patente: ');
	readln(a.patente);
	writeln('ingrese marca: ');
	readln(a.marca);
	writeln('ingrese modelo: ');
	readln(a.modelo);
	writeln('ingrese fecha: ');
	readln(a.fecha);
end;


procedure buscar(a : arboldelista; marca : string; var ok : boolean; var nodo : arboldelista);
begin
	if(a <> nil) then
		begin
			if(a^.marca = marca) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(marca > a^.marca) then
						buscar(a^.hd, marca, ok ,nodo)
					else
						buscar(a^.hi, marca, ok ,nodo);
				end;
		end
	else
		begin
			ok := false;
			nodo := nil;
		end;
end;
					
procedure agregaradelante(var l : lis; a : automarca);
var
    aux : lis;
begin
    new(aux); aux^.sig := nil; aux^.dato := a;
    if(l = nil) then
        l := aux
    else
        begin
            aux^.sig := l;
            l := aux;
        end;
end;

procedure agregarnodolista(var a : arboldelista; aux : auto);
var
	autom : automarca;
begin
	if(a = nil) then
		begin
			autom.patente := aux.patente;
			autom.fecha := aux.fecha;
			autom.modelo := aux.modelo;
			new(a); a^.hi := nil; a^.hd := nil;a^.marca := aux.marca; a^.l:= nil;
			agregaradelante(a^.l, autom);
		end
	else
		begin
			if(aux.marca > a^.marca) then
				agregarnodolista(a^.hd, aux)
			else
				agregarnodolista(a^.hi, aux);
		end;
end;


procedure agregarnodo(var a : arbpatente; aux : auto);
begin
	if(a = nil) then
		begin
			new(a);a^.hi := nil;a^.hd := nil; a^.dato := aux;
		end
	else
		begin
			if(aux.patente <= a^.dato.patente) then
				agregarnodo(a^.hi, aux)
			else
				agregarnodo(a^.hd, aux);
		end;
end;


procedure cargararboles(var a : arbpatente;var arbl : arboldelista; aux : auto);
var
	ok : boolean;
	nodo : arboldelista;
	autom : automarca;
begin
	agregarnodo(a, aux);
	buscar(arbl, aux.marca, ok, nodo);
	if(ok = true) then
		begin
			autom.fecha := aux.fecha;
			autom.modelo := aux.modelo;
			autom.patente := aux.patente;
			agregaradelante(nodo^.l, autom);
		end
	else
		agregarnodolista(arbl, aux);
end;

procedure cargageneral(var a : arbpatente; var arbl : arboldelista);
var
	aux : auto;
begin
	leer(aux);
	if(aux.patente <> 0) then
		begin
			cargararboles(a, arbl, aux);
			cargageneral(a, arbl);
		end;
end;


procedure imprimirarbol(a : arbpatente);
begin
	if(a <> nil) then
		begin
			writeln(a^.dato.patente);
			imprimirarbol(a^.hd);
			imprimirarbol(a^.hi);
		end;
end;

procedure imprimirlistas(l : lis);
begin
	while(l <> nil) do
		begin
			writeln(l^.dato.patente);
			l := l^.sig;
		end;
end;

procedure imprimirarbollista(a : arboldelista);
begin
	if(a <> nil) then
		begin
		    writeln(a^.marca);
			imprimirlistas(a^.l);
			imprimirarbollista(a^.hd);
			imprimirarbollista(a^.hi);
		end;
end;

function procesarlista(l : lis) : integer;
var
	cant : integer;
begin
	cant := 0;
	while(l <> nil) do
		begin
			cant := cant + 1;
			l := l^.sig;
		end;
	procesarlista := cant;
end;

function cantmarca(a : arboldelista; marca : string) : integer;
begin
	if(a <> nil) then
		begin
			if(a^.marca = marca) then
				cantmarca := procesarlista(a^.l)
			else
				begin
					if(marca > a^.marca) then
						cantmarca(a^.hd, marca)
					else
						cantmarca(a^.hi, marca);
				end;
		end
	else
		cantmarca := 0;
end;

procedure agregaratras(var l : listafabricacion; elem : infofabricacion; fecha : ANIO);
var
	ult, aux : listafabricacion;
begin
	new(aux); aux^.sig:= nil; aux^.fecha := fecha; aux^.info := elem;
	if(l = nil) then
		l := aux
	else
		begin
			ult := l;
			while(ult^.sig <> nil) do
				ult := ult^.sig;
			ult^.sig := aux;
		end;
end;
			

procedure fabricacion(a : arbpatente; var listaf : listafabricacion; fecha : ANIO);
var
	info : infofabricacion;
begin
	if(a <> nil) then
		begin
			if(a^.dato.fecha = fecha) then
				begin
					info.marca := a^.dato.marca;
					info.modelo := a^.dato.modelo;
					info.patente := a^.dato.patente;
					agregaratras(listaf, info, fecha);
					fabricacion(a^.hi, listaf, fecha);
					fabricacion(a^.hd, listaf, fecha);
				end
			else
				begin
					fabricacion(a^.hi, listaf, fecha);
					fabricacion(a^.hd, listaf, fecha);
				end;
		end;
end;
			
procedure imprimirfabricacion(l : listafabricacion);
begin
	while(l <> nil) do
		begin
			writeln(l^.info.patente);
			l := l^.sig;
		end;
end;

function buscarpatente(a : arbpatente; patente : integer) : string;
begin
	if(a <> nil ) then
		begin
			if(a^.dato.patente = patente) then	
				buscarpatente := a^.dato.modelo
			else
				begin
					if(patente > a^.dato.patente) then
						buscarpatente(a^.hd, patente)
					else
						buscarpatente(a^.hi, patente);
				end;
		end
	else
		buscarpatente := 'no se encontro la patente';
end;
					
procedure busquedadepatente(l : lis; patente : integer; var ok : boolean; var modelo : string);
begin
	while(l <> nil) and (ok = false) do
		begin
			if(l^.dato.patente = patente) then
				begin
					ok := true;
					modelo := l^.dato.modelo;
				end
			else
				l := l^.sig;
		end;
end;
					
					
function buscarpatentelistas(a : arboldelista; patente : integer) : string;
var
	ok : boolean;
	modelo : string;
begin
	if(a <> nil) then
		begin
			busquedadepatente(a^.l, patente, ok, modelo);
			if(ok) then
				buscarpatentelistas := modelo
			else
				begin
					buscarpatentelistas := buscarpatentelistas(a^.hd, patente);
					buscarpatentelistas := buscarpatentelistas(a^.hi, patente);
				end;
		end;
end;


var
	a : arbpatente;
	arbl : arboldelista;
	marca : string;
	listaf : listafabricacion;
	fecha : ANIO;
	patente : integer;
begin
	a := nil;
	arbl := nil;
	cargageneral(a, arbl);
	imprimirarbol(a);
	imprimirarbollista(arbl);
	marca := 'kia';
	writeln('hay ', cantmarca(arbl, marca),' autos de la marca ',marca);
	listaf := nil;
	fecha := 2018;
	fabricacion(a, listaf, fecha);
	imprimirfabricacion(listaf);
	patente := 2;
	writeln('el auto con la patente: ',patente,' es del modelo ',buscarpatente(a, patente));
	writeln('el auto con la patente: ',patente,' es del modelo ',buscarpatentelistas(arbl, patente));
end.