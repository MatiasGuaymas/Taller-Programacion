{1.- Descargar el programa ImperativoEjercicioClase2.pas que contiene parte del código del
siguiente enunciado a resolver. Implementar lo indicado en el código.
Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random”
mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del
vector.
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores
pares contenidos en el vector.
e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del
vector.
f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si
dicho valor se encuentra en el vector o falso en caso contrario.
g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en
el vector, sus dígitos en el orden en que aparecen en el número. Debe implementarse un
módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se
debe imprimir 1 4 2.}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
    if(dimL<>0) then
        begin
            ImprimirVectorRecursivo(v, dimL-1);
            write(v[dimL], ' | ');
        end;    
end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos > dimL) then 
        SumarRecursivo:= 0
    else if (v[pos] mod 2 = 0) then
        SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]   
    else
        SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL);
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function ObtenerMaximo (v: vector; dimL: integer): integer;
begin
    if(dimL <> 0) then
        begin
            if(dimL = 1) then
                ObtenerMaximo:=v[dimL]
            else
                begin
                    ObtenerMaximo:=ObtenerMaximo(v, dimL-1);
                    if(v[dimL] > ObtenerMaximo) then
                        ObtenerMaximo:=v[dimL];
                end;
        end;
end;     
     
function BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
    if(dimL = 0) then
        BuscarValor:=false
    else
        begin
            if(v[dimL] = valor) then
                BuscarValor:=true
            else
                BuscarValor:=BuscarValor(v, dimL-1, valor);
        end;
end; 

procedure descomponerNumero(var dig: integer; var num: integer);
begin
	dig:= num mod 10;
	num:= num div 10;
end;

procedure impDigitos(num: integer);
var
	dig: integer;
begin
	if(num <> 0) then
		begin
			descomponerNumero(dig, num);
			impDigitos(num);
			write(' ', dig);
		end;
end;

procedure ImprimirDigitos (v: vector; dimL: integer);
begin    
    if(dimL<>0) then
        begin
            ImprimirDigitos(v, dimL-1);
            writeln();
            write('Numero: ', v[dimL], ' -> ');
            impDigitos(v[dimL]);  
        end;   
end; 

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                     {  ImprimirVectorRecursivo (v, dimL);}
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.