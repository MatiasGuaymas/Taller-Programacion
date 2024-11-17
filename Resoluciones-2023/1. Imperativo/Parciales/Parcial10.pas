program parcial10;
type
    pedido = record
        numero: integer;
        dia: integer;
        cant: integer;
        monto: real;
    end;
    pedido2 = record
        dia: integer;
        cant: integer;
        monto: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: pedido2;
        sig: lista;
    end;
    cliente = record
        numero: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;
procedure leerPedido(var p: pedido);
begin
    p.numero:= Random(15);
    if(p.numero <> 0 ) then
        begin
            p.dia:= Random(31)+1;
            p.cant:= Random(5)+2;
            p.monto:= p.cant * 30;
        end;
end;
procedure imprimirPedido(p: pedido);
begin
    writeln('CLIENTE=', p.numero, ' DIA=', p.dia, ' CANT=', p.cant, ' MONTO=', p.monto:0:2);
end;
procedure agregarAdelante(var l: lista; p: pedido2);
var
    aux: lista;
begin
    new(aux);
    aux^.sig:= l;
    l:= aux;
    aux^.dato:= p;
end;
procedure agregarArbol(var a: arbol; p: pedido);
var
    ped: pedido2;
begin
    if(a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.numero:= p.numero;
            a^.dato.l:= nil;
            ped.dia:= p.dia;
            ped.cant:= p.cant;
            ped.monto:= p.monto;
            agregarAdelante(a^.dato.l, ped);
        end
    else
        if(a^.dato.numero = p.numero) then
            begin
                ped.dia:= p.dia;
                ped.cant:= p.cant;
                ped.monto:= p.monto;
                agregarAdelante(a^.dato.l, ped);
            end
        else
            if(p.numero < a^.dato.numero) then
                agregarArbol(a^.hi, p)
            else
                agregarArbol(a^.hd, p);
end;
procedure cargarArbol(var a: arbol);
var
    p: pedido;
begin
    leerPedido(p);
    imprimirPedido(p);
    while(p.numero <> 0 ) do
        begin
            agregarArbol(a, p);
            leerPedido(p);
            imprimirPedido(p);
        end;
end;
procedure retornarListaDNI(a: arbol; numero: integer; var l: lista);
begin
    if(a<>nil) then
        begin
            if(a^.dato.numero = numero) then
                l:= a^.dato.l
            else
                if(numero < a^.dato.numero) then
                    retornarListaDNI(a^.hi, numero, l)
                else
                    retornarListaDNI(a^.hd, numero, l);
        end;
end;
function montoCliente(l: lista): real;
begin
    if(l = nil) then
        montoCliente:= 0
    else
        montoCliente:= montoCliente(l^.sig) + l^.dato.monto;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write(' | DIA=', l^.dato.dia, ' CANT=', l^.dato.cant, ' MONTO=', l^.dato.monto:0:2);
            l:= l^.sig;
        end;
end;
procedure imprimirCliente(c: cliente);
begin
    write('CODIGO=', c.numero);
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
    numero: integer;
    l: lista;
begin
    Randomize;
    a:= nil;
    cargarArbol(a);
    writeln('---------------');
    imprimirArbol(a);
    writeln('---------------');
    l:= nil;
    writeln('Ingrese un numero de cliente');
    readln(numero);
    retornarListaDNI(a, numero, l);
    writeln('Los pedidos del cliente con codigo ', numero, ' son: ');
    imprimirLista(l);
    writeln();
    writeln('---------------');
    writeln('En total, dicho cliente gasto: ', montoCliente(l):0:2);
end.