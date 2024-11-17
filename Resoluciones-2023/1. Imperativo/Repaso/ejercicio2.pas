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
    subAnio = 2010..2018;
    auto = record
        patente: integer;
        anio: subAnio;
        marca: string;
        modelo: string;
    end;
    arbol1 = ^nodoArbol1;
    nodoArbol1 = record
        dato: auto;
        hi: arbol1;
        hd: arbol1;
    end;
    
    auto2= record
        patente: integer;
        anio: subAnio;
        modelo: string;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: auto2;
        sig: lista;
    end;
    
    autoMarca = record
        marca: string;
        l: lista;
    end;
    
    arbol2 = ^nodoArbol2;
    nodoArbol2 = record 
        dato: autoMarca;
        hi: arbol2;
        hd: arbol2;
    end;
    
    auto3= record
        patente: integer;
        marca: string;
        modelo: string;
    end;
    
    listaAnio = ^nodoAnio;
    nodoAnio = record
        dato: auto3;
        sig: listaAnio;
    end;
    
    autoAnio = record
        anio: subAnio;
        l: listaAnio;
    end;
    
    arbol3 = ^nodoArbol3;
    nodoArbol3 = record
        dato: autoAnio;
        hi: arbol3;
        hd: arbol3;
    end;
procedure imprimirAuto(a: auto);
begin
	writeln('PATENTE=', a.patente, ' ANIO=', a.anio, ' MARCA=', a.marca, ' MODELO=', a.modelo);
end;
procedure leerAuto(var a: auto);
begin
    writeln('Ingrese una patente');
    readln(a.patente);
    if(a.patente <> 0) then
        begin
            a.anio:= Random(9)+2010;
            writeln('Ingrese una marca de auto');
            readln(a.marca);
            a.modelo:= 'zzz';
        end;
end;
procedure agregarArbolI(var a: arbol1; au: auto);
begin
    if(a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato:= au;
        end
    else
        if(au.patente <= a^.dato.patente) then
            agregarArbolI(a^.hi, au)
        else
            agregarArbolI(a^.hd, au);
end;
procedure agregarAdelante(var l: lista; a: auto2);
var
    aux: lista;
begin
    new(aux);
    aux^.sig:= l;
    aux^.dato:= a;
    l:= aux;
end;
procedure agregarArbolII(var a: arbol2; au: auto);
var
    aux: auto2;
begin
    if(a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.marca:= au.marca;
            a^.dato.l:= nil;
            aux.patente:= au.patente;
            aux.anio:= au.anio;
            aux.modelo:= au.modelo;
            agregarAdelante(a^.dato.l, aux);
        end
    else
        if(a^.dato.marca = au.marca) then
            begin
                aux.patente:= au.patente;
                aux.anio:= au.anio;
                aux.modelo:= au.modelo;
                agregarAdelante(a^.dato.l, aux);
            end
        else
            if(au.marca < a^.dato.marca) then
                agregarArbolII(a^.hi, au)
            else
                agregarArbolII(a^.hd, au);
end;
procedure cargarEstructuras(var a1: arbol1; var a2: arbol2);
var
    au: auto;
begin
    leerAuto(au);
	imprimirAuto(au);
    while(au.patente <> 0) do
        begin
            agregarArbolI(a1, au);
            agregarArbolII(a2, au);
            leerAuto(au);
			imprimirAuto(au);
        end;
end;
procedure cantAutoMarcaI(a: arbol1; marca: string; var cant: integer);
begin
    if(a <> nil) then
        begin
            if(a^.dato.marca = marca) then
                cant:= cant + 1;
            cantAutoMarcaI(a^.hi, marca, cant);
            cantAutoMarcaI(a^.hd, marca, cant);
        end;
end;
procedure contarCantLista(l: lista; var cant: integer);
begin
    while(l<>nil) do
        begin
            cant:= cant+1;
            l:= l^.sig;
        end;
end;
procedure cantAutoMarcaII(a: arbol2; marca: string; var cant: integer);
begin
    if(a <> nil) then
        begin
             if(a^.dato.marca = marca) then
                contarCantLista(a^.dato.l, cant)
            else
                if(marca < a^.dato.marca) then
                    cantAutoMarcaII(a^.hi, marca, cant)
                else
                    cantAutoMarcaII(a^.hd, marca, cant);
        end;
end;
procedure agregarAdelanteII(var l: listaAnio; a: auto3);
var
    aux: listaAnio;
begin
    new(aux);
    aux^.sig:= l;
    l:= aux;
    aux^.dato:= a;
end;
procedure agregarArbolIII(a: auto; var a3: arbol3);
var
    au: auto3;
begin
    if(a3 = nil) then
        begin
            new(a3);
            a3^.hi:= nil;
            a3^.hd:= nil;
			a3^.dato.l:= nil;
            a3^.dato.anio:= a.anio;
            au.patente:= a.patente;
            au.modelo:= a.modelo;
            au.marca:= a.marca;
            agregarAdelanteII(a3^.dato.l, au);
        end
    else
        if(a3^.dato.anio = a.anio) then
            begin
                au.patente:= a.patente;
                au.modelo:= a.modelo;
                au.marca:= a.marca;
                agregarAdelanteII(a3^.dato.l, au);
            end
        else
            if(a.anio < a3^.dato.anio) then
                agregarArbolIII(a, a3^.hi)
            else
                agregarArbolIII(a, a3^.hd);
end;
procedure generarArbolAnio(a: arbol1; var a3: arbol3);
begin
    if(a <> nil) then
        begin
            agregarArbolIII(a^.dato, a3);
            generarArbolAnio(a^.hi, a3);
            generarArbolAnio(a^.hd, a3);
        end;
end;
procedure encontrarPatente(a1: arbol1; patente: integer; var modelo: string; var ok: boolean);
begin
    if(a1 <> nil) then
        begin
            if(a1^.dato.patente = patente) then
				begin
					modelo:= a1^.dato.modelo;
					ok:= true;
				end
            else
                if(patente < a1^.dato.patente) then
                    encontrarPatente(a1^.hi, patente, modelo, ok)
                else
                    encontrarPatente(a1^.hd, patente, modelo, ok);
        end;
end;
procedure buscarPatente(l: lista; patente: integer; var modelo: string; var ok: boolean);
begin
    while(l <> nil) and (not ok) do
        begin
            if(l^.dato.patente = patente) then
                begin
                    modelo:= l^.dato.modelo;
                    ok:= true;
                end
            else
                l:= l^.sig;
        end;
end;
procedure encontrarPatenteArbII(a: arbol2; patente: integer; var modelo: string; var ok: boolean);
begin
    if(a <> nil) and (not ok) then
        begin
            buscarPatente(a^.dato.l, patente, modelo, ok);
            if(not ok) then
                begin
                    encontrarPatenteArbII(a^.hi, patente, modelo, ok);
                    encontrarPatenteArbII(a^.hd, patente, modelo, ok);
                end;
 		end;
end;
procedure imprimirArbolI(a: arbol1);
begin
	if(a<>nil) then
		begin
			imprimirArbolI(a^.hi);
			imprimirAuto(a^.dato);
			imprimirArbolI(a^.hd);
		end;
end;
procedure imprimirListaMarca(l: lista);
begin	
	while(l<>nil) do
		begin
			write(' | PATENTE=', l^.dato.patente, ' ANIO=', l^.dato.anio, ' MODELO=', l^.dato.modelo);
			l:= l^.sig;
		end;
end;
procedure imprimirAutoMarca(a: autoMarca);
begin
	write('MARCA=', a.marca);
	imprimirListaMarca(a.l);
	writeln();
end;
procedure imprimirArbolII(a: arbol2);
begin
	if(a<>nil) then
		begin
			imprimirArbolII(a^.hi);
			imprimirAutoMarca(a^.dato);
			imprimirArbolII(a^.hd);
		end;
end;
procedure imprimirListaAnio(l: listaAnio);
begin	
	while(l<>nil) do
		begin
			write(' | PATENTE=', l^.dato.patente, ' MARCA=', l^.dato.marca, ' MODELO=', l^.dato.modelo);
			l:= l^.sig;
		end;
end;
procedure imprimirAutoAnio(a: autoAnio);
begin
	write('ANIO=', a.anio);
	imprimirListaAnio(a.l);
	writeln();
end;
procedure imprimirArbolIII(a: arbol3);
begin
	if(a <> nil) then
		begin
			imprimirArbolIII(a^.hi);
			imprimirAutoAnio(a^.dato);
			imprimirArbolIII(a^.hd);
		end;
end;
var
	a1: arbol1;
	a2: arbol2;
	a3: arbol3;
	marca, modelo: string;
	cant, patente: integer;
	ok: boolean;
begin
    Randomize;
	a1:= nil;
	a2:= nil;
	cargarEstructuras(a1, a2);

	writeln('------------------');
	imprimirArbolI(a1);

	writeln('------------------');
	imprimirArbolII(a2);
	
	writeln('------------------');
	writeln('Ingrese una marca de auto');
	readln(marca);
	cant:= 0;
	cantAutoMarcaI(a1, marca, cant);
	writeln('Para la marca de autos ', marca, ' la agencia posee ', cant, ' autos');

	writeln('------------------');
	writeln('Ingrese otra marca de auto');
	readln(marca);
	cant:= 0;
	cantAutoMarcaII(a2, marca, cant);
	writeln('Para la marca de autos ', marca, ' la agencia posee ', cant, ' autos');

	writeln('------------------');
	a3:= nil;
	writeln('Informacion de los autos agrupados por anio de fabricacion: ');
	generarArbolAnio(a1, a3);
	imprimirArbolIII(a3);

	writeln('------------------');
	writeln('Ingrese un numero de patente');
	readln(patente);
	ok:= false;
	encontrarPatente(a1, patente, modelo, ok);
	if(ok) then writeln('El modelo del auto de la patente ', patente, ' es: ', modelo) else writeln('No se encontro un auto con la patente ', patente);

	writeln('------------------');
	writeln('Ingrese otro numero de patente');
	readln(patente);
	ok:= false;
	encontrarPatenteArbII(a2, patente, modelo, ok);
	if(ok) then writeln('El modelo del auto de la patente ', patente, ' es: ', modelo) else writeln('No se encontro un auto con la patente ', patente);
end.