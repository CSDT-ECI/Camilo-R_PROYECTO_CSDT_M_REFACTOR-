<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
</style>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Editar Cliente</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
	
		// Aquí traemos los datos de consultar clientes con la cedula
		var cedula = "<%=request.getParameter("cedula") %>"
		var cliente = $.ajax({
			type: "GET",
			url: "http://localhost:8080/consultarCliente?documento="+cedula,
			success: function(data){ 
				$.each(data, function(i, item){
				document.getElementById("cedula").value = item.cedulaCliente;
				document.getElementById("direccion").value = item.direccionCliente;
				document.getElementById("email").value = item.emailCliente;
				document.getElementById("nombre").value = item.nombreCliente;
				document.getElementById("telefono").value = item.telefonoCliente;
			})
		}
			
		});
		
		function editarCliente(){
			var cedula = document.getElementById("cedula").value;
			var direccion = document.getElementById("direccion").value;
			var email = document.getElementById("email").value;
			var nombre = document.getElementById("nombre").value;
			var telefono = document.getElementById("telefono").value;
			
			var editar = $.ajax({
				type: "GET",
				url: "http://localhost:8080/editarCliente?cedulaCliente="+cedula+
											"&direccionCliente="+direccion+
											"&emailCliente="+email+
											"&nombreCliente="+nombre+
											"&telefonoCliente="+telefono,
				success: function(data){
					window.location.replace("http://localhost:8080/clientes.jsp");
				}
		});
		}
</script>

</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<div class="form-group text-center">
	<h1>Editar Cliente</h1>
	</div>
	<br>
	<br>

	
	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
	
	
			<form action="" method="get" onsubmit = "editarCliente()">
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Cédula</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" name="cedulaCliente" id = "cedula" readonly disabled>
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Dirección</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="direccionCliente" id = "direccion">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Email</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"  name="emailCliente" id = "email">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Nombre</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"  name="nombreCliente" id = "nombre">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Teléfono</label>
				<div class="col-sm-8">
					<input type="number" class="form-control"  name="telefonoCliente" id = "telefono">
				</div>
				</div>
				
				<br>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-outline-primary"">Editar Cliente</button>
					</div>
				<br>
					<div class="form-group text-center">
					<a href="clientes.jsp">
						<button type="button" class="btn btn-outline-primary"">Volver a Clientes</button>
					</a>
					</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>