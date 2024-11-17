program parcial8;
type
    alquiler = record
        dni: integer;
        patente: integer;
        mes: integer;
        anio: integer;
    end;
    alquiler2 = record
        dni: integer;
        mes: integer;
        anio: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: alquiler2;
        sig: lista;
    end;
    patente = record
        codigo: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: patente;
        hi: arbol;
        hd: arbol;
    end;
procedure leerAlquiler(var a: alquiler);
begin
    a.patente:= Random(10);
    if(a.patente <> 0) then
        begin
            a.dni:= Random(15) + 1;
            a.mes:= Random(12) + 1;
            a.anio:= Random(24) + 2000;
        end;
end;
procedure imprimirAlquiler(a: alquiler);
begin
    writeln('PATENTE=',a.patente, ' DNI=', a.dni, ' MES=', a.mes, ' ANIO=', a.anio);
end;
procedure agregarAdelante(var l: lista; a: alquiler2);
var
    aux: lista;
begin
    new(aux);
    aux^.sig:= l;
    l:= aux;
    aux^.dato:= a;
end;
procedure agregarArbol(var a: arbol; alq: alquiler);
var
    alq2: alquiler2;
begin
    if( a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.codigo:= alq.patente;
            a^.dato.l:= nil;
            alq2.dni:= alq.dni;
            alq2.mes:= alq.mes;
            alq2.anio:= alq.anio;
            agregarAdelante(a^.dato.l, alq2);
        end
    else
        if(a^.dato.codigo = alq.patente) then
            begin
                alq2.dni:= alq.dni;
                alq2.mes:= alq.mes;
                alq2.anio:= alq.anio;
                agregarAdelante(a^.dato.l, alq2);
            end
        else
            if(alq.patente < a^.dato.codigo) then
                agregarArbol(a^.hi, alq)
            else
                agregarArbol(a^.hd, alq);
end;
procedure cargarArbol(var a: arbol);
var
    alq: alquiler;
begin
    leerAlquiler(alq);
    imprimirAlquiler(alq);
    while(alq.patente <> 0) do
        begin
            agregarArbol(a, alq);
            leerAlquiler(alq);
            imprimirAlquiler(alq);
        end;
end;
procedure contarCantDNILista(l: lista; dni: integer; var cant: integer);
begin
    while(l <> nil) do
        begin
            if(l^.dato.dni = dni) then
                cant:= cant + 1;
            l:= l^.sig;    
        end;
end;
procedure contarCantDNIArbol(a: arbol; dni: integer; var cant: integer);
begin
    if(a <> nil) then
        begin
            contarCantDNILista(a^.dato.l, dni, cant);
            contarCantDNIArbol(a^.hi, dni, cant);
            contarCantDNIArbol(a^.hd, dni, cant);
        end;
end;
procedure contarCantAnioLista(l: lista; anio: integer; var cant: integer);
begin
    while(l <> nil) do
        begin
            if(l^.dato.anio = anio) then
                cant:= cant + 1;
            l:= l^.sig;    
        end;
end;
procedure entreDosValores(a: arbol; anio, num1, num2: integer; var cant: integer);
begin
    if(a <> nil) then
        begin
            if(a^.dato.codigo >= num1) and (a^.dato.codigo <= num2) then
                begin
                    contarCantAnioLista(a^.dato.l, anio, cant);
                    entreDosValores(a^.hi, anio, num1, num2, cant);
                    entreDosValores(a^.hd, anio, num1, num2, cant);
                end
            else
                if(a^.dato.codigo > num1) then
                    entreDosValores(a^.hi, anio, num1, num2, cant)
                else
                    entreDosValores(a^.hd, anio, num1, num2, cant);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l <> nil) do
        begin
            write(' | DNI=', l^.dato.dni, ' MES=', l^.dato.mes, ' ANIO=', l^.dato.anio);
            l:= l^.sig;
        end;
end;
procedure imprimirPatente(p: patente);
begin
    write('PATENTE=', p.codigo);
    imprimirLista(p.l);
    writeln();
end;
procedure imprimirArbol(a: arbol);
begin
    if(a <> nil) then
        begin
            imprimirArbol(a^.hi);
            imprimirPatente(a^.dato);
            imprimirArbol(a^.hd);
        end;
end;
procedure verificar(var pat1, pat2: integer);
var
    aux: integer;
begin
    if(pat1 > pat2) then
        begin
            aux:= pat1;
            pat1:= pat2;
            pat2:= aux;
        end;
end;
var
    a: arbol;
    num1, cant, pat1, pat2, anio: integer;
begin
    Randomize;
    cargarArbol(a);
    writeln('-------------');
    imprimirArbol(a);
    writeln('-------------');
    writeln('Ingrese un numero de DNI');
    readln(num1);
    cant:= 0;
    contarCantDNIArbol(a, num1, cant);
    writeln('La cantidad de alquileres realizados por el DNI ', num1, ' es: ', cant);
    writeln('-------------');
    writeln('Ingrese un anio');
    readln(anio);
    writeln('Ingrese un primer numero de patente');
    readln(pat1);
    writeln('Ingrese un segundo numero de patente');
    readln(pat2);
    cant:= 0;
    verificar(pat1, pat2);
    entreDosValores(a, anio, pat1, pat2, cant);
    writeln('La cantidad de alquileres realizados para las patentes entre ', pat1, ' y ', pat2, ' durante el anio ', anio, ' es: ', cant);
end.