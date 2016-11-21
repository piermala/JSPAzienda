<%@page import="model.DipendenteBean"%>
 <%@ page import="servizi.Servizi" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="request"></jsp:useBean>
    <jsp:setProperty property="*" name="dipendente"/>
    
    
     <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	 <jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
<% if (admin.isValid()) {

		
%>	

	<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Elimina Dipendente</a></li>	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
			
			
			<div class="box-content" align="center">
							

		<div class=" row">

				<h2>Sei sicuro di voler eliminare questo dipendente?</h2>

				<form action="doEliminaDipendente.jsp" method="post">
					<button type="submit" class="btn btn-info" id="idUtente">Sì</button>
				</form> <br>

				<form action="listaDipendenti.jsp" method="post">
					<button type="submit" value="No" class="btn btn-info">No</button>
				</form>


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







<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<!-- <title>Elimina dipendente</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- 	<h2>Sei sicuro di voler eliminare questo dipendente?</h2> -->
	
<!-- 	<form action="doEliminaUtente.jsp" method="post"> -->
<!-- 		<button type="submit" class="btn btn-info">Sì</button>	 -->
<!-- 	</form> -->
	
<!-- 	<form action="listaDipendenti.jsp" method="post"> -->
<!-- 		<button type="submit" value="No" class="btn btn-info">No</button>	 -->
<!-- 	</form> -->

<!-- </body> -->
<!-- </html> -->