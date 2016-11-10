<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
    
   	<%
	Servizi serv = new Servizi();
	
	List<DipendenteBean> dipendenti = serv.getTuttiDipendenti();
	
	session.setAttribute("dipendenti", dipendenti);
	
	%>

	<table border="2">
	  <thead>
	    <tr>
	      <td>N.</td>
	      <td>Nome</td>
	      <td>Cognome</td>
	      <td>Posizione</td>
	      <td>Stipendio</td>
	      <td>Username</td>
	    </tr>	  
	  </thead> 
	  
	  
	  <tbody>
	  
	  <c:set var="i" value="1" scope="page" />
	  
	  <c:forEach items="${dipendenti}" var="d">
	  
	    <tr>
	      <td><c:out value="${i}" /></td>
	      <td><c:out value="${d.nome}" /></td>
	      <td><c:out value="${d.cognome}" /></td>
	      <td><c:out value="${d.posizione}" /></td>
	      <td><c:out value="${d.stipendio}" /></td>
	      <td><c:out value="${d.username}" /></td>
	    </tr>	
	    
	    <c:set var="i" value="${i+1}" scope="page" />
	    
	  </c:forEach>  
	  
	  </tbody>	
	  
	</table>

</body>
</html>
