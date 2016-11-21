<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
 
<% if (admin.isValid()) { %>

	<div class="ch-container">
		<div class="row">
		
			<ul class="breadcrumb">
				<li><a href="HomepageAdmin.jsp">Home</a></li>
				<li><a href="#">Aggiungi Dipendente</a></li>	
			</ul>
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div align="center">
	
				<h1>Aggiungi dipendente</h1> 

				<form class="form-horizontal" action="doAggiungiDipendente.jsp" method="post">
					<label>Nome</label><br>
					<input type="text" name="nome" placeholder="Inserisci il nome" required/><br> 
					<label>Cognome</label><br> 
					<input type="text" name="cognome" placeholder="Inserisci il cognome" required/><br> 
					<label>Posizione</label><br> 
					<input type="text" name="posizione" placeholder="Inserisci la posizione" required/><br> 
					<label>Stipendio</label><br> 
					<input type="number" name="stipendio" id="stipendio" placeholder="Inserisci lo stipendio" required/><br> 
					<label>Username</label><br> 
					<input	type="text" name="username" placeholder="Inserisci lo username" required/><br> 
					<label>Password</label><br> 
					<input type="password" name="password" placeholder="Inserisci la password" required/><br><br>
					<input type="submit" value="Aggiungi" class="btn btn-primary" /><br><br>
				</form>

				<form action="HomepageAdmin.jsp" method="post">
					<input type="submit" value="Annulla" class="btn btn-primary"/><br>
				</form>



			</div>
				
				
			</div>
			
			<div class=" row">
	
	
			</div>
			
			<!-- content ends -->
		</div>
		<!--/#content.col-md-0-->
	</div>
	<!--/fluid-row-->
	
	<hr>
	
	<jsp:include page="../charisma/footer.jsp"></jsp:include>
	
	
	<!--/.fluid-container-->
	
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>

<%
} else {
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}
%>
