package Parciales.Parcial17;

public class Parcial17 {
    public static void main(String[] args) {
        Fecha fec1 = new Fecha(7, 1, 2005);
        Fecha fec2 = new Fecha(9, 1, 2002);
        
        Compra com1 = new Compra(300, fec1, 10);
        
        ConsumidorFinal cons = new ConsumidorFinal(333, "Matias");
        ComprasPorMayor com2 = new ComprasPorMayor(200, fec2, 10, cons);
        
        Producto prod1 = new Producto(1, "Manzana", 80.0, 10);
        Producto prod2 = new Producto(2, "Banana", 50.0, 5);
        Producto prod3 = new Producto(3, "Papa", 30, 10);
        Producto prod4 = new Producto(4, "Arroz", 200.0, 3);
        Producto prod5 = new Producto(5, "Fideos", 150.0, 7);
        Producto prod6 = new Producto(6, "Galletitas", 120.0, 7);
        Producto prod7 = new Producto(7, "Sillas", 10000.0, 15);
        
        com1.agregarProducto(prod1);
        com1.agregarProducto(prod2);
        com1.agregarProducto(prod3);
        com2.agregarProducto(prod4);
        com2.agregarProducto(prod5);
        com2.agregarProducto(prod6);
        com2.agregarProducto(prod7);
        
        System.out.println(com1.resumenCompra());
        System.out.println("-----------------");
        System.out.println(com2.resumenCompra());
        System.out.println("-----------------");
        System.out.println("COMPRA1 EN CUOTAS? " + com1.abonableCuotas());
        System.out.println("COMPRA2 EN CUOTAS? " + com2.abonableCuotas());
    }
    
}
