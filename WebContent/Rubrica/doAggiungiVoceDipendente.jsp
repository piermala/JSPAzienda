<%@page import="serviziRubrica.ServiziRubrica"%>
<%@page import="model.Rubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="voce" class="model.Voce" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="voce"/>
    
    <%
    ServiziRubrica s = new ServiziRubrica();
    //String username = dipendente.getUsername();
    //long id = dipendente.getIdUtente();
    long id = s.leggiID(dipendente.getUsername());
    Rubrica r = s.cercaRubrica(id);
    
    
    if (dipendente.isValid()){  /// controllo se è valido altrimenti torno al login
    	
    	if (voce.getNome() != null && voce.getTelefono().length() > 4){  /// controllo se nella voce siano stati inseriti almeno il nome ed un numero di telefono con più di 4 cifre
        	
        		s.aggiungiVoce(voce.getNome(), voce.getCognome(), voce.getTelefono(), r);
    			response.sendRedirect("../Rubrica/listaVociDipendente.jsp");
        	
        } else {
    %>
        	<jsp:forward page="aggiungiVoce.jsp"></jsp:forward>
    <%        	
        }
    	
    } else {
    	
    	response.sendRedirect("../login/login.jsp");
    	session.invalidate();
    }
    
    %>