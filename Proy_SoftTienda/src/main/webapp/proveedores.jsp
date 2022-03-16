<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Proveedores</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	var proveedores = $.ajax({
		type: "GET",
		url: "http://localhost:8080/listarProveedor",
		success: function(data){
			$.each(data, function(i, item){
				lista = document.getElementById("myTable");
				var tr = document.createElement("tr");
				var columna1 = document.createElement("td");
				columna1.innerHTML = item.nitProveedor;
				var columna2 = document.createElement("td");
				columna2.innerHTML = item.ciudadProveedor;
				var columna3 = document.createElement("td");
				columna3.innerHTML = item.direccionProvedor;
				var columna4 = document.createElement("td");
				columna4.innerHTML = item.nombreProveedor;
				var columna5 = document.createElement("td");
				columna5.innerHTML = item.telefonoProveedor;
				var columna6 = document.createElement("td");
				columna6.innerHTML = "<a href = 'proveedorEditar.jsp?nit="+item.nitProveedor+"'>Editar</a>";
				var columna7 = document.createElement("td");
				columna7.innerHTML = "<a href = '' onclick = 'eliminarProveedor("+item.nitProveedor+")'>Eliminar</a>";				
				
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
	
	function eliminarProveedor(nit){
		var eliminar = $.ajax({
			type: "GET", 
			url: "http://localhost:8080/eliminarProveedor?nit="+nit,
			sucess: function(data){
				alert("El Proveedor ha sido eliminado");
			}
			
			
		})
	};
</script>
</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Proveedores</h1>
	</div>
	<div class="form-group text-center">
		<a href="proveedorAgregar.jsp">
			<button type="button" class="btn btn-outline-primary"">Agregar Proveedor</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
		<a href="proveedorBuscar.jsp">
			<button type="button" class="btn btn-outline-primary"">Buscar Proveedor</button>
		</a>
	</div>
	<br>
	<div class="form-group text-center">
<table class="table"  border = "1px">
  <thead class="table-light">
	<tr>
				<th>NIT</th>
				<th>Ciudad</th>
				<th>Dirección</th>
				<th>Nombre</th>
				<th>Teléfono</th>
				<th>Eliminar</th>
				<th>Editar</th>
					
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
				<th>NIT</th>
				<th>Ciudad</th>
				<th>Direccion</th>
				<th>Nombre</th>
				<th>Telefono</th>
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