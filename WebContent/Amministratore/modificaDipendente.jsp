<%@page import="model.DipendenteBean"%>
 <%@ page import="servizi.Servizi" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
     <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	 <jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<% if (admin.isValid()) {

	Servizi s = new Servizi();
	
	long id = Long.parseLong(request.getParameter("idUtente"));	
	DipendenteBean d = (DipendenteBean)s.cercaUtenteConId(id);
	
		
%>	

	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Modifica Dipendente</a></li>	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
			
			
			<div class="box-content" align="center">
							<font size="4" color="red"></font>
								<form class="form-horizontal" action="doModificaDipendente.jsp"
									method="post">
									
									<div class="form-group">
										<label>Nome</label><br> <input type="text" name="nome1" value=<%=d.getNome()%> ><br> 
										<label>Cognome</label><br><input type="text" name="cognome1" value=<%=d.getCognome()%>><br> 
										<label>Posizione</label><br> <input type="text" name="posizione1" value=<%=d.getPosizione()%>><br> 
										<label>Stipendio</label><br><input type="text" name="stipendio1" value=<%=d.getStipendio()%> ><br> 
										<br><input type="hidden" value=<%=d.getIdUtente()%>	name="id_utente" ><br> 
										<input type="submit"
											class="btn btn-primary" value="Modifica"> <br>
									</div>
								</form>
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