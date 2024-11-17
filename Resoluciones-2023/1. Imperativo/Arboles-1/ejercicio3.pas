{3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
f. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
g. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3;
type
	tipoFinal = record
		codigo: integer;
		nota: integer;
	end;
	final = ^nodoFinales;
	nodoFinales = record
		dato: tipoFinal;
		sig: final;
	end;
	alumno = record
		legajo: integer;
		dni: integer;
		anio: integer;
		finales: final;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
	end;
	alumnoB = record
		dni: integer;
		anio: integer;
	end;
	arbolB = ^nodoArbolB;
	nodoArbolB = record
		dato: alumnoB;
		hi: arbolB;
		hd: arbolB;
	end;
	aluProm = record
		legajo: integer;
		prom: real;
	end;
	lista = ^nodoLista;
	nodoLista = record
		dato: aluProm;
		sig: lista;
	end;

procedure agregarAdelante(var alu:alumno;f:tipoFinal);
var 
    aux:final;
begin 
    new(aux);
    aux^.dato:=f;
    aux^.sig:=alu.finales;
    alu.finales:=aux;
end;

procedure finalRandom(var final:tipoFinal);
begin 
    final.codigo:=random(200)+1;
    final.nota:=random(10)+1;
end;

procedure alumnoRandom(var alu:alumno);
var 
    final:tipoFinal;
    i:integer;
begin
    alu.legajo:=random(1000)+1;
    alu.dni:=random(500)+1;
    alu.anio:=random(24)+2000;
    alu.finales:=nil;
    for i:=1 to Random(5)+4 do 
        begin 
            finalRandom(final);
            agregarAdelante(alu,final);
        end;
end;

procedure agregarAlumno(var a: arbol; alu: alumno);
begin
	if(a = nil) then
		begin
			new(a);
			a^.dato:= alu;
			a^.hi:= nil;
			a^.hd:= nil;
		end
	else
		begin
			if(alu.legajo <= a^.dato.legajo) then
				agregarAlumno(a^.hi, alu)
			else
				agregarAlumno(a^.hd, alu);
		end;
end;

procedure agregarAlumnoB(var a: arbolB; alu: alumnoB);
begin
	if(a = nil) then
		begin
			new(a);
			a^.dato:= alu;
			a^.hi:= nil;
			a^.hd:= nil;
		end
	else
		begin
			if(alu.dni <= a^.dato.dni) then
				agregarAlumnoB(a^.hi, alu)
			else
				agregarAlumnoB(a^.hd, alu);
		end;
end;

procedure cargarArbol(var a: arbol);
var
	i: integer;
	alu: alumno;
begin
	writeln('Carga del arbol A:');
	for i:= 1 to Random(10)+3 do
		begin
			alumnoRandom(alu);
			agregarAlumno(a,alu);
		end;
end;

procedure imprimirAlu(a: alumno);
begin
	writeln();
	write('Legajo=',a.legajo,' DNI=',a.dni,' Anio=',a.anio);
	while(a.finales<>nil) do
		begin
			write(' |Cod=', a.finales^.dato.codigo,' N=',a.finales^.dato.nota, '| ');
			a.finales:= a.finales^.sig;
		end;
end;

procedure imprimirAluB(a: alumnoB);
begin
	writeln('DNI=', a.dni, ' ANIO=', a.anio);
end;

procedure imprimir(a: arbol);
begin
	if(a<>nil) then
		begin
			imprimir(a^.hi);
			imprimirAlu(a^.dato);
			imprimir(a^.hd);
		end;
end;

procedure imprimirB(a: arbolB);
begin
	if(a<>nil) then
		begin
			imprimirB(a^.hi);
			imprimirAluB(a^.dato);
			imprimirB(a^.hd);
		end;
end;

procedure menores(arb:arbol;var arbB:arbolB;legajo:integer);
var 
    aluB:alumnoB;
begin 
    if (arb<>nil) then 
        begin 
            if (arb^.dato.legajo < legajo) then 
                begin
					aluB.dni:= arb^.dato.dni;
					aluB.anio:= arb^.dato.anio;
                    agregarAlumnoB(arbB , aluB);
                    menores(arb^.HI,arbB,legajo);
                    menores(arb^.HD,arbB,legajo);
                end
            else
                menores(arb^.HI,arbB,legajo);
        end;
end;

function numLegajoMasGrande(a: arbol; numLegajoMax: integer): integer;
begin
	if (a=nil) then
		numLegajoMasGrande:= numLegajoMax
	else
		begin
			if(a^.dato.legajo > numLegajoMax) then
				numLegajoMax:= a^.dato.legajo;
			numLegajoMasGrande:= numLegajoMasGrande(a^.HD, numLegajoMax);
		end;
end;

procedure maxDni(a: arbol; var max:integer);
begin 
    if (a <> nil) then 
        begin 
            if (a^.dato.dni > max) then 
                max:=a^.dato.dni;
            maxDni(a^.hi,max);
            maxDni(a^.hd,max);
        end;
end;

function cantAluImpares(a : arbol; total : integer) : integer;
begin
	if(a = nil) then
		cantAluImpares:= 0
	else
		begin
			cantAluImpares:= cantAluImpares(a^.hi, total) + cantAluImpares(a^.hd, total);
			if((a^.dato.legajo mod 2)=1) then
				cantAluImpares := cantAluImpares + 1;
		end;
end;

function obtenerPromedio(a: alumno): real;
var
	total, cant: integer;
begin
	total:= 0;
	cant:= 0;
	while(a.finales <> nil) do
		begin
			cant:= cant+1;
			total:= total + a.finales^.dato.nota;
			a.finales := a.finales^.sig;
		end;
	obtenerPromedio:= (total/cant);
end;

procedure mejorProm (a:arbol; var legajo: integer; var promMax: real);
var
	promedioActual: real;
begin 
    if (a<>nil) then 
        begin 
			promedioActual:= obtenerPromedio(a^.dato);
            if (promedioActual > promMax) then 
				begin
					promMax:= promedioActual;
					legajo:= a^.dato.legajo;
				end;
            mejorProm(a^.hi,legajo, promMax);
            mejorProm(a^.hd,legajo, promMax);
        end;
end;

procedure agregarProm(var l: lista; a: aluProm);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= a;
	aux^.sig:= l;
	l:= aux;
end;

procedure imprimirLista(l: lista);
begin
	while(l<>nil) do
		begin
			writeln('Legajo=', l^.dato.legajo, ' Promedio=', l^.dato.prom:0:2);
			l:= l^.sig;
		end;
end;

procedure promMayorANum(a: arbol; var l: lista; num: integer);
var
	promActual: real;
	alu: aluProm;
begin
	if(a<>nil) then
		begin
			promActual:= obtenerPromedio(a^.dato);
			if(promActual > num) then
				begin
					alu.prom:= promActual;
					alu.legajo:= a^.dato.legajo;
					agregarProm(l, alu);
					promMayorANum(a^.hi, l, num);
					promMayorANum(a^.hd, l, num);
				end
			else
				promMayorANum(a^.hd, l, num);
		end;
end;

var
	a: arbol;
	aB: arbolB;
	l: lista;
	num, max, cant, legajo: integer;
	promMax: real;
begin
	Randomize;
	a:= nil;
	aB:= nil;
	l:= nil;
	cargarArbol(a); //A
	imprimir(a);

	writeln();
	writeln('-------------------');
	writeln('Ingrese un numero de legajo: ');
	readln(num);
	menores(a, aB, num); 
	writeln('Los alumnos con legajo menor a ', num, ' son:');
	imprimirB(aB); //B

	writeln('-------------------');
	max:= -1;
	writeln('El numero de legajo mas grande de todos los alumnos es: ',  numLegajoMasGrande(a, max)); //C

	writeln('-------------------');
	max:= -1;
	maxDni(a, max); //D
	writeln('El DNI mas grande de todos los alumnos es: ', max); //D

	writeln('-------------------');
	cant:= 0;
	writeln('La cantidad de alumnos con legajo impar es: ', cantAluImpares(a, cant)); //E

	writeln('-------------------');
	legajo:= 0;
	promMax:= -1;
	mejorProm(a, legajo, promMax);
	writeln('El legajo del alumno con mayor promedio es: ', legajo, ' con un promedio de ', promMax:0:2); //F

	writeln('-------------------');
	writeln('Ingrese un valor entero: ');
	readln(num);
	promMayorANum(a, l, num);
	writeln('Los alumnos cuyo promedio supera el valor ingresado (' , num , ') son: '); //G
	imprimirLista(l);
end.