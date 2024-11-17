{1.- Implementar un programa que procese la información de los alumnos de la Facultad de
Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}

program ejercicio1;
type
    vAp = array [1..36] of integer;
    alumno = record
        ap: string;
        num: integer;
        ingreso: integer;
        materias: vAp;
    end;
    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
procedure leerMaterias(var v: vAp);
var
    i: integer;
begin
    for i:= 1 to 36 do
        begin
            writeln('Ingrese nota de la materia numero ', i, ': ');
            readln(v[i]);
        end;
end;
procedure leerAlumno(var a: alumno);
begin
    writeln('Ingrese el numero del alumno: ');
    readln(a.num);
    writeln('Ingrese el apellido del alumno: ');
    readln(a.ap);
    writeln('Ingrese el anio de ingreso del alumno: ');
    readln(a.ingreso);
    leerMaterias(a.materias);
end;
procedure agregarAdelante(var l: lista; a: alumno);
var
    aux: lista;
begin
    new(aux); aux^.sig:= nil; aux^.dato:= a;
    if (l = nil) then l:= aux
    else
        begin
            aux^.sig:= l;
            l:= aux;
        end;
end;
procedure cargarLista(var l: lista);
var
    a: alumno;
begin
    repeat
        leerAlumno(a);
        agregarAdelante(l, a);
    until (a.num = 11111);
end;
function calcularProm(v: vAp): real;
var
    prom: real;
    i: integer;
begin
    prom:= 0;
    for i:= 1 to 36 do prom:= prom + v[i];
    calcularProm:= (prom/36);
end;
procedure procesarAlumno(l: lista);
begin
    while(l<>nil) do
        begin
            writeln('El alumno con numero: ', l^.dato.num, ' tiene un promedio de: ', calcularProm(l^.dato.materias):0:2);
            l:= l^.sig;
        end;
end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l);
    procesarAlumno(l);
end.