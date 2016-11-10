import static org.junit.Assert.*;
import model.Rubrica;

import org.junit.BeforeClass;
import org.junit.Test;

import serviziRubrica.ServiziRubrica;


public class Prova {

	static Rubrica r;
	static ServiziRubrica serv;
	
	@BeforeClass
	public static void inizializzaClasse(){
		r = new Rubrica();
		serv = new ServiziRubrica();
	}
	
	@Test
	public void testRubrica() {
		assertNotNull(r);
	}
	
	@Test
	public void testServiziRubrica() {
		assertNotNull(serv);
	}
	
	
	@Test
	public void cercaRubrica(){
		Rubrica rubrica = serv.cercaRubrica("cilento");
		assertNotNull(rubrica);
	}

}
