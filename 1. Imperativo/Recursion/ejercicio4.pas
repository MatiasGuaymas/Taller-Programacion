{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program ejercicio4;
const
	DIMF = 20;
type
	vecNum = array [1..DIMF] of integer;
procedure generarVector(var v: vecNum; dimL: integer);
var
    num: integer;
begin
	if(dimL < DIMF) then
		begin
			dimL:= dimL + 1;
			num:= random(99)+1; 
			v[dimL] := num;
			generarVector(v, dimL);
		end;
end;
procedure imprimirVector(v: vecNum);
var
	i:integer;
begin
	for i:= 1 to DIMF do
		writeln('En la posicion: ', i, ', el valor actual es ', v[i]);
end;

function Encontrar_Maximo(v:vecNum; max, i:integer):integer;
Begin
    if (i < dimF) then
    begin
		i:=i+1;
        if (v[i] > max) then
        begin
            max:=v[i];
        end;
        Encontrar_Maximo:=Encontrar_Maximo(v,max,i);
    end
    else
        Encontrar_Maximo:=max;
End;

function suma(v: vecNum; i,total: integer): integer;
begin
  if(i < DIMF)then
    begin
      i:= i+1;
      total:= total + v[i];
      suma:= suma(v,i,total);
    end
  else
    suma:= total;
end;

var
	v: vecNum;
	max, dimL, total: integer;
begin
	Randomize;
	dimL:= 0;
	generarVector(v, dimL); //A
	imprimirVector(v);
	max:= -1;
	dimL:= 0;
	WriteLn('El valor maximo es: ', Encontrar_Maximo(v,max,dimL));//B
	dimL:= 0; 
	total:= 0;
	writeln('La suma total del vector es: ',suma(v,dimL, total)); //C
end.