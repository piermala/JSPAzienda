 <%@page import="model.Rubrica"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page import="servizi.Servizi" %>
  <%@ page import="model.ClienteBean" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    
<% if (admin.isValid()) { 
	
	Servizi s = new Servizi();
	ServiziRubrica sr = new ServiziRubrica();

	Long id = Long.parseLong(request.getParameter("idCliente"));
	
	ClienteBean c = (ClienteBean)s.cercaUtenteConId(id);
	
	long idRubrica = sr.leggiID(c.getUsername());
	Rubrica r = sr.cercaRubrica(idRubrica);

	s.eliminaCliente(c);
	
	sr.eliminaRubrica(r);
	
%>

	<jsp:forward page="listaClienti.jsp"></jsp:forward>

<%
} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
