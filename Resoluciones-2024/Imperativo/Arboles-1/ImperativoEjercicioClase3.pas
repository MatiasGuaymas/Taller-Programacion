{Escribir un programa que:
a. Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro para: 
    i. Informar los datos de los socios en orden creciente.
    ii. Informar los datos de los socios en orden decreciente.
    iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
    iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.
    vi. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
    vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
    viii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que retorne el promedio de las edades de los socios.}

Program ImperativoClase3;

type 
  rangoEdad = 12..100;
  cadena15 = string[15];
  socio = record
    numero: integer;
    nombre: cadena15;
    edad: rangoEdad;
  end;
  
  arbol = ^nodoArbol;
  nodoArbol = record
    dato: socio;
    HI: arbol;
    HD: arbol;
  end;

procedure GenerarArbol(var a: arbol);
  procedure CargarSocio(var s: socio);
  var
    vNombres: array[0..9] of string = ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola');
  begin
    s.numero := random(51) * 100;
    if s.numero <> 0 then
    begin
      s.nombre := vNombres[random(10)];
      s.edad := 12 + random(79);
    end;
  end;

  procedure InsertarElemento(var a: arbol; elem: socio);
  begin
    if a = nil then
    begin
      new(a);
      a^.dato := elem;
      a^.HI := nil;
      a^.HD := nil;
    end
    else if elem.numero < a^.dato.numero then
      InsertarElemento(a^.HI, elem)
    else
      InsertarElemento(a^.HD, elem);
  end;

var
  unSocio: socio;
begin
  writeln;
  writeln('----- Ingreso de socios y armado del arbol ----->');
  writeln;
  a := nil;
  CargarSocio(unSocio);
  while unSocio.numero <> 0 do
  begin
    InsertarElemento(a, unSocio);
    CargarSocio(unSocio);
  end;
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarSociosOrdenCreciente(a: arbol);
  procedure InformarDatosSociosOrdenCreciente(a: arbol);
  begin
    if a <> nil then
    begin
      InformarDatosSociosOrdenCreciente(a^.HI);
      writeln('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
      InformarDatosSociosOrdenCreciente(a^.HD);
    end;
  end;

begin
  writeln;
  writeln('----- Socios en orden creciente por numero de socio ----->');
  writeln;
  InformarDatosSociosOrdenCreciente(a);
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarSociosOrdenDecreciente(a: arbol);
  procedure InformarDatosSociosOrdenDecreciente(a: arbol);
  begin
    if a <> nil then
    begin
      InformarDatosSociosOrdenDecreciente(a^.HD);
      writeln('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
      InformarDatosSociosOrdenDecreciente(a^.HI);
    end;
  end;

begin
  writeln;
  writeln('----- Socios en orden decreciente por numero de socio ----->');
  writeln;
  InformarDatosSociosOrdenDecreciente(a);
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarNumeroSocioConMasEdad(a: arbol);
  procedure ActualizarMaximo(var maxValor, maxElem: integer; nuevoValor, nuevoElem: integer);
  begin
    if nuevoValor >= maxValor then
    begin
      maxValor := nuevoValor;
      maxElem := nuevoElem;
    end;
  end;

  procedure NumeroMasEdad(a: arbol; var maxEdad: integer; var maxNum: integer);
  begin
    if a <> nil then
    begin
      ActualizarMaximo(maxEdad, maxNum, a^.dato.edad, a^.dato.numero);
      NumeroMasEdad(a^.HI, maxEdad, maxNum);
      NumeroMasEdad(a^.HD, maxEdad, maxNum);
    end;
  end;

var
  maxEdad, maxNum: integer;
begin
  writeln;
  writeln('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad(a, maxEdad, maxNum);
  if maxEdad = -1 then
    writeln('Arbol sin elementos')
  else
    writeln('Numero de socio con mas edad: ', maxNum);
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure AumentarEdadNumeroImpar(a: arbol);
  function AumentarEdad(a: arbol): integer;
  var
    resto: integer;
  begin
    if a = nil then
      AumentarEdad := 0
    else
    begin
      resto := a^.dato.edad mod 2;
      if resto = 1 then
        a^.dato.edad := a^.dato.edad + 1;
      AumentarEdad := resto + AumentarEdad(a^.HI) + AumentarEdad(a^.HD);
    end;
  end;

begin
  writeln;
  writeln('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln('Cantidad: ', AumentarEdad(a));
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarExistenciaNombreSocio(a: arbol);
  function ExisteNombre(a: arbol; nom: cadena15): boolean;
  begin
    if a = nil then
      ExisteNombre := false
    else if a^.dato.nombre = nom then
      ExisteNombre := true
    else
      ExisteNombre := ExisteNombre(a^.HI, nom) or ExisteNombre(a^.HD, nom);
  end;

var
  nom: cadena15;
begin
  writeln;
  writeln('----- Verificar existencia de un nombre ----->');
  writeln;
  write('Ingrese nombre a buscar: ');
  readln(nom);
  if ExisteNombre(a, nom) then
    writeln('El nombre ', nom, ' existe en el arbol')
  else
    writeln('El nombre ', nom, ' no existe en el arbol');
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

function CantidadSocios(a: arbol): integer;
begin
  if a = nil then
    CantidadSocios := 0
  else
    CantidadSocios := 1 + CantidadSocios(a^.HI) + CantidadSocios(a^.HD);
end;

procedure InformarCantidadSocios(a: arbol);
var
  cant: integer;
begin
  writeln;
  writeln('----- Cantidad de socios ----->');
  writeln;
  cant := CantidadSocios(a);
  writeln('Cantidad de socios: ', cant);
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure InformarPromedioDeEdad(a: arbol);
  function EdadTotal(a: arbol; total: integer): integer;
  begin
    if a <> nil then
      total := a^.dato.edad + EdadTotal(a^.HI, total) + EdadTotal(a^.HD, total);
    EdadTotal := total;
  end;

  function EdadProm(a: arbol): real;
  var
    total, cant, sumaEdades: integer;
  begin
    cant := CantidadSocios(a);
    total := 0;
    sumaEdades := EdadTotal(a, total);
    if cant > 0 then
      EdadProm := sumaEdades / cant
    else
      EdadProm := 0;
  end;

var
  prom: real;
begin
  writeln;
  writeln('----- Promedio de edad de los socios ----->');
  writeln;
  prom := EdadProm(a);
  writeln('Promedio de edad de los socios: ', prom:2:2);
  writeln;
  writeln('//////////////////////////////////////////////////////////');
  writeln;
end;

var
  a: arbol;
begin
  randomize;
  GenerarArbol(a);
  InformarSociosOrdenCreciente(a);
  InformarSociosOrdenDecreciente(a);
  InformarNumeroSocioConMasEdad(a);
  AumentarEdadNumeroImpar(a);
  InformarExistenciaNombreSocio(a);
  InformarCantidadSocios(a);
  InformarPromedioDeEdad(a);
end.
