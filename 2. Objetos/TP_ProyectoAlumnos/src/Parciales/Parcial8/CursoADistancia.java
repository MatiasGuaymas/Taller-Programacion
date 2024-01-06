package Parciales.Parcial8;

public class CursoADistancia extends Curso{
    private String link;

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    public CursoADistancia(String lin, int a, int cant){
        super(a, cant);
        this.link = lin;
    }
@Override
    public boolean puedeRendir(Alumno2 a){
       return ((a.getAutoEvaluaciones() >= 3)&&(a.getAsistencias() >= 1));
    }
}
