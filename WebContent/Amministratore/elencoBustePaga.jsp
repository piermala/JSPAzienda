<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="servizi.Servizi" %>
    <%@ page import="model.BustaPaga" %>
    <%@ page import="java.util.List" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="admin" class="model.AdminBean" scope="session"></jsp:useBean>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
    

<% if (admin.isValid()) {	

	Servizi serv = new Servizi();
	
	List<BustaPaga> bustePaga = serv.leggiTutteBustePaga();
	
	session.setAttribute("bustePaga", bustePaga);
	
	%>
	
	<!-- DA QUI!!! -->
	<div class="ch-container">
		<div class="row">
		
				<ul class="breadcrumb">
					<li><a href="HomepageAdmin.jsp">Home</a></li>
					<li><a href="#">Elenco buste paga</a></li>	
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
							<td>N.</td>
							<td>Nome</td>
							<td>Cognome</td>
							<td>Posizione</td>
							<td>Importo</td>
							<td>Data</td>
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

