package com.soft.tienda.controllers;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.soft.tienda.dto.UsuarioDTO;

@RestController
public class UsuarioController {
	
	@RequestMapping("/registrarUsuario")
	public void registrarUsuario(UsuarioDTO usuarioDto) {

	}
	
	@RequestMapping("/consultarUsuario")
	public ArrayList<UsuarioDTO> consultarUsuario(long documento){
		return new ArrayList<>();
	}
	
	@RequestMapping("/listarUsuarios")
	public ArrayList<UsuarioDTO> listaDeUsuarios() {
		return new ArrayList<>();
	}
		
	@RequestMapping("/eliminarUsuario")
	public void eliminarUsuario(long cedula) {

	}
	
	
	@RequestMapping("/editarUsuario")
	public void editarUsuario(UsuarioDTO usuarioDto){
	}
}
