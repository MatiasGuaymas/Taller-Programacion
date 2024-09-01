{3. Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.}

program ejercicio3;
type
    producto = record
        codigo: integer;
        cantidad: integer;
        monto: real;
    end;
    
    arbol = ^nodo;
    nodo = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;
    
    venta = record
        codigoVenta: integer;
        codigoProducto: integer;
        cantidad: integer;
        precioUnitario: real;
    end;

procedure leerVenta(var v: venta);
begin
    v.codigoVenta := random(30)-1;
    if(v.codigoVenta <> -1) then begin
        v.codigoProducto := random(50)+1;
        v.cantidad := random(50)+1;
        v.precioUnitario := random(100)*1.5;
    end;
end;

procedure agregarVenta(var a: arbol; p: producto);
begin
    if(a = nil) then begin
        new(a);
        a^.dato := p;
        a^.HI := nil;
        a^.HD := nil;
    end
    else
        if(p.codigo = a^.dato.codigo) then begin
            a^.dato.cantidad := a^.dato.cantidad + p.cantidad;
            a^.dato.monto := a^.dato.monto + p.monto;
        end
        else
            if(p.codigo < a^.dato.codigo) then
                agregarVenta(a^.HI, p)
            else
                agregarVenta(a^.HD, p);
end;

procedure cargarVentas(var a: arbol);
var
    v: venta;
    p: producto;
begin
    leerVenta(v);
    while(v.codigoVenta <> -1) do begin
        p.codigo := v.codigoProducto;
        p.cantidad := v.cantidad;
        p.monto := v.cantidad * v.precioUnitario;
        writeln('Codigo: ', p.codigo, ' Cantidad: ', p.cantidad, ' Monto: ', p.monto:0:2);
        agregarVenta(a, p);
        leerVenta(v);
    end;
end;

procedure imprimirArbol(a: arbol);
begin
    if(a <> nil) then begin
        imprimirArbol(a^.HI);
        writeln('Codigo: ', a^.dato.codigo, ' Cantidad: ', a^.dato.cantidad, ' Monto: ', a^.dato.monto:0:2);
        imprimirArbol(a^.HD);
    end;
end;

procedure mayorCantidad(a: arbol; var max: integer; var cod: integer);
begin
    if(a <> nil) then begin
        if(a^.dato.cantidad > max) then begin
            max := a^.dato.cantidad;
            cod := a^.dato.codigo;
        end;
        mayorCantidad(a^.HI, max, cod);
        mayorCantidad(a^.HD, max, cod);
    end;
end;

function cantidadMenores(a: arbol; valor: integer): integer;
begin
    if(a <> nil) then begin
        if(a^.dato.codigo < valor) then
            cantidadMenores := 1 + cantidadMenores(a^.HI, valor) + cantidadMenores(a^.HD, valor)
        else
            cantidadMenores := cantidadMenores(a^.HI, valor);
    end
    else
        cantidadMenores := 0;
end;

function montoEntre(a: arbol; valor1, valor2: integer): real;
begin
    if(a <> nil) then begin
        if(a^.dato.codigo > valor1) and (a^.dato.codigo < valor2) then
            montoEntre := a^.dato.monto + montoEntre(a^.HI, valor1, valor2) + montoEntre(a^.HD, valor1, valor2)
        else
            if (a^.dato.codigo < valor1) then
                montoEntre := montoEntre(a^.HD, valor1, valor2)
            else
                montoEntre := montoEntre(a^.HI, valor1, valor2);
    end
    else
        montoEntre := 0;
end;

var
    a: arbol;
    max, cod: integer;
begin
    randomize;
    a := nil;
    max := -1;
    cod := -1;
    cargarVentas(a);
    writeln('Arbol ordenado por codigo de producto:');
    imprimirArbol(a);
    mayorCantidad(a, max, cod);
    writeln('Codigo con mayor cantidad de unidades vendidas: ', cod);
    writeln('Cantidad de codigos menores a 50: ', cantidadMenores(a, 20));
    writeln('Monto total entre codigos 20 y 40: ', montoEntre(a, 20, 40):0:2);
end.