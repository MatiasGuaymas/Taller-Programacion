{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:				
i. Una estructura eficiente para la búsqueda por patente.	
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.		
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

{ A: SE LEE INFORMACION DE AUTOS (PATENTE, ANHO DE FABRICACION[2010..2018], MARCA Y MODELO)
* I: ARMAR UN ARBOL DE AUTOS EFICIENTE POR PATENTE
* II ARMAR UN ARBOL EFICIENTE POR MARCA Y QUE CADA NODO DE LA MARCA TENGA UN REGISTRO Q TENGA LA PATENTE, ANHO DE FABRICACION Y MODELO (UN ARBOL DE LISTAS)
* B: UN MODULO QUE RECORRA TODO EL ARBOL NORMAL Y RETORNE LA CANTIDAD DE AUTOS DE DICHA MARCA, RECIBE EL ARBOL I Y UNA MARCA, RETORNA LA CANT DE AUTOS Q POSEE ESA MARCA
* C: RECIBO UNA MARCA Y BUSCO DE MANERA EFICIENTE EN EL ARBOL II ORDENADO POR MARCA Y UNA VEZ Q LO ENCUENTRO RECORRO TODA LA LISTA CONTANDO LA CANT DE AUTOS DE DICHA MARCA 
* RECIBO MARCA Y ARBOL II  RETORNO LA CANT DE AUTOS DE DICHA MARCA
* D: RECORRO TODO EL ARBOL Y VOY GENERANDO UNA LISTA (CON UN INSERTARORDENADO) PARA Q ME QUEDE LA LISTA NUEVA AGRUPADA POR ANHO DE FABRICACION
* E: ARMAR UN MODULO QUE BUSQUE QUE BUSQUE DE MANERA EFICIENTE POR PATENTE Y SI SE ENCUENTRA DEVUELVA EL MODELO DEL AUTO DE ESA PATENTE
* F: ARMAR UN MODULO QUE BUSQUE POR TODO EL ARBOL EN CADA LISTA LA PATENTE SI LA ENCUENTRA QUE RETORNE EL MODELO DEL AUTO Y TERMINE DE RECORRER
* 0:12 
* }
//1:33 sin testear
{a[V]
*b [V]
*c []
* 
* 
* }
program ejercicio2;
const
	izq = 1; der = 20;
type
	rango2010And2018 = izq..der;
	str20 = string[20];
	
	auto = record
		patente: integer;
		anhoFabricacion: integer;
		marca: str20;
		modelo: integer;
	end;
	
	arbolI = ^aI;
	
	aI = record
		dato: auto;
		hi: arbolI;
		hd: arbolI;
	end;
	
	//---------------------------
	mismaMarca = record
		patente: integer;
		anhoFabricacion: rango2010And2018;
		modelo: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: mismaMarca;
		sig: lista;
	end;
	
	arbolII = ^aII;
	
	aII = record
		marca: str20;
		dato: lista;
		hi: arbolII;
		hd: arbolII;
	end;
	//---------------------------------
	listaD = ^nodoD;
	nodoD = record
		dato: auto;
		sig: listaD;
	end;
	
procedure inicializarPunteros(var a1: arbolI; var a2: arbolII);
begin
	a1:= nil;
	a2:= nil;
end;
	
procedure leerAuto(var a: auto);
begin
	Writeln('Ingrese el anho de fabricacion: ');
	readln(a.anhoFabricacion);
	if((a.anhoFabricacion >= izq) and (a.anhoFabricacion <= der))then
		begin
			Writeln('Ingrese la patente del auto ');
			readln(a.patente);
			Writeln('Ingrese la marca: (es un string)');
			readln(a.marca);
			Writeln('Ingrese el modelo: ');
			a.modelo:= random(20);
			//readln(a.modelo);
		end;
end;

procedure cargarArbolI(var a1: arbolI; a: auto);
begin
	if(a1 = nil)then
		begin
			new(a1);
			a1^.dato:= a;
			a1^.hi:= nil;
			a1^.hd:= nil;
		end
	else
		begin
			if(a.patente < a1^.dato.patente)then
				cargarArbolI(a1^.hi,a)
			else
				begin
					if(a.patente > a1^.dato.patente)then	//no se permiten patentes repetidas
						cargarArbolI(a1^.hd,a);
				end;
		end;
end;

	
procedure asigarCampos(a: auto; var b: mismaMarca);
begin
	b.patente:= a.patente;
	b.anhoFabricacion:= a.anhoFabricacion;
	b.modelo:= a.modelo;
end;

procedure insertarOrdenado(var L: lista; b: mismaMarca);
var
	ant,act,nue: lista;
begin
	new(nue);
	nue^.dato:= b;
	ant:= L;
	act:= L;
	While(act <> nil) and (b.patente > L^.dato.patente)do
		begin
			ant:= act;
			act:= act^.sig;
		end;
	if(act <> nil)then
		begin
			if(act = ant)then
				L:= nue
			else
				ant^.sig:= nue;
			nue^.sig:= act;
		end;
end;
//por marca
procedure cargarArbolII(var a2: arbolII; a: auto; b: mismaMarca);
begin
	if(a2 = nil)then
		begin
			new(a2);
			a2^.marca:= a.marca;
			insertarOrdenado(a2^.dato,b);
			//a2^.dato:= b;
			a2^.hi:= nil;
			a2^.hd:= nil;
		end
	else
		begin
			if(a2^.marca = a.marca)then
				insertarOrdenado(a2^.dato,b)
			else
				begin
					if(a.marca < a2^.marca)then
						cargarArbolII(a2^.hi,a,b)
					else
						cargarArbolII(a2^.hd,a,b)
				end;
		end;
end;

procedure cargarEstructura(var a1: arbolI; var a2: arbolII);
var
	a: auto;
	mismMarc: mismaMarca;
begin
	leerAuto(a);
	While(a.anhoFabricacion >= izq) and (a.anhoFabricacion <= der)do
		begin
			Writeln('--1--');
			cargarArbolI(a1,a);	//eficiente por patente
			Writeln('--2--');
			asigarCampos(a,mismMarc);
			Writeln('--3--');
			cargarArbolII(a2,a,mismMarc);	//eficiente por marca
			Writeln('--4--');
			leerAuto(a);
		end;
		Writeln('--5--');
end;

{* B: UN MODULO QUE RECORRA TODO EL ARBOL NORMAL Y RETORNE LA CANTIDAD DE AUTOS DE DICHA MARCA, RECIBE EL ARBOL I Y UNA MARCA, RETORNA LA CANT DE AUTOS Q POSEE ESA MARCA
}
function cantAutosMarcaI(a1: arbolI; marca: str20): integer;
begin
	if(a1 = nil)then
		cantAutosMarcaI:= 0
	else	
		begin
			if(a1^.dato.marca = marca)then
				cantAutosMarcaI:= cantAutosMarcaI(a1^.hi,marca)+ cantAutosMarcaI(a1^.hd,marca)+1
			else
				cantAutosMarcaI:= cantAutosMarcaI(a1^.hi,marca)+cantAutosMarcaI(a1^.hd,marca);
		end;	
end;

{* C: RECIBO UNA MARCA Y BUSCO DE MANERA EFICIENTE EN EL ARBOL II ORDENADO POR MARCA Y UNA VEZ Q LO ENCUENTRO RECORRO TODA LA LISTA CONTANDO LA CANT DE AUTOS DE DICHA MARCA 
}

function cuantosAutosTieneEsteNodoDeListas(L: lista): integer;

begin
	if(L = nil)then
		cuantosAutosTieneEsteNodoDeListas:= 0
	else
		begin
			cuantosAutosTieneEsteNodoDeListas:= cuantosAutosTieneEsteNodoDeListas(L^.sig)+1;
		end;
end;

function cantAutosMarcaII(a2: arbolII; marca: str20): integer;
begin
	if(a2 = nil)then
		cantAutosMarcaII:= 0
	else
		begin
			if(a2^.marca = marca)then
				cantAutosMarcaII:= cuantosAutosTieneEsteNodoDeListas(a2^.dato)
				//Writeln('cuantos autos tiene en la fucnion: ',cuantosAutosTieneEsteNodoDeListas(a2^.dato))
				//cantAutosMarcaII:= cantAutosMarcaII(a2^.hi,marca) + cantAutosMarcaII(a2^.hd,marca)+1
			else
				begin
					if(marca < a2^.marca)then
						cantAutosMarcaII:= cantAutosMarcaII(a2^.hi,marca)
					else
						cantAutosMarcaII := cantAutosMarcaII(a2^.hd,marca);
				end;
		end;
end;


procedure insertarOrdenadoD(a: auto; var L2: listaD);
var
	ant,act,nue: listaD;
begin
	ant:= L2;
	act:= L2;
	new(nue);
	nue^.dato:= a;
	While((act <> nil) and (a.anhoFabricacion < act^.dato.anhoFabricacion))do
		begin
			ant:= act;
			act:= act^.sig;
		end;
	if(act <> nil)then
		begin
			if(ant = act)then
				L2:= nue
			else
				ant^.sig:= nue;
			nue^.sig:= act;
		end;
end;

{d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.}
{* D: RECORRO TODO EL ARBOL Y VOY GENERANDO UNA LISTA (CON UN INSERTARORDENADO) PARA Q ME QUEDE LA LISTA NUEVA AGRUPADA POR ANHO DE FABRICACION
}
procedure recorrerArbolEirGenerandoListaD(a1: arbolI;var L2: listaD);
begin
	if(a1<>nil)then
		begin
			
			recorrerArbolEirGenerandoListaD(a1^.hi,L2);
			insertarOrdenadoD(a1^.dato,L2);
			recorrerArbolEirGenerandoListaD(a1^.hd,L2);
		end;
end;

{* E: ARMAR UN MODULO QUE BUSQUE QUE BUSQUE DE MANERA EFICIENTE POR PATENTE Y SI SE ENCUENTRA DEVUELVA EL MODELO DEL AUTO DE ESA PATENTE
}
{e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.}
function modeloDePatenteBuscada(a1: arbolI; patente: integer): integer;
begin
	if(a1 = nil)then
		modeloDePatenteBuscada:= 0
	else
		begin
			if(a1^.dato.patente = patente)then
				modeloDePatenteBuscada:= a1^.dato.modelo
			else
				begin
					if(patente < a1^.dato.patente)then
						modeloDePatenteBuscada(a1^.hi,patente)
					else
						modeloDePatenteBuscada(a1^.hd,patente)
				end;				
		end;
end;

{* F: ARMAR UN MODULO QUE BUSQUE POR TODO EL ARBOL EN CADA LISTA LA PATENTE SI LA ENCUENTRA QUE RETORNE EL MODELO DEL AUTO Y TERMINE DE RECORRER
}
{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

function buscarEnNodo(L: lista;patente: integer): integer;
begin
	if(L = nil)then
		buscarEnNodo:= 0
	else	
		begin
			if(L^.dato.patente = patente)then
				buscarEnNodo:= L^.dato.modelo
			else
				buscarEnNodo:= buscarEnNodo(L^.sig,patente);
		end;
end;

function buscarModeloPorPatente(a2: arbolII; patente: integer): integer;
var
	modelo: integer;
begin
	if(a2 = nil)then
		buscarModeloPorPatente:= 0
	else
		begin
			modelo:= buscarEnNodo(a2^.dato,patente);
			if(modelo <> 0)then
				buscarModeloPorPatente:= modelo
			else
				begin
					buscarModeloPorPatente:= buscarModeloPorPatente(a2^.hi,patente) + buscarModeloPorPatente(a2^.hd,patente);
				end;
		end;
end;

procedure imprimirArbol1(a1: arbolI);
begin
	if(a1 <> nil)then
		begin
			imprimirArbol1(a1^.hi);
			Writeln('arbol ordenado por patente: ',a1^.dato.patente);
			Writeln('me rompi aca1?');
			imprimirArbol1(a1^.hd);
		end;
end;

procedure imprimirArbol2(a2: arbolII);
begin
	if(a2 <> nil)then
		begin
			imprimirArbol2(a2^.hi);
			Writeln('arbolOrdenado por marca: ',a2^.marca);
			Writeln('me rompi aca2?');
			imprimirArbol2(a2^.hd);
		end;
end;

procedure controlarCarga2Arboles(a1: arbolI; a2: arbolII);
begin	
	Writeln('aNTES1 me rompi aca1?');
	imprimirArbol1(a1);
	Writeln('aNTES2 me rompi aca1?');
	imprimirArbol2(a2);
end;

var	
	a1: arbolI; a2: arbolII;
	marcaBuscadaB: str20;
	L2: listaD; patenteBuscada: integer;
begin
	randomize;
	inicializarPunteros(a1,a2);
	cargarEstructura(a1,a2);
	Writeln('--llegue aca retorne--');
	controlarCarga2Arboles(a1,a2);
	
	Writeln('Ingrese una marca a abuscar en la estructara A ');
	readln(marcaBuscadaB);
	Writeln('La cantidad de autos de la marca: ',marcaBuscadaB, ' es: ',cantAutosMarcaI(a1,marcaBuscadaB));
	//reutilizo la marca
	Writeln('La cantidad de autos de la marca: ',marcaBuscadaB, ' es: ',cantAutosMarcaII(a2,marcaBuscadaB));
	//
	recorrerArbolEirGenerandoListaD(a1,L2);
	// 
	Writeln('Ingrese una patente para buscar que modelo es: (en la estructura I)');
	readln(patenteBuscada);
	Writeln('El modelo de la pantente: ',patenteBuscada,' es: ',modeloDePatenteBuscada(a1,patenteBuscada));
	//
end.