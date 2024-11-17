{2.- Implementar un programa que procese información de propiedades que están a la venta
en una inmobiliaria.
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido.}

program ejercicio2;
type
    subZona = 1..5;
    propiedad = record
        codigo: integer;
        tipo: string;
        precioTotal: real;
    end;
    propLectura = record
        zona: subZona;
        codigo: integer;
        tipo: string;
        cantMetros: real;
        precio: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: propiedad;
        sig: lista;
    end;
    vecProp = array [1..5] of lista;
procedure inicializarVector(var v: vecProp);
var
    i: subZona;
begin
    for i:= 1 to 5 do v[i]:= nil;
end;
procedure leerPropiedad(var p: propLectura);
begin
    writeln('Ingrese precio por metro cuadrado:');
    readln(p.precio);
    if (p.precio <> -1) then 
        begin
            writeln('Ingrese numero de zona:');
            readln(p.zona);
            writeln('Ingrese codigo de propiedad:');
            readln(p.codigo);
            writeln('Ingrese tipo de propiedad:');
            readln(p.tipo);
            writeln('Ingrese cantidad de metros cuadrados:');
            readln(p.cantMetros);
        end;
end;
procedure insertar(var l: lista; p: propiedad);
var
    ant, act, aux: lista;
begin
    new(aux); aux^.dato:= p; act:= l;
    while(act<>nil) and (act^.dato.tipo < p.tipo) do
        begin
            ant:= act;
            act:= act^.sig;
        end;
    if(act = l) then
        l:= aux
    else
        ant^.sig:= aux;
    aux^.sig:= act;
end;
procedure cargarProp(var v: vecProp);
var
    p: propiedad;
    prop: propLectura;
begin
    leerPropiedad(prop);
    while(prop.precio <> -1) do
        begin
            p.codigo:= prop.codigo;
            p.tipo:= prop.tipo;
            p.precioTotal:= prop.cantMetros * prop.precio;
            insertar(v[prop.zona], p);
            leerPropiedad(prop);
        end;
end;
procedure imprimir(v: vecProp; zona: subZona; tipo: string);
begin
    writeln('Para el codigo de propiedad de tipo ', tipo, ' en la zona ', zona, ' se encontraron estos codigos: ');
    while(v[zona] <> nil) do
        begin
            if(v[zona]^.dato.tipo = tipo) then 
                writeln(' - ', v[zona]^.dato.codigo);
            v[zona]:= v[zona]^.sig;
        end;
end;
var
    v: vecProp;
    zona: integer;
    tipo: string;
begin
    inicializarVector(v);
    cargarProp(v);
    writeln('Ingrese numero de zona:');
    readln(zona);
    writeln('Ingrese tipo de propiedad:');
    readln(tipo);
    imprimir(v, zona, tipo);
end.