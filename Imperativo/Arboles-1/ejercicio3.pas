{ EJERCICIO 3
3. Implementar un programa que contenga:
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
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f.
Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

prg
type
	producto = record
		cant : integer;
		monto : real;
		codep : integer;
		end;
		
	venta = record
		code : integer;
		codep: integer;
		cant : integer;
		precio : real;
		end;
		
	arb = ^nodo
	
	nodo = record
		p : producto;
		hi : arb;
		hd : arb;
		end;
		
procedure leer(var v : venta);
begin
	read(v.code);
	read(v.codep);
	read(v.cant);
	read(v.precio);
end;


procedure agregar(var a : arb; elem : venta);
Var
	aux : producto
begin
	aux.cant := elem.cant;
	aux.codep := elem.codep;
	aux.monto := elem.precio *elem.cant;
	if(a = nil) then
		begin
			new(a); a^.hi := nil, a^.hd := nil; a^.p := aux;
		end;
	else
		if(elem.code = a^.p.code) then
			begin
				a^.p.cant := a^.p.cant + aux.cant;
				a^.p.monto := aux.monto
		if(elem.code < a^.p.code) then
			agregar(a^.hi, elem);
		else
			agregar(a^.hd, elem);
end;
	



procedure cargararbol(var a : arb);
var
	aux : venta;
begin
	leer(aux);
	if(aux.code <> -1) then
		begin
			agregar(a, aux);
			leer(aux);
			cargararbol(a);
		end;
end;


procedure preorden(a : arb);
begin
	if(a <> nil) then
		begin
			writeln(a^.p.cant);
			writeln(a^.p.monto);
			writeln(a^.p.codep);
			preorden(a^.hi);
			preorden(a^.hd);
		end;
end;


function maximo(num1, num2): integer;
begin
	if (a = nil) then
		maximo := -1;
	else
		if(a^.p.ca
end;

procedure  maxproducto(a : arb; var max : integer; var codemax : integer);
begin
	if(a <> nil) then
		begin
			maxproducto(a^.hi, max, codemax);
			maxproducto(a^.hd, max, codemax);
			if(a^.p.cant > max) then
				begin
					codemax := a^.p.code;
					max := a^.p.cant;
				end;
		end;
	else
		maxproducto := -1;
end;


procedure menores(a : arb; var cant : integer; code : integer) : integer;
begin
	if(a <> nil) then
		begin
			if(a^.p.code < code) then
				begin
					cant := cant + 1;
					menores(a^.hi, cant, code);
					menores(a^.hd, cant, code);
				end;
			else
				menores(a^.hi, cant, code);
		end;
end;

procedure entredosvalores