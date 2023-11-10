{}
{Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. 
El ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la 
estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
comprendidos entre los dos valores recibidos (sin incluir).
}

Program ImperativoClase4;

type rangoEdad = 12..100;
     cadena15 = string [15];
     venta = record
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     productoVendido = record
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure ModuloA (var a: arbol);
{ Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }

  Procedure LeerVenta (var v: venta);
  begin
    write ('Ingrese codigo de venta: ');
    readln (v.codigoVenta);
    If (v.codigoVenta <> -1)
    then begin
           write ('Ingrese codigo de producto: ');
           readln (v.codigoProducto);
           write ('Ingrese cantidad de unidades: ');
           readln (v.cantUnidades);
           write ('Ingrese precio unitario: ');
           readln (v.precioUnitario);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: venta);
  var p: productoVendido;
     Procedure ArmarProducto (var p: productoVendido; v: venta);
     begin
       p.codigo:= v.codigoProducto;
       p.cantTotalUnidades:= v.cantUnidades;
       p.montoTotal:= v.cantUnidades * v.precioUnitario;
     end;
  Begin
    if (a = nil) 
    then begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigoProducto = a^.dato.codigo)
         then begin
                a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades;
                a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario);
              end
         else if (elem.codigoProducto < a^.dato.codigo) 
              then InsertarElemento(a^.HI, elem)
              else InsertarElemento(a^.HD, elem); 
  End;

var unaVenta: venta;  
Begin
 writeln;
 writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
 writeln;
 a:= nil;
 LeerVenta (unaVenta);
 while (unaVenta.codigoVenta <> -1) do
  begin
   InsertarElemento (a, unaVenta);
   writeln;
   LeerVenta (unaVenta);
  end;
 writeln;
 writeln ('-----------------------------------------------');
 writeln;
end;

procedure ModuloB (a: arbol);
{ Imprima el contenido del árbol ordenado por código de producto.}
  procedure ImprimirArbol (a: arbol);
  begin
    if (a <> nil)
    then begin
          if (a^.HI <> nil) then ImprimirArbol (a^.HI);
          writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotalUnidades, ' monto: ', a^.dato.montoTotal:2:2);
          if (a^.HD <> nil) then ImprimirArbol (a^.HD);
         end;
  end;

begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then writeln ('Arbol vacio')
                else ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloC (a: arbol);
{Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.}

  procedure CodigoDeProductoConMayorCantidadDeUnidadesVendidas (a: arbol; var maxCant: integer; var maxCod: integer);
  begin
    { COMPLETAR }
  end;
   
var maxCant, maxCod: integer;
begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  maxCant := -1;
  CodigoDeProductoConMayorCantidadDeUnidadesVendidas (a, maxCant, maxCod);
  if (maxCant = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Codigo de Producto con mayor cantidad de unidades vendidas: ', maxCod);
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloD (a: arbol);
{ Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la 
estructura. }
  
  function ObtenerCantidadCodigosMenores (a: arbol; unCodigo: integer): integer;
  begin
    { COMPLETAR }
  end;
   
var unCodigo, cantCodigos: integer;
begin
  writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  write ('Ingrese codigo de producto: ');
  readln (unCodigo);
  writeln;
  cantCodigos:= ObtenerCantidadCodigosMenores (a, unCodigo);
  if (cantCodigos = 0) 
  then writeln ('No hay codigos menores al codigo ', unCodigo)
  else begin
         writeln;
         writeln ('La cantidad de codigos menores a ', unCodigo, ' es: ', cantCodigos); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloE (a: arbol);
{ Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
comprendidos entre los dos valores recibidos (sin incluir). }
  
  function ObtenerMontoTotalEntreDosCodigos (a: arbol; codigo1, codigo2: integer): real;
  begin
    { COMPLETAR }
  end;
   
var codigo1, codigo2: integer;
    montoTotal: real;
begin
  writeln;
  writeln ('----- Modulo E ----->');
  writeln;
  write ('Ingrese primer codigo de producto: ');
  readln (codigo1);
  write ('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln (codigo2);
  writeln;
  montoTotal:= ObtenerMontoTotalEntreDosCodigos (a, codigo1, codigo2);
  if (montoTotal = 0) 
  then writeln ('No hay codigos entre ', codigo1, ' y ', codigo2)
  else begin
         writeln;
         writeln ('El monto total entre el codigo', codigo1, ' y el codigo : ', codigo2, ' es: ', montoTotal); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

var a: arbol; 
Begin
  ModuloA (a);
  ModuloB (a);
  { ModuloC (a);
    ModuloD (a);
    ModuloE (a);
  }   
End.