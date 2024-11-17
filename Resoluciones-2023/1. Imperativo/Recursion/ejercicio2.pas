{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6}

program ejercicio2; 

procedure leerNumero(var n: integer);
begin
    writeln();
	writeln('Ingresa un numero :)');
	readln(n);
end;

procedure descomponerNumero(var dig: integer; var num: integer);
begin
	dig:= num mod 10;
	num:= num div 10;
end;

procedure imprimirDigitos(num: integer);
var
	dig: integer;
begin
	if(num <> 0) then
		begin
			descomponerNumero(dig, num);
			imprimirDigitos(num);
			write(' ', dig);
		end;
end;

procedure procesarNumeros();
var
	n: integer;
begin
	leerNumero(n);
	if(n <> 0) then
		begin
			imprimirDigitos(n);
			procesarNumeros();
		end;
end;

begin
	procesarNumeros();
end.