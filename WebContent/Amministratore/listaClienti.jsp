<%@page import="servizi.Servizi"%>
<%@page import="model.ClienteBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
   
	<script type="text/javascript" src="editCliente.js"></script>
	
<% if (admin.isValid()) {%>
	
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Lista Clienti</a></li>	
				</ul>
	
			<!-- left menu starts -->
			<jsp:include page="menuLateraleAdmin.jsp"></jsp:include>
			<!-- left menu ends -->
	
			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
			<div>
			
				<%=message.getMessage()%><br/><br/>

				<table border="2">
					<thead>
						<tr>
							<th>Num.</th>
							<th>Nome</th>
							<th>Cognome</th>
							<th>Partita IVA</th>
							<th>Ragione sociale</th>
							<th>Username</th>
						<tr>
					</thead>

					<tbody>

						<%
							Servizi serv = new Servizi();

								List<ClienteBean> clienti = serv.getTuttiClienti();

								session.setAttribute("clienti", clienti);
						%>

						<c:set var="i" value="1" scope="page" />

						<c:forEach items="${clienti}" var="c">

							<tr>
								<td><c:out value="${i}" /></td>
								<td><c:out value="${c.nome}" /></td>
								<td><c:out value="${c.cognome}" /></td>
								<td><c:out value="${c.pIVA}" /></td>
								<td><c:out value="${c.ragioneSociale}" /></td>
								<td><c:out value="${c.username}" /></td>
								<td>
								<form id="formModifiche" method="post"> 
									<input type="hidden" value="${c.idUtente}" name="idCliente"/> 
									<button type="button" id="editCliente" type="button" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-white" onclick="confirmEditCliente()"> Edit </i></button>
									<button type="button" id="deleteCliente" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-trash icon-white" onclick="confirmDeleteCliente()"> Delete </i></button>
								</form>
								</td>
							</tr>

							<c:set var="i" value="${i+1}" scope="page" />
						</c:forEach>

					</tbody>


				</table>

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
	
	<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include>
	

</body>
</html>


<% } else {

	session.invalidate();
	response.sendRedirect("../login/login.jsp");
	
}
%>

