<%@page import="serviziRubrica.ServiziRubrica"%>
<%@page import="model.Rubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="voce" class="model.Voce" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="voce"/>
    
    <%
    ServiziRubrica s = new ServiziRubrica();
    String username = cliente.getUsername();
    Rubrica r = s.cercaRubrica(username);
    
    
    if (cliente.isValid()){  /// controllo se è valido altrimenti torno al login
    	
    	if (voce.getNome() != null && voce.getTelefono().length() > 4){  /// controllo se nella voce siano stati inseriti almeno il nome ed un numero di telefono con più di 4 cifre
        	
        		s.aggiungiVoce(voce.getNome(), voce.getCognome(), voce.getTelefono(), r);
    			response.sendRedirect("../Cliente/HomepageCliente.jsp");
        	
        } else {
    %>
        	<jsp:forward page="aggiungiVoceCliente.jsp"></jsp:forward>
    <%        	
        }
    	
    } else {
    	
    	response.sendRedirect("../login/login.jsp");
    	session.invalidate();
    }
    
    %>