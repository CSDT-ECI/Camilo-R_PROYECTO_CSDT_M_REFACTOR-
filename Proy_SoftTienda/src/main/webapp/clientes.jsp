<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Clientes</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	var clientes = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listarClientes",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.cedulaCliente;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.direccionCliente;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.emailCliente;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.nombreCliente;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.telefonoCliente;
				var columna6 = document.createElement("td");
				columna6.innerHTML = "<a href = 'clienteEditar.jsp?cedula="+item.cedulaCliente+"'>Editar</a>";
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<a href = '' onclick = 'eliminarCliente("+item.cedulaCliente+")'>Eliminar</a>";				
				
				lista.appendChild(tr);
				tr.appendChild(columna1);
				tr.appendChild(columna2);
				tr.appendChild(columna3);
				tr.appendChild(columna4);
				tr.appendChild(columna5);
				tr.appendChild(columna6);
				tr.appendChild(columna7);
			});
		}
	})
	
	function eliminarCliente(cedula){
		var eliminar = $.ajax({
			type: "GET", 
			url: "http://localhost:8080/eliminarCliente?cedula="+cedula,
			sucess: function(data){
				alert("El cliente ha sido eliminado");
			}
			
			
		})
	};
</script>
</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Clientes</h1>
	</div>
	<div class="form-group text-center">
		<a href="clienteAgregar.jsp">
			<button type="button" class="btn btn-outline-primary"">Agregar Cliente</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
		<a href="clienteBuscar.jsp">
			<button type="button" class="btn btn-outline-primary"">Buscar Cliente</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
<table class="table"  border = "1px">
  <thead class="table-light">
	<tr>
				<th>Cédula</th>
				<th>Dirección</th>
				<th>Email</th>
				<th>Nombre</th>
				<th>Teléfono</th>
				<th>Editar</th>
				<th>Eliminar</th>
					
	</tr>		
  </thead>
  <tbody id = "myTable">
  
  </tbody>
</table>
</div>

</body>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 
	<table border = "1">
		<thead>
			<tr>
				<th>Cedula</th>
				<th>Correo</th>
				<th>Nombre</th>
				<th>Contraseña</th>
				<th>Usuario</th>
				<th>Eliminar</th>
				<th>Editar</th>
					
			</tr>
		</thead>
		<tbody id = "myTable">
		
		</tbody>
		
	</table>
	
	 
	
</body>
</html>

-->