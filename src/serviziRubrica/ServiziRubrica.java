package serviziRubrica;

import model.*;
import dao.RubricaDao;
import dao.VoceDao;

public class ServiziRubrica {

	RubricaDao rDao = new RubricaDao();
	VoceDao vDao = new VoceDao();
	
	
	/// AGGIUNGI RUBRICA
	public Rubrica aggiungiRubrica(String nome){
		Rubrica r = null;
		r = rDao.aggiungiRubrica(nome);
		
		return r;
	}
	
	
	/// CERCA RUBRICA
	public Rubrica cercaRubrica(String nome){
		Rubrica r = null;
		r = rDao.cercaRubrica(nome);
			
		return r;
	}
	
	
	/// AGGIUNGI VOCE
	public Voce aggiungiVoce(String nome, String cognome, String telefono, Rubrica rubrica) {
		Voce v = null;
		v = vDao.aggiungiVoce(nome, cognome, telefono,rubrica);

		return v;
	}
	
	
	/// CERCA VOCE
	public Voce cercaVoce(String nome, String cognome) {
		Voce v = null;
		v = vDao.cercaVoce(nome, cognome);

		return v;
	}
	
	
	/// CERCA TELEFONO
	public Voce cercaTelefono(String telefono) {
		Voce v = null;
		v = vDao.cercaTelefono(telefono);

		return v;
	}
	
	
	/// MODIFICA VOCE
	public boolean modificaVoce(Voce v) {
		boolean modificato = false;
		modificato = vDao.modificaVoce(v);

		return modificato;
	}
	
	
	/// ELIMINA VOCE
	public boolean eliminaVoce(Voce v) {
		boolean eliminato = false;
		eliminato = vDao.eliminaVoce(v);

		return eliminato;
	}
}
