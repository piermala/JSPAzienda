<%@page import="serviziRubrica.ServiziRubrica"%>
<%@page import="model.Voce"%>
<%@ page import="servizi.Servizi" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
    <jsp:useBean id="cliente" class="model.ClienteBean" scope="session"></jsp:useBean>
    
     <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	 <jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<% if (cliente.isValid()) {

	ServiziRubrica s = new ServiziRubrica();
	
	long id = Long.parseLong(request.getParameter("id_voce"));	
	Voce v = (Voce)s.cercaVoce(id);
		
%>	

	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Modifica Cliente</a></li>	
				</ul>
				
	
			<!-- left menu starts -->
			<jsp:include page="../Cliente/menuLateraleCliente.jsp"></jsp:include>
			<!-- left menu ends -->
			
			
			<div class="box-content" align="center">
							<font size="4" color="red"></font>
								<form class="form-horizontal" action="doModificaVoce.jsp"
									method="post">
									
									<div class="form-group">
										<label>Nome</label><br> <input type="text" name="nome" value=<%=v.getNome()%> ><br> 
										<label>Cognome</label><br><input type="text" name="cognome" value=<%=v.getCognome()%>><br> 
										<label>Telefono</label><br><input type="text" name="telefono" value=<%=v.getTelefono()%> ><br> 
										<br><input type="hidden" value=<%=v.getId_voce()%> name="id_voce" ><br> 
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