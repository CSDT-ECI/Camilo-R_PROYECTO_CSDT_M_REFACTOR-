package com.soft.tienda;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import com.soft.tienda.DAO.UsuarioDAO;
import com.soft.tienda.DAO.VentasDAO;
import com.soft.tienda.DTO.DetallesVentaDTO;
//import com.soft.tienda.DTO.UsuarioDTO;
import com.soft.tienda.DTO.Ventas;


@RestController
public class VentaController {
	
	@RequestMapping("/obtenerConsecutivo")
	public long consecutivoFactura() {
		VentasDAO ventaDao = new VentasDAO();
		return ventaDao.consecutivoFactura();
	}
	
	
	@RequestMapping("/registrarVenta")
	public void registrarVenta(Ventas venta) {
		VentasDAO ventaDao = new VentasDAO();
		ventaDao.registrarVenta(venta);
	}


	@RequestMapping("/registrarDetalleVenta")
	public void registrarDetalleVenta(DetallesVentaDTO detalleVenta) {
		VentasDAO ventaDao = new VentasDAO();
		ventaDao.registrarDetalleVenta(detalleVenta);
	}
}
