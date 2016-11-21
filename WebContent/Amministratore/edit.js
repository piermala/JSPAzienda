function confirmDeleteDipendente(){	
	
	var result = confirm ("Vuoi davvero eliminare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaDipendente.jsp";
	}
}


function confirmDeleteCliente(){	
	
	var result = confirm ("Vuoi davvero eliminare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaCliente.jsp";
	}
}


function confirmDeleteBustaPaga(){	
	
	var result = confirm ("Vuoi davvero eliminare questa busta paga?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaBustaPaga.jsp";
	}
}

function confirmDeleteVoce(){	
	
	var result = confirm ("Vuoi davvero eliminare questa voce?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaVoce.jsp";
	}
}