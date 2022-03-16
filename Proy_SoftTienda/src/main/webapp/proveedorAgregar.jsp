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
<title>Agregar Proveedor</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
	
	function agregarProveedor(){
		var nit = document.getElementById("nit").value;
		var ciudad = document.getElementById("ciudad").value;
		var direccion = document.getElementById("direccion").value;
		var nombre = document.getElementById("nombre").value;
		var telefono = document.getElementById("telefono").value;
		
		var agregar = $.ajax({
			type: "GET",
			url: "http://localhost:8080/registrarProveedor?nitProveedor="+nit+
					"&ciudadProveedor="+ciudad+
					"&direccionProvedor="+direccion+
					"&nombreProveedor="+nombre+
					"&telefonoProveedor="+telefono,
				success: function(data){
					window.location.assign("http://localhost:8080/proveedores.jsp");
		}
		});
	}

</script>

</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<div class="form-group text-center">
	<h1>Agregar Proveedor</h1>
	</div>
	<br>
	<br>
	<br>


	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
				<form action="" method="get" onsubmit="agregarProveedor()">
			
				<div class="mb-3 row" class="form-group text-center">
				<label for="NITProveedor" class="col-sm-3 col-form-label">NIT</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" name="NITProveedor" id="nit">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
					<label for="ciudadProveedor" class="col-sm-3 col-form-label">Ciudad</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="ciudadProveedor" id="ciudad">
					</div>
					</div>

				
				<div class="mb-3 row" class="form-group text-center">
					<label for="direccionProveedor" class="col-sm-3 col-form-label">Dirección</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="direccionProveedor" id="direccion">
					</div>
					</div>


					<div class="mb-3 row" class="form-group text-center">
						<label for="nombreProveedor" class="col-sm-3 col-form-label">Nombre</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="nombreProveedor" id="nombre">
						</div>
						</div>


						<div class="mb-3 row" class="form-group text-center">
							<label for="telefonoProveedor" class="col-sm-3 col-form-label">Teléfono</label>
							<div class="col-sm-8">
								<input type="number" class="form-control" name="telefonoProveedor" id="telefono">
							</div>
							</div>


							 <br>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-outline-primary"">Agregar Proveedor</button>
								</div>
							 <br>
								<div class="form-group text-center">
								<a href="proveedores.jsp">
									<button type="button" class="btn btn-outline-primary"">Volver a Proveedores</button>
								</a>
								</div>
						</form>
		</div>						
	</div>
</div>
</body>
</html>