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
<title>Buscar Producto</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 

var codigo = "<%=request.getParameter("codigo") %>"
var producto = $.ajax({
	type: "GET",
	url: "http://localhost:8080/consultarProducto?codigo="+codigo,
	success: function(data){ 
		$.each(data, function(i, item){
		document.getElementById("codigo").value = item.codigoProducto;
		document.getElementById("nombre").value = item.nombreProducto;
		document.getElementById("nit").value = item.nitProveedor;
		document.getElementById("compra").value = item.precioCompra;
		document.getElementById("iva").value = item.ivaCompra;
		document.getElementById("venta").value = item.precioVenta;
	})
}
	
});
</script>
</head>
<body>
<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Buscar Producto</h1>
	</div>
	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
		
					<form action = "" method = "get" onsubmit = "">
					<div class="form-group text-center">
					<label>Digite código producto:</label>
					<input type="number" name="codigo" id= "codigo"><br>
					</div>
					<br>
						<div class="form-group text-center">
						 	<button type="submit" class="btn btn-outline-primary"">Consultar Producto</button>
						</div>
					<br>
					
					</form>
					
					<form method = "get">
					
					<div class="mb-3 row" class="form-group text-center">
							<label for="pass" class="col-sm-3 col-form-label">Nombre Producto</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="nombre_producto" id="nombre" disabled>
							</div>
							</div>
					
					
					<div class="mb-3 row" class="form-group text-center">
					<label for="emailUsuario" class="col-sm-3 col-form-label">NIT Proveedor</label>
					<div class="col-sm-8">
						<input type="number" class="form-control" name="nit_proveedor" id="nit" disabled>
					</div>
					</div>

					<div class="mb-3 row" class="form-group text-center">
								<label for="usuario" class="col-sm-3 col-form-label">Precio Compra</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="precio_compra" id="compra" disabled>
								</div>
							</div>
							

					<div class="mb-3 row" class="form-group text-center">
						<label for="nombreUsuario" class="col-sm-3 col-form-label">IVA Compra</label>
						<div class="col-sm-8">
							<input type="number" class="form-control" name="iva_compra" id="iva" disabled>
						</div>
						</div>



							
							<div class="mb-3 row" class="form-group text-center">
								<label for="usuario" class="col-sm-3 col-form-label">Precio Venta</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="precio_venta" id="venta" disabled>
								</div>
							</div>

	
	
					
							<br>
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