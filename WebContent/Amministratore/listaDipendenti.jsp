<%@page import="model.DipendenteBean"%>
<%@page import="servizi.Servizi"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false"%>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
	<script type="text/javascript" src="editDipendente.js"></script>
	

<% if (admin.isValid()) { %>
    
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Elenco dipendenti</a></li>	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->

		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<div>

				<table border="2">
					<thead>
						<tr>
							<th>N.</th>
							<th>Nome</th>
							<th>Cognome</th>
							<th>Posizione</th>
							<th>Stipendio</th>
							<th>Username</th>
						</tr>
					</thead>

					<%
						Servizi serv = new Servizi();

						List<DipendenteBean> dipendenti = serv.getTuttiDipendenti();

						session.setAttribute("dipendenti", dipendenti);
					%>



					<tbody>

						<c:set var="i" value="1" scope="page" />

						<c:forEach items="${dipendenti}" var="d">

							<tr>
								<td class="center"><c:out value="${i}" /></td>
								<td class="center"><c:out value="${d.nome}" /></td>
								<td class="center"><c:out value="${d.cognome}" /></td>
								<td class="center"><c:out value="${d.posizione}" /></td>
								<td class="center"><c:out value="${d.stipendio}" /></td>
								<td class="center"><c:out value="${d.username}" /></td>
								<td>
								<form id="formModifiche" method="post"> 
									<input type="hidden" value="${d.idUtente}" name="id"/> 
									<button type="button" id="editDipendenti" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-white" onclick="confirmEditDipendente()"> Edit </i></button>
									<button type="button" id="deleteDipendenti" class="btn btn-danger"><i class="glyphicon glyphicon-trash icon-white" onclick="confirmDeleteDipendente()"> Delete </i></button>
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


