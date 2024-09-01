{a) Implemente un módulo CargarLista que cree una lista de enteros y le
agregue valores aleatorios entre el 100 y 150, hasta que se genere el
120.
b) Implemente un módulo ImprimirLista que reciba una lista generada en
a) e imprima todos los valores de la lista en el mismo orden que están
almacenados.
c) Implemente un módulo BuscarElemento que reciba la lista generada
en a) y un valor entero y retorne true si el valor se encuentra en la lista
y false en caso contrario.
d) Invocar desde el programa principal a los módulos implementados
para crear una lista, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.}

program ProgramaListas;
type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
procedure agregarAdelante(var l: lista; num: integer);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= num;
    aux^.sig:= l;
    l:= aux;
end;
procedure CargarLista(var l: lista);
var
    num: integer;
begin
    num:= random(51) + 100;
    while(num <> 120) do begin
        agregarAdelante(l, num);
        num:= random(51) + 100;
    end;
end;
procedure ImprimirLista(l: lista);
begin
    while(l <> nil) do begin
        writeln('El valor de la lista es: ', l^.dato);
        l:= l^.sig;
    end;
end;
function BuscarElemento(l: lista; num: integer): boolean;
var
    ok: boolean;
begin
    ok:= false;
    while(l <> nil) and (not ok) do begin
        if(l^.dato = num) then begin
            ok:= true;
        end;
        l:= l^.sig;
    end;
    BuscarElemento:= ok;
end;
var
    l: lista;
    num: integer;
begin
    randomize;
    l:= nil;
    CargarLista(l);
    ImprimirLista(l);
    writeln('Ingrese un numero para buscar en la lista: ');
    readln(num);
    if(BuscarElemento(l, num)) then begin
        writeln('El numero ', num, ' se encuentra en la lista.');
    end
    else begin
        writeln('El numero ', num, ' no se encuentra en la lista.');
    end;
end.

