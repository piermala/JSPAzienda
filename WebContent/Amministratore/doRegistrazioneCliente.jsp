<%@page import="servizi.Servizi"%>
<%@page import="model.ClienteBean"%>
<%@page import="model.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="cliente"/>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    <%
    Servizi serv = new Servizi();
    cliente.setRuolo('C');
    String username = request.getParameter("username");
    String pass = request.getParameter("password");
    UtenteBean u = serv.cercaConUsername(username);
    
    if (cliente.isValid() && u==null){
    	String password = serv.codificaPassword(pass);
    	serv.createCliente(cliente.getNome(), cliente.getCognome(), cliente.getUsername(), password, cliente.getpIVA(), cliente.getRagioneSociale());
    	response.sendRedirect("HomepageAdmin.jsp");
    %>
    <%
    } else {
    %>
    <jsp:forward page="RegistrazioneCliente.jsp"></jsp:forward>
    <%
    }
    %>
     
    
    
    
    