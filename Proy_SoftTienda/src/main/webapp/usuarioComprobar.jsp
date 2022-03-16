<%@page import="com.soft.tienda.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<% 
	String usuario = request.getParameter("usuario");
	String password = request.getParameter("pass");
	String adminUser = "admininicial";
	String adminPass = "admin123456";
	if (usuario.equals(adminUser) && password.equals(adminPass)){
		Conexion conexion = new Conexion();
		PreparedStatement ps = conexion.getConnection().prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND password = ?");
		ps.setString(1, usuario);
		ps.setString(2, password);
		ResultSet result = ps.executeQuery();
		int i = 0;	
		while(result.next()){
			i++;
		}
		if (i == 1){
			response.sendRedirect("iprincipal.jsp");
		}
		}else{
			response.sendRedirect("index.html");
		}
		%>
</body>
</html>