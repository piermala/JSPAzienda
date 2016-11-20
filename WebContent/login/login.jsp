<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
	<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>   <!-- PRENDIAMO COME ESEMPIO QUESTO! -->
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
	<div class="col-md-12 center login-header">
		<h1>Welcome to the login page</h1><br/><br/>
		<div id="messageError">
			<%=message.getMessage()%>
		</div>
	</div>
	
	<form action="doLogin.jsp" method="post">
		<div class="input-group input-group-lg">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span> 
				<input type="text" class="form-control" name="username" placeholder="Username">
				<input type="password" class="form-control" name="password" placeholder="Password"/>
		</div>
		
		<br/><br/>
		
		<p class="center col-md-5">
		
			<input type="submit" class="btn btn-primary" value="Login">
			
		</p>
	</form>
	
<!-- 	<div id="formLogin" align="center"> -->
<!-- 		<h1>Just another Login page</h1><br> -->
<!-- 		<form  action="doLogin.jsp" method="post"> -->
<!-- 		  Username <input type="text" name="username"/> <br><br> -->
<!-- 		  Password <input type="password" name="password"/> <br><br> -->
<!-- 		  <input type="submit" value="Accedi"/>    -->
<!-- 		</form> -->
<!-- 	</div> -->
	
	
</body>
</html>

<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include> 