function confirmEditCliente(){
	var result = confirm ("Vuoi modificare questo utente?");
	
	if (result == true){
		
		document.getElementById("formModifiche").action = "modificaCliente.jsp";
		document.getElementById("formModifiche").submit();
	}
	
}

function confirmDeleteCliente(){	
	
	var result = confirm ("Vuoi davvero eliminare questo utente?");
	
	if (result == true){
		document.getElementById("formModifiche").action = "doEliminaCliente.jsp";
		document.getElementById("formModifiche").submit();
	}
}