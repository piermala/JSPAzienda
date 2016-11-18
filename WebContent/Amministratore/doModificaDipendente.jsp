<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    
<% if (admin.isValid()) {


} else {	
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}