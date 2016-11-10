<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="request"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
 

	<div class="ch-container">
		<div class="row">
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div align="center">
	
					<h1>Aggiungi dipendente</h1> 



				<form action="doAggiungiDipendente.jsp" method="post">
					Nome <input type="text" name="nome" /><br> 
					Cognome <input type="text" name="cognome" /><br> 
					Posizione <input type="text" name="posizione" /><br> 
					Stipendio <input type="text" name="stipendio" /><br> 
					Username <input	type="text" name="username" /><br> 
					Password <input type="password" name="password" /><br> 
					<input type="submit" value="Aggiungi" /><br>
				</form>

				<form action="HomepageAdmin.jsp" method="post">
					<input type="submit" value="annulla" /><br>
				</form>



			</div>
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Admin</a></li>
	
				</ul>
				<div align="center"><font size="4" color="red"></font></div>
			</div>
			
			<div class=" row">
	
				<!--       devo scrivere per ogni pagina   -->
	
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

