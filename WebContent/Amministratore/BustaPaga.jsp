<%@page import="model.DipendenteBean"%>
<%@page import="java.util.List"%>
<%@page import="servizi.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="request"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	

<% if (admin.isValid()) { %>
	
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Busta Paga</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					
				<div align="center"><font size="4" color="red"></font></div>
			</div>
			
			<div class="row">
			
				<form action="doBustaPaga.jsp" method="post">
				
				
					Dipendente: <select name="idUtente" id="dipendente" style="width:200px;">
					
					<%
					Servizi s = new Servizi();
					
					List<DipendenteBean> dipendenti = s.getTuttiDipendenti();
					
					session.setAttribute("dipendenti", dipendenti);
					%>
					
				
					<c:forEach items="${dipendenti}" var="u">
						<option value="${u.idUtente}"><c:out value="${u.nome} ${u.cognome}"/></option>							
					</c:forEach>
					
					
					</select>
					<br>
					
					Data: <input type="text" name="data" id="data" /> <br>
					Importo: <input type="text" name="importo" id="importo" /> <br>
					
					
					<button type="submit" name="registra">Registra</button>					
				
				</form>
	

			</div>
			<!-- content ends -->
		</div>
		<!--/#content.col-md-0-->
	</div>
	<!--/fluid-row-->
</div>
	
	
	
	<hr>
	
	<jsp:include page="../charisma/footer.jsp"></jsp:include>
	
	
	<!--/.fluid-container-->
	
	<!--      includo tutti script di sotto -->
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>
	

</body>
</html>

<% } else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}
%>

