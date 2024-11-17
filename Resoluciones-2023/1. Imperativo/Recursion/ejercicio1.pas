{ 1.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.
b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.
f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados. }

program ejercicio1;
const
	DIMF = 10;
type
	vecChar = array [1..DIMF] of char;
	lista = ^nodo;
	nodo = record
		dato: char;
		sig: lista;
	end;
	
procedure leerCaracter(var c: char);
begin
    Writeln('Ingrese un caracter e ingrese "." para terminar de leer');
    readln(c);
end;

//A

procedure cargarEstructura(var v: vecChar; var dimL: integer);
var
	c: char;
begin
    leerCaracter(c);
	if(dimL < DIMF) and (c <> '.') then
	begin
		dimL:= dimL + 1;
		v[dimL]:= c;
		cargarEstructura(v, dimL);
	end;
end;

//B

procedure imprimirVector(v: vecChar; dimL: integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		writeln('En la posicion: ', i, ', el valor actual es ', v[i]);
end;

//C

procedure impVectorRecursivo(v: vecChar; dimL: integer);
begin
	//dimL:= dimL -1;
	if(dimL > 0) then
		begin
			impVectorRecursivo(v,dimL-1);
			Writeln(dimL,'. Valor actual= ',v[dimL]);
		end;
end;

//D

function leerYretornarCantCaract(): integer;
var
    c: char;
begin
    leerCaracter(c);
    if(c<>'.') then
        leerYretornarCantCaract:= leerYretornarCantCaract()+1
    else
        leerYretornarCantCaract:= 0;
end;

//E 

procedure agregarAdelante(var l: lista; c: char);
var
	aux: lista;
begin
	new(aux); aux^.sig:= nil; aux^.dato:= c;
	if(l = nil) then l:= aux
	else begin
		aux^.sig:= l;
		l:= aux;
	end;
end;

procedure cargarLista(var l: lista);
var 
	c: char;
begin
	leerCaracter(c);
	if(c <> '.') then
		begin
			agregarAdelante(l, c);
			cargarLista(l);
		end;
end;

//F 

procedure imprimirLista(L: lista);
begin
  if(L <> nil)then
    begin
      Writeln('Lo que esta contenido en la lista es: ',L^.dato);
      imprimirLista(L^.sig);
    end;
end;

//G 

procedure imprimirListaInverso(L: lista);
begin
  if(L <> nil)then
    begin
      imprimirListaInverso(L^.sig);
      Writeln('Lo que esta contenido en la lista es: ',L^.dato);
    end;
end;

var
	v: vecChar;
	dimL, resultado: integer;
	l: lista;
begin
	dimL:= 0;
	cargarEstructura(v, dimL);
	imprimirVector(v, dimL);
    writeln();
    Writeln('Recursivo');
	impVectorRecursivo(v, dimL);
	resultado:= leerYretornarCantCaract();
	Writeln('La cantidad de caracteres leidos es: ', resultado);
	l:= nil;
	cargarLista(l);
    writeln();
    Writeln('Orden Normal');
	imprimirLista(l);
    writeln();
    Writeln('Orden Inverso');
	imprimirListaInverso(l);
end.