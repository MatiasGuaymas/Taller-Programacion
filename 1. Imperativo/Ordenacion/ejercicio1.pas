{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}

program ejercicio1;
type
    subDia = 1..31;
    subCode = 1..15;
    subVend = 1..99;
    venta = record
        dia: subDia;
        codigo: subCode;
        cantV: subVend;
    end;
    vecVentas = array [1..50] of venta;
    {tipoVentaCodigoPar = record 
        codigo:tipocodigo;
        cantidad:tipocantidad;
    end;
    tipoVentasCodigoPar = array [1..maxVentas] of tipoVentaCodigoPar;}
procedure cargarVector(var v: vecVentas; var diml: integer);
var
    i: integer;
begin
    diml:= Random(50)+1;
    for i:= 1 to diml do
        begin
            v[i].dia:=random(31)+1;
            v[i].codigo:=random(15)+1;
            v[i].cantV:=random(99)+1;
        end;
end;
procedure imprimirVector(v: vecVentas; diml: integer);
var
    i: integer;
begin
    for i:= 1 to diml do
        writeln('Venta ', i, ' : Dia = ', v[i].dia, ' Codigo = ', v[i].codigo, ' Cantidad = ', v[i].cantV);
end;
procedure ordenarInsercion(var v: vecVentas; diml: integer);
var
    i, j: integer;
    actual: venta;
begin
    for i:= 2 to diml do begin
        actual:= v[i];
        j:= i-1;
        while(j>0) and (v[j].codigo > actual.codigo) do
            begin
                v[j+1]:= v[j];
                j:= j-1;
            end;
        v[j+1]:= actual;
    end;
end;
function busquedaBinaria (v:vecVentas; diml,codigo:integer):integer;
var 
    indiceIzq,indiceDer,medio:integer;
begin
    indiceIzq:=1;
    indiceDer:=diml;
    medio:=((indiceIzq+indiceDer) div 2);
    while (indiceIzq<indiceDer) and (v[medio].codigo<>codigo) do 
        begin
            medio:=((indiceIzq+indiceDer) div 2);
            if (codigo>v[medio].codigo) then 
                indiceIzq:=medio+1
            else 
                indiceDer:=medio-1;
        end;
    busquedaBinaria:=medio;
end;
procedure eliminar (var v: vecVentas; var diml:integer; codigoIzq, codigoDer: integer);
var 
    i,indiceIzq,indiceDer,salto:integer;
begin 
    writeln('Se eliminaran todas las ventas con codigo entre ',codigoIzq,' y ',codigoDer,'.');
    i:=1;
    while (i<diml) and (v[i].codigo < codigoIzq) do
        i:=i+1;
    indiceIzq:=i;
    while (i<diml) and (v[i].codigo <= codigoDer) do
        i:=i+1;
    indiceDer:=i; 

    salto:=indiceDer-indiceIzq;
    while ((indiceIzq+salto)<=diml) do 
        begin
            v[indiceIzq]:=v[indiceIzq+salto]; 
            indiceIzq:=indiceIzq+1;
        end;   
    {Si se quiere borrar todos los elementos hay que agregar esto:
    if(v[i].codigo >= codigoIzq) or (v[i].codigo <= codigoDer) then
    salto:= salto+1;}
    diml:=diml-salto;
end;
{procedure imprimirVentasCodigoPar(ventas:tipoVentasCodigoPar;dimlVentasCodigoPar:integer);
var 
    i:integer;
begin 
    writeln();
    writeln('Ventas con codigo par: ');
    for i:=1 to dimlVentasCodigoPar do 
        writeln('Venta ',i,' Codigo=',ventas[i].codigo,' Cantidad=',ventas[i].cantidad,'.');
    writeln();
end;
procedure modulog (ventas:tipoventas;var ventasCodPar:tipoVentasCodigoPar;diml:integer;var dimlVentasCodigoPar:integer);//Retorna la informacion de cada codigo par con su cantidad 
var 
    i:integer;
    ventaCodigoPar:tipoVentaCodigoPar;
begin 
    dimlVentasCodigoPar:=0;
    for i:=1 to diml do 
        begin
            if ((ventas[i].codigo mod 2)=0) then
                begin 
                    dimlVentasCodigoPar:=dimlVentasCodigoPar+1;
                    ventaCodigoPar.codigo:=ventas[i].codigo;
                    ventaCodigoPar.cantidad:=ventas[i].cantidad;
                    ventasCodPar[dimlVentasCodigoPar]:=ventaCodigoPar;
                end;
        end;
end; 
}
var
    v: vecVentas;
    diml, codeIzq, codeDer: integer;
begin
    Randomize;
    cargarVector(v, diml);
    imprimirVector(v, diml);

    writeln();

    ordenarInsercion(v, diml);
    imprimirVector(v, diml);

    writeln();
    
    eliminar(v, diml, 4, 8);
    imprimirVector(v, diml);

    {modulog(ventas,ventasCodigoPar,diml,dimlVentasCodigoPar);
    imprimirVentasCodigoPar(ventasCodigoPar,dimlVentasCodigoPar);}
end.