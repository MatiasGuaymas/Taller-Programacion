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
		
		
		
		
procedure leerP(var p : producto)
begin
	read(p.code);
	read(p.stock);
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



procedure Leerventa( var v : venta);
var
	pro : producto;
begin
	read(v.codigov);
	leerp(pro);
	while(pro.stock <> 0) do
		begin
			agregar(pri, pro);
			leerP(pro);
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

procedure cargarLista(var l : lis);
var
	aux : venta;
begin
	Leerventa(aux);
	while(aux.v <> -1) do
		begin
			agregar2(l, aux);
			Leerventa(aux);
		end;
end;

rocedure agregarticket (var t : listaT, Tik: ticket);
var
	aux := listaT;
begin
	new(aux); aux^.sig := nil; aux^.t:= tik;
	if (pri = nil) then
		pri := aux;
	else
		aux^.sig := pri;
		pri := aux;
end;
	
procedure generarticket(var t : listaT; l : lis; vec : tabla)
var
	aux : ticket;
begin
	while(l <> nil) do 
		begin
			aux.codev := l^.v.codigoV;
			
			aux.cant := l^.listaP^p.stock;
			if(aux.cant > vec[aux.codeP].stock)then
				aux.cant := vec[aux.codeP].stock;
			aux.precio := aux.cant * vec[aux.codeP].precio;
			Agregarticket(T, aux);
			l := l^.sig;		
		end;
end;