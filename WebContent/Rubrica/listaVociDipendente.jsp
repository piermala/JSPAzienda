<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Voce"%>
<%@page import="model.Rubrica"%>
<%@page import="serviziRubrica.ServiziRubrica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="dipendente" class="model.DipendenteBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    <script type="text/javascript" src="edit.js"></script>
    
<%

if(dipendente.isValid()) {

	ServiziRubrica servRubrica = new ServiziRubrica();
	
	long id = servRubrica.leggiID(dipendente.getUsername());
	
	List<Voce> voci = servRubrica.getTutteLeVoci(id);
	
	session.setAttribute("voci", voci);

%>

	<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	


	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Lista Voci</a></li>
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="../Dipendente/menuLateraleDipendente.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<div>
	
					<div class="box-content">
					<div align="center">
						<font size="4" color="red" class="messageConfirmed"><%=message.getMessage()%></font>
					</div>
				</div>


				<table border="3" class="table table-striped table-bordered bootstrap-datatable datatable responsive">

						<thead>
							<tr>
								<th>N.</th>
								<th>Nome</th>
								<th>Cognome</th>
								<th>Telefono</th>
								<th>Comandi</th>
							</tr>
						</thead>

							<c:set var="i" value="1" scope="page" />

							<c:forEach items="${voci}" var="v">

								<tr>
									<td><c:out value="${i}" /></td>
 									<td><c:out value="${v.nome}" /></td> 
 									<td><c:out value="${v.cognome}" /></td> 
 									<td><c:out value="${v.telefono}" /></td> 
 									<td>
										<form id="formModifiche" method="post" action="modificaVoceDipendente.jsp"> 
											<input type="hidden" value="${v.id_voce}" name="id_voce"/> 
											<button type="submit" id="editVoce" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-white"> Edit </i></button>
										</form> 
										
										<form id="formElimina" method="post" action="doEliminaVoceDipendente.jsp"> 
											<input type="hidden" value="${v.id_voce}" name="id_voce"/> 
											<button type="submit" id="deleteVoce" class="btn btn-danger" onclick="confirmDeleteVoce()"><i class="glyphicon glyphicon-trash icon-white"> Delete </i></button>
										</form> 
									
									</td>
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