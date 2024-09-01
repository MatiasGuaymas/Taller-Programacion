{3. Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3;
type
    regLectura = record
        legajo: integer;
        materia: integer;
        fecha: integer;
        nota: integer;
    end;
    regLista = record
        materia: integer;
        fecha: integer;
        nota: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: regLista;
        sig: lista;
    end;
    regArbol = record
        legajo: integer;
        l: lista;
    end;
    arbol = ^nodoArbol;
    nodoArbol = record
        dato: regArbol;
        HI: arbol;
        HD: arbol;
    end;
    regProm = record
        legajo: integer;
        promedio: real;
    end;
    listaPromedios = ^nodoPromedios;
    nodoPromedios = record
        dato: regProm;
        sig: listaPromedios;
    end;
procedure leerFinal(var r: regLectura);
begin
    r.legajo:= random(101);
    if (r.legajo <> 0) then
    begin
        r.materia:= random(101);
        r.fecha:= random(31)+1;
        r.nota:= random(9)+2;
    end;
end;
procedure convertirRegistro(r: regLectura; var rLista: regLista);
begin
    rLista.materia:= r.materia;
    rLista.fecha:= r.fecha;
    rLista.nota:= r.nota;
end;
procedure agregarAdelante(var l: lista; rLista: regLista);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato:= rLista;
    nuevo^.sig:= l;
    l:= nuevo;
end;
procedure insertar(var a: arbol; rLista: regLista; legajo: integer);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.legajo:= legajo;
        a^.dato.l:= nil;
        agregarAdelante(a^.dato.l, rLista);
        a^.HI:= nil;
        a^.HD:= nil;
    end;
    if (a^.dato.legajo = legajo) then
    begin
        agregarAdelante(a^.dato.l, rLista);
    end
    else
    begin
        if (legajo < a^.dato.legajo) then
            insertar(a^.HI, rLista, legajo)
        else
            insertar(a^.HD, rLista, legajo);
    end;
end;
procedure cargarArbol(var a: arbol);
var
    r: regLectura;
    rLista: regLista;
begin
    leerFinal(r);
    while (r.legajo <> 0) do
    begin
        convertirRegistro(r, rLista);
        insertar(a, rLista, r.legajo);
        leerFinal(r);
    end;
end;
procedure cantidadAlumnosImpares(a: arbol; var cant: integer);
begin
    if (a <> nil) then
    begin
        if (a^.dato.legajo mod 2 <> 0) then
            cant:= cant + 1;
        cantidadAlumnosImpares(a^.HI, cant);
        cantidadAlumnosImpares(a^.HD, cant);
    end;
end;
function cantFinales(l: lista): integer;
var
    cant: integer;
begin
    cant:= 0;
    while (l <> nil) do
    begin
        if (l^.dato.nota >= 4) then
            cant:= cant + 1;
        l:= l^.sig;
    end;
    cantFinales:= cant;
end;
procedure cantidadFinalesAprobados(a: arbol);
begin
    if (a <> nil) then
    begin
        writeln('Legajo=', a^.dato.legajo, ' Cantidad de finales aprobados=', cantFinales(a^.dato.l));
        cantidadFinalesAprobados(a^.HI);
        cantidadFinalesAprobados(a^.HD);
    end;
end;
function promAlumno(l: lista): real;
var
    suma: integer;
    cant: integer;
begin
    suma:= 0;
    cant:= 0;
    while (l <> nil) do
    begin
        suma:= suma + l^.dato.nota;
        cant:= cant + 1;
        l:= l^.sig;
    end;
    if (cant <> 0) then
        promAlumno:= suma / cant
    else
        promAlumno:= 0;
end;
procedure agregarAdelanteProm(var l: listaPromedios; r: regProm);
var
    nuevo: listaPromedios;
begin
    new(nuevo);
    nuevo^.dato:= r;
    nuevo^.sig:= l;
    l:= nuevo;
end;
procedure agregarListaPromedios(a: arbol; var l: listaPromedios; promedio: real);
var
    promAlu: real;
    r: regProm;
begin
    if (a <> nil) then
    begin
        promAlu:= promAlumno(a^.dato.l);
        if(promAlu > promedio) then
            begin
                r.legajo:= a^.dato.legajo;
                r.promedio:= promAlu;
                agregarAdelanteProm(l, r);
            end;
        agregarListaPromedios(a^.HI, l, promedio);
        agregarListaPromedios(a^.HD, l, promedio);
    end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            write('MAT=', l^.dato.materia, ' FECHA=', l^.dato.fecha, ' NOTA=', l^.dato.nota, ' - ');
            l:= l^.sig;
        end;
end;
procedure imprimirNodo(r: regArbol);
begin
    write('LEGAJO=', r.legajo, ' Lista:');
    imprimirLista(r.l);
    writeln();
end;
procedure imprimirArbol(a: arbol);
begin
    if (a <> nil) then
    begin
        imprimirArbol(a^.HI);
        imprimirNodo(a^.dato);
        imprimirArbol(a^.HD);
    end;
end;
procedure imprimirListaPromedios(l: listaPromedios);
begin
    while(l<>nil) do
        begin
            write('LEGAJO=', l^.dato.legajo, ' PROMEDIO=', l^.dato.promedio:0:2, ' - ');
            l:= l^.sig;
        end;
end;
var
    a: arbol;
    cant: integer;
    l: listaPromedios;
begin
    Randomize;
    a:= nil;
    l:= nil;
    cant:= 0;
    cargarArbol(a);
    imprimirArbol(a);
    cantidadAlumnosImpares(a, cant);
    writeln('Cantidad de alumnos con legajo impar=', cant);
    cantidadFinalesAprobados(a);
    agregarListaPromedios(a, l, 6);
    writeln('Alumnos con promedio mayor a 6:');
    imprimirListaPromedios(l);
end.


