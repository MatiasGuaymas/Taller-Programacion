program parcial7;
type
    compra = record
        codeJuego: integer;
        codeCliente: integer;
        dia: integer;
        mes: integer;
    end;
    compra2 = record
        codeJuego: integer;
        dia: integer;
        mes: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: compra2;
        sig: lista;
    end;
    cliente = record
        codeCliente: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;
    vecMeses = array [1..12] of integer;
procedure inicializarVector(var v: vecMeses);
var
    i: integer;
begin
    for i:= 1 to 12 do v[i]:= 0;
end;
procedure leerCompra(var c: compra);
begin
    c.codeCliente:= Random(30);
    if(c.codeCliente <> 0 ) then
        begin
            c.dia:= Random(31)+1;
            c.mes:= Random(12)+1;
            c.codeJuego:= Random(500)+1;
        end;
end;
procedure imprimirCompra(c: compra);
begin
    writeln('CODECLI=', c.codeCliente, ' CODEJUEGO=', c.codeJuego, ' MES= ', c.mes, ' DIA=', c.dia);
end;
procedure agregarAdelante(var l: lista; c: compra2);
var
    aux: lista;
begin
    new(aux);
    aux^.sig:= l;
    l:= aux;
    aux^.dato:= c;
end;
procedure cargarArbol(var a: arbol; c: compra);
var
    com: compra2;
begin
    if(a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.codeCliente:= c.codeCliente;
            a^.dato.l:= nil;
            com.codeJuego:= c.codeJuego;
            com.mes:= c.mes;
            com.dia:= c.dia;
            agregarAdelante(a^.dato.l, com);
        end
    else
        if(a^.dato.codeCliente = c.codeCliente) then
            begin
                com.codeJuego:= c.codeJuego;
                com.mes:= c.mes;
                com.dia:= c.dia;
                agregarAdelante(a^.dato.l, com);
            end
        else
            if(c.codeCliente < a^.dato.codeCliente) then
                cargarArbol(a^.hi, c)
            else
                cargarArbol(a^.hd, c);
end;
procedure cargarEstructuras(var a: arbol; var v: vecMeses);
var
    c: compra;
begin
    leerCompra(c);
    imprimirCompra(c);
    while(c.codeCliente <> 0) do
        begin
            cargarArbol(a, c);
            v[c.mes] := v[c.mes] + 1;
            leerCompra(c);
            imprimirCompra(c);
        end;
end;
procedure retornarLista(a: arbol; codigo: integer; var lis: lista);
begin
    if(a<>nil) then
        begin
            if(a^.dato.codeCliente = codigo) then
                lis:= a^.dato.l
            else
                if(codigo < a^.dato.codeCliente) then
                    retornarLista(a^.hi, codigo, lis)
                else
                    retornarLista(a^.hd, codigo, lis);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write(' | CODEJUEGO=', l^.dato.codeJuego, ' MES= ', l^.dato.mes, ' DIA=', l^.dato.dia);
            l:= l^.sig;
        end;
end;
procedure imprimirCliente(c: cliente);
begin
    write('CODECLI= ', c.codeCliente);
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

procedure seleccion(var v: vecMeses);
var
	i, j, pos, item: integer;
begin
	for i:= 1 to 11 do begin
		pos:= i;
		for j:= i + 1 to 12 do
			if (v[j] > v[pos]) then pos:= j;
		item:= v[pos];
		v[pos] := v[i];
		v[i]:= item;
	end;
end;
procedure imprimirVector(v: vecMeses);
var
    i: integer;
begin
    for i:= 1 to 12 do writeln(i, '. ' , v[i]);
end;
var
    a: arbol;
    l: lista;
    v: vecMeses;
    codigo: integer;
begin
    Randomize;
    a:= nil;
    l:= nil;
    inicializarVector(v);
    cargarEstructuras(a, v);
    writeln('--------------');
    imprimirArbol(a);
    writeln('--------------');
    writeln('Ingrese un codigo de cliente:');
    readln(codigo);
    retornarLista(a, codigo, l);
    writeln('Compras del cliente con codigo ', codigo,':');
    imprimirLista(l);
    writeln();
    writeln('--------------');
    writeln('Vector desordenado:');
    imprimirVector(v);
    writeln('Vector ordenado:');
    seleccion(v);
    imprimirVector(v);
end.