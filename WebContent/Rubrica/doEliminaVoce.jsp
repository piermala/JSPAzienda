 <%@page import="serviziRubrica.ServiziRubrica"%>
 <%@page import="model.Voce"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
<% if (cliente.isValid()) { 
	
	ServiziRubrica sr = new ServiziRubrica();

	long id = Long.parseLong(request.getParameter("id_voce"));
	
	Voce v = (Voce)sr.cercaVoce(id);

	sr.eliminaVoce(v);
	
	message.setMessage("Voce eliminata!");
	
%>

	<jsp:forward page="../Rubrica/listaVociCliente.jsp"></jsp:forward>

<%
} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
