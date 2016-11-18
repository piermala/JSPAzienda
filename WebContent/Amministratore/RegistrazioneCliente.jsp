<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session" />
    <jsp:setProperty property="*" name="admin"/>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<%if (admin.isValid()) {%>
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Admin</a></li>
	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="./menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div align="center">


				<h1>Registra nuovo cliente</h1> <br>
				<form action="doRegistrazioneCliente.jsp" method="post">
					Nome <input type="text" name="nome" /><br> 
					Cognome <input type="text" name="cognome" /><br> 
					Partita IVA <input type="text" name="pIVA" /><br> 
					Ragione Sociale <input type="text" name="ragioneSociale" /><br> 
					Username <input type="text" name="username" /><br> 
					Password <input type="password" name="password" /><br>
					<input type="submit" value="registra">
				</form>

				<form action="HomepageAdmin.jsp" method="post">
					<input type="submit" value="annulla" /><br>
				</form>



			</div>
				
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
	
</body>
</html>

<%} else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
}	
%>
}


