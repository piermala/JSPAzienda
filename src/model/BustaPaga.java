package model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import servizi.Servizi;
import dao.DipendenteDao;

@Entity
public class BustaPaga {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id_bustaPaga;
	
	@ManyToOne
	private DipendenteBean dipendente;
	
	private String data;
	private double importo;
	
	
	
	public int getId_bustaPaga() {
		return id_bustaPaga;
	}
	public void setId_bustaPaga(int id_bustaPaga) {
		this.id_bustaPaga = id_bustaPaga;
	}
	public DipendenteBean getDipendente() {
		return dipendente;
	}
	public void setDipendente(DipendenteBean dipendente) {
		this.dipendente = dipendente;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public double getImporto() {
		return importo;
	}
	public void setImporto(double importo) {
		this.importo = importo;
	}
	
	
	public BustaPaga(int id_bustaPaga, DipendenteBean dipendente, String data,
			double importo) {
		super();
		this.id_bustaPaga = id_bustaPaga;
		this.dipendente = dipendente;
		this.data = data;
		this.importo = importo;
	}
	
	public BustaPaga(){}
	
	
	public boolean isValid(){
		boolean valid = false;
		
		Servizi s = new Servizi();
		List<DipendenteBean> dipendenti = s.getTuttiDipendenti();
		
		if (/*dipendenti.contains(dipendente) && */dipendente.getStipendio() <= importo){
			valid = true;
		}
		
		return valid;
	}
	
	
	
}
