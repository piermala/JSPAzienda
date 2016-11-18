<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Voce"%>
<%@page import="model.Rubrica"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>
    
<%

if(dipendente.isValid()) {

	ServiziRubrica servRubrica = new ServiziRubrica();
	
	int id = servRubrica.leggiID(dipendente.getUsername());
	
	List<Voce> voci = servRubrica.getTutteLeVoci(id);
	
	session.setAttribute("voci", voci);

%>

	<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	

<!-- da qui -->
<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Dipendente</a></li>
					<li><a href="#">Lista Voci</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="../Dipendente/menuLateraleDipendente.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<div>
	
					<div id="elencoVoci">

					<table border="2">
						<thead>
							<tr>
								<td>N.</td>
								<td>Nome</td>
								<td>Cognome</td>
								<td>Telefono</td>
							</tr>
						</thead>


						

							<c:set var="i" value="1" scope="page" />

							<c:forEach items="${voci}" var="v">

								<tr>
									<td><c:out value="${i}" /></td>
 									<td><c:out value="${v.nome}" /></td> 
 									<td><c:out value="${v.cognome}" /></td> 
 									<td><c:out value="${v.telefono}" /></td> 
								</tr> 

								<c:set var="i" value="${i+1}" scope="page" />

							</c:forEach>

						

					</table>


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
</div>
	
	
	
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