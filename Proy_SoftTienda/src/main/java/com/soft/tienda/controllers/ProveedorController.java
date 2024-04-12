package com.soft.tienda.controllers;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soft.tienda.deprecated.ProveedorDAO;
import com.soft.tienda.dto.ProveedorDTO;

@RestController
public class ProveedorController {
	
	@RequestMapping("/registrarProveedor")
	public void registrarProveedor(ProveedorDTO proveedorDto) {
		ProveedorDAO ProvDao = new ProveedorDAO();
		ProvDao.registrarProveedor(proveedorDto);
	}
	
	@RequestMapping("/consultarProveedor")
	public ArrayList<ProveedorDTO> consultarProveedor(long nit){
		ProveedorDAO ProvDao = new ProveedorDAO();
		return ProvDao.consultarProveedor(nit);
	}
	
	@RequestMapping("/listarProveedor")
	public ArrayList<ProveedorDTO> listaDeProveedores() {
		ProveedorDAO ProvDao = new ProveedorDAO();
		return ProvDao.listaDeProveedores();
	}
		
	@RequestMapping("/eliminarProveedor")
	public void eliminarProveedor(long nit) {
		ProveedorDAO ProvDao = new ProveedorDAO();
		ProvDao.eliminarProveedor(nit);
	}
	
	
	@RequestMapping("/editarProveedor")
	public void editarProveedor(ProveedorDTO proveedorDto){
		ProveedorDAO ProvDao = new ProveedorDAO();
		ProvDao.editarProveedor(proveedorDto);
	}
}

