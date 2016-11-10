<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>   <!-- PRENDIAMO COME ESEMPIO QUESTO! -->
<jsp:include page="../charisma/navBar.jsp"></jsp:include> 

	<h1>Just another Login page</h1><br>
	<form  action="doLogin.jsp" method="post">
	  Username <input type="text" name="username"/> <br>
	  Password  <input type="password" name="password"/> <br><br>
	  <input type="submit" value="Accedi"/>   <!-- deve essere di tipo submit -->
	</form>
	
	<jsp:include page="../charisma/footer.jsp"></jsp:include>
</body>
</html>

<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include> 