program ej3;
const
	LIM = 30;
type

	APROBADAS = 4..10;
	
	NOTA = 1..10;

	MATERIAS = 1..30;

		
	final = record
		codealumno : integer;
		codemateria : integer;
		nota : NOTA;
		end;
		
		
	finalrendido = record
		codealumno : integer;
		nota : NOTAS;
		end;
		
	lis = ^nodofinales
	
	nodofinales = record
		f : finalrendido;
		materia : integer;
		sig : lis;
		end;
		
		
	materia = record
		code : integer;
		final : lis;
		end;
		
	vecnotas = array[MATERIAS] of APROBADAS;	
		
	alumno = record
		code : integer;
		nota : vecnotas;
		diml := integer;
		end;	
		
	vec = array[MATERIAS] of materia;
		
	
	arb = ^nodo
	
	nodo = record
		dato : alumno;
		hi : arb;
		hd : arb;
		end;


	registropromedio = record
		promedio : real;
		codealumno : integer;
		end;

	listapromedios = ^nodopromedios;
	
	nodopromedios = record
		p : registropromedio;
		sig : listapromedios;

procedure inicializarvector(var vec : vecnotas);
var
	i : integer;
begin
	for i := 1 to LIM do
		begin
			vec[i] := -1;
		end;
end;
	


procedure leer(var f : final);
begin
	writeln('ingrese codigo de alumno: ');
	readln(f.codealumno);
	writeln('ingrese codigo de materia: ');
	readln(f.codemateria);
	writeln('ingrese la nota: ');
	readln(f.nota);
end;


procedure agregarnodo(var a : arb; alu : alumno);
begin
	if(a = nil) then
		begin
			new(a); a^.hi := nil; a^.hd := nil; a^.dato := alu;
		end
	else
		if(alu.code <= a^.dato.code) then
			agregarnodo(a^.hi, alu);
		else
			agregarnodo(a^.hd, alu);
end;

procedure buscar(a : arb; var ok : boolean; var nodo : arb; codigoalumno : integer);
begin
	if(a <> nil) then
		begin
			if(codigoalumno = a^.dato.code) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(codigoalumno > a^.dato.code) then
						buscar(a^.hd, ok, nodo, codigoalumno);
					else
						buscar(a^.hi, ok ,nodo, codigoalumno);
				end;
		end
	else
		begin
			ok := false;
			nodo := nil;
		end;
end;


procedure agregaradelante(var l : lis; elemento : final);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.materia := elemento.codemateria; aux^.f.codealumno := elemento.codealumno; aux^.f.nota := elemento.nota;
	if(l = nil) then
		l := aux;
	else
		aux^.sig := l;
		l := aux;
end;
	
		

procedure cargararbol(var a : arb; var l : lis);
var
	alu : alumno;
	f : final;
	ok : boolean;
	nodo : arb;
begin
	leer(f);
	if(f.nota <> -1) then
		begin
			if(f.nota >= 4) then
				begin
					agregaradelante(l, f);
					buscar(a, ok, nodo, f.codealumno);
					if(ok = true) then
						begin
							a^.dato.nota[f.codemateria] := f.nota;
							a^.dato.diml := a^.dato.diml + 1;
						end
					else
						begin
							alu.code :=  f.codealumno;
							alu.nota[f.codemateria] := f.nota;
							alu.diml := 1;
							agregarnodo(a, alu);
						end;
				end
			else	
				agregaradelante(l, f);
			cargararbol(a);
		end;
end;


procedure agregarpromedios(var l : listapromedios; elemento : registropromedio);
var
	aux : listapromedios;
begin
	new(aux); aux^.sig := nil; aux^.p := elemento;
	if(aux = nil) then
		l := aux;
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;


function cantidad(v : vecnotas; diml : integer;) : integer;
var
	cant, i : integer;
begin
	cant := 0;
	for i := 1 to diml do
		begin
			cant := v[i] + cant;
		end;
	cantidad := cant;
end;


procedure promedio(a : arb; var l : listapromedios; codigo : integer);
var
	aux : registropromedio;
begin
	if(a <> nil) then
		begin
			if(a^.dato.code > codigo) then
				begin
					aux.promedio := (cantidad(a^.dato.notas) / a^.dato.diml);
					aux.codealumno := a^.dato.code;
					agregarpromedios(l, aux);
					promedio(a^.hi, l, codigo);
					promedio(a^.hd, l, codigo);
				end
			else
				promedio(a^.hd, l, codigo);
		end;
end;
					
					
function entredosnum(numero, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if(num1 > num2) then
		begin
			aux:= num1;
			num1 := num2;
			num2 := aux;
		end;
	if(numero >= num1) and (numero <= num2) then
		entredosnum := true;
	else
		entredosnum := false;
end;


	
function mayorentredosvalores(a : arb; num1, num2, valor : integer) : integer;
begin
	if(entredosnum(a^.dato.code, num1, num2)) then
		begin
			if(valor = a^.dato.diml) then
				mayorentredosvalores := mayorentredosvalores(a^.hi, num1, num2, valor) + mayorentredosvalores(a^.hd, num1, num2, valor) + 1;
			else
				mayorentredosvalores := 0;
		end;
	else
		begin
			if(num1 < a^.dato.code) then
				mayorentredosvalores := (a^.hd, num1, num2, valor)
			else
				mayorentredosvalores := (a^.hi, num1, num2, valor);
		end;
end;