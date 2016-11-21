<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="model.BustaPaga"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="bustaPaga" class="model.BustaPaga" scope="request"></jsp:useBean>
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="bustaPaga"/>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
<%   if (admin.isValid()){
	
		Servizi s = new Servizi();
		long id = Long.parseLong(request.getParameter("idUtente"));
		double importo = Double.parseDouble(request.getParameter("importo"));
		bustaPaga.setImporto(importo);
		
		DipendenteBean dipendente = (DipendenteBean)s.cercaUtenteConId(id);
		
		System.out.println(dipendente.getIdUtente() + " " + (importo + 1));
		
		dipendente.getListaBustePaga().add(bustaPaga);
		bustaPaga.setDipendente(dipendente);
		
		
		if (bustaPaga.isValid()){			
			
			s.creaBustaPaga(bustaPaga);	
			s.modificaDipendente(dipendente);
			
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