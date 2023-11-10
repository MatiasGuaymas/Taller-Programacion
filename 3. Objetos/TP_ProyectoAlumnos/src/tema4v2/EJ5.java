/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

/**
 *
 * @author alumnos
 */
public class EJ5 {

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {
		VisorFiguras vs;
		Rectangulo rec;
		Cuadrado cua1, cua2;
		
		
		vs = new VisorFiguras();
		rec = new Rectangulo(2.0,1.5,"verde", "rojo");
		cua1 = new Cuadrado(5, "azul", "mama");
		cua2 = new Cuadrado(8, "mama de mati", "mati fis");
		
		vs.guardar(rec);
		vs.guardar(cua1);
		vs.guardar(cua2);
		
		vs.mostrar();
	}
	
}
