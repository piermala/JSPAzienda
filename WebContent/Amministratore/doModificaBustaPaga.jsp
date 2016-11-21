<%@page import="model.BustaPaga"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="servizi.Servizi" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
	<jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
	
	
<% if (admin.isValid()) {

	Servizi s = new Servizi();
	
	long id = Long.parseLong(request.getParameter("id_bustapaga"));
	BustaPaga bPaga = (BustaPaga)s.leggiBustaPagaDaId(id);
	
	bPaga.setData(request.getParameter("data"));
	bPaga.setImporto(Double.parseDouble(request.getParameter("importo")));
	
	s.modificaBustaPaga(bPaga);	//modifica busta paga
	
	message.setMessage("Busta paga modificata!");
		
%>	

	<jsp:forward page="elencoBustePaga.jsp"></jsp:forward>

<%
} else {	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}
%>