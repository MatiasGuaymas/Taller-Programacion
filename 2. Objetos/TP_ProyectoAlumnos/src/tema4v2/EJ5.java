/* 5-A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura.
public class VisorFigurasModificado {
private int guardadas;
private int capacidadMaxima=5;
private Figura [] vector;
public VisorFigurasModificado(){
//completar
}
public void guardar(Figura f){
//completar
}
public boolean quedaEspacio(){
//completar
}
public void mostrar(){
//completar
}
public int getGuardadas() {
return guardadas;
}
} 
B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas. */

package tema4v2;

public class EJ5 {
	public static void main(String[] args) {
		VisorFiguras vs;
		Rectangulo rec;
		Cuadrado cua1, cua2;
                
		vs = new VisorFiguras();
		rec = new Rectangulo(2.0,1.5,"Verde", "Rojo");
		cua1 = new Cuadrado(5, "Azul", "Violeta");
		cua2 = new Cuadrado(8, "Amarillo", "Celeste");
		
		vs.guardar(rec);
		vs.guardar(cua1);
		vs.guardar(cua2);
		
		vs.mostrar();
	}
	
}