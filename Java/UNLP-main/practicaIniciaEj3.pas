program ej3; {lista de ventas, por cada venta una lista de productos y por producto los 2 campos + precio}
const
	lim = 1000;
type
	
	produ = 1..lim;
	
	item = record
		precio : real;
		stock : integer;
		end;
	
	
	producto = record
		code : produ;
		cant : integer;
		precio : real;
		end;
	
	tabla = array[produ] of item
	
		
	pri = ^nodo2
	
	nodo2 = record
		p : producto;
		sig : pri;
		end;
		
		
		
	venta = record
		codigoV : integer;
		listaP : pri;
		
		end;
		
	lis = ^nodo;
	
	nodo = record 
		v : venta;
		sig : lis;
		end;
		
		
		
		
procedure leerP(var p : producto, v : tabla)
var
	aux : integer;
begin
	read(p.code);
	read(p.cant);
	if(p.cant > v[p.code].stock)
		then
			aux := v[p.code].stock;
		else
			aux := p.cant;
	p.precio := aux * v[p.code].precio;
end;

procedure agregar (var pri : pri, p : producto);
var
	aux := pri;
begin
	new(aux); aux^.sig := nil; aux^.p := p;
	if (pri = nil) then
		pri := aux;
	else
		aux^.sig := pri;
		pri := aux;
end;



procedure Leerventa( var v : venta; v : tabla;);
var
	pro : producto;
begin
	read(v.codigov);
	leerp(pro, v);
	while(pro.stock <> 0) do
		begin
			agregar(pri, pro);
			leerP(pro, v);
		end;
end;

procedure agregar2 (var l : lis, v : venta);
var
	aux := lis;
begin
	new(aux); aux^.sig := nil; aux^.v := v;
	if (pri = nil) then
		pri := aux;
	else
		aux^.sig := pri;
		pri := aux;
end;

procedure cargarLista(var l : lis, v : tabla);
var
	aux : venta;
begin
	Leerventa(aux, v);
	while(aux.v <> -1) do
		begin
			agregar2(l, aux);
			Leerventa(aux, v);
		end;
end;


