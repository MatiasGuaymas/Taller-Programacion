program parcial6;
type
    compra = record
        codigo: integer;
        dia: integer;
        cant: integer;
        monto: real;
    end;
    compra2 = record
        dia: integer;
        cant: integer;
        monto: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: compra2;
        sig: lista;
    end;
    cliente = record
        codigo: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;
procedure leerCompra(var c: compra);
begin
    c.cant:= Random(30);
    if(c.cant <> 0 ) then
        begin
            c.codigo:= Random(30)+1;
            c.monto:= 150.80 * (Random(400)+1);
            c.dia:= Random(31)+1;
        end;
end;
procedure agregarAdelante(var l: lista; c: compra2);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
end;
procedure agregarArbol(var a: arbol; c: compra);
var
    com: compra2;
begin
    if (a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.l:= nil;
            a^.dato.codigo:= c.codigo;
            com.dia:= c.dia;
            com.cant:= c.cant;
            com.monto:= c.monto;
            agregarAdelante(a^.dato.l, com);
        end
    else
        if(a^.dato.codigo = c.codigo) then
            begin
                com.dia:= c.dia;
                com.cant:= c.cant;
                com.monto:= c.monto;
                agregarAdelante(a^.dato.l, com);
            end
        else
            if(c.codigo < a^.dato.codigo) then
                agregarArbol(a^.hi, c)
            else
                agregarArbol(a^.hd, c);
end;
procedure imprimirCompra(c: compra);
begin
    writeln('CODIGO=', c.codigo, ' DIA=', c.dia, ' CANT=', c.cant,' MONTO=', c.monto:0:2);
end;
procedure cargarArbol(var a: arbol);
var
    c: compra;
    i: integer;
begin
    leerCompra(c);
    imprimirCompra(c);
    while(c.cant <> 0 ) do
        begin
            agregarArbol(a, c);
            leerCompra(c);
            imprimirCompra(c);
        end;
end;
procedure listaCliente(a: arbol; codigo: integer; var lis: lista);
begin
    if(a<>nil) then
        begin
            if(a^.dato.codigo = codigo ) then
                lis:= a^.dato.l
            else
                if(codigo < a^.dato.codigo) then
                    listaCliente(a^.hi, codigo, lis)
                else
                    listaCliente(a^.hd, codigo, lis);
        end;
end;
procedure maxCantLista(l: lista; var monto: real; var cantMax: integer);
begin
    while(l<>nil) do
        begin
            if(l^.dato.cant > cantMax) then
                begin
                    cantMax:= l^.dato.cant;
                    monto:= l^.dato.monto;
                end;
            l:= l^.sig;
        end;
end;
procedure montoCompra(a: arbol; var monto: real; var cantMax: integer);
begin
    if(a<>nil) then
        begin
            maxCantLista(a^.dato.l, monto, cantMax);
            montoCompra(a^.hi, monto, cantMax);
            montoCompra(a^.hd, monto, cantMax);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write(' | DIA=', l^.dato.dia,' CANT=', l^.dato.cant, ' MONTO=', l^.dato.monto:0:2);
            l:= l^.sig;
        end;
end;
procedure imprimirCliente(c: cliente);
begin
    write('CODIGO=', c.codigo);
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
    l: lista;
    codigo, cant: integer;
    monto: real;
begin
    a:= nil;
    cargarArbol(a);
    writeln();
    writeln('--------------');
    imprimirArbol(a);
    l:= nil;
    writeln('Ingrese un codigo de cliente');
    readln(codigo);
    listaCliente(a, codigo, l);
    imprimirLista(l);
    writeln();
    writeln('--------------');
    cant:= -1;
    montoCompra(a, monto, cant);
    writeln('El monto de la compra con mayor cantidad de productos es: ', monto:0:2);
end.