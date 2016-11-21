<%@page import="model.DipendenteBean"%>
<%@page import="java.util.List"%>
<%@page import="servizi.Servizi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
    <jsp:include page="../charisma/navBar.jsp"></jsp:include>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="request"></jsp:useBean>    
    
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>   -->
<!-- 	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!-- 	<script	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>	  -->
<!--     <script type="text/javascript" src="bustaPaga.js"></script>  -->
	
	
<% if (admin.isValid()) { %>
	
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Emissione Busta Paga</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					
				<div align="center">
				
					<form class="form-horizontal" action="doBustaPaga.jsp" method="post">
				
				
					<label>Dipendente:</label><br>
					<select name="idUtente" id="dipendente" style="width:200px;">
					
					<%
					Servizi s = new Servizi();
					
					List<DipendenteBean> dipendenti = s.getTuttiDipendenti();
					
					session.setAttribute("dipendenti", dipendenti);
					%>
					
				
					<c:forEach items="${dipendenti}" var="u">
						<option value="${u.idUtente}" ><c:out value="${u.nome} ${u.cognome}"/></option>							
					</c:forEach>
					
					
					</select>
					<br>
					
					<label>Data:</label><br>
					<input type="text" name="data" id="data" placeholder="Inserisci la data"/ required> <br>
					
					<label>Importo:</label><br>
					<input type="text" name="importo" id="importo" placeholder="Inserisci l'importo per l'utente" required/> <br><br>
					
					
					<button type="submit" name="registra" class="btn btn-primary">Registra</button><br><br>			
				
				</form>
				
				<form action="HomepageAdmin.jsp">
					<button type="submit" name="annulla" class="btn btn-primary">Annulla</button>
				</form>
				
				</div>
				
			</div>
			
			<div class="row">
			
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

