package Parciales.Parcial14;

public class Parcial14 {
    public static void main(String[] args) {
        Director direc = new Director("Matias", 46201342, 2000, 30000.0, 2000.0);
        Empresa emp = new Empresa("Empresa Guaymas", "La Plata", direc, 10);
        
        Encargado encargado1 = new Encargado("Pepe", 111, 2005, 10000.0, 5);
        Encargado encargado2 = new Encargado("Juan", 222, 2008, 12000.0, 7);
        Encargado encargado3 = new Encargado("Francisco",333, 2003, 8000.0, 3);
        Encargado encargado4 = new Encargado("Federico",444, 2006, 9000.0, 4);
        
        emp.agregarEncargado(1, encargado1);
        emp.agregarEncargado(3, encargado2);
        emp.agregarEncargado(6, encargado3);
        emp.agregarEncargado(9, encargado4);
        
        System.out.println(emp.toString());
    }
    
}
