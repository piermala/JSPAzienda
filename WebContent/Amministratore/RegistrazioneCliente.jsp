<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session" />
     <jsp:useBean id="message" class="utility.Message" scope="request" />
    <jsp:setProperty property="*" name="admin"/>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<%if (admin.isValid()) {%>
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Registra nuovo cliente</a></li>
	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div align="center">


				<h1>Registra nuovo cliente</h1> <br>
				<form class="form-horizontal" action="doRegistrazioneCliente.jsp" method="post">
					<label>Nome</label><br>
					<input type="text" name="nome" placeholder="Inserisci il nome" required /><br> 
					<label>Cognome</label><br>
					<input type="text" name="cognome" placeholder="Inserisci il cognome" required/><br> 
					<label>Partita IVA</label><br>
					<input type="text" name="pIVA" placeholder="Inserisci la partita iva" required/><br> 
					<label>Ragione Sociale</label><br>
					<input type="text" name="ragioneSociale" placeholder="Inserisci la ragione sociale" required/><br> 
					<label>Username</label><br>
					<input type="text" name="username" placeholder="Inserisci lo username" required/><br> 
					<label>Password</label><br>
					<input type="password" name="password" placeholder="Inserisci la password" required/><br><br>
					<input type="submit" value="Registra cliente" class="btn btn-primary"><br><br>
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
	
</body>
</html>

<%

} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}	
%>
}


