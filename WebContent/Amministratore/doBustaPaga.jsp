<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="model.BustaPaga"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="bustaPaga" class="model.BustaPaga" scope="session"></jsp:useBean>
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="bustaPaga"/>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
<%   if (admin.isValid()){
	
		Servizi s = new Servizi();
		long id = Long.parseLong(request.getParameter("idUtente"));
		
		DipendenteBean dipendente = (DipendenteBean)s.cercaUtenteConId(id);
		
		dipendente.getListaBustePaga().add(bustaPaga);
		bustaPaga.setDipendente(dipendente);
		
		
		if (bustaPaga.isValid()){			
			
			s.creaBustaPaga(bustaPaga);		
			
			message.setMessage("Busta paga aggiunta!");
			
			%>
			<jsp:forward page="elencoBustePaga.jsp"></jsp:forward>	
			<%
			
		} else {
			
			%>  

			<jsp:forward page="BustaPaga.jsp"></jsp:forward>

			<%
		}	

} else {
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}

%>