program parcial1;
type
    subCode = 1..15;
    atencion = record
        dni: integer;
        mes: integer;
        code: subCode;
    end;
    cliente = record
        dni: integer;
        cant: integer;
    end;
    arbol = ^nodo;
    nodo = record
        dato: cliente;
        hi: arbol;
        hd: arbol;
    end;
    vecCode = array [subCode] of integer;
procedure inicializarVector(var v: vecCode);
var
    i: subCode;
begin
    for i:= 1 to 15 do v[i]:= 0;
end;
{procedure leerAtencion(a: atencion);
begin
    writeln('Ingrese el dni del paciente');
    readln(a.dni);
    writeln('Ingrese el numero de mes');
    readln(a.mes);
    if(a.mes <> 0) then
        begin
            writeln('Ingrese el codigo del diagnostico');
            readln(a.code);
        end;
end;}
procedure cargarArbol(var a: arbol; at: atencion);
var
    c: cliente;
begin
    if(a=nil) then
        begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            c.dni:= at.dni;
            c.cant:= 1;
            a^.dato:= c;
        end
    else
        if(at.dni = a^.dato.dni) then
            a^.dato.cant:= a^.dato.cant + 1
        else
            if(at.dni < a^.dato.dni) then
                cargarArbol(a^.hi, at)
            else
                cargarArbol(a^.hd, at);
end;
procedure imprimirPaciente(c: cliente);
begin
    writeln('DNI=', c.dni, ' CANT=', c.cant);
end;
procedure cargarEstructuras(var a: arbol; var v: vecCode);
var
    at: atencion;
    i: integer;
begin
    inicializarVector(v);
   { leerAtencion(at);
    while(at.mes <> 0) do
        begin
            v[at.code]:= v[at.code] + 1;
            cargarArbol(a, at);
            leerAtencion(at);
        end;}
    for i:= 1 to Random(10)+5 do
        begin
            at.dni:= Random(10)+1;
            at.mes:= Random(12)+1;
            at.code:= Random(15)+1;
            v[at.code]:= v[at.code] + 1;
            writeln('DNI=', at.dni, ' MES=', at.mes, ' CODE=', at.code);
            cargarArbol(a, at);
        end;
end;
procedure entreDosValores(a: arbol; num1, num2, cant: integer; var aux: integer);
begin
	if(a<>nil) then
		begin
			if(a^.dato.dni > num1) and (a^.dato.dni < num2) then
				begin
					if(a^.dato.cant = cant) then
						aux:= aux+1;
					entreDosValores(a^.hi, num1, num2, cant, aux);
					entreDosValores(a^.hd, num1, num2, cant, aux);
				end
			else
				if(a^.dato.dni > num1) then
					entreDosValores(a^.hi, num1, num2, cant, aux)
				else
					entreDosValores(a^.hd, num1, num2, cant, aux);
		end;
end;
procedure imprimirArbol(a: arbol);
begin
    if(a<>nil) then
        begin
            imprimirArbol(a^.hi);
            imprimirPaciente(a^.dato);
            imprimirArbol(a^.hd);
        end;
end;
procedure imprimirVector(v: vecCode);
var
    i: integer;
begin
    for i:= 1 to 15 do begin
        writeln(i, '. ', v[i]);
    end;
end;
function atencionesCero(v:vecCode; cant, dim:integer):integer;
begin
    if (dim = 0) then
        atencionesCero := cant
    else
        begin
            if(v[dim] = 0) then
                cant:= cant + 1;
            atencionesCero:= atencionesCero(v, cant, dim-1);
        end;
end;
{function atencionesCeroV2(v:vecCode; dim:integer):integer;
begin
    if (dim = 0) then
        atencionesCeroV2 := 0
    else
        begin
            atencionesCeroV2:= atencionesCeroV2(v, dim-1);
            if(v[dim] = 0) then
                atencionesCeroV2:= atencionesCeroV2 + 1;
        end;
end;}
var
    a: arbol;
    v: vecCode;
    num1, num2, x, cant, dim: integer;
begin
    Randomize;
    a:= nil;
    cargarEstructuras(a, v);
    writeln('---------------');
    imprimirArbol(a);
    writeln('Ingrese un primer numero de DNI');
    readln(num1);
    writeln('Ingrese un segundo numero de DNI');
    readln(num2);
    writeln('Ingrese un valor entero X');
    readln(x);
    cant:= 0;
    entreDosValores(a, num1, num2, x, cant);
    writeln('La cantidad de pacientes con mas de ', x, ' consultas cuyo DNI esta entre ', num1, ' y ', num2, ' es: ', cant);
    writeln('---------------');
    imprimirVector(v);
    cant:= 0;
    dim:= 15;
    writeln('La cantidad de diagnosticos para los cuales la cantidad de atenciones fue cero es: ', atencionesCero(v, cant, dim));
    //writeln('V2: La cantidad de diagnosticos para los cuales la cantidad de atenciones fue cero es: ', atencionesCeroV2(v, dim));
end.