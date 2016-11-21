<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="message" class="utility.Message" scope="request"></jsp:useBean>
    
	<jsp:include page="../charisma/headerHtml.jsp"></jsp:include>   
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
				<input type="text" class="form-control" name="username" placeholder="Username" required>
				<input type="password" class="form-control" name="password" placeholder="Password" required/>
		</div>
		
		<br/><br/>
		
		<p class="center col-md-5">
		
			<input type="submit" class="btn btn-primary" value="Login">
			
		</p>
	</form><br><br>
	
	<h4 align="center"><font color="red"><%=message.getMessage()%></font></h4>
	
	
</body>
</html>

<jsp:include page="../charisma/scriptEnd.jsp"></jsp:include> 