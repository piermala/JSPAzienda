<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>
    <jsp:setProperty property="*" name="dipendente"/>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
   
 <%if(dipendente.isValid()) {%>  
 
<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Dipendente</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleDipendente.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					<h1 align="center">Welcome Employer</h1>
					<br>
					<h4 align="center">${dipendente.nome} ${dipendente.cognome} </h4>
	
					
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
	
	<!--      includo tutti script di sotto -->
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>
	
	</html>
	
<%} else {
	
	try {
		
	} catch (NullPointerException e){
		
	}
	session.invalidate();
	response.sendRedirect("../login/login.jsp");	
}%>