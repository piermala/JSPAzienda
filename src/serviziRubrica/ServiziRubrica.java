package serviziRubrica;

import java.util.List;

import model.*;
import dao.RubricaDao;
import dao.VoceDao;

public class ServiziRubrica {

	RubricaDao rDao = new RubricaDao();
	VoceDao vDao = new VoceDao();
	
	
	/// AGGIUNGI RUBRICA
	public Rubrica aggiungiRubrica(String name){
		Rubrica r = null;
		r = rDao.aggiungiRubrica(name);
		
		return r;
	}
	
	
	/// CERCA RUBRICA
	public Rubrica cercaRubrica(long id){
		Rubrica r = null;
		r = rDao.cercaRubrica(id);
			
		return r;
	}
	
	
	/// LEGGI ID RUBRICA
	public long leggiID(String username){
		
		long id = -1;
		id = rDao.leggiIdRubrica(username);
		
		return id;		
	}
	
	
	/// ELIMINA RUBRICA
	public void eliminaRubrica(Rubrica r){
		rDao.eliminaRubrica(r);
	}
	
	
	/// AGGIUNGI VOCE
	public Voce aggiungiVoce(String nome, String cognome, String telefono, Rubrica rubrica) {
		Voce v = null;
		v = vDao.aggiungiVoce(nome, cognome, telefono,rubrica);

		return v;
	}
	
	
	/// CERCA VOCE
	public Voce cercaVoce(long id) {
		Voce v = null;
		v = vDao.cercaVoce(id);

		return v;
	}
	
	
	/// CERCA TELEFONO
	public Voce cercaTelefono(String telefono) {
		Voce v = null;
		v = vDao.cercaTelefono(telefono);

		return v;
	}
	
	
	/// LEGGI TUTTE LE VOCI
	public List<Voce> getTutteLeVoci(long id){
		
		List<Voce> voci = null;
		voci = vDao.getTutteLeVoci(id);
		
		return voci;
	}
	
	
	
	
	/// MODIFICA VOCE
	public boolean modificaVoce(Voce v) {
		boolean modificato = false;
		modificato = vDao.modificaVoce(v);

		return modificato;
	}
	
	
	/// ELIMINA VOCE
	public void eliminaVoce(Voce v) {
		vDao.eliminaVoce(v);
	}
}
