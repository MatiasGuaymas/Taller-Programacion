package tema4v2;

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
            for (i=0; i < guardadas;i++) {
                System.out.println(vector[i].toString());
            }
	}
	
	public int getGuardadas(){
            return guardadas;
	}
}