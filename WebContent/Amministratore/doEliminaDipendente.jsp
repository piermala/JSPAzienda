 <%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page import="servizi.Servizi" %>
  <%@ page import="model.DipendenteBean" %>
  <%@ page import="model.Rubrica" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    
<% if (admin.isValid()) { 
	
	Servizi s = new Servizi();
	ServiziRubrica sr = new ServiziRubrica();
	
	Long id = Long.parseLong(request.getParameter("id"));
	
	DipendenteBean d = (DipendenteBean)s.cercaUtenteConId(id);
	
	long idRubrica = sr.leggiID(d.getUsername());
	Rubrica r = sr.cercaRubrica(idRubrica);

	s.eliminaDipendente(d);
	
	sr.eliminaRubrica(r);
	
%>

	<jsp:forward page="listaDipendenti.jsp"></jsp:forward>

<%
} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
