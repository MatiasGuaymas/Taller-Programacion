/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

import PaqueteLectura.*;
public class EJ3 {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		Trabajador trabajador1;
		
		trabajador1 = new Trabajador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarString(5));
		
		System.out.println(trabajador1.toString());
	}
	
}
