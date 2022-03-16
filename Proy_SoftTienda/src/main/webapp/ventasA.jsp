<%@page import="com.soft.tienda.DAO.Conexion"%>
<%@ page import = "java.sql.*" %>
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

let cantidadFilas = 1;
$(document).ready(function(){
	
	$('#dataParent').submit(function(event) { 
		event.preventDefault()
		/*var serializeData = $(this).serialize()
		
		$.ajax({
			  type: "GET",
			  url: "http://localhost:8080/agregarVenta?"+serializeData,
			  success: function(data){
				  console.log(data)
				  //AQUI DEBO LIMPIAR EL FORMULARIO
					$('#dataParent')[0].reset()
			  }
			  
			});
		*/
		
		var codigoVenta = document.getElementById("consecutivo").value;
		var cedulaCliente = document.getElementById("cedulaCliente").value;
		var cedulaUsuario = document.getElementById("cedulaVendedor").value;
		var subTotal = document.getElementById("sumaSubTotal").value;
		var iva = document.getElementById("calculoIva").value;
		var total = document.getElementById("totalAPagar").value;
		
		
		
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/registrarVenta?codigo_venta="+codigoVenta+
					"&cedula_cliente="+cedulaCliente+
					"&cedula_usuario="+cedulaUsuario+
					"&total_venta="+subTotal+
					"&iva_venta="+iva+
					"&valor_venta="+total,
				success: function(data){
					//window.location.assign("http://localhost:8080/usuarios.jsp");
		}
		});
	});
	

	
	
	// ENVIO DE INFORMACION DETALLES VENTA
	/*
	$('#dataParent').submit(function(event) { 
		event.preventDefault()
		
		var cantidadproducto = document.getElementById("cantidad1").value;
		var codigoProducto = document.getElementById("cedulaCliente").value;
		var codigoVenta = document.getElementById("cedulaVendedor").value;
		var subTotal = document.getElementById("sumaSubTotal").value;
		var iva = document.getElementById("calculoIva").value;
		var total = document.getElementById("totalAPagar").value;
		
		
		
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/registrarVenta?codigo_venta="+codigoVenta+
					"&cedula_cliente="+cedulaCliente+
					"&cedula_usuario="+cedulaUsuario+
					"&total_venta="+subTotal+
					"&iva_venta="+iva+
					"&valor_venta="+total,
				success: function(data){
					//window.location.assign("http://localhost:8080/usuarios.jsp");
		}
		});
	});
	
	*/
	
	
	
	
	
	
	// --------CONSULTAR CLIENTE POR CEDULA
	$('#btnConsultarCedula').click(function() { 
		var cedula = document.getElementById("cedula").value;
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/consultarCliente?documento="+cedula,
			success: function(data){ 
				$.each(data, function(i, item){
					document.getElementById("nombreCliente").value = item.nombreCliente;
					document.getElementById("cedulaCliente").value = item.cedulaCliente;
				
			})
		}
		}); 
	});
	
	
	//-----CONSULTAR VENDEDOR POR CEDULA
	$('#btnConsultarVendedor').click(function() { 
		var cedula = document.getElementById("cedulaV").value;
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/consultarUsuario?documento="+cedula,
			success: function(data){ 
				$.each(data, function(i, item){
					document.getElementById("nombreVendedor").value = item.nombreUsuario;
					document.getElementById("cedulaVendedor").value = item.cedulaUsuario;
			})
		}
		}); 
	});
	
	
	function agregarListener (rowId){
		
		$('.btnConsultarProducto').click(function() {
			var codigo = document.getElementById("codigo"+rowId).value;
			var cantidadN = document.getElementById("cantidad"+rowId).value;
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/consultarProducto?codigo="+codigo,
				success: function(data){ 
					$.each(data, function(i, item){
						document.getElementById("codigo"+rowId).value = item.codigoProducto;
						document.getElementById("nombre"+rowId).value = item.nombreProducto;
						document.getElementById("precio"+rowId).value = item.precioVenta;
						document.getElementById("subtotal"+rowId).value = item.precioVenta*cantidadN;
						
						
				})
				
				var sumatoria = 0;
				$('.sumaSubtotal').each(function(){
							sumatoria+=Number($(this).val())
							
				}) 
					$('#sumaSubTotal').val(sumatoria)
					
					var iva = Number((sumatoria * 0.19).toFixed(2))
					$('#calculoIva').val(iva)
					
					
					var total = Number((sumatoria + iva).toFixed(2))
					$('#totalAPagar').val(total)
			}
			}); 
		});
	}
	
	
	// -----AGREGAR FILA DE PRODUCTOS
	$('#btnAgregarFila').click(function() { 
		cantidadFilas += 1;
		console.log(cantidadFilas);
		let newHtml = '<tr><td><input type= "text" name="cantidad'+cantidadFilas+'" id="cantidad'+cantidadFilas+'" value="1" size="5"></td><td> <input type= "text" name="codigo'+cantidadFilas+'" id="codigo'+cantidadFilas+'" size="5"><button type="button" class="btn-outline-info btnConsultarProducto">Consultar</button></td> <td><input type= "text" name="nombre'+cantidadFilas+'" id="nombre'+cantidadFilas+'" disabled></td><td><input type= "text" name="precio'+cantidadFilas+'" id="precio'+cantidadFilas+'" disabled></td><td><input type= "text" name="subtotal'+cantidadFilas+'" id="subtotal'+cantidadFilas+'" class="sumaSubtotal" disabled></td> </tr>'
		$( "#padreFilas" ).append(newHtml);
		
		agregarListener(cantidadFilas);
		
	});
	
	agregarListener(1);
	
	
	
	
	
});



// ESTO YA VA POR FUERA DEL LISTENER
//Llamada al consecutivo
$.ajax({
type: "GET",
url: "http://localhost:8080/obtenerConsecutivo",
success: function(data){ 
	document.getElementById("consecutivo").value = (data + 1);
}
});


</script>


<body>

<!-- TABLA DE PRODUCTOS AGREGADOS -->

<jsp:include page="iprincipal.jsp"></jsp:include><br>
	
	<div class="form-group text-center">
	<h1>Formato de Ventas</h1>
	</div><br>
					
					<div class="col-sm-8 text-center" style="margin-left:300px">
						<form class="card" id="dataParent">
							<div class="card-body text-center">
				<!-- CONSECUTIVO FACTURA -->					
								<div class="d-flex col-sm-2">
									<label>Factura</label> <input type= "text" name="consecutivo" id="consecutivo" size="10" disabled>
								</div>
								<br>
				<!-- CONSULTAR CLIENTE -->				
								<div class="d-flex col-sm-4">
									<label >Cédula:</label>
										<input type= "text" name="cedula" id="cedula" placeholder="Cédula del Cliente" > 
									<button type="button" id="btnConsultarCedula" class="btn-outline-info">Consultar</button>
									<label >________Cliente:</label> 
										<input type= "text" name="nombreCliente" id="nombreCliente" size="50" disabled>
									<label >Cédula:</label> 
										<input type= "text" name="cedulaCliente" id="cedulaCliente" size="15" disabled>
								</div>
				<!-- CONSULTAR VENDEDOR -->				
								<br>
								<div class="d-flex col-sm-4">
									<label >Cédula:</label>
										<input type= "text" name="cedulaV" id="cedulaV" placeholder="Cédula del Vendedor"> 
									<button type="button" id="btnConsultarVendedor" class="btn-outline-info">Consultar</button>
									<label >_____Vendedor:</label> 
										<input type= "text" name="nombreVendedor" id="nombreVendedor" size="50"  disabled>
										<label >Cédula:</label> 
										<input type= "text" name="cedulaVendedor" id="cedulaVendedor" size="15" disabled>
								</div>
				
				<!-- TABLA DE PRODUCTOS -->				
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Cantidad</th>
										<th>Código</th>
										<th>Descripción</th>
										<th>Precio Unitario</th>
										<th>SubTotal</th>
									</tr>
								</thead>
					<!-- CONSULTA DE PRODUCTOS -->	
									<tbody id="padreFilas">
										<tr>
											<td><input type= "text" name="cantidad1" id="cantidad1" value="1" size="5"></td>
											<td><input type= "text" name="codigo1" id="codigo1" size="5"><button type="button" class="btn-outline-info btnConsultarProducto">Consultar</button></td> 
											<td><input type= "text" name="nombre1" id="nombre1" disabled></td>
											<td><input type= "text" name="precio1" id="precio1" disabled></td>
											<td><input type= "text" name="subtotal1" id="subtotal1" class="sumaSubtotal" disabled ></td>
										</tr>	
									</tbody>
									
								</table>
								<button type="button" id="btnAgregarFila">Agregar Item</button>
							</div>
							
							<div class="card-footer">
								<div>
									<div>
										<br>
										<label>SubTotal________:</label>
										<input type="text" id="sumaSubTotal" name="sumaSubTotal" id="sumaSubTotal" disabled>
									</div>
									<br>
									<div>	
										<label>Iva______________:</label>
										<input type="text" id="calculoIva" name="calculoIva" id="calculoIva" disabled>
									</div>
									<br>
									<div>
										<label>TOTAL A PAGAR:</label>
										<input type="text" id="totalAPagar" name="totalAPagar" id="totalAPagar" disabled>
									</div>
									<br>
									<button type="submit" class="btn btn-success" >Generar Factura</button> <a href="ventasA.jsp"> <button type="button" class="btn btn-danger" >Limpiar</button> </a>
									<br>
									
								</div>
							</div>
						</form>
					</div>

</body>
</html>