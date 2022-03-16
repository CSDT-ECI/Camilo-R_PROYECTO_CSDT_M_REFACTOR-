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
<title>Editar Producto</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
	
		// Aquí traemos los datos de consultar productos con el codigo
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
		
		function editarProducto(){
			var codigo = document.getElementById("codigo").value;
			var nombre = document.getElementById("nombre").value;
			var nit = document.getElementById("nit").value;
			var compra = document.getElementById("compra").value;
			var iva = document.getElementById("iva").value;
			var venta = document.getElementById("venta").value;
			
			var editar = $.ajax({
				type: "GET",
				url: "http://localhost:8080/editarProducto?codigoProducto="+codigo+
													"&nombreProducto="+nombre+
													"&nitProveedor="+nit+
													"&precioCompra="+compra+
													"&ivaCompra="+iva+
													"&precioVenta="+venta,
				success: function(data){
					window.location.replace("http://localhost:8080/productos.jsp");
				}
		});
		}
</script>

</head>
<body>
	<jsp:include page="iprincipal.jsp"></jsp:include><br>
	<div class="form-group text-center">
	<h1>Editar Producto</h1>
	</div>
	<br>
	<br>

	
	<div class="container mt-8 col-lg-4">
		<div class="card col-sm-15">
			<div class="card-body">
	
	
			<form action="" method="get" onsubmit = "editarProducto()">
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Código Producto</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" name="codigo" id = "codigo" readonly disabled>
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Nombre Producto</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="nombre" id="nombre">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Nit Proveedor</label>
				<div class="col-sm-8">
					<input type="number" class="form-control"  name="nit" id="nit">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Precio Compra</label>
				<div class="col-sm-8">
					<input type="number" class="form-control"  name="precio" id="compra">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Iva Compra</label>
				<div class="col-sm-8">
					<input type="number" class="form-control"  name="iva" id="iva">
				</div>
				</div>
				
				<div class="mb-3 row" class="form-group text-center">
				<label class="col-sm-3 col-form-label">Precio Venta</label>
				<div class="col-sm-8">
					<input type="number" class="form-control"  name="venta" id="venta">
				</div>
				</div>
				
				
				
				<br>
					<div class="form-group text-center">
						<button type="submit" class="btn btn-outline-primary">Editar Producto</button>
					</div>
				<br>
					<div class="form-group text-center">
					<a href="productos.jsp">
						<button type="button" class="btn btn-outline-primary">Volver a Productos</button>
					</a>
					</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>