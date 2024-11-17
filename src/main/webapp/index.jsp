<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css" >
</head>
<body>


 <table border="1">
    
    
    

        <tr>
			<th>
			

	            <h2>INICIAR SESION</h2>
	            <form action="Login" method="post">
	            
	            <p>
	            	<label for= "user"></label>
	             
	                <input type="text" id="user" name="user"  placeholder="USUARIO">
	            
	           	</p>
	           	<p>
	           		<label for ="pass"></label>
	     
	                <input type="password" id="pass" name="pass"  placeholder="CONTRASEÑA">
	           	
	           	</p>
				
				<% if (request.getAttribute("errorMessage") != null) { %>
            		<p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        		<% } %>
        		<% if (request.getAttribute("successMessage") != null) { %>
            		<p style="color: green;"><%= request.getAttribute("successMessage") %></p>
        		<% } %>
	           	
	           	<p>
	           	
	                <button type="submit">Iniciar Sesión</button>
	           	
	           	</p>
	                
	            </form>
			
			</th>


            
        </tr>



    </table>
</body>
</html>