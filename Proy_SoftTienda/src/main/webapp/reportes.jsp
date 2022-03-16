<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>
</head>
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
</style>

<body>

	<jsp:include page="iprincipal.jsp"></jsp:include><br>

	<div class="form-group text-center">
		<h1>Reportes</h1>
	</div>
	<br>
	<br>
	<div class="form-group text-center">
		<a href="reporteListaUsuarios.jsp">
			<button type="button" class="btn btn-outline-primary"">Lista de Usuarios</button>
		</a>
	</div>	
	<br>
	<div class="form-group text-center">
		<a href="reporteListaClientes.jsp">
			<button type="button" class="btn btn-outline-primary"">Lista de Clientes</button>
		</a>
	</div>
	<br>
	<br>
	
	<div class="form-group text-center">
	<h4>Consultar Ventas por Cliente</h4>
	</div>
	<!-- Formulario de Consulta de la cedula del cliente a buscar -->
	<form action = "reporteVentasXCliente.jsp" method = "get">
		<div class="form-group text-center">
			<label>Cédula del Cliente:</label><br>
				<input type="number" name="cedula" id= "cedula"><br>
		</div>
		<br>
		<div class="form-group text-center">
			<button type="submit" class="btn btn-outline-primary"">Ver facturas</button>
		</div>
		<br>
		</form>	
	
	</div>
</body>
</html>

