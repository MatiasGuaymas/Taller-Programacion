{2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program ejercicio2;
type
	prestamo = record
		isbn : integer;
		num : integer;
		dia : integer;
		mes : integer;
		cant : integer;
	end;
	arb = ^nodo;
	nodo = record
		dato : prestamo;
		hi : arb;
		hd : arb;
	end;

	prestamo2 = record
		num : integer;
		dia : integer;
		mes : integer;
		cant : integer;
	end;	
	lis = ^nodo2;
	nodo2 = record
		dato : prestamo2;
		sig : lis;
	end;
	pres = record
		isbn: integer;
		l: lis;
	end;
	arboldelistas= ^nodo3;
	nodo3 = record
		dato: pres;
		hi : arboldelistas;
		hd : arboldelistas;
	end;	

	tipoCant = record
		isbn: integer;
		cant: integer;
	end;
	listaISBN = ^nodo4; 
	nodo4 = record
		dato: tipoCant;
		sig: listaISBN;
	end;

{procedure leer(var p : prestamo);
begin
	writeln('ingrese isbn');
	readln(p.isbn);
	writeln('ingrese num');
	readln(p.num);
	writeln('ingrese dia');
	readln(p.dia);
	writeln('ingrese mes');
	readln(p.mes);
	writeln('ingrese cant');
	readln(p.cant);
end;

procedure leer2(var p : prestamo2);
begin
	writeln('ingrese num');
	readln(p.num);
	writeln('ingrese dia');
	readln(p.dia);
	writeln('ingrese mes');
	readln(p.mes);
	writeln('ingrese cant');
	readln(p.cant);
end;}

procedure prestamoRandom(var p:prestamo);
begin 
    p.isbn:=random(10)+1;
    p.num:=random(30)+1;
    p.dia:=random(31)+1;
    p.mes:=random(12)+1;
    p.cant:=random(20)+1;
end;

procedure imprimirPrestamo(p:prestamo);
begin 
    writeln('ISBN=',p.isbn,' Socio=',p.num,' Dia=',p.dia,' Mes=',p.mes,' Dias=',p.cant);
end;

//A - I
procedure agregar(var a : arb; p : prestamo); //Carga arbol comun y corriente
begin
	if(a=nil) then
		begin
			new(a);
			a^.hi:= nil; 
			a^.hd:= nil; 
			a^.dato := p;
		end
	else
		if(p.isbn <= a^.dato.isbn) then
			agregar(a^.hi, p)
		else
			agregar(a^.hd, p);
end;

procedure imprimirArbol(a:arb);
begin 
    if (a<>nil) then 
        begin
            imprimirArbol(a^.hi);
            imprimirPrestamo(a^.dato); 
            imprimirArbol(a^.hd);
        end;
end; 

// A - II
procedure agregarPrestamo(var l:lis; p: prestamo);
var 
    aux:lis;
begin 
    new(aux);
    aux^.dato.num:=p.num;
    aux^.dato.dia:=p.dia;
    aux^.dato.mes:=p.mes;
    aux^.dato.cant:=p.cant;
    aux^.sig:=l;
    l:=aux;
end;

procedure agregarII(var a: arboldelistas; p:prestamo); //Carga arbol de listas
begin 
    if (a<>nil) then 
        begin 
            if (p.isbn=a^.dato.isbn) then 
                begin 
                    agregarPrestamo(a^.dato.l, p);
                end
            else
                begin       
                    if (p.isbn<=a^.dato.isbn) then 
                        agregarII(a^.hi,p)
                    else 
                        agregarII(a^.hd,p);
                end
        end 
    else 
        begin 
            new(a);
            a^.dato.isbn:=p.isbn;
            agregarPrestamo(a^.dato.l,p);
            a^.hi:=nil;
            a^.hd:=nil;
        end;
end;

procedure imprimirPorISBN(p: pres);
begin
	write('ISBN=', p.isbn);
	while(p.l <> nil) do
		begin
			write('| Socio=', p.l^.dato.num,' Dia=',p.l^.dato.dia,' Mes=',p.l^.dato.mes,' Dias=',p.l^.dato.cant);
			p.l:= p.l^.sig;
		end;
end;

procedure imprimirArbolII(a: arboldelistas);
begin
	if(a<>nil)then
		begin
			imprimirArbolII(a^.hi);
			imprimirPorISBN(a^.dato);
			writeln();
			imprimirArbolII(a^.hd);
		end;
end;

procedure cargarArboles(var a1: arb; var a2: arboldelistas);
var
	i: integer;
	p: prestamo;
begin
	for i:= 1 to Random(10)+4 do
		begin
			prestamoRandom(p);
			write(i, ': ');
			imprimirPrestamo(p);
			agregar(a1, p);
			agregarII(a2, p);
		end;
end;

function isbnMax(a: arb): integer;
begin
	if(a^.hd = nil) then
		isbnMax:= a^.dato.isbn
	else
		isbnMax:= isbnMax(a^.hd);
end;

function isbnMin(a: arboldelistas): integer;
begin
	if(a^.hi = nil) then
		isbnMin:= a^.dato.isbn
	else
		isbnMin:= isbnMin(a^.hi);
end;

function cantPrestamosA1(a : arb; num: integer) : integer;
begin
	if(a = nil) then
		cantPrestamosA1:= 0
	else
		begin
			cantPrestamosA1:= cantPrestamosA1(a^.hi, num) + cantPrestamosA1(a^.hd, num);
			if(a^.dato.num = num) then
				cantPrestamosA1 := cantPrestamosA1 + 1;
		end;
end;

{Esta solucion tambien es correcta, solo estaba probando, es un poco mas eficiente en tiempo, pero es minima la diferencia
	
function prestamossocio(a : arb; numsocio : integer) : integer;
begin
	if(a <> nil) then
		begin
			if(a^.dato.num = numsocio) then
				prestamossocio := prestamossocio(a^.hi, numsocio) + prestamossocio(a^.hd, numsocio) + 1
			else
				prestamossocio:= prestamossocio(a^.hi, numsocio) + prestamossocio(a^.hd, numsocio);
		end
	else
		prestamossocio := 0;
end;}
			

procedure cantPrestamosA2(a : arboldelistas; num: integer; var cant: integer);
var
	aux: lis;
begin
	if(a<>nil)then
		begin
			aux:= a^.dato.l;
			while(aux<>nil) do
				begin
					if(aux^.dato.num = num) then
						cant:= cant+1;
					aux:= aux^.sig;
				end;
			cantPrestamosA2(a^.hi, num, cant);
			cantPrestamosA2(a^.hd, num, cant);
		end;
end;				
	
procedure agregarCant(var l: listaISBN; tipoC: tipoCant);
var
	aux, ant, act: listaISBN;
begin
	act:= l;
	new(aux);
	aux^.dato:= tipoC;
	while(act<>nil) and (act^.dato.isbn < tipoC.isbn) do
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

procedure actualizarCant(var l: listaISBN; tipoC: tipoCant);
var
	aux: listaISBN;
	sigo: boolean;
begin
	sigo:= false;
	aux:= l;
	while(aux<>nil) and (not sigo) do
		begin
			if(aux^.dato.isbn = tipoC.isbn) then
				begin
					aux^.dato.cant:= aux^.dato.cant+tipoC.cant;
					sigo:= true;
				end;
			aux:= aux^.sig;
		end;
	if(not sigo) then
		agregarCant(l, tipoC);
end;

procedure generarListaF(a: arb; var l: listaISBN);
var
	tipoC: tipoCant;
begin
	if(a<>nil)then
		begin
			tipoC.cant:= 1;
			tipoC.isbn:= a^.dato.isbn;
			actualizarCant(l, tipoC);
			generarListaF(a^.hi, l);
			generarListaF(a^.hd, l);
		end;
end;

procedure imprimirLista(l: listaISBN);
begin
	while(l<>nil) do
		begin
			writeln('ISBN=', l^.dato.isbn, ' Cantidad=', l^.dato.cant);
			l:= l^.sig;
		end;
end;

procedure generarListaG(a: arboldelistas; var l: listaISBN);
var
	tipoC: tipoCant;
	aux: lis;
begin
	if(a<>nil) then
		begin
			tipoC.isbn:= a^.dato.isbn;
			tipoC.cant:= 0;
			aux:= a^.dato.l;
			while(aux<>nil) do
				begin
					tipoC.cant:= tipoC.cant+1;
					aux:= aux^.sig;
				end;
			actualizarCant(l, tipoC);
			generarListaG(a^.hi, l);
			generarListaG(a^.hd,l);
		end;
end;

procedure verificar(var num1, num2: integer);
var
    aux: integer;
begin
    if(num1 > num2) then
		begin
			aux := num1;
			num1 := num2;
			num2 := aux;
		end;
end;

function dosvalores(num1, num2, dato : integer) : boolean;
begin
	if(dato >= num1) and (dato <= num2) then
		dosvalores := true
	else
		dosvalores := false;
end;

function entredosvaloresI(a : arb; num1, num2: integer): integer;
begin
	if(a = nil) then 
		entredosvaloresI:= 0
	else
		begin
			if(dosvalores(num1, num2, a^.dato.isbn)) then
				entredosvaloresI := entredosvaloresI(a^.hi, num1, num2) + entredosvaloresI(a^.hd, num1, num2) + 1
            else
                if(a^.dato.isbn > num1) then
                    entredosvaloresI:= entredosvaloresI(a^.hi, num1, num2)
                else
                    entredosvaloresI:= entredosvaloresI(a^.hd, num1, num2);
		end;
end;

procedure entredosvaloresII(a: arboldelistas; num1, num2: integer; var cant: integer);
var
	aux: lis;
begin
	if(a<>nil) then
		begin
			if(dosvalores(num1, num2, a^.dato.isbn)) then
				begin
					aux:= a^.dato.l;
					while (aux <> nil) do
						begin
							cant:= cant+1;
							aux:= aux^.sig;
						end;
					entredosvaloresII(a^.hi, num1, num2, cant);
					entredosvaloresII(a^.hd, num1, num2, cant);
				end
			else
				if(a^.dato.isbn > num1) then
					entredosvaloresII(a^.hi, num1, num2, cant)
				else
					entredosvaloresII(a^.hd, num1, num2, cant);
		end;
end;

{		
function rango(a : arboldelistas; num1, num2 : integer) : integer;
var
	cant : integer;
begin
	if(a <> nil) then
		begin
			if(entredosnum(a^.isbn, num1, num2)) then
				begin
					cant := 0;
					while(a^.l <> nil) do
						begin
							cant := cant + 1;
							a^.l := a^.l.sig;
						end;
					rango := rango(a^.hi, num1, num2) + rango(a^.hd, num1, num2) + cant);
				end
			else
				begin
					if(num1 > a^.isbn) then
						rango(a^.hd, num1, num2)
					else
						rango(a^.hi, num1, num2);
				end;
		end
	else
		rango := 0;
end;}

var
	a1 : arb;
	a2 : arboldelistas;
	listaF, listaG: listaISBN;
	num, cant, num1, num2: integer;
begin
	Randomize;
	a1:= nil;
	a2:= nil;
	listaF:= nil;
	listaG:= nil;
	cargarArboles(a1, a2); //A

	writeln('-----------------------');
	writeln('Arbol A-I: ');
	imprimirArbol(a1);

	writeln('-----------------------');
	writeln('Arbol A-II: ');
	imprimirArbolII(a2);

	writeln('-----------------------');
	if(a1<>nil) then
		writeln('El ISBN mas grande es: ', isbnMax(a1)) //B
	else
		writeln('El arbol esta vacio');

	writeln('-----------------------');
	if(a2<>nil) then
		writeln('El ISBN mas chico es: ', isbnMin(a2)) //C
	else
		writeln('El arbol esta vacio');
		
	writeln('-----------------------');
	writeln('Ingrese un numero de socio: ');
	readln(num);
	writeln('El socio con numero ', num, ' realizo ', cantPrestamosA1(a1, num) , ' prestamos'); //D
	//writeln('2. El socio con numero ', num, ' realizo ', prestamossocio(a1, num) , ' prestamos');

	writeln('-----------------------');
	writeln('Ingrese otro numero de socio: ');
	readln(num);
	cant:= 0;
	cantPrestamosA2(a2, num, cant);
	writeln('El socio con numero ', num, ' realizo ', cant, ' prestamos'); //E

	writeln('-----------------------');
	writeln('Lista inciso F:');
	generarListaF(a1, listaF); //F
	imprimirLista(listaF);

	writeln('-----------------------');
	writeln('Lista inciso G:');
	generarListaG(a2, listaG); //G
	imprimirLista(listaG);

	writeln('-----------------------');
	writeln('Ingrese un primer ISBN como limite izquierdo: ');
	readln(num1);
	writeln('Ingrese un segundo ISBN como limite derecho: ');
	readln(num2);
    verificar(num1, num2);
	writeln('La cantidad total de prestamos realizados a los ISBN comprendidos entre: ', num1, ' y ', num2, ' es: ', entredosvaloresI(a1, num1, num2)); //I

	writeln('-----------------------');
	cant:= 0;
	writeln('Ingrese otro ISBN como limite izquierdo: ');
	readln(num1);
	writeln('Ingrese otro ISBN como limite derecho: ');
	readln(num2);
    verificar(num1, num2);
	entredosvaloresII(a2, num1, num2, cant);
	writeln('La cantidad total de prestamos realizados a los ISBN comprendidos entre: ', num1, ' y ', num2, ' es: ', cant); //I
	
end.
