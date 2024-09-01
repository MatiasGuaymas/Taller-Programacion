{ ACTIVIDAD 1
a) Compile y ejecute el programa descargado
b) Responda ¿Qué hace el programa?
c) Modifique el programa para que imprima 20 números
aleatorios.
d) Modifique el programa para que imprima N números
aleatorios en el rango (A,B), donde N, A y B son
números enteros que se leen por teclado.
e) Modifique el programa para que imprima números
aleatorios en el rango (A,B) hasta que se genere un
valor igual a F, el cual no debe imprimirse. F, A y B
son números enteros que se leen por teclado.

b) El programa genera un número aleatorio en el intervalo 0 a 99 y lo imprime en pantalla.}

program ProgramaNumAleatorio;
procedure NumerosAleatorios20;
var 
     ale, i: integer;
begin
     for i:= 1 to 20 do begin
          ale := random (100); 
          writeln ('El numero aleatorio generado es: ', ale);
     end;
end;
procedure verificar(var a, b: integer);
var
     aux: integer;
begin
     if a > b then begin
          aux := a;
          a := b;
          b := aux;
     end;
end;
procedure imprimirEntreAyBConN(n, a, b: integer);
var 
     ale, i: integer;
begin
     for i:= 1 to n do begin
          ale := random (b - a + 1) + a; 
          writeln ('El numero aleatorio generado es: ', ale);
     end;
end;
procedure imprimirEntreAyBConF(n, a, b: integer);
var 
     ale: integer;
begin
     ale:= random (b - a + 1) + a;
     while(ale <> n) do begin
          writeln ('El numero aleatorio generado es: ', ale);
          ale:= random (b - a + 1) + a;
     end;
end;
var 
     n, a, b: integer;
begin
     randomize; 
     NumerosAleatorios20;
     writeln ('Ingrese la cantidad de numeros aleatorios a generar: ');
     readln (n);
     writeln ('Ingrese el valor de A: ');
     readln (a);
     writeln ('Ingrese el valor de B: ');
     readln (b);
     verificar(a, b);
     imprimirEntreAyBConN(n, a, b);
     writeln ('Ingrese un valor F que sera la condicion de corte: ');
     readln (n);
     writeln ('Ingrese un nuevo valor de A: ');
     readln (a);
     writeln ('Ingrese un nuevo valor de B: ');
     readln (b);
     verificar(a, b);
     imprimirEntreAyBConF(n, a, b);
end.
