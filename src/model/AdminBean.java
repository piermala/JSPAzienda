package model;

import java.io.Serializable;

import javax.persistence.*;

import utility.IsValid;

@Entity
public class AdminBean extends UtenteBean implements IsValid {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String livelloAccesso;

	public AdminBean() {
		setNome("");
		setCognome("");
		setUsername("");
		setPassword("");
		setRuolo(' ');
		this.livelloAccesso = "admin";
	}
	
	public AdminBean(String nome, String cognome,
			String username, String password, char ruolo, String livelloAccesso) {
		super(nome,cognome,username,password,ruolo);
		this.livelloAccesso = livelloAccesso;
	}

	public AdminBean(String nome, String cognome, String username,
			String password, char ruolo) {
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.password = password;
		this.ruolo = ruolo;
	}

	public String getLivelloAccesso() {
		return livelloAccesso;
	}

	public void setLivelloAccesso(String livelloAccesso) {
		this.livelloAccesso = livelloAccesso;
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
				ruolo=='A') {
			result=true;
		}
		
		return result;
	}
	
	
	public boolean isValidLogin(){
		boolean valid = false;
		if (!username.isEmpty() && username!=null &&
			 password.isEmpty() && password!=null){
			valid = true;
		}
			
		return valid;
	}

}
