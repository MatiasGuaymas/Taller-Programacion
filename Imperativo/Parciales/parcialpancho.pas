program ejparcial;
type

	MES = 1..31;
	
	compra = record
		code : integer;
		dia : MES;
		cant : integer;
		monto : real;
		end;
		
	compralista = record
		dia : MES;
		cant : integer;
		monto : real;
		end;
		
	lis = ^nodolista;
	
	nodolista = record
		dato : compralista;
		sig : lis;
		end;
			
	
	arb = ^nodo;
	
	nodo = record
		code : integer;
		l : lis;
		hi : arb;
		hd : arb;
		end;

procedure leer(var c : compra);
begin
	writeln('ingrese cantidad: ');
	readln(c.cant);
	if(c.cant <> 0) then
		begin
			writeln('ingrese codigo: ');
			readln(c.code);
			c.dia := random(31) + 1;
			c.monto := random(1000) + 1;
		end;
end;

procedure agregaradelante(var l : lis; c : compralista);
var
	aux : lis;
begin
	new(aux); aux^.sig := nil; aux^.dato := c;
	if(l = nil) then
		l := aux
	else
		begin
			aux^.sig := l;
			l := aux;
		end;
end;


procedure agregarnodo(var a : arb; c : compra);
var
	cl : compralista;
begin
	if(a = nil) then
		begin
			new(a);a^.hi := nil; a^.hd:= nil; a^.code := c.code; 
			cl.cant := c.cant; cl.monto := c.monto; cl.dia := c.dia;
			a^.l := nil;
			agregaradelante(a^.l, cl);
		end
	else
		begin
			if(c.code > a^.code) then
				agregarnodo(a^.hd, c)
			else
				agregarnodo(a^.hi, c);
		end;
end;


procedure buscar(a : arb; var ok : boolean; var nodo : arb; codigo : integer);
begin
	if(a <> nil) then
		begin
			if(a^.code = codigo) then
				begin
					ok := true;
					nodo := a;
				end
			else
				begin
					if(codigo > a^.code) then
						buscar(a^.hd, ok, nodo, codigo)
					else
						buscar(a^.hi, ok, nodo, codigo);
				end;
		end
	else
		ok := false;
		nodo := nil;
end;

procedure cargararbol(var a : arb; c : compra);
var
	ok : boolean;
	nodo : arb;
	cl : compralista;
begin
	buscar(a, ok, nodo, c.code);
	if(ok = true) then
		begin
			cl.dia := c.dia;
			cl.cant :=c.cant;
			cl.monto := c.monto;
			agregaradelante(nodo^.l, cl);
		end
	else
		agregarnodo(a, c);
end;


procedure cargageneral(var a : arb);
var
	c : compra;
begin
	leer(c);
	if(c.cant <> 0) then
		begin
			cargararbol(a, c);
			cargageneral(a);
		end;
end;


procedure imprimirarbol(a : arb);
begin
	if(a <> nil) then
		begin
			imprimirarbol(a^.hi);
			writeln(a^.code);
			imprimirarbol(a^.hd);
		end;
end;

var
	a : arb;
begin
	a := nil;
	cargageneral(a);
	imprimirarbol(a);
end.