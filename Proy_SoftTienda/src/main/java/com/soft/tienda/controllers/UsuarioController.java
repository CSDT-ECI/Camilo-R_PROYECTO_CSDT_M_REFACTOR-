package com.soft.tienda.controllers;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soft.tienda.deprecated.UsuarioDAO;
import com.soft.tienda.dto.UsuarioDTO;

@RestController
public class UsuarioController {
	
	@RequestMapping("/registrarUsuario")
	public void registrarUsuario(UsuarioDTO usuarioDto) {
		UsuarioDAO userDao = new UsuarioDAO();
		userDao.registrarUsuario(usuarioDto);
	}
	
	@RequestMapping("/consultarUsuario")
	public ArrayList<UsuarioDTO> consultarUsuario(long documento){
		UsuarioDAO userDao = new UsuarioDAO();
		return userDao.consultarUsuario(documento);
	}
	
	@RequestMapping("/listarUsuarios")
	public ArrayList<UsuarioDTO> listaDeUsuarios() {
		UsuarioDAO userDao = new UsuarioDAO();
		return userDao.listaDeUsuarios();
	}
		
	@RequestMapping("/eliminarUsuario")
	public void eliminarUsuario(long cedula) {
		UsuarioDAO userDao = new UsuarioDAO();
		userDao.eliminarUsuario(cedula);
	}
	
	
	@RequestMapping("/editarUsuario")
	public void editarUsuario(UsuarioDTO usuarioDto){
		UsuarioDAO userDao = new UsuarioDAO();
		userDao.editarUsuario(usuarioDto);
	}
}
