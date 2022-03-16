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
<title>Agregar Producto</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
	
	function registrarProducto(){
		var codigoProducto = document.getElementById("codigoProducto").value;
		var nombreProducto = document.getElementById("nombreProducto").value;
		var nitProveedor = document.getElementById("nitProveedor").value;
		var precioCompra = document.getElementById("precioCompra").value;
		var ivaCompra = document.getElementById("ivaCompra").value;
		var precioVenta = document.getElementById("precioVenta").value;
		
		var agregar = $.ajax({
			type: "GET",
			url: "http://localhost:8080/registrarProducto?codigoProducto="+codigoProducto+
					"&nombreProducto="+nombreProducto+
					"&nitProveedor="+nitProveedor+
					"&precioCompra="+precioCompra+
					"&ivaCompra="+ivaCompra+
					"&precioVenta="+precioVenta,
				success: function(data){
					window.location.assign("http://localhost:8080/productos.jsp");
		}
		});
	}

</script>

</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<div class="form-group text-center">
	<h1>Agregar Producto</h1>
	</div>
	<br>
	<br>
	<br>


	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
				<form action="" method="get" onsubmit="registrarProducto()">
			
				<div class="mb-3 row" class="form-group text-center">
				<label for="cedulaUsuario" class="col-sm-3 col-form-label">Código Producto</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" name="codigo_producto" id="codigoProducto">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
							<label for="pass" class="col-sm-3 col-form-label">Nombre Producto</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="nombre_producto" id="nombreProducto">
							</div>
							</div>

				
				<div class="mb-3 row" class="form-group text-center">
					<label for="emailUsuario" class="col-sm-3 col-form-label">NIT Proveedor</label>
					<div class="col-sm-8">
						<input type="number" class="form-control" name="nit_proveedor" id="nitProveedor">
					</div>
					</div>

				<div class="mb-3 row" class="form-group text-center">
								<label for="usuario" class="col-sm-3 col-form-label">Precio Compra</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="precio_compra" id="precioCompra">
								</div>
							</div>
							

					<div class="mb-3 row" class="form-group text-center">
						<label for="nombreUsuario" class="col-sm-3 col-form-label">IVA Compra</label>
						<div class="col-sm-8">
							<input type="number" class="form-control" name="iva_compra" id="ivaCompra">
						</div>
						</div>



							
							<div class="mb-3 row" class="form-group text-center">
								<label for="usuario" class="col-sm-3 col-form-label">Precio Venta</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="precio_venta" id="precioVenta">
								</div>
							</div>

							 <br>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-outline-primary"">Agregar Producto</button>
								</div>
							 <br>
								<div class="form-group text-center">
								<a href="productos.jsp">
									<button type="button" class="btn btn-outline-primary"">Volver a Producto</button>
								</a>
								</div>
						</form>
		</div>						
	</div>
</div>
</body>
</html>