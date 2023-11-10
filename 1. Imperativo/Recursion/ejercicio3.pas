{EJERCICIO 3
3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
}
 
program ejercicio3;
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
	new(aux); aux^.sig:= nil; aux^.dato:= num;
	if(l=nil) then l:= aux
	else begin
		aux^.sig:= l;
		l:= aux;
	end;
end;

procedure cargarLista(var l: lista);
var
	num: integer;
begin
	num:= random(101); //101 ES
	if(num <> 0) then
		begin
			agregarAdelante(l, num);
			cargarLista(l);
		end;
end;

function MinimoValor(l:lista;min:integer):Integer;
Begin
    if (l = nil) then begin
        MinimoValor:=min;
    end
    else begin
        if (l^.dato < min) then
            min:=l^.dato;
    MinimoValor:=MinimoValor(l^.sig,min);
    end;
End;

function MaximoValor(l:lista;max:integer):Integer;
Begin
    if (l = nil) then begin
        MaximoValor:=max;
    end
    else begin
        if (l^.dato > max) then
            max:=l^.dato;
    MaximoValor:=MaximoValor(l^.sig,max);
    end;
End;

function buscar(l:lista; x:integer):boolean;
begin
  if(l=nil)then
    buscar:=false
  else
    if(l^.dato=x)then
      buscar:=true
    else
      buscar:=buscar(l^.sig,x);
end;

var
	l: lista;
	min, max: integer;
	valor: integer;
begin
	Randomize;
	l:= nil;
	cargarLista(l); //A
	writeln();
	WriteLn('_________');
	min:= 999;
	WriteLn('El valor minimo es: ', MinimoValor(l,min));//B
	max:= -1;
	WriteLn('El valor Maximo es: ', MaximoValor(l,max));//C
	Writeln('Ingrese el numero buscado ');
	readln(valor);
	WriteLn('Encontro: ', buscar(l,valor));//D
end.