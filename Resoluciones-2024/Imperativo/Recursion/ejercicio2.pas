{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program ejercicio2;
type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
procedure agregarAdelante(var l: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= num;
    nuevo^.sig:= l;
    l:= nuevo;
end;
procedure cargarLista(var l: lista);
var
    num: integer;
begin
    num:= random(101) + 100;
    if (num <> 100) then
        begin
            agregarAdelante(l, num);
            cargarLista(l);
        end;
end;
procedure imprimirLista(l: lista);
begin
    if (l <> nil) then
        begin
            write(l^.dato, ' ');
            imprimirLista(l^.sig);
        end;
end;
procedure imprimirListaInverso(l: lista);
begin
    if (l <> nil) then
        begin
            imprimirListaInverso(l^.sig);
            write(l^.dato, ' ');
        end;
end;
function minimo(l: lista; min: integer): integer;
begin
    if (l <> nil) then
        begin
            if (l^.dato < min) then
                min:= l^.dato;
            minimo:= minimo(l^.sig, min);
        end
    else
        minimo:= min;
end;
function buscar(l: lista; num: integer): boolean;
begin
    if (l <> nil) then
        begin
            if (l^.dato = num) then
                buscar:= true
            else
                buscar:= buscar(l^.sig, num);
        end
    else
        buscar:= false;
end;
var
    l: lista;
    min: integer;
begin
    randomize;
    l:= nil;
    cargarLista(l);
    writeln('Lista generada: ');
    imprimirLista(l);
    writeln;
    writeln('Lista generada en orden inverso: ');
    imprimirListaInverso(l);
    writeln;
    min:= 9999;
    writeln('El minimo valor de la lista es: ', minimo(l, min));
    if (buscar(l, 150)) then
        writeln('El valor 150 se encuentra en la lista')
    else
        writeln('El valor 150 no se encuentra en la lista');
end.