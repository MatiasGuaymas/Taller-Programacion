program parcial2;
type
    compra = record
        codigo: integer;
        mes: integer;
        monto: real;
    end;
    vecMonto = array [1..12] of real;
    cliente = record
        codigo: integer;
        monto: vecMonto;
    end;
    arbol = ^nodo;
    nodo = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;
procedure inicializarVector(var v: vecMonto); 
var
    i: integer;
begin
    for i:= 1 to 12 do v[i]:= 0;
end;
procedure agregarArbol(var a: arbol; c: compra);
var
    cli: cliente;
begin
    if(a = nil) then    
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            cli.codigo:= c.codigo;
            inicializarVector(cli.monto);
            cli.monto[c.mes]:= cli.monto[c.mes] + c.monto;
            a^.dato:= cli;
        end
    else
        if(a^.dato.codigo = c.codigo) then
            a^.dato.monto[c.mes]:= a^.dato.monto[c.mes] + c.monto
        else
            if(c.codigo < a^.dato.codigo) then
                agregarArbol(a^.hi, c)
            else
                agregarArbol(a^.hd, c);
end;
procedure imprimirCompra(c: compra);
begin
    writeln('CODIGO=', c.codigo, ' MES=', c.mes, ' MONTO=', c.monto:0:2);
end;
procedure cargarArbol(var a: arbol);
var
    c: compra;
    i: integer;
begin
    for i:= 1 to Random(10)+5 do
        begin
            c.codigo:= Random(10)+1;
            c.mes:= Random(12)+1;
            c.monto:= c.mes * ((Random(20)) * 3);
            imprimirCompra(c);
            agregarArbol(a, c);
        end;
end;
procedure imprimirCliente(c: cliente);
var
    i: integer;
begin
    write('CODIGO=', c.codigo,' MONTO=');
    for i:= 1 to 12 do
        write(i, '. ', c.monto[i]:0:2,' ');
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
procedure max(v: vecMonto; var maxMes: integer);
var
    i: integer;
    max: real;
begin
    max:= -1;
    for i:= 1 to 12 do
        begin
            if(v[i] > max) then
                begin
                    max:= v[i];
                    maxMes:= i;
                end;
        end;
end;
procedure calcularMax(a: arbol; num1: integer; var maxMes: integer);
begin
    if(a<>nil) then
        begin
            if(a^.dato.codigo = num1) then
                max(a^.dato.monto, maxMes)
            else
                if(num1 < a^.dato.codigo) then
                    calcularMax(a^.hi, num1, maxMes)
                else
                    calcularMax(a^.hd, num1, maxMes);
        end;
end;
procedure calcularMes(a: arbol; mes: integer; var cant: integer);
begin
    if(a<>nil) then
        begin
            if(a^.dato.monto[mes] = 0) then
                cant:= cant + 1;
            calcularMes(a^.hi, mes, cant);
            calcularMes(a^.hd, mes, cant);
        end;
end;
var
    a: arbol;
    num1, cant, mesMax: integer;
begin
    Randomize;
    a:= nil;
    cargarArbol(a);
    writeln('-------------');
    imprimirArbol(a);
    writeln('-------------');
    writeln('Ingrese un numero de cliente');
    readln(num1);
    mesMax:= -1;
    calcularMax(a, num1, mesMax);
    writeln('El mes con mayor gasto del cliente con codigo ', num1, ' es: ', mesMax);
    writeln('-------------');
    writeln('Ingrese un numero de mes');
    readln(num1);
    cant:= 0;
    calcularMes(a, num1, cant);
    writeln('Para el mes ', num1, ' la cantidad de clientes que no gastaron en dicho mes es: ', cant);
end.