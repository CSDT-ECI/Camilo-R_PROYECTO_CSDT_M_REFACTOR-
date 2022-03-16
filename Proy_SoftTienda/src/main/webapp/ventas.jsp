<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
			pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Ventas</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 

var cedula = "<%=request.getParameter("cedula") %>"
var cliente = $.ajax({
	type: "GET",
	url: "http://localhost:8080/consultarCliente?documento="+cedula,
	success: function(data){ 
		$.each(data, function(i, item){
		document.getElementById("cedula1").value = item.cedulaCliente;
		document.getElementById("nombre").value = item.nombreCliente;
		//document.getElementById("direccion").value = item.direccionCliente;
		//document.getElementById("email").value = item.emailCliente;
		//document.getElementById("telefono").value = item.telefonoCliente;
	})
}
	
});


var codigo = "<%=request.getParameter("codigo") %>"
var producto = $.ajax({
	type: "GET",
	url: "http://localhost:8080/consultarProducto?codigo="+codigo,
	success: function(data){ 
		$.each(data, function(i, item){
		document.getElementById("codigo1").value = item.codigoProducto;
		document.getElementById("nombreP").value = item.nombreProducto;
		//document.getElementById("nit").value = item.nitProveedor;
		//document.getElementById("compra").value = item.precioCompra;
		//document.getElementById("iva").value = item.ivaCompra;
		document.getElementById("precio").value = item.precioVenta;
	})
}
	
});


// Crear una función, guardar en variables los valores 


</script>

<body>
		<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Formato de Ventas</h1>
	</div>

<!-- TARJETA DE CARGA-->
	<div class= "d-flex" style="margin-left:200px">
		<div class="col-sm-3">
			<div class="card">
			
			
			<!-- FORMULARIO DE CARGA DE CLIENTE-->
				<form action="" method="get" onclick = ""> 
					<div class="card-body">
							<div class="form-group">
								
								<label>Datos del Cliente</label>
								<div class="col-sm-8 d-flex">
								<input type="text" name="cedula" id="cedula" class="form-control"  placeholder="Digite la cedula">  <input type="submit" value="Consultar" class="btn btn-outline-info">
								</div>
								
								<div class="col-sm-6">
								<label>Cédula</label>
								<input type="text" name="cedula1" id="cedula1" class="form-control" >
								</div>
								
								<div class="col-sm-12">
								<label>Nombre</label>
								<input type="text" name="nombre" id="nombre" class="form-control" >
								</div>
								
								<div class="col-sm-12">
								<label>Dirección</label>
								<input type="text" name="direccion" id="direccion" class="form-control" >
								</div>
								
								<div class="col-sm-8">
								<label>Teléfono</label>
								<input type="text" name="telefono" id="telefono" class="form-control" >
								</div>
								
								</div>
							</div>
							<div class="form-group text-center">
									<input type="submit" value= "Cargar Cliente" class="btn btn-outline-info">
								</div>
					</form>
					
				<br>
				<br>
					
		<!-- FORMULARIO DE CARGA DE PRODUCTO-->
				<form action="" method="get" onclick = ""> 
					<div class="card-body">
							<div class="form-group">
							
							<div class="form-group">
								<label>Cargar Productos</label>
							</div>
							<div class="col-sm-8 d-flex">
								<input type="text" name="codigo" id="codigo" class="form-control" placeholder="Digite el código">  <input type="submit" name="accion"  value="Buscar" class="btn btn-outline-info">
							</div>
								
								
							<div class="col-sm-6">
								<label>Código</label>
								<input type="text" name="codigo1" id="codigo1" class="form-control">
							</div>	
								
							<div class="col-sm-12">
								<label>Descripción</label>
								<input type="text" name="nombreP" id="nombreP" class="form-control">
							</div>
							
								<div class="col-sm-4">
								<label>Precio</label>
								<input type="text" name="precio" id="precio" class="form-control" placeholder="$">
								</div>
								
								<div class="col-sm-2">
								<label>Cantidad</label>
								<input type="number" name="cantidad" id="cantidad" class="form-control" value="1">
								</div>
							</div>
							</div>
								<div class="form-group text-center">
									<button type="submit"  name="accion" value= "Cargar Producto" class="btn btn-outline-info">Cargar Producto</button>
								</div>
								<br>
						</form>	
	 	</div>	
	</div>
	
		<!-- TABLA DE PRODUCTOS AGREGADOS -->
					
					<div class="col-sm-8">
						<div class="card">
							<div class="card-body">
							
								<div class="d-flex col-sm-2">
									<label>Factura</label> <input type= "text" name="consecutivo" id="consecutivo" size="10" disabled>
								</div>
								<br>
								<div class="d-flex col-sm-4">
									
									<label for="cargaNombleCliente">Cliente:</label> <input type= "text" name="cargaNombleCliente" id="cargaNombleCliente" size="70" disabled>
									<label for="cargaCedulaCliente">Cédula:</label><h5></h5>	<input type= "text" name="cargaCedulaCliente" id="cargaCedulaCliente"  disabled>
									
								</div>
								<div class="d-flex col-sm-4">
									<label>Dirección:</label> <input type= "text" name="cargaDirCliente" id="cargaDirCliente" size="70" disabled>
									<label>Teléfono:</label> <input type= "text" name="cargaTelCliente" id="cargaTelCliente"  disabled>
								</div>
								
							
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Item</th>
										<th>Código</th>
										<th>Descripción</th>
										<th>Cantidad</th>
										<th>Precio Unitario</th>
										<th>SubTotal</th>
										<th>Acciones</th>
									</tr>
								</thead>
									<tbody>
										<tr>
											<td></td>			
										
										
										
										</tr>
									</tbody>	
								</table>
							</div>
							
							<div class="card-footer">
								<div>
									<input type="submit" name="accion" value="Generar Factura" class="btn btn-success">
									<input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
								</div>
							</div>
						</div>
					</div>
	
	
</div>



		


</body>
</html>




<select name = "producto">
            <option value="producto1">Producto 1</option>
            <option value="producto2">Producto 2</option>
            <option value="producto3">Producto 3</option>
        </select>
        
        
        
        
        
        
        