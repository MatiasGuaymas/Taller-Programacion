//1- Queremos representar compras minoristas y mayoristas. De cualquier compra se conoce: nro. y los productos
//comprados (como máximo N). De cada producto registra: código, precio y descripción. Además: las compras
//mayoristas tienen el CUIT del comprador; y las minoristas si el comprador es jubilado.
//a- Genere las clases necesarias. Provea constructores para iniciar las compras a partir de toda su información,
//para una cantidad máxima de N productos comprados y sin productos cargados.
//b- Implemente métodos en las clases que corresponda para permitir:
//i- Agregar a la compra un producto que se recibe. Asuma que hay espacio.
//ii- Obtener el precio a pagar por la compra teniendo en cuenta que es la suma del precio de los productos
//comprados al que se adiciona el IVA (21% del total).
//iii- Obtener la representación String de la compra siguiendo el ejemplo:
//Compra minorista: “Nro:... , Productos (código/precio/descripción):..., Precio a pagar:... , Es jubilado: ...”
//Compra mayorista: “Nro:..., Productos (código/precio/descripción):..., Precio a pagar:..., CUIT:...”
//2) Realice un programa que instancie una compra mayorista y una minorista. Cargue 3 productos a cada compra.
//Para finalizar, muestre la representación String de cada compra.

package Parciales.Parcial3;

import PaqueteLectura.*;

public class Parcial3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        CompraMayorista com1;
        CompraMinorista com2;
        Producto prod;
        
        com1 = new CompraMayorista(20, 3, GeneradorAleatorio.generarInt(20), GeneradorAleatorio.generarInt(30)+200);
        com2 = new CompraMinorista(20, 3, GeneradorAleatorio.generarInt(20), GeneradorAleatorio.generarBoolean());
        
        System.out.println(com1.toString());
        System.out.println(com2.toString());
    }
    
}
