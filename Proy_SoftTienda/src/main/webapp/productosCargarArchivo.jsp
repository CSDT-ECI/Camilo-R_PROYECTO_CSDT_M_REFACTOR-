<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<h1>Usuarios</h1>
	<a href = "productoAgregar.jsp">Agregar Producto</a>
	<a href = "productoConsultar.jsp">Buscar Producto</a>
	<form>
		<table>
			<tr>
				<td>Seleccione el Archivo a Cargar: </td> <td><input type="file" name="archivo"></td>
			</tr>
			<tr>
				<td colspan = "2" ><input type="submit" value="Cargar"> </td> <!-- Acá combino las dos columnas de arriba -->
			</tr>
		</table>
	</form>
</body>
</html>