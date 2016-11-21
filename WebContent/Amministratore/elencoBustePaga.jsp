<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="servizi.Servizi" %>
    <%@ page import="model.BustaPaga" %>
    <%@ page import="java.util.List" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
	<script type="text/javascript" src="edit.js"></script> 
	
	<style>
		.messageConfirmed {
			font-family: Verdana;
			size: 24px;
		}
	</style>   
    
<% if (admin.isValid()) {	

	Servizi serv = new Servizi();
	
	List<BustaPaga> bustePaga = serv.leggiTutteBustePaga();
	
	session.setAttribute("bustePaga", bustePaga);
	
	%>
	
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Elenco buste paga</a></li>	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
			
		<div class="box-content">
			<div align="center">
				<font size="4" color="red" class="messageConfirmed"><%=message.getMessage()%></font>
			</div>
		</div>

		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div>

				<table border="3" class="table table-striped table-bordered bootstrap-datatable datatable responsive">
					<thead>
						<tr>
							<th>N.</th>
							<th>Nome</th>
							<th>Cognome</th>
							<th>Posizione</th>
							<th>Importo</th>
							<th>Data</th>
							<th>Comandi</th>
						</tr>
					</thead>


					<tbody>

						<c:set var="i" value="1" scope="page" />

						<c:forEach items="${bustePaga}" var="bp">

							<tr>
								<td><c:out value="${i}" /></td>
								<td><c:out value="${bp.dipendente.nome}" /></td>
								<td><c:out value="${bp.dipendente.cognome}" /></td>
								<td><c:out value="${bp.dipendente.posizione}" /></td>
								<td><c:out value="${bp.importo}" /></td>
								<td><c:out value="${bp.data}" /></td>
								
								<td>
									<form id="formModifiche" method="post" action="modificaBustaPaga.jsp"> 
										<input type="hidden" value="${bp.id_bustaPaga}" name="id_bustaPaga"/> 
										<button type="submit" id="editBustaPaga" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-white"> Edit </i></button>
									</form> 
									
									<form id="formElimina" method="post" action="doEliminaBustaPaga.jsp"> 
										<input type="hidden" value="${bp.id_bustaPaga}" name="id_bustaPaga"/> 
										<button type="submit" id="deleteBustaPaga" class="btn btn-danger" onclick="confirmDeleteBustaPaga()"><i class="glyphicon glyphicon-trash icon-white"> Delete </i></button>
									</form> 
								</td>
							</tr>

							<c:set var="i" value="${i+1}" scope="page" />

						</c:forEach>

					</tbody>

				</table>

			</div>

			<div align="center">
				<font size="4" color="red"></font>
			</div>
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

<% } else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}
%>

