import model.UtenteBean;
import servizi.Servizi;


public class MainClass {

	static Servizi serv;
	
	public static void main(String[] args) {
		
		serv = new Servizi();
		
		UtenteBean u = serv.cercaConUsername("CM");
		System.out.println(u.getNome() + " " + u.getCognome());
		
		
	}
}
