package com.soft.tienda.services;

import com.soft.tienda.entities.Usuario;

import java.util.List;

/**
 * Interfaz que representara la capa de servicio la cual permitira hacer los CRUD del servicio usuario
 */
public interface UsuarioService {

    List<Usuario> consultarUsuarios();

    Usuario consultarUsuarioPorCorreoElectronico(String correo);


}
