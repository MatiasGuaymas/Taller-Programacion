{3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.}

program ejercicio3;
const
	//LIM = 30;
	LIM = 10;
type
	MATERIAS = 1..LIM;
		
	final = record
		codealumno : integer;
		codemateria : integer;
		nota : integer;
	end;

////

	vecnotas = array[MATERIAS] of integer;	

	alumno = record
		code : integer;
		nota : vecnotas;
	end;	

	arb = ^nodo;
	
	nodo = record
		dato : alumno;
		hi : arb;
		hd : arb;
	end;

////

	finalrendido = record
		codealumno : integer;
		nota : integer;
	end;
		
	lis = ^nodofinales;
	
	nodofinales = record
		dato : finalrendido;
		sig : lis;
	end;
	
	vec = array[MATERIAS] of lis;

////

	registropromedio = record
		promedio : real;
		codealumno : integer;
	end;

	listapromedios = ^nodopromedios;
	
	nodopromedios = record
		dato : registropromedio;
		sig : listapromedios;
	end;

procedure inicializarMaterias(var v: vecnotas);
var
	i: integer;
begin
	for i:= 1 to LIM do v[i]:= -1;
end;

procedure inicializarFinales(var v: vec);
var
	i: integer;
begin
	for i:= 1 to LIM do v[i]:= nil;
end;

procedure imprimirFinal(f: final);
begin
	writeln('Alumno=', f.codealumno, ' Materia=', f.codemateria, ' Nota=', f.nota);
end;

procedure agregarFinal(var a: alumno; f: final);
begin
	if((a.nota[f.codemateria] = -1) and (f.nota >= 4)) then
		a.nota[f.codemateria]:= f.nota;
end;

procedure agregarAdelante(var l: lis; f: final);
var
	aux: lis;
begin
	new(aux);
	aux^.sig:= l;
	aux^.dato.codealumno:= f.codealumno;
	aux^.dato.nota:= f.nota;
	l:= aux;
end;

procedure agregarVec(var v: vec; f: final);
begin
	agregarAdelante(v[f.codemateria], f);
end;

procedure agregarArbol(var a: arb; f: final);
begin
	if(a<>nil)then
		begin
			if(a^.dato.code = f.codealumno) then
				agregarFinal(a^.dato, f)
			else
				begin
					if (f.codealumno <= a^.dato.code) then
						agregarArbol(a^.hi, f)
					else
						agregarArbol(a^.hd, f)
				end;
		end
	else
		begin
			new(a);
			a^.dato.code:= f.codealumno;
			inicializarMaterias(a^.dato.nota);
			agregarFinal(a^.dato, f);
			a^.hi:= nil;
			a^.hd:= nil;
		end;
end;

procedure cargarArbol(var a: arb; var v: vec);
var
	i: integer;
	f: final;
begin
	inicializarFinales(v);
	for i:= 1 to Random(20)+7 do
		begin
			f.codealumno:= Random(12)+1;
			f.codemateria:= Random(10)+1; //Puede llegar a repetirse este codigo de materia al usar random, pero siempre queda la primera nota del final aprobado, por ende si se repite este numero, no cambia la nota del final.
			f.nota:= Random(10)+1;
			write(i, ': ');
			imprimirFinal(f);
			agregarArbol(a, f);
			agregarVec(v, f);
		end;
end;

procedure imprimirAlu(a: alumno);
var
	i: integer;
begin
	writeln();
	write('AluNum=', a.code);
	for i:= 1 to LIM do
		begin
			if(a.nota[i]<>-1) then
				write(' | Materia=', i, ' Nota=', a.nota[i]);
		end;
end;

procedure imprimirArbol(a: arb);
begin
	if(a<>nil)then
		begin
			imprimirArbol(a^.hi);
			imprimirAlu(a^.dato);
			imprimirArbol(a^.hd);
		end;
end;

procedure imprimirVec(v: vec);
var
	i: integer;
begin
	for i:= 1 to LIM do
		begin
			if(v[i]<>nil) then
				begin
					writeln();
					write(i, '. ');
					while (v[i]<>nil) do
						begin
							write(' | AluNum= ', v[i]^.dato.codealumno,' Nota=', v[i]^.dato.nota,'');
							v[i]:= v[i]^.sig;
						end;
				end;
		end;
end;

procedure calcularProm(a: alumno; var p: registropromedio);
var
	i, total, cant: integer;
begin
	total:= 0;
	cant:= 0;
	for i:= 1 to LIM do
		begin
			if(a.nota[i]<>-1) then
				begin
					cant:= cant+1;
					total:= total + a.nota[i];
				end;
		end;
	if(cant = 0) then //Agrego esto porque si no aprobo ningun final sale error 207 por dividir por 0 -.-
		p.promedio:= 1
	else
		p.promedio:= (total/cant);
	p.codealumno:= a.code;
end;

procedure agregarAd(var l: listapromedios; p: registropromedio);
var
	aux: listapromedios;
begin
	new(aux);
	aux^.dato:= p;
	aux^.sig:= l;
	l:= aux;
end;

procedure generarListaMayores(a: arb; var l: listapromedios; code: integer);
var
	p: registropromedio;
begin
	if(a<>nil)then
		begin
			if(a^.dato.code > code) then
				begin
					calcularProm(a^.dato, p);
					agregarAd(l, p);
					generarListaMayores(a^.hi, l, code);
					generarListaMayores(a^.hd, l, code);
				end
			else
				generarListaMayores(a^.hd, l, code);
		end;
end;

procedure verificar(var num1, num2: integer);
var
	aux: integer;
begin
	if(num1 > num2) then
		begin
			aux:= num1;
			num1:= num2;
			num2:= aux;
		end;
end;

function cantAprobados(v: vecnotas): integer;
var
	i, cant: integer;
begin
	cant:= 0;
	for i:= 1 to LIM do
		begin
			if(v[i] >= 4) then
				cant:= cant+1;
		end;
	cantAprobados:= cant;
end;

procedure entreDosValoresFinales(a: arb; num1, num2, cant: integer; var aux: integer);
begin
	if(a<>nil) then
		begin
			if(a^.dato.code > num1) and (a^.dato.code < num2) then
				begin
					if(cantAprobados(a^.dato.nota)=cant) then
						aux:= aux+1;
					entreDosValoresFinales(a^.hi, num1, num2, cant, aux);
					entreDosValoresFinales(a^.hd, num1, num2, cant, aux);
				end
			else
				if(a^.dato.code > num1) then
					entreDosValoresFinales(a^.hi, num1, num2, cant, aux)
				else
					entreDosValoresFinales(a^.hd, num1, num2, cant, aux);
		end;
end;

procedure imprimirLista(l: listapromedios);
begin
	while(l<>nil) do
		begin
			writeln('NumAlumno=', l^.dato.codealumno, ' Promedio=', l^.dato.promedio:0:2);
			l:= l^.sig;
		end;
end;

var
	a: arb;
	v: vec;
	l: listapromedios;
	code, num1, num2, cant, aux: integer;
begin
	Randomize;
	a:= nil;
	l:= nil;
	cargarArbol(a, v);
	imprimirArbol(a);
	writeln();
	writeln('----------------');
	imprimirVec(v);

	writeln();
	writeln();
	writeln('----------------');
	writeln('Ingrese un codigo de alumno: ');
	readln(code);
	generarListaMayores(a, l, code);
	writeln('Lista de alumnos con codigo mayor a ', code, ': ');
	imprimirLista(l);

	writeln();
	writeln('----------------');
	writeln('Ingrese un primer codigo de alumno: ');
	readln(num1);
	writeln('Ingrese un segundo codigo de alumno: ');
	readln(num2);
	writeln('Ingrese una cantidad de finales aprobados: ');
	readln(cant);
	aux:= 0;
	verificar(num1,num2);
	entreDosValoresFinales(a, num1, num2, cant, aux);
	writeln('La cantidad de alumnos con cantidad de finales aprobados igual a ', cant, ' y cuyo codigo esta entre ', num1, ' y ', num2, ' es: ', aux);
end.