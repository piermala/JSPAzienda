<%@page import="serviziRubrica.ServiziRubrica"%>
<%@page import="servizi.Servizi"%>
<%@page import="model.ClienteBean"%>
<%@page import="model.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="cliente"/>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    
    
<% if (admin.isValid()){	

    Servizi serv = new Servizi();
    ServiziRubrica servRubrica = new ServiziRubrica();
    cliente.setRuolo('C');
    String username = request.getParameter("username");
    String pass = request.getParameter("password");
    UtenteBean u = serv.cercaConUsername(username);
    
    if (cliente.isValid() && u==null){
    	String password = serv.codificaPassword(pass);
    	serv.createCliente(cliente.getNome(), cliente.getCognome(), cliente.getUsername(), password, cliente.getpIVA(), cliente.getRagioneSociale());
    	servRubrica.aggiungiRubrica(username);
    	
    	message.setMessage("Cliente aggiunto");
%>
		<jsp:forward page="listaClienti.jsp"></jsp:forward>
<%
    } else {
    	%>
       	<jsp:forward page="RegistrazioneCliente.jsp"></jsp:forward>
       	<% 	
    }
    
  } else {
	  
	  session.invalidate();
	  response.sendRedirect("../login/login.jsp");
  }
%> 
     
    
    
    
    