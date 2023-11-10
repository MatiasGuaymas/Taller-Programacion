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
public class VisorFiguras {
	private int guardadas;
	private int capacidadMaxima = 5;
	private Figura [] vector;
	
	public VisorFiguras(){
		vector = new Figura[capacidadMaxima];
		guardadas = 0;
	}
	
	public void guardar(Figura f){
		vector[guardadas++] = f;
	}
	
	public boolean quedaEspacio(){
		return guardadas != capacidadMaxima;
	}

	public void mostrar(){
		int i;
		for (i=0; i < guardadas;i++)
			System.out.println(vector[i].toString());
	}
	
	public int getGuardadas(){
		return guardadas;
	}
}

