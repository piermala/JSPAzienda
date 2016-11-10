<%@page import="model.UtenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="model.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="admin"/>
    
    <% 
    Servizi serv = new Servizi();
    String username = request.getParameter("username");
    UtenteBean u = serv.cercaConUsername(username);
    admin.setRuolo('A');
    
    if (admin.isValid() && u==null){
    	String password = request.getParameter("password");
    	String passCodificata = serv.codificaPassword(password);
    	
    	serv.createAdmin(admin.getNome(), admin.getCognome(), admin.getUsername(), passCodificata, admin.getLivelloAccesso());
    	
    	response.sendRedirect("HomepageAdmin.jsp");
    } else {	%>
    
    <jsp:forward page="aggiungiNuovoAdmin.jsp"></jsp:forward>
    <%	
    }
    %>
    
    
    
    
    
    
    
    
    
    %>