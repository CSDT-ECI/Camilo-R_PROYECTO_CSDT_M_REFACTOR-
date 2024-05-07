package com.soft.tienda.services;

import com.soft.tienda.entities.Usuario;
import com.soft.tienda.exceptions.UsuarioException;
import com.soft.tienda.repositories.UserRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class UsuarioServiceImplTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UsuarioServiceImpl usuarioService;

    @Test
    void consultarUsuarioPorCorreoElectronicoLanzaExcepcionPorNoExistirCorreo() {
        String correoDummy = "correo@falso.com";

        when(userRepository.obtenerUsuarioPorCorreo(anyString())).thenReturn(null);


        Assertions.assertThrows(UsuarioException.class, () -> usuarioService.consultarUsuarioPorCorreoElectronico(correoDummy));
    }

    @Test
    void consultarUsuarioPorCorreoElectronicoRetornaUsuario() {
        String correoDummy = "correo@falso.com";
        Usuario usuarioDummy = Mockito.mock(Usuario.class);

        when(userRepository.obtenerUsuarioPorCorreo(anyString())).thenReturn(usuarioDummy);

        Usuario usuarioObtenido = usuarioService.consultarUsuarioPorCorreoElectronico(correoDummy);

        assertEquals(usuarioDummy, usuarioObtenido);
    }
}