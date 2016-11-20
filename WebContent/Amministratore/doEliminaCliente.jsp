 <%@ page import="servizi.Servizi" %>
  <%@ page import="model.ClienteBean" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    
<% if (admin.isValid()) { 
	
	Servizi s = new Servizi();

	Long id = Long.parseLong(request.getParameter("idCliente"));
	
	ClienteBean c = (ClienteBean)s.cercaUtenteConId(id);

	s.eliminaCliente(c);
	
%>

	<jsp:forward page="listaClienti.jsp"></jsp:forward>

<%
} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
