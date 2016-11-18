function confirmEdit(){
	var result = confirm ("Vuoi modificare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doModificaDipendente.jsp";
		document.getElementById("formModifiche").submit();
	}
	
}

function confirmDelete(){	
	
	var result = confirm ("Vuoi davvero eliminare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaDipendente.jsp";
		document.getElementById("formModifiche").submit();
	}
}