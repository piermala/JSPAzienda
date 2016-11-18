package model;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import utility.IsValid;

@Entity
@PrimaryKeyJoinColumn(name="idUtente")
public class DipendenteBean extends UtenteBean implements IsValid {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String posizione;
	private double stipendio;
	
	@OneToMany(mappedBy="dipendente",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@NotFound(action=NotFoundAction.IGNORE)
	private Set<BustaPaga> listaBustePaga = new HashSet<BustaPaga>();
	
	public DipendenteBean() {}
	
	
	public DipendenteBean(String nome, String cognome,
			String username, String password, char ruolo,String posizione, double stipendio) {
		super(nome,cognome,username,password,ruolo);
		this.posizione = posizione;
		this.stipendio = stipendio;
	}


	public String getPosizione() {
		return posizione;
	}


	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}


	public double getStipendio() {
		return stipendio;
	}


	public void setStipendio(double stipendio) {
		this.stipendio = stipendio;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Set<BustaPaga> getListaBustePaga() {
		return listaBustePaga;
	}


	public void setListaBustePaga(Set<BustaPaga> listaBustePaga) {
		this.listaBustePaga = listaBustePaga;
	}


	@Override
	public boolean isValid() {

		boolean result=false;
		
		if(!nome.isEmpty() && nome!=null && 
				!cognome.isEmpty() && cognome!=null &&
				!username.isEmpty() && username!=null &&
				!password.isEmpty() && password!=null &&
				ruolo=='D' &&
				!posizione.isEmpty() && posizione!=null) {
			result=true;
		}
		
		return result;
	}


	

}