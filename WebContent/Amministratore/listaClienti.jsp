<%@page import="servizi.Servizi"%>
<%@page import="model.ClienteBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
   

	
	<table border="2">
		<thead>
		  <tr>
		  	 <th>Num.</th>
		     <th>Nome</th>
		     <th>Cognome</th>
		     <th>Partita IVA</th>
		     <th>Ragione sociale</th>
		     <th>Username</th>
		  <tr>		
		</thead>
		
		<tbody>
		
		<%
	
		Servizi serv = new Servizi();
	
		List<ClienteBean> clienti = serv.getTuttiClienti();	
		
		session.setAttribute("clienti", clienti);
	
		%>
	
		  <c:set var="i" value="1" scope="page" />
		  
		  <c:forEach items="${clienti}" var="c">			
		
		  <tr>
		     <td><c:out value="${i}" /></td>
			 <td><c:out value="${c.nome}" /></td>
			 <td><c:out value="${c.cognome}" /></td>
			 <td><c:out value="${c.pIVA}" /></td>
			 <td><c:out value="${c.ragioneSociale}" /></td>
			 <td><c:out value="${c.username}" /></td>
		  </tr>
		  
		  <c:set var="i" value="${i+1}" scope="page" />
		  </c:forEach>
		  
		</tbody>
	
	
	</table>

</body>
</html>
