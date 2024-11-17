program parcial3;
type
    pasaje = record
        codeVuelo: integer;
        codeCliente: integer;
        codeCiudad: integer;
        monto: real;
    end;
    pasaje2 = record
        codeVuelo: integer;
        codeCliente: integer;
        monto: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: pasaje2;
        sig: lista;
    end;
    ciudad = record
        codeCiudad: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: ciudad;
        hi: arbol;
        hd: arbol;
    end;
procedure agregarAdelante(var l: lista; p: pasaje2);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;
procedure agregarArbol(var a: arbol; p: pasaje);
var
    pas: pasaje2;
begin
    if( a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.l:= nil;
            a^.dato.codeCiudad:= p.codeCiudad;
            pas.codeVuelo:= p.codeVuelo;
            pas.codeCliente:= p.codeCliente;
            pas.monto:= p.monto;
            agregarAdelante(a^.dato.l, pas);
        end
    else
        if(a^.dato.codeCiudad = p.codeCiudad) then
            begin
                pas.codeVuelo:= p.codeVuelo;
                pas.codeCliente:= p.codeCliente;
                pas.monto:= p.monto;
                agregarAdelante(a^.dato.l, pas);
            end
        else
            if(p.codeCiudad < a^.dato.codeCiudad) then
                agregarArbol(a^.hi, p)
            else
                agregarArbol(a^.hd, p);
end;
procedure cargarArbol(var a: arbol);
var
    p: pasaje;
    i: integer;
begin
    for i:= 1 to Random(12)+5 do
        begin
            p.codeVuelo:= Random(30)+1;
            p.codeCliente:= Random(20)+1;
            p.codeCiudad:= Random(5)+1;
            p.monto:= ((Random(5)+1) * p.codeCliente);
            writeln('VUELO=', p.codeVuelo, ' CODECLI=', p.codeCliente, ' CODECIUDAD=', p.codeCiudad, ' MONTO=', p.monto:0:2);
            agregarArbol(a, p);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l <> nil) do
        begin
            write(' | VUELO=', l^.dato.codeVuelo, ' CODECLI=', l^.dato.codeCliente, ' MONTO=', l^.dato.monto:0:2);
            l:= l^.sig;
        end;
end;
procedure imprimirCiudad(c: ciudad);
begin
    write('CODE=', c.codeCiudad);
    imprimirLista(c.l);
    writeln();
end;
procedure imprimirArbol(a: arbol);
begin
    if (a<>nil) then
        begin
            imprimirArbol(a^.hi);
            imprimirCiudad(a^.dato);
            imprimirArbol(a^.hd);
        end;
end;
procedure obtenerLista(a: arbol; codigoCiudad: integer; var l: lista);
begin
    if(a<>nil) then
        begin
            if(a^.dato.codeCiudad = codigoCiudad) then
                l:= a^.dato.l
            else 
                if(codigoCiudad < a^.dato.codeCiudad) then
                    obtenerLista(a^.hi, codigoCiudad, l)
                else
                    obtenerLista(a^.hd, codigoCiudad, l);
        end
    else
        l:= nil;
end;

function obtenerCantidad(var l: lista): integer;
var
    cant: integer;
begin
    cant:= 0;
    while(l <> nil) do
        begin
            cant:= cant+1;
            l:= l^.sig;
        end;
    obtenerCantidad:= cant;
end;

procedure maxCant (a:arbol; var codigo: integer; var cantMax: integer);
var
	cantActual: integer;
begin 
    if (a<>nil) then 
        begin 
			cantActual:= obtenerCantidad(a^.dato.l);
            if (cantActual > cantMax) then 
				begin
					cantMax:= cantActual;
					codigo:= a^.dato.codeCiudad;
				end;
            maxCant(a^.hi,codigo, cantMax);
            maxCant(a^.hd,codigo, cantMax);
        end;
end;

var
    a: arbol;
    l: lista;
    codigo, cantMax, codeMax, cant: integer;
begin
    Randomize;
    a:= nil;
    cargarArbol(a);
    writeln('-----------');
    imprimirArbol(a);
    writeln('-----------');
    writeln('Ingrese un codigo de ciudad destino');
    readln(codigo);
    obtenerLista(a, codigo, l);
    if(l <> nil) then begin
        writeln();
        write('Para el codigo de ciudad destino ', codigo,' todos los pasajes son: ');
        imprimirLista(l);
    end; 
    writeln();
    writeln('-----------');
    cantMax:= -1;
    maxCant(a, codeMax, cantMax);
    writeln('El codigo de ciudad de destino con mayor cantidad de pasajes vendidos es: ', codeMax);
end.