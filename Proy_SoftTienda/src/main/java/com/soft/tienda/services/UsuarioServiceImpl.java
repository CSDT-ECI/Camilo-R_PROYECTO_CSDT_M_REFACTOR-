package com.soft.tienda.services;

import com.soft.tienda.entities.Usuario;
import com.soft.tienda.exceptions.UsuarioException;
import com.soft.tienda.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author Ivan Camilo Rincon Saavedra
 * @version 1.0
 * @since 3/18/2024
 */
@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Usuario> consultarUsuarios() {
        return userRepository.findAll();
    }

    @Override
    public Usuario consultarUsuarioPorCorreoElectronico(String correo) throws UsuarioException{
        return Optional.ofNullable(userRepository.obtenerUsuarioPorCorreo(correo))
                .orElseThrow(() -> new UsuarioException("No existe un usuario registrado con el correo ".concat(correo)));
    }


}
