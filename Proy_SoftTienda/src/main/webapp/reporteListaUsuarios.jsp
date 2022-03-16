<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Reporte: Lista de Usuarios</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	var usuarios = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listarUsuarios",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.cedulaUsuario;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.emailUsuario;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.nombreUsuario;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.password;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.usuario;
				var columna6 = document.createElement("td");
			/*	columna6.innerHTML = "<a href = 'usuarioEditar.jsp?cedula="+item.cedulaUsuario+"'>Editar</a>";
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<a href = '' onclick = 'eliminarUsuario("+item.cedulaUsuario+")'>Eliminar</a>";	*/			
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
		/*		tr.appendChild(columna6);
				tr.appendChild(columna7); */
			});
		}
	})
	
	function eliminarUsuario(cedula){
		var eliminar = $.ajax({
			type: "GET", 
			url: "http://localhost:8080/eliminarUsuario?cedula="+cedula,
			sucess: function(data){
				alert("El usuario ha sido eliminado");
			}
			
			
		})
	};
</script>
</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Reporte</h1>
	<h3>Lista de Usuarios</h3>
	</div>
	
	<br>
	<div class="form-group text-center">
<table class="table"  border = "1px">
  <thead class="table-light">
	<tr>
				<th>Cédula</th>
				<th>Correo</th>
				<th>Nombre</th>
				<th>Contraseña</th>
				<th>Usuario</th>
		<!-- 	<th>Eliminar</th>
				<th>Editar</th>  -->
					
	</tr>		
  </thead>
  <tbody id = "myTable">
  
  </tbody>
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