package com.soft.tienda.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soft.tienda.deprecated.ClienteDAO;
import com.soft.tienda.dto.ClienteDTO;



@RestController
public class ClienteController {

	
	@RequestMapping("/registrarCliente")
	public void registrarCliente(ClienteDTO clienteDto) {
		ClienteDAO clientDao = new ClienteDAO();
		clientDao.registrarCliente(clienteDto);
	}
	
	@RequestMapping("/consultarCliente")
	public ArrayList<ClienteDTO> consultarCliente(long documento){
		ClienteDAO clientDao = new ClienteDAO();
		return clientDao.consultarCliente(documento);
	}
	
	@RequestMapping("/listarClientes")
	public ArrayList<ClienteDTO> listaDeClientes() {
		ClienteDAO clientDao = new ClienteDAO();
		return clientDao.listaDeClientes();
	}
		
	@RequestMapping("/eliminarCliente")
	public void eliminarCliente(long cedula) {
		ClienteDAO clientDao = new ClienteDAO();
		clientDao.eliminarCliente(cedula);
	}
	
	
	@RequestMapping("/editarCliente")
	public void editarCliente(ClienteDTO clienteDto){
		ClienteDAO clientDao = new ClienteDAO();
		clientDao.editarCliente(clienteDto);
	}
	

}
