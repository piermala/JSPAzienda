<%@page import="serviziRubrica.ServiziRubrica"%>
<%@page import="model.Rubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="voce" class="model.Voce" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="voce"/>
    
    <%
    ServiziRubrica s = new ServiziRubrica();
    long id = s.leggiID(cliente.getUsername());
    Rubrica r = s.cercaRubrica(id);
    
    
    if (cliente.isValid()){  
    	
    	if (voce.getNome() != null && voce.getTelefono().length() > 4){  
        	
        		s.aggiungiVoce(voce.getNome(), voce.getCognome(), voce.getTelefono(), r);
    			response.sendRedirect("../Rubrica/listaVociCliente.jsp");
        	
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