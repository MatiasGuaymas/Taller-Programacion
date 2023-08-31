{ EJERCICIO1
1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente.
xi. Informe los números de socio pares en orden decreciente.
}

{ EJERCICIO1
1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente.
xi. Informe los números de socio pares en orden decreciente.
}

program ejercicio1;
type
	socio = record
		numero: integer;
		nombre: string;
		edad: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;

procedure inicializarArbol(var a: arbol);
begin
	a:= nil;
end;

procedure leerSocio(var s: socio);
begin
	writeln('Ingrese el numero de socio: ');
	read(s.numero);
	if(s.numero <> 0) then
		begin
			writeln('Ingrese el nombre del socio: ');
			readln(s.nombre);
			writeln('Ingrese la edad del socio: ');
			readln(s.edad);
		end;
end;

//i

procedure cargarArbol(var a: arbol; s: socio);
begin
	if(a = nil) then
		begin
			new(a);
			a^.dato:= s; a^.HI:= nil; a^.HD:= nil;
		end
		else
			if(num < a^.dato.numero) then
				cargarArbol(a^.HI, s)
			else if(s.numSocio > a^.dato.numSocio) then
				cargarArbol(a^.HD, s);
end;

procedure imprimir(a: arbol);
begin
	if (a <> nil) then begin
		imprimir(a^.HI);
		write(a^.dato.numero);
		write(a^.dato.edad);
		imprimir(a^.HD);
	end;
end;

//ii

function numSocioMasGrande(a: arbol; numSocioMax: integer): integer;
begin
	if(a=nil) then
		numSocioMasGrande:= numSocioMax
	else
		begin
			if(a^.dato.numero > numSocioMax) then
				numSocioMax:= a^.dato.numero;
			numSocioMasGrande:= numSocioMasGrande(a^.HD, numSocioMax);
		end;
end;

//iii

function buscarSocioChico(a: arbol;numSocioMin: integer): arbol;
begin
  if(a = nil)then
    buscarSocioChico:= a
  else
    begin
      if(a^.dato.numSocio < numSocioMin)then
        numSocioMin:= a^.dato.numSocio;
      if(a^.hi= nil)then
        buscarSocioChico:= a
      else
        buscarSocioChico:= buscarSocioChico(a^.hi,numSocioMin);
    end;
end;

procedure informarDatosSocioMasChico(a: arbol);
var
  nodoBuscado: arbol;
  numSocioMin: integer;
begin
  numSocioMin:= 9999;
  nodoBuscado:= buscarSocioChico(a,numSocioMin);
  if(nodoBuscado <> nil)then
    // imprimir()
    begin
      Writeln('num socio: ',nodoBuscado^.dato.numero);
      Writeln('nombre socio: ',nodoBuscado^.dato.nombre);
      Writeln('edad socio: ',nodoBuscado^.dato.edad);
    end
  else
    Writeln('Arbol vacio / algun error');
end;

//iv

procedure aumentar(a: arbol);
begin
	if(a<> nil) then
		begin
			a^.dato.edad:= a^.dato.edad + 1;
			aumentar(a^.hi);
			aumentar(a^.hd);
		end;
end;

//v

function esta(a : arbol; num : integer) : boolean;
begin
	if(a <> nil) then
		if(a^.dato.numero = num) then
			esta := true
		else
			begin
				esta(a^.hi, num);
				esta(a^.hd, num);
			end;
	else
		esta := false;
end;

//vi

function nombreesta(a : arbol; nom : string) : boolean;
begin
	if(a <> nil) then
		if(a^.dato.nombre = nom) then
			nombreesta := true;
		else
			begin
				nombreesta(a^.hi, nom);
				nombreesta(a^.hd, nom);
			end;
	else
		nombreesta := false;
end;

//vii

function cantidadsocios(a : arbol; total : integer) : integer;
begin
	if(a<>nil) then
		begin
			total := total + 1;
			cantidadsocios(a^.hi, total);
			cantidadsocios(a^.hd, total);
		end;
	cantidadsocios := total;
end;

//viii

function edadtotal(a : arbol; total : integer) : integer;
begin
	if(a<>nil) then
		begin
			total := a^.dato.edad + total;
			edadtotal(a^.hi, total);
			edadtotal(a^.hd, total);
		end;
	edadtotal := total;
end;

procedure edadsocios(a : arb; prom : real);
var
	total, cant : integer;
begin
	cantidadsocios(a, cant);
	edadtotal(a, total);
	edadsocios(total / cant);
end;

//ix

function dosvalores(num1, num2, dato : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := aux;
		end;
	if(dato >= num1) and (dato <= num2) then
		dosvalores := true;
	else
		dosvalores := false;
end;


function entredosvalores(a : arb; num1, num2, cant : integer);
begin
	if(a<>nil) then
		begin
			if(dosvalores(num1, num2, a^.s.num) then
				cant := cant + 1;
			entredosvalores(a^.hi, num1, num2, cant);
			entredosvalores(a^.hd, num1, num2, cant);
		end;
	entredosvalores := cant;
end;

//x
procedure imprimirOrden(a: arbol);
begin
	if(a<> nil) then
		begin
			write(a^.dato.numero);
			imprimirOrden(a^.hi);
			imprimirOrden(a^.hd);
		end;
end;

procedure imprimirInOrder(a: arbol);
begin
  if(a <> nil)then
    begin
      imprimirInOrder(a^.hi);
      Writeln('In Order: de menor a mayor',a^.dato);
      imprimirInOrder(a^.hd);
    end;
end;

//xi
procedure imprimirInOrder2(a: arbol);
begin
  if(a <> nil)then
    begin
      imprimirInOrder2(a^.hd);
      if(a^.dato mod 2= 0)then
        Writeln('In Order: de mayor a menor',a^.dato);
      imprimirInOrder2(a^.hi);
    end;
end;

procedure postorden(a : arb);
begin
    if(a <> nil) then  
        begin
        postorden(a^.hi);
        postorden(a^.hd);
        writeln(a^.s.num);
        end;
end;

//IMPLEMENTAR EL PROGRAMA PRINCIPAL
