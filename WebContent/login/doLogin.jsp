<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="utility.Message"%>
<%@page import="model.UtenteBean" %>
<%@page import="model.AdminBean" %>
<%@page import="model.ClienteBean" %>
<%@page import="model.DipendenteBean" %>
<%@page import="servizi.Servizi" %>
    
    <jsp:useBean id="utente" class="model.UtenteBean" scope="request"></jsp:useBean>    
	<jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
	<jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
	<jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>	
	<jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    <jsp:setProperty property="*" name="utente"/>
    
    <%
    Servizi serv = new Servizi();
    
    String username = request.getParameter("username");
    UtenteBean u = serv.cercaConUsername(username);
    String password = u.getPassword();
    String pass = request.getParameter("password");
    pass = serv.codificaPassword(pass);
    
    if (u != null && pass.equals(password)){
    	
    	char ruolo = u.getRuolo();
    	
    	utente.setNome(u.getNome());
    	utente.setCognome(u.getCognome());
    	utente.setRuolo(ruolo);
    	utente.setPassword(pass);
    		
    		switch(ruolo){
    		
    		case 'A':
    			AdminBean ad = serv.trovaAdminConUsername(username);
    			session.setAttribute("admin",ad);
    			
    		%>
    		<jsp:forward page="../Amministratore/HomepageAdmin.jsp"></jsp:forward>
    		<%	
    		break;
    			
    		case 'C':
    			ClienteBean cl = serv.trovaClienteConUsername(username);
    			session.setAttribute("cliente",cl);
    		%>
    		<jsp:forward page="../Cliente/HomepageCliente.jsp"></jsp:forward>
    		<%	
    		break;
    			
    		case 'D':
    			DipendenteBean dip = serv.trovaDipendenteConUsername(username);
    			session.setAttribute("dipendente",dip);
    		%>
    		<jsp:forward page="../Dipendente/HomepageDipendente.jsp"></jsp:forward>
    		<%
    		break;
    		
    		}    		
 
    } else {
    	
    	message.setMessage("Username e/o password errati!");
    	
    	%>
    	<jsp:forward page="login.jsp"></jsp:forward>
    	<%
    }
    
    
    %>
    