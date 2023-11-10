program ejercicio1;
const
	dimF = 50
type
	subVen: 0..dimF;
	subCod: 1..15;
	subCant: 0..99;
	
	venta = record
		dia: integer;
		codigo: subCod;
		cantVentas: subCant;
	end;
	
	vecVentas = array [1..dimF] of venta;
	
	vent = record
		cod: subCod;
		cant: subCant;
	end; 
	
	lista = ^nodo
	nodo = record
		dato: vent;
		sig: lista;
	end;
// procedure inicializarV(var v: vVentas);
// var
//   i: integer;
// begin
//   for i:= 1 to maxVentas do
//       v[i].cantVent:= 0;
// end;
procedure leerVenta(var v: venta);
var
	codRandom: integer;
begin
	randomize;
	codRandom:= random(15)+1;
	if(codRandom <> 0) then
		begin
			v.codigo:= codRandom;
			repeat
				writeln('Ingrese la cantidad vendida');
				readln(v.cantVentas);
            until(v.cantVentas >= 0) and (v.CantVentas < 100);
		end;
end;

procedure cargarVentas(var v: vecVentas; var dimL: integer);
var
	ven: venta;
begin
	dimL:= 0;
	leerVenta(ven);
	while(ven.dia <> 0) and (dimL < dimF) do begin // MENOR O MENOR/IGUAL?
		dimL:= dimL + 1;
		v[dimL]:= ven;
		leerVenta(ven);
	end;
end;

procedure imprimirVector(v: vecVentas; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		begin
			write(v[i].dia);
			write(v[i].codigo);
			write(v[i].cantVentas);
		end;
end;

procedure ordenarVector(var v: vecVentas; dimL: integer);
var
	i, j, pos: integer;
	item: venta;
begin
	for i:= 1 to dimL - 1 do begin
		pos:= i;
		for j:= i+1 to dimL do 
			if v[j].codigo < v[pos].codigo then pos:= j;
		item:= v[pos];
		v[pos] := v[i];
		v[i] := min;
	end;
end;

procedure encontrarlimites(v : vec; dimL: integer;li, ls : integer; var elemI, elemS : integer);
var 
    aux,i:integer;
    indice : integer;
begin
	indice := 0;
	
	if (li > ls) then{modularizar}
		begin
			aux := ls;
			ls := li;
			li := aux;
		end;
	
	while(indice <= diml) and	(li >= v[incide].code ) do
			indice := indice + 1;
	
	elemi := indice;
		
	while(indice <= diml) and (ls > v[indice].code) do
		indice := indice + 1;
	elemS := indice	

end;


procedure eliminarentrelimites (var v : vec; var dimL: integer; num1, num2 : integer);
var
	cant, ls, li, i : integer;
begin
	encontrarlimites(v, diml, num1, num2, li, ls)
	cant := (ls - li) + 1;
	for i := ls + 1 to diml do
		begin
			v[i - cant] := v[i];
		end;
	diml := diml - cant;
end;
	

procedure agregarAtras(var l:lista, v : venta);
var
    aux, ult: lista;
begin
    new(aux); aux^.sig := nil; aux^.dato = v;
    if (l = nil) then l:= aux
    else 
    begin
        ult:= l;
        while(ult^.sig <> nil) do
            ult:= ult^.sig
        ult^.sig := aux;
    end
end;

procedure cargarLista(var l: lista; v: vecVentas; dimL: integer);
var
	i: integer;
begin
	l:= nil;
	i:= 0;
	while i < dimL do
		begin
			i:= i+1;
			if(v[i].codigo mod 2 = 0) then
				agregarAtras(l, v[i]);
		end;
end;

procedure imprimirLista(L: lista);
var
  i: integer;
begin
  i:= 0;
  While (L <> nil )do
    begin
      i:= i+1;
      Writeln('En la pos',i, ' estan estos datos');
      Writeln('codigo de producto: ',L^.dato.codigo);
      Writeln('codigo de producto: ',L^.dato.dia);
      Writeln('cantidad vendida: ',L^.dato.cantVent);
      L:= L^.sig;
    end;  
end;

var
	v: vecVentas;
	dimL: integer;
	posTop, posBot: integer;
	l: lista;
begin
	ramdomize;
	//inicializarVector(v);
	cargarVentas(v, dimL);
	//Termino de leer...
	imprimirVector(v, dimL);
	ordenarVector(v, dimL);
	imprimirVector(v, dimL);
	eliminarentrelimites(v, dimL, posTop, posBot);
	imprimirVector(v, dimL)
	cargarLista(l, v, dimL);
	imprimirLista(l);
end;