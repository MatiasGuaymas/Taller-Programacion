/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

/**
 *
 * @author Francisco
 */
public class EJ6 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SistemaAnual sistemita;
        Estacion est;
        
        est = new Estacion("La pleita", 12.0, 33.22);
        
        sistemita = new SistemaAnual();
        
        System.out.println(sistemita.toString(est));
    }
    
}
