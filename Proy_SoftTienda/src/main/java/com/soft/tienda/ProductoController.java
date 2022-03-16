package com.soft.tienda;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soft.tienda.DAO.ProductosDAO;
import com.soft.tienda.DTO.ProductoDTO;

@RestController
public class ProductoController {
	
	@RequestMapping("/registrarProducto")
	public void registrarProducto(ProductoDTO productoDto) {
		ProductosDAO producDao = new ProductosDAO();
		producDao.registrarProducto(productoDto);
	}
	
	@RequestMapping("/consultarProducto")
	public ArrayList<ProductoDTO> consultarProducto(long codigo){
		ProductosDAO producDao = new ProductosDAO();
		return producDao.consultarProducto(codigo);
	}
	
	@RequestMapping("/listarProducto")
	public ArrayList<ProductoDTO> listaDeProductos() {
		ProductosDAO producDao = new ProductosDAO();
		return producDao.listaDeProductos();
	}
		
	@RequestMapping("/eliminarProducto")
	public void eliminarUProducto(long codigo) {
		ProductosDAO producDao = new ProductosDAO();
		producDao.eliminarProducto(codigo);
	}
	
	
	@RequestMapping("/editarProducto")
	public void editarProducto(ProductoDTO ProductoDto){
		ProductosDAO producDao = new ProductosDAO();
		producDao.editarProducto(ProductoDto);
	}
}