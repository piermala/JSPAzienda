 <%@page import="java.io.PrintWriter"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page import="servizi.Servizi" %>
  <%@ page import="model.DipendenteBean" %>
  <%@ page import="model.Rubrica" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
<% if (admin.isValid()) { 
	
	Servizi s = new Servizi();
	ServiziRubrica sr = new ServiziRubrica();
	
	long id = Long.parseLong(request.getParameter("idUtente"));	
		
	DipendenteBean d = (DipendenteBean)s.cercaUtenteConId(id);
	
	long idRubrica = sr.leggiID(d.getUsername());
	Rubrica r = sr.cercaRubrica(idRubrica);

	s.eliminaDipendente(d);
	//s.eliminaUtenteById(d.getIdUtente());
	
	sr.eliminaRubrica(r);
	
	message.setMessage("Utente eliminato!");
	
%>
	
	<jsp:forward page="listaDipendenti.jsp"></jsp:forward>

<%

} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
