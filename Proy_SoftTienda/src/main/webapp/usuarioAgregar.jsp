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
<title>Agregar Usuario</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
	
	function agregarUsuario(){
		var cedula = document.getElementById("cedula").value;
		var correo = document.getElementById("correo").value;
		var nombre = document.getElementById("nombre").value;
		var password = document.getElementById("pass").value;
		var usuario = document.getElementById("usuario").value;
		
		var agregar = $.ajax({
			type: "GET",
			url: "http://localhost:8080/registrarUsuario?cedulaUsuario="+cedula+
					"&emailUsuario="+correo+
					"&nombreUsuario="+nombre+
					"&password="+password+
					"&usuario="+usuario,
				success: function(data){
					window.location.assign("http://localhost:8080/usuarios.jsp");
		}
		});
	}

</script>

</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<div class="form-group text-center">
	<h1>Agregar Usuario</h1>
	</div>
	<br>
	<br>
	<br>


	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
				<form action="" method="get" onsubmit="agregarUsuario()">
			
				<div class="mb-3 row" class="form-group text-center">
				<label for="cedulaUsuario" class="col-sm-3 col-form-label">Cédula</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" name="cedulaUsuario" id="cedula">
				</div>
				</div>

				
				<div class="mb-3 row" class="form-group text-center">
					<label for="emailUsuario" class="col-sm-3 col-form-label">Correo</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="emailUsuario" id="correo">
					</div>
					</div>


					<div class="mb-3 row" class="form-group text-center">
						<label for="nombreUsuario" class="col-sm-3 col-form-label">Nombre</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="nombreUsuario" id="nombre">
						</div>
						</div>


						<div class="mb-3 row" class="form-group text-center">
							<label for="pass" class="col-sm-3 col-form-label">Password</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="password" id="pass">
							</div>
							</div>

						
							<div class="mb-3 row" class="form-group text-center">
								<label for="usuario" class="col-sm-3 col-form-label">Usuario</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="usuario" id="usuario">
								</div>
							</div>

							 <br>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-outline-primary"">Agregar Usuario</button>
								</div>
							 <br>
								<div class="form-group text-center">
								<a href="usuarios.jsp">
									<button type="button" class="btn btn-outline-primary"">Volver a Usuarios</button>
								</a>
								</div>
						</form>
		</div>						
	</div>
</div>
</body>
</html>