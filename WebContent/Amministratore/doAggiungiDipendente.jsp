<%@page import="model.UtenteBean"%>
<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="request"></jsp:useBean>
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="dipendente"/>
    
    <%
    if (admin.isValid()){
	    Servizi serv = new Servizi();
	    ServiziRubrica servRubrica = new ServiziRubrica();
	    
	    String username = request.getParameter("username");
	    UtenteBean u = serv.cercaConUsername(username);
	    dipendente.setRuolo('D');
	    
	    if(dipendente.isValid() && u==null){
	    	String password = request.getParameter("password");
	    	String passCodificata = serv.codificaPassword(password);
	    	serv.createDipendente(dipendente.getNome(), dipendente.getCognome(), dipendente.getUsername(), passCodificata, dipendente.getPosizione(), dipendente.getStipendio());
	    	servRubrica.aggiungiRubrica(dipendente.getUsername());
	    	
	    	response.sendRedirect("HomepageAdmin.jsp");
	    	
	    } else {
   	%>
   	<jsp:forward page="aggiungiDipendente.jsp"></jsp:forward>
   	<% 	
    	}
    } else {
    	response.sendRedirect("login.jsp");
    	session.invalidate();
    }
    %>
    
    
    