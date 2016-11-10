<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:include page="../charisma/headerHtml.jsp"></jsp:include>
	<jsp:include page="../charisma/navBar.jsp"></jsp:include>
	
  <form action="doRegistraAdmin.jsp" method="post">
    Nome <input type="text" name="nome"> <br>
  	Cognome <input type="text" name="cognome"> <br> 
  	Livello accesso <input type="text" name="livelloAccesso"> <br> 
  	Username <input type="text" name="username"> <br> 
  	Password <input type="password" name="password"> <br> <br> 
  	<input type="submit" value="Registra"/> <br>
  </form>
  
  <form action="HomepageAdmin.jsp" method="post">
    <input type="submit" value="Annulla"/>
  </form>

</body>
</html>