<%@page import="model.Voce"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="serviziRubrica.*" %>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
	
<% if (dipendente.isValid()) {

	ServiziRubrica s = new ServiziRubrica();
	
	long id = Long.parseLong(request.getParameter("id_voce"));
	Voce v = (Voce)s.cercaVoce(id);
	
	v.setNome(request.getParameter("nome"));
	v.setCognome(request.getParameter("cognome"));
	v.setTelefono(request.getParameter("telefono"));
	
	s.modificaVoce(v);	
	
	
	message.setMessage("Voce modificata!");
		
%>	

	<jsp:forward page="../Rubrica/listaVociDipendente.jsp"></jsp:forward>

<%
} else {	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}
%>