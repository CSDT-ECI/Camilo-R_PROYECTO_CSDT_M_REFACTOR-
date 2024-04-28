package com.soft.tienda.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import com.soft.tienda.DAO.UsuarioDAO;
import com.soft.tienda.dto.DetallesVentaDTO;
//import com.soft.tienda.DTO.UsuarioDTO;
import com.soft.tienda.entities.Ventas;


@RestController
public class VentaController {

	@RequestMapping("/obtenerConsecutivo")
	public long consecutivoFactura() {
//		VentasDAO ventaDao = new VentasDAO();
//		return ventaDao.consecutivoFactura();
		return 0l;
	}
	
	
	@RequestMapping("/registrarVenta")
	public void registrarVenta(Ventas venta) {
//		VentasDAO ventaDao = new VentasDAO();
//		ventaDao.registrarVenta(venta);
	}


	@RequestMapping("/registrarDetalleVenta")
	public void registrarDetalleVenta(DetallesVentaDTO detalleVenta) {
//		VentasDAO ventaDao = new VentasDAO();
//		ventaDao.registrarDetalleVenta(detalleVenta);
	}
}
