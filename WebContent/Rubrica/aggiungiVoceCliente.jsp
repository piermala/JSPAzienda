<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="cliente" class="model.ClienteBean"	scope="session"></jsp:useBean>
    
    
<%if(cliente.isValid()) {%> 

	<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	

<!-- da qui -->
<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Aggiungi Voce</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="../Cliente/menuLateraleCliente.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					<div id="formRegistrazioneVoce" align="center">
  
						<form action="doAggiungiVoceCliente.jsp" method="post">
						  <label>Nome</label><br>
						  <input type="text" name="nome" placeholder="Inserisci il nome" required/><br>
						  <label>Cognome</label><br>
						  <input type="text" name="cognome" placeholder="Inserisci il cognome" required/><br>
						  <label>Telefono</label><br>
						  <input type="number" name="telefono" placeholder="Inserisci il numero di telefono" required/><br><br>
						  
						  <input type="submit" value="Aggiungi" class="btn btn-primary"/><br><br>
						</form>
						
						<form action="../Cliente/HomepageCliente.jsp" method="post">
						  <input type="submit" value="Annulla" class="btn btn-primary"/>	
						</form>
						
					</div>
	
					
				</div>
				
				<div align="center"><font size="4" color="red"></font></div>
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
	
	<!--      includo tutti script di sotto -->
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>
	
	</html>
<%} else {
	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}%>