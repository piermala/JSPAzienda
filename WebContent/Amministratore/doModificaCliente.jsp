<%@page import="model.ClienteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="servizi.Servizi" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
	
<% if (admin.isValid()) {

	Servizi s = new Servizi();
	
	long id = Long.parseLong(request.getParameter("id_utente"));
	ClienteBean c = (ClienteBean)s.cercaUtenteConId(id);
	
	c.setNome(request.getParameter("nome1"));
	c.setCognome(request.getParameter("cognome1"));
	c.setRagioneSociale(request.getParameter("ragioneSociale1"));
	
	s.modificaCliente(c);	
	
	
	message.setMessage("Cliente modificato!");
		
%>	

	<jsp:forward page="listaClienti.jsp"></jsp:forward>

<%
} else {	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}
%>