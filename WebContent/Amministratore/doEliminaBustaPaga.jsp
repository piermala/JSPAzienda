 <%@page import="model.Rubrica"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page import="servizi.Servizi" %>
  <%@ page import="model.BustaPaga" %>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
<% if (admin.isValid()) { 
	
	Servizi s = new Servizi();

	long id = Long.parseLong(request.getParameter("id_bustaPaga"));
	
	BustaPaga bp = (BustaPaga)s.leggiBustaPagaDaId(id);

	s.eliminaBustaPaga(bp);
	
	message.setMessage("Busta paga eliminato!");
	
%>

	<jsp:forward page="elencoBustePaga.jsp"></jsp:forward>

<%
} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}%>
    
    
