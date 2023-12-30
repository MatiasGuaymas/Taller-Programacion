program parcial4;
type
    compra = record
        codigo: integer;
        numero: integer;
        cant: integer;
        monto: real;
    end;
    compra2 = record
        numero: integer;
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
{procedure leerCompra(var c: compra);
begin
    writeln('Ingrese el codigo de cliente');
    readln(c.codigo);
    if(c.codigo <> 0) then
        begin
            writeln('Ingrese el numero de factura');
            readln(c.numero);
            writeln('Ingrese la cantidad de productos vendidos');
            readln(c.cant);
            writeln('Ingrese el monto');
            readln(c.monto);
        end;
end;}
procedure productoRandom(var c: compra);
begin
    c.codigo:= Random(7)+1;
    c.numero:= Random(20)+1;
    c.cant:= Random(15)+5;
    c.monto:= c.cant * (Random(10)+1);
end;
procedure imprimirCompra(c: compra);
begin
    writeln('CODE=', c.codigo, ' NUMFACTURA=', c.numero,' CANT=', c.cant, ' MONTO=', c.monto:0:2);
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
procedure agregarArbol(var a: arbol; c: compra);
var
    com: compra2;
begin
    if(a = nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.dato.codigo:= c.codigo;
            a^.dato.l:= nil;
            com.numero:= c.numero;
            com.cant:= c.cant;
            com.monto:= c.monto;
            agregarAdelante(a^.dato.l, com);
        end
    else
        if(a^.dato.codigo = c.codigo) then
            begin
                com.numero:= c.numero;
                com.cant:= c.cant;
                com.monto:= c.monto;
                agregarAdelante(a^.dato.l, com)
            end
        else
            if(c.codigo < a^.dato.codigo) then
                agregarArbol(a^.hi, c)
            else
                agregarArbol(a^.hd, c);
end;
procedure cargarArbol(var a: arbol);
var
    c: compra;
    i: integer;
begin
    //leerCompra(c); Hacer con un while el ir cargando al arbol...
    for i:= 1 to Random(15)+5 do
        begin
            productoRandom(c);
            imprimirCompra(c);
            agregarArbol(a, c);
        end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write(' | NUMFACTURA=', l^.dato.numero,' CANT=', l^.dato.cant, ' MONTO=', l^.dato.monto:0:2);
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
procedure calcularCompras(l: lista; var cant: integer; var monto: real);
begin
    while(l<>nil) do
        begin
            monto:= monto + l^.dato.monto;
            cant:= cant + 1;
            l:= l^.sig;
        end;
end;
procedure calcularCantMonto(a: arbol; codigo: integer; var cant: integer; var monto: real);
begin
    if(a <> nil) then
        begin
            if(a^.dato.codigo = codigo) then
                calcularCompras(a^.dato.l, cant, monto)
            else
                if(codigo < a^.dato.codigo) then
                    calcularCantMonto(a^.hi, codigo, cant, monto)
                else
                    calcularCantMonto(a^.hd, codigo, cant, monto)
        end;
end;
procedure verificar(var num1, num2: integer);
var
    aux: integer;
begin
    if(num1 > num2) then
        begin
            aux:= num1;
            num1:= num2;
            num2:= aux;
        end;
end;
procedure generarLista(l: lista; num1, num2: integer; var lisNueva: lista);
begin
    while(l<>nil) do
        begin
            if(l^.dato.numero >= num1) and (l^.dato.numero <= num2) then
                agregarAdelante(lisNueva, l^.dato);
            l:= l^.sig;
        end;
end;
procedure listaEntreDosValores(a: arbol; num1, num2: integer; var l: lista);
begin
    if(a<>nil) then
        begin
            generarLista(a^.dato.l, num1, num2, l); 
            listaEntreDosValores(a^.hi, num1, num2, l);
            listaEntreDosValores(a^.hd, num1, num2, l);
        end;
end;
var
    a: arbol;
    codigo, cant, x, y: integer;
    monto: real;
    l: lista;
begin
    a:= nil;
    cargarArbol(a);
    writeln('---------------');
    imprimirArbol(a);
    writeln('---------------');
    writeln('Ingrese un codigo de cliente');
    readln(codigo);
    cant:= 0;
    monto:= 0;
    calcularCantMonto(a, codigo, cant, monto);
    writeln('El cliente con codigo ', codigo, ' hizo ', cant, ' compras y gasto: ', monto:0:2);
    writeln('---------------');
    l:= nil;
    writeln('Ingrese un primer codigo de factura');
    readln(x);
    writeln('Ingrese un segundo codigo de factura');
    readln(y);
    verificar(x, y);
    listaEntreDosValores(a, x, y, l);
    imprimirLista(l);
end.