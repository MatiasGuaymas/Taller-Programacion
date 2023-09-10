{11) Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente
registra: dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y
costo abonado por sesión. Implemente un programa que:
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con
dni 0.
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con dni y cód de paciente de los pacientes de ioma, ordenados
por dni descendente.
c) Dado un dni, modificar la obra social de dicho paciente a una recibida. Considere que el
paciente puede no existir.
NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

program Parcial;

type
    rangoObra = 1..5;
    paciente = record
        dni:integer;
        cod:integer;
        obra:rangoObra;
        costo:real;
    end;
    Type
    arbol = ^nodo;
    nodo = record
        dato: paciente;
        HI: arbol;
        HD: arbol;
    end;
    paciente2 = record
        dni:integer;
        cod:Integer;
    end;
    lista = ^nodo2;

    nodo2 = record
        dato:paciente2;
        sig:lista;
    end;
//____________________________________________
procedure LeerPaciente(var p:paciente);
begin
    p.dni:=random(5);
    if p.dni <> 0 then
    begin
        p.cod:=random(10);
        p.obra:=1+random(5);
        p.costo:=random(10);
    end;
end;
//____________________________________________
Procedure crear (var A:arbol; p:paciente);
Begin
    if (A = nil) then
    begin
        new(A);
        A^.dato:= p; 
        A^.HI:= nil; 
        A^.HD:= nil;
    end
    else
        if (p.dni < A^.dato.dni) then 
            crear(A^.HI,p)
        else 
            crear(A^.HD,p)   
End;
//____________________________________________
procedure CargarArbol(var abb:arbol);
var
    p:paciente;
begin
    LeerPaciente(p);
    while (p.dni<>0)do
    begin
        crear(abb,p);
        LeerPaciente(p);
    end;
end;
//____________________________________________
Procedure AgregarAdelante (var L:lista; x:integer;y:integer);
Var 
    nue:lista;
Begin  
    New(nue);  
    nue^.dato.dni:=x;
    nue^.dato.cod:=y;  
    nue^.sig:=L;  
    L:=nue;
End;

//____________________________________________
Procedure CargarLista ( a : arbol ; var l:lista);
begin 
    if ( a<> nil ) then begin
        CargarLista (a^.HD,l);
        if (a^.dato.obra = 1) then
        begin
            AgregarAdelante(l,a^.dato.dni,a^.dato.cod);
        end;
        CargarLista (a^.HI,l);
    end;
end;
//____________________________________________  
procedure ImprimirLista(l:lista);
begin
    while (l <> nil) do
    begin
        WriteLn('DNI: ',l^.dato.dni);
        {WriteLn('COD: ',l^.dato.cod);}
        l:=l^.sig;
    end;
end;
//____________________________________________
Procedure Modificar_Obra ( var a : arbol ; dni:integer;obra:integer;var existe:Boolean);
begin 
    if ( a<> nil ) and (not existe) and (dni<=a^.dato.dni) then begin
        Modificar_Obra (a^.HD,dni,obra,existe);
        if (a^.dato.dni = dni) then
        begin
            a^.dato.obra:=obra;
            existe:=True;
        end;
        Modificar_Obra (a^.HI,dni,obra,existe);
    end;
end;
//____________________________________________
Procedure enOrden ( a : arbol );
begin 
    if ( a<> nil ) then begin
        enOrden (a^.HI);
        writeln ('dni: ',a^.dato.dni);
        writeln ('cod: ',a^.dato.cod);
        writeln ('obra: ',a^.dato.obra);
        writeln ('costo: ',a^.dato.costo);
        enOrden (a^.HD);
    end;
end;
//____________________________________________
var
  abb:arbol;
  l:lista;
  dniNuevo:integer;
  existe:boolean;
begin
    randomize;
    existe:=False;
    l:=nil;
    dniNuevo:=4;
    CargarArbol(abb);
    WriteLn('CARGA REALIZADA');
    CargarLista(abb,l);
    WriteLn('CARGA REALIZADA 2');
    ImprimirLista(l);
    enOrden(abb);
    Modificar_Obra(abb,dniNuevo,4,existe);
    WriteLn('_________________');
    if existe then
        enOrden(abb);
end.
