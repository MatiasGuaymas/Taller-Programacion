program untitled;
const
	lim = 50;
type
	
	sub = 1..15;	
	
	maxU = 1.99;
		
	venta = record
		dia : integer;
		code : sub;
		cant : maxU;
		end;
		
	vec = array[1..lim] of venta
		

	lis = ^nodo;
	
	nodo = record
		i : venta;
		sig : lis;
		end;
		
procedure leer(var v : venta);
begin
	reaa(v.dia);
	read(v.code);
	ready(v.cant);
end;

procedure cargarV(var v : vec; var dimL : integer)
var
	aux : venta;
begin
	dimL := 0;
	leer(aux);
	while(aux.dia <> 0) and (diml <= lim) do
		begin
			dimL := dimL + 1;
			v[dimL] := aux;
			leer(aux);
		end;
end;

	
procedure muestras (v : vec; diml : integer)
var
	i : integer;
begin
	for i := 1 to diml do
		begin
			write(v[i].dia);
			write(v[i].code);
			write(v[i].cant);
		end;
end;

procedure ordenarVector(var v : vec; diml : integer)
var
	i, j, pos: integer;
	item : venta

begin
	for i := 1 to diml - 1 do 
		begin
			pos := i;
			for j := i + 1 to diml do
				begin
					if (v[j].code < v[pos].code then	
						pos := j;
					item := v[pos];
					v[pos] := v[i]
					v[i] := item;
				end;
		end;
end;



procedure eliminar(var v : vec; var dimL: integer; pos : integer);
var 
    i:integer;
    pude:boolean;
begin
    pude:=false;
    if ((pos>=1) and (pos<=dimL)) then begin
        for i:=pos to (dimL-1) do
            v[i]:=v[i+1];
        pude:=true;
        dimL:=dimL-1;
    end;
end;

function cumple(v, num1, num2 : integer) : boolean;
var
	aux : integer;
begin
	if (num 1 > num2) then
		begin
			aux := num2;
			num2 := num1;
			num1 := aux;
		end;
	cumple := (v > num1) and (v < num2);
end;

procedure eliminarPares (var v : vec; var dimL: integer; num1, num2 : integer);
var
	i : integer;
begin
	for i := 1 to diml do
		begin
			if (cumple(v[i].code, num1, num2))then
				eliminar(v, diml, i);
		end;
end;
	
	
procedure agregarAtras (var L:lis; v:venta);
var
	nuevo,aux:lis;
begin
    new (nuevo); 
    nuevo^.elem:=num; 
    nuevo^.sig:=nil; 
    if (L = nil) then 
        L:= nuevo
    else begin
        aux:= L;
        while (aux ^.sig <> nil) do
            aux:= aux^.sig;
        aux^.sig:=nuevo;       
    end;
end;
	
	
function espar(num : integer);
begin
	espar:= ((num mod 2) == 0)
end;	
	
	
procedure codigospares(var l : lis; v : vec; diml : integer)
var
	i : integer;
begin
	for i := 1 to diml do 
		begin
			if (espar(v[i].code) then
				agregarAtras(l, v[i]);
		end;
end;

procedure mostrarLista(l : lis);
begin
	while( l <> nil) do
		begin
			read(l^.v.dia);
			read(l^.v.code);
			read(l^.v.cant);
			l := l^.sig;
		end;
end;

var
	l : lis
	v : vec
	num1, num2, diml : integer;
begin
	cargarV(v, diml);
	muestras(v);
	ordenarVector(v, diml);
	muestras(v);
	read(num1);
	read(num2);
	eliminarPares(v, diml, num1, num2);
	muestras(v);
	codigospares(l, v, diml);
	mostrarlista(l);
end.


	
	
	
	
	
	
	
	
	
	
	
