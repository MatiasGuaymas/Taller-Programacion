{a) Implemente un módulo CargarVector que cree un vector de enteros
con a lo sumo 50 valores aleatorios. Los valores, generados
aleatoriamente (entre un mínimo y máximo recibidos por parámetro),
deben ser almacenados en el vector en el mismo orden que se
generaron, hasta que se genere el cero.
b) Implemente un módulo ImprimirVector que reciba el vector generago
en a) e imprima todos los valores del vector en el mismo orden que
están almacenados. Qué cambiaría para imprimir en orden inverso?
c) Escriba el cuerpo principal que invoque a los módulos ya
implementados.}

program ProgramaVectores;
const
    DIMF = 50;
type
    subRango = 1..DIMF;
    vector = array [subRango] of integer;
procedure CargarVector(var v: vector; min, max: integer; var dimL: integer);
var
    num: integer;
begin
    dimL := 0;
    num := random(max - min + 1) + min;
    while (dimL < MAX) and (num <> 0) do begin
        dimL := dimL + 1;
        v[dimL] := num;
        num := random(max - min + 1) + min;
    end;
end;
procedure ImprimirVector(v: vector; dimL: integer);
var
    i: subRango;
begin
    for i:= 1 to dimL do begin
        writeln('El valor del vector en la posicion ', i, ' es: ', v[i]);
    end;
end;
procedure ImprimirVectorInverso(v: vector; dimL: integer);
var
    i: subRango;
begin
    for i:= dimL downto 1 do begin
        writeln('El valor del vector en la posicion ', i, ' es: ', v[i]);
    end;
end;
var
    v: vector;
    dimL, min, max: integer;
begin
    randomize;
    min := -10;
    max := 10;
    //verificar(min, max);
    CargarVector(v, min, max, dimL);
    ImprimirVector(v, dimL);
    writeln('---------------------');
    ImprimirVectorInverso(v, dimL);
end.