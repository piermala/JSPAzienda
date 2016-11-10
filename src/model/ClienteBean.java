package model;

import javax.persistence.*;

import utility.IsValid;

@Entity
public class ClienteBean extends UtenteBean implements IsValid  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String ragioneSociale;
	private String pIVA;
	
	public ClienteBean() {
		setNome("");
		setCognome("");
		setUsername("");
		setPassword("");
		setRuolo(' ');
		this.ragioneSociale = "";
		this.pIVA = "";
	}
	
	public ClienteBean(String nome, String cognome,
			String username, String password, char ruolo,String ragioneSociale, String pIVA) {
		super(nome,cognome,username,password,ruolo);
		this.ragioneSociale = ragioneSociale;
		this.pIVA = pIVA;
	}

	public String getRagioneSociale() {
		return ragioneSociale;
	}

	public void setRagioneSociale(String ragioneSociale) {
		this.ragioneSociale = ragioneSociale;
	}

	public String getpIVA() {
		return pIVA;
	}

	public void setpIVA(String pIVA) {
		this.pIVA = pIVA;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public boolean isValid() {

		boolean result=false;
		
		if(!nome.isEmpty() && nome!=null && 
				!cognome.isEmpty() && cognome!=null &&
				!username.isEmpty() && username!=null &&
				!password.isEmpty() && password!=null &&
				ruolo=='C' &&
				!ragioneSociale.isEmpty() && ragioneSociale!=null &&
				!pIVA.isEmpty() && pIVA!=null) {
			result=true;
		}
		
		return result;
	}
	
}

