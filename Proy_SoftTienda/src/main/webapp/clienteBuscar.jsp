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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Buscar Clientes</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 

var cedula = "<%=request.getParameter("cedula") %>"
var cliente = $.ajax({
	type: "GET",
	url: "http://localhost:8080/consultarCliente?documento="+cedula,
	success: function(data){ 
		$.each(data, function(i, item){
		document.getElementById("cedula").value = item.cedulaCliente;
		document.getElementById("nombre").value = item.nombreCliente;
		document.getElementById("direccion").value = item.direccionCliente;
		document.getElementById("email").value = item.emailCliente;
		document.getElementById("telefono").value = item.telefonoCliente;
	})
}
	
});
</script>
</head>
<body>
<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Buscar Cliente</h1>
	</div>
	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
		
					<form action = "" method = "get" onsubmit = "">
					<div class="form-group text-center">
					<label>Digite número de cédula:</label>
					<input type="number" name="cedula" id= "cedula"><br>
					</div>
					<br>
						<div class="form-group text-center">
						 	<button type="submit" class="btn btn-outline-primary"">Consultar Cliente</button>
						</div>
					<br>
					
					</form>
	
	
					<form action="" method="get" onsubmit = "">

					<div class="mb-3 row" class="form-group text-center">
					<label class="col-sm-3 col-form-label">Dirección</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="direccionCliente" id = "direccion" disabled>
					</div>
					</div>
					
					<div class="mb-3 row" class="form-group text-center">
					<label class="col-sm-3 col-form-label">Email</label>
					<div class="col-sm-8">
						<input type="text" class="form-control"  name="emailCliente" id = "email" disabled>
					</div>
					</div>
					
					<div class="mb-3 row" class="form-group text-center">
					<label class="col-sm-3 col-form-label">Nombre</label>
					<div class="col-sm-8">
						<input type="text" class="form-control"  name="nombreCliente" id = "nombre" disabled>
					</div>
					</div>
					
					<div class="mb-3 row" class="form-group text-center">
					<label class="col-sm-3 col-form-label">Teléfono</label>
					<div class="col-sm-8">
						<input type="number" class="form-control"  name="telefonoCliente" id = "telefono" disabled>
					</div>
					</div>
					
					
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