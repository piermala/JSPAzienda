<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="dipendente" class="model.DipendenteBean"	scope="session"></jsp:useBean>
    
    
<%if(dipendente.isValid()) {%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aggiungi Voce</title>
</head>
<body>

  <div id="formRegistrazioneVoce">
  
	<form action="doAggiungiVoceDipendente.jsp" method="post">
	  Nome <input type="text" name="nome" /><br>
	  Cognome <input type="text" name="cognome" /><br>
	  Telefono <input type="number" name="telefono" /><br>
	  <input type="submit" value="Aggiungi"/>
	</form>
	
	<form action="HomepageDipendente.jsp" method="post">
	  <input type="submit" value="Annulla"/>	
	</form>
	
  </div>

</body>
</html>
<%} else {
	response.sendRedirect("login.jsp");
}%>