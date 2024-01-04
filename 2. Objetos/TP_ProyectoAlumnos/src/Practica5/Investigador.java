package Practica5;

public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int cantSub;
    private Subsidios [] sub;

    
    public Investigador(String nom, int cate, String esp){
        this.categoria = cate;
        this.nombre = nom;
        this.especialidad = esp;
        this.sub = new Subsidios [5];
        this.inicializarSubsidios(sub);
    }
    
    public boolean puedoAgregar(){
        return cantSub < 5;
    }
    
    private void inicializarSubsidios(Subsidios [] vec){
        int i;
        for(i=0;i<5;i++)
            vec[i] = new Subsidios(0, "Null");
    }
    
    public void agregarSubsidio(Subsidios sub){
        if(this.puedoAgregar()){
            this.getSub()[this.cantSub] = sub;
            this.getSub()[this.cantSub++].setOtorgadoTrue();
        }            
    }
    
    public double totalSubsidio(){
        int i;
        double aux = 0;
        for(i=0;i<this.cantSub;i++){
            aux = aux + this.sub[i].getMonto();
        }
        return aux;
    }
    
    public String getNombre() {
        return nombre;
    }

    public int getCantSub() {
        return cantSub;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public Subsidios[] getSub(){
        return this.sub;
    }
    
@Override
    public String toString(){
        String aux = "Nombre: " + this.getNombre()+ " --- " + " Categoria: " + this.getCategoria() + " --- " + " Especialidad: " + this.getEspecialidad()+ " --- " + "Monto total Subisidiado: " + this.totalSubsidio()+"\n";
        return aux;
    }
    
}
