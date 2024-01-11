package Parciales.Parcial16;

import PaqueteLectura.GeneradorAleatorio;

public class Parcial16 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        BancoDigital bancodig = new BancoDigital("Banco Digital", 20, 10, "https://bancodigital.lp.com");
        BancoTradicional bancotrad = new BancoTradicional("Banco Tradicional", 30, 10, "Calle 7 1200", "La Plata");
        
        Cuenta c1 = new Cuenta(200, "PEPE.DIG", GeneradorAleatorio.generarInt(30)+200, "Pesos");
        Cuenta c2 = new Cuenta(201, "JUAN.DIG", GeneradorAleatorio.generarInt(30)+200, "Pesos");
        Cuenta c3 = new Cuenta(202, "JOSE.DIG", GeneradorAleatorio.generarInt(30)+200, "Dolares");
        Cuenta c4 = new Cuenta(203, "ROSANA.TRAD", GeneradorAleatorio.generarInt(30)+200, "Dolares");
        Cuenta c5 = new Cuenta(204, "PEDRO.TRAD", GeneradorAleatorio.generarInt(30)+200, "Pesos");
        
        System.out.println("MODULO C");
        System.out.println(bancodig.agregarCuenta(c1));
        System.out.println(bancodig.agregarCuenta(c2));
        System.out.println(bancodig.agregarCuenta(c3));
        System.out.println(bancotrad.agregarCuenta(c4));
        System.out.println(bancotrad.agregarCuenta(c5));
        
        bancodig.depositarDinero(200, 10000.0);
        bancodig.depositarDinero(201, 100001.0);
        bancodig.depositarDinero(202, 1000.0);
        bancotrad.depositarDinero(203, 501.0);
        bancotrad.depositarDinero(204, 60000.0);
        
        System.out.println("MODULO D");
        System.out.println(bancodig.puedeRecibirTarjeta(200));
        System.out.println(bancodig.puedeRecibirTarjeta(201));
        System.out.println(bancodig.puedeRecibirTarjeta(202));
        System.out.println(bancotrad.puedeRecibirTarjeta(203));
        System.out.println(bancotrad.puedeRecibirTarjeta(204));
    }
    
}
