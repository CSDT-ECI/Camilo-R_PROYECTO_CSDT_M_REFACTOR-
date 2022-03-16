<%@page import="com.soft.tienda.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes: Venta por Cliente</title>
</head>
<body>


<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Reporte</h1>
	<h3>Lista de Ventas por Cliente</h3>
	</div>
	<br>
	<br>
<%
	long cedula = Long.parseLong(request.getParameter("cedula"));
	Conexion conexion = new Conexion();	

	PreparedStatement ps = conexion.getConnection().prepareStatement("SELECT * FROM ventas WHERE cedula_cliente = "+cedula);
	ResultSet result = ps.executeQuery();
%>

<div class="form-group text-center">
<table class="table"  border = "1px">
  <thead class="table-light">
	<tr>
				<th>Número de Factura</th>
				<th>Cédula Cliente</th>
				<th>Cajero</th>
				<th>SubTotal</th>
				<th>Iva</th>
		 		<th>Total</th>
		
					
	</tr>
  </thead>
  <tbody id = "myTable">
  
  </tbody>
  
  <%
		while(result.next()){		
		%>
		<tr>
			<td><%= result.getLong("codigo_venta") %>
			<td><%= result.getLong("cedula_cliente") %>
			<td><%= result.getLong("cedula_usuario") %>
			<td><%= result.getDouble("total_venta") %>
			<td><%= result.getDouble("iva_venta") %>
			<td><%= result.getDouble("valor_venta") %>
			
		</tr>
		<%} %>
</table>
</div>

<br>
		<div class="form-group text-center">
			<a href="reportes.jsp">
				<button type="button" class="btn btn-outline-primary"">Volver a Reportes</button>
			</a>
		</div>





</body>
</html>