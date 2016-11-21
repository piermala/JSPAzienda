function confirmEditDipendente(){
	var result = confirm ("Vuoi modificare questo utente?");
	
	if (result == true){
		
		document.getElementById("formModifiche").action = "modificaDipendente.jsp";
		document.getElementById("formModifiche").submit();
	}
	
}

function confirmDeleteDipendente(){	
	
	var result = confirm ("Vuoi davvero eliminare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaDipendente.jsp";
		//document.getElementById("formModifiche").submit();
	}
}


