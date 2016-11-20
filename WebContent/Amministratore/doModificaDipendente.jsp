<%@page import="model.DipendenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="servizi.Servizi" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
	
<% if (admin.isValid()) {

	Servizi s = new Servizi();
	
	long id = Long.parseLong(request.getParameter("id_utente"));
	DipendenteBean d = (DipendenteBean)s.cercaUtenteConId(id);
	
	d.setNome(request.getParameter("nome1"));
	d.setCognome(request.getParameter("cognome1"));
	d.setPosizione(request.getParameter("posizione1"));
	d.setStipendio(Double.parseDouble(request.getParameter("stipendio1")));
	
	s.modificaDipendente(d);	
	
	
		
%>	

	<jsp:forward page="listaDipendenti.jsp"></jsp:forward>

<%
} else {	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}
%>