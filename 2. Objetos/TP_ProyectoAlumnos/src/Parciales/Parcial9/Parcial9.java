//https://cdn.discordapp.com/attachments/963569430112129025/1160662323896266762/Parcial_9.jpg?ex=65357a06&is=65230506&hm=dec8e55522f789228a3ea514551b7de2920454f40af5871a7388b86666f75f0a&
//LINK CON FOTO DEL PARCIAL

package Parciales.Parcial9;

public class Parcial9 {

    public static void main(String[] args) {
        Funcion f1; 
        
        f1 = new Funcion("El Cumple De Estanislao", 17, 20, 5, 9);
        
        int i,j;
        for(i=0;i<5;i++){
            for(j=0;j<9;j++){
                f1.ocuparButaca(i, j);
            }
        }
        System.out.println(f1.toString());
    }
    
}
