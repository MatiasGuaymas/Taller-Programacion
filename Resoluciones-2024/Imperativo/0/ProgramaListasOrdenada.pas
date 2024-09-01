{a) Implemente un módulo CargarListaOrdenada que cree una lista de
enteros y le agregue valores aleatorios entre el 100 y 150, hasta que se
genere el 120. Los valores dentro de la lista deben quedar ordenados
de menor a mayor.
b) Reutilice el módulo ImprimirLista que reciba una lista generada en a) e
imprima todos los valores de la lista en el mismo orden que están
almacenados.
c) Implemente un módulo BuscarElementoOrdenado que reciba la lista
generada en a) y un valor entero y retorne true si el valor se encuentra
en la lista y false en caso contrario.
d) Invocar desde el programa principal a los módulos implementados
para crear una lista ordenada, mostrar todos sus elementos y
determinar si un valor leído por teclado se encuentra o no en la lista.}

program ProgramaListas;
type
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
procedure insertarOrdenado(var l: lista; num: integer);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.sig:= nil;
	aux^.dato:= num;
	if(l = nil) then l:= aux
	else
		begin
			act:= l; 
			ant:= l;
			while(act <> nil) and (act^.dato < aux^.dato) do
				begin
					ant:= act;
					act:= act^.sig;
				end;
			if(act = l) then
				begin
					aux^.sig:= l;
					l:= aux;
				end
			else
				begin
					ant^.sig:= aux;
					aux^.sig:= act;
				end;
		end;
end;
procedure CargarListaOrdenada(var l: lista);
var
    num: integer;
begin
    num:= random(51) + 100;
    while(num <> 120) do begin
        insertarOrdenado(l, num);
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
function BuscarElementoOrdenado(l: lista; num: integer): boolean;
begin
    while((l<>nil) and (l^.dato < num)) do
        l:= l^.sig;
    if(l <> nil) and (l^.dato = num) then
        BuscarElementoOrdenado:= true
    else
        BuscarElementoOrdenado:= false;
end;
var
    l: lista;
    num: integer;
begin
    randomize;
    l:= nil;
    CargarListaOrdenada(l);
    ImprimirLista(l);
    writeln('Ingrese un numero para buscar en la lista: ');
    readln(num);
    if(BuscarElementoOrdenado(l, num)) then begin
        writeln('El numero ', num, ' se encuentra en la lista.');
    end
    else begin
        writeln('El numero ', num, ' no se encuentra en la lista.');
    end;
end.

