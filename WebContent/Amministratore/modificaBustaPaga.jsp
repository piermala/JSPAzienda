<%@page import="model.BustaPaga"%>
<%@page import="model.ClienteBean"%>
 <%@ page import="servizi.Servizi" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    
     <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	 <jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<% if (admin.isValid()) {

	Servizi s = new Servizi();
	
	long id = Long.parseLong(request.getParameter("id_bustaPaga"));	
	BustaPaga busta = s.leggiBustaPagaDaId(id);
	
		
%>	

	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Modifica Busta Paga</a></li>	
				</ul>
				
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
			
			
			<div class="box-content" align="center">
							<font size="4" color="red"></font>
								<form class="form-horizontal" action="doModificaBustaPaga.jsp"
									method="post">
									
									<div class="form-group">
										<label>Importo</label><br><input type="text" name="importo" value=<%=busta.getImporto()%>><br> 
										<label>Data</label><br><input type="text" name="data" value=<%=busta.getData()%> ><br> 
										<br><input type="hidden" value=<%=busta.getId_bustaPaga()%> name="id_bustapaga" ><br> 
										<input type="submit" class="btn btn-primary" value="Modifica"><br>
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