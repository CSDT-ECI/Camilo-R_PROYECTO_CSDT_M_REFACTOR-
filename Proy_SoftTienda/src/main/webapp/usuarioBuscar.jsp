<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<style type="text/css">
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
</style>


<title>Buscar Usuarios</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 

var cedula = "<%=request.getParameter("cedula") %>"
var usuario = $.ajax({
	type: "GET",
	url: "http://localhost:8080/consultarUsuario?documento="+cedula,
	success: function(data){ 
		$.each(data, function(i, item){
		document.getElementById("cedula").value = item.cedulaUsuario;
		document.getElementById("correo").value = item.emailUsuario;
		document.getElementById("nombre").value = item.nombreUsuario;
		document.getElementById("pass").value = item.password;
		document.getElementById("usuario").value = item.usuario;
	})
}
	
});
</script>
</head>
<body>
<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Buscar Usuario</h1>
	</div>
	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
		
					<form action = "" method = "get" onsubmit = "buscarUsuario()">
					<div class="form-group text-center">
					<label>Digite número de cédula:</label>
					<input type="number" name="cedula" id= "cedula"><br>
					</div>
					<br>
						<div class="form-group text-center">
						 	<button type="submit" class="btn btn-outline-primary"">Consultar Usuario</button>
						</div>
					<br>
					
					</form>
	
	
					<form action="" method="get" onsubmit = "editarUsuario()">

					<div class="mb-3 row" class="form-group text-center">
						<label class="col-sm-3 col-form-label">Nombre </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="nombreUsuario" id = "nombre" disabled>
						</div>
					</div>


					<div class="mb-3 row" class="form-group text-center">
						<label class="col-sm-3 col-form-label">Correo </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="emailUsuario" id = "correo" disabled>
						</div>
					</div>
					
					<div class="mb-3 row" class="form-group text-center">
						<label class="col-sm-3 col-form-label">Usuario </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="usuario" id = "usuario" disabled>
						</div>
					</div>
					
					<div class="mb-3 row" class="form-group text-center">
						<label class="col-sm-3 col-form-label">Contraseña </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="password" id = "pass" disabled>
						</div>
					</div>
					
					
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