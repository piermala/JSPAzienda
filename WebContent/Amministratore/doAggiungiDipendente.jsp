<%@page import="model.UtenteBean"%>
<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="dipendente"/>
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
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
	    	
	    	message.setMessage("Dipendente aggiunto");
	    	%>
	    			<jsp:forward page="listaDipendenti.jsp"></jsp:forward>
	    	<%
	    	
	    } else {
		   	%>
		   	<jsp:forward page="aggiungiDipendente.jsp"></jsp:forward>
		   	<% 	
    	}
    } else {
    	response.sendRedirect("../login/login.jsp");
    	session.invalidate();
    }
    %>
    
    
    