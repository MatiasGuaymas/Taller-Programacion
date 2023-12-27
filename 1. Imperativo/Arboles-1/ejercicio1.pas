{1. Escribir un programa que:
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
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.}

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

{procedure leerSocio(var s: socio);
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

procedure cargarArbol(var a: arbol);
var
	s: socio;
begin
	leerSocio(s);
	while(s.numero <> 0) do
		begin
			agregar(a,s);
			leerSocio(s);
		end;
end;}

//A

procedure agregar(var a: arbol; s: socio);
begin
	if(a = nil) then
		begin
			new(a);
			a^.dato:= s; a^.HI:= nil; a^.HD:= nil;
		end
		else
			if(s.numero <= a^.dato.numero) then 
				agregar(a^.HI, s)
			else 
				agregar(a^.HD, s);
end;

procedure cargarArbol(var a: arbol);
var
	s: socio;
	st: string;
	i: integer;
begin
	for i:= 1 to Random(10)+5 do
		begin
			s.numero:=random(200)+1;
    		Str(s.numero,st);
    		s.nombre:='Socio '+st;
    		s.edad:=random(70)+10;
			agregar(a, s);
		end;
end;

//IX

procedure imprimirSocio(s: socio);
begin
	writeln('Codigo= ',s.numero,' Nombre=', s.nombre,' Edad=', s.edad);
end;

procedure imprimir(a: arbol);
begin
	if (a <> nil) then begin
		imprimir(a^.HI);
		imprimirSocio(a^.dato);
		imprimir(a^.HD);
	end;
end;

//I

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

//II

procedure codigoMinimo (arbol:arbol;var minimo: socio);
begin 
    if (arbol<>nil) then 
        begin 
            if (arbol^.HI=nil) then 
                minimo:=arbol^.dato
            else 
                codigoMinimo(arbol^.HI,minimo);
        end;
end;

//III

procedure masEdad (a:arbol;var s:socio);
begin 
    if (a<>nil) then 
        begin 
            if (a^.dato.edad>s.edad) then 
                s:=a^.dato;
            masEdad(a^.HI,s);
            masEdad(a^.HD,s);
        end;
end;

//IV

procedure aumentar(a: arbol);
begin
	if(a<> nil) then
		begin
			a^.dato.edad:= a^.dato.edad + 1;
			aumentar(a^.hi);
			aumentar(a^.hd);
		end;
end;

//V

function esta(a : arbol; num : integer) : boolean;
begin
	if(a <> nil) then
		if(a^.dato.numero = num) then
			esta := true
		else
			begin
				if (num < a^.dato.numero) then
					esta:= esta(a^.hi, num)
				else
					esta:= esta(a^.hd, num);
			end
	else
		esta := false;
end;

//VI

function nombreesta(a : arbol; nom : string) : boolean;
begin
	if(a <> nil) then
		if(a^.dato.nombre = nom) then
			nombreesta := true
		else
			nombreesta:= nombreesta(a^.hi, nom) or nombreesta(a^.hd, nom)
	else
		nombreesta := false;
end;

//VII

function cantidadsocios(a : arbol; total : integer) : integer;
begin
	if(a<>nil) then
		begin
			total := cantidadsocios(a^.hi, total) + cantidadsocios(a^.hd, total) + 1;
		end;
	cantidadsocios := total;
end;

//VIII

function edadTotal(a : arbol; total : integer) : integer;
begin
	if(a<>nil) then
		begin
			total:= a^.dato.edad + edadTotal(a^.hi, total) + edadTotal(a^.hd, total) + total;
		end;
	edadTotal := total;
end;

function edadProm(a : arbol): real;
var
	total, t, cant, sumaEdades : integer;
begin
	t:= 0;
	cant:= cantidadsocios(a, t);
	total:= 0;
	sumaEdades:= edadTotal(a, total);
	edadProm:= (sumaEdades/cant);
end;

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
		dosvalores := true
	else
		dosvalores := false;
end;


function entredosvalores(a : arbol; num1, num2: integer): integer;
begin
	if(a = nil) then 
		entredosvalores:= 0
	else
		begin
			entredosvalores:= entredosvalores(a^.hi, num1, num2) + entredosvalores(a^.hd, num1, num2);
			if(dosvalores(num1, num2, a^.dato.numero)) then
				entredosvalores := entredosvalores + 1;
		end;
end;

//X
procedure imprimirPares(a: arbol);
begin
  	if(a <> nil)then
    	begin
      		imprimirPares(a^.hd);
      		if((a^.dato.numero mod 2) = 0)then
				imprimirSocio(a^.dato);
      		imprimirPares(a^.hi);
    	end;
end;

var
	a: arbol;
	s: socio;
	max, num, num1, num2: integer;
	nom: string;
begin
	Randomize;
	writeln('-----------------------');
	inicializarArbol(a); 
	cargarArbol(a);	//A

	imprimir(a); //B - IX

	writeln('-----------------------');
	max:= -1;
	writeln('El numero de socio mas grande es ', numSocioMasGrande(a,max)); //B - I

	writeln('-----------------------');
	s.numero:= 999;
	codigoMinimo(a, s); //B - II
	write('El socio con numero de socio mas chico es: ');
	imprimirSocio(s);

	writeln('-----------------------');
	s.edad := -1;
	masEdad(a, s); //B - III
	writeln('El numero de socio con mayor edad es : ', s.numero);

	writeln('-----------------------');
	writeln('Se aumenta en 1 la edad de todos los socios: ');
	aumentar(a); //B - IV
	imprimir(a); 

	writeln('-----------------------');
	writeln('Ingrese un numero de socio a buscar: ');
	readln(num);
	writeln('EXISTE NUMERO?: ', esta(a, num)); //B - V

	writeln('-----------------------');
	writeln('Ingrese un nombre : ');
	readln(nom);
	writeln('EXISTE NOMBRE?: ', nombreesta(a, nom)); //B - VI 

	writeln('-----------------------');
	num:= 0;
	writeln('La cantidad de socios es: ', cantidadsocios(a, num)); //B - VII

	writeln('-----------------------');
	writeln('La edad promedio de todos los socios es: ', edadProm(a):0:2); //B - VIII

	writeln('-----------------------');
	writeln('Los socios con numero par son: ');
	imprimirPares(a); //B - X

	writeln('-----------------------');
	writeln('Ingrese un primer numero de socio como limite izquierdo: ');
	readln(num1);
	writeln('Ingrese un primer numero de socio como limite derecho: ');
	readln(num2);
	writeln('La cantidad de socios que se encuentran entre esos dos limites es: ', entredosvalores(a, num1, num2)); //ESTA ERA EL INCISO IX, ANTES.
end.