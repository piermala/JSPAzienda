<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <jsp:useBean id="admin" class="model.AdminBean"	scope="session"></jsp:useBean>
    
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
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					<h1 align="center">Welcome ${admin.nome} ${admin.cognome}</h1>
					<br>
					<h4 align="center"> ${admin.username}</h4>	
					
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
	
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>


<%} else { 
  session.invalidate();
  response.sendRedirect("../login/login.jsp");
}%>
  
  