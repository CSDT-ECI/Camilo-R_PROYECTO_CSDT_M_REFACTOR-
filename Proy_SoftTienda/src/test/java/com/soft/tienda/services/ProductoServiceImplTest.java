package com.soft.tienda.services;

import com.soft.tienda.dto.response.RespuestaServicioDTO;
import com.soft.tienda.entities.Producto;
import com.soft.tienda.repositories.ProductoRepository;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;

import java.util.Date;
import java.util.Optional;

import static org.hamcrest.Matchers.any;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class ProductoServiceImplTest {

    @Mock
    private ProductoRepository productoRepository;
    @InjectMocks
    private ProductoServiceImpl productoService;

    @BeforeAll
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }


    @Test
    public void testUpdateProductSuccess() {
        Long id = Long.valueOf(1L);
        Producto producto = new Producto(id, "Producto de prueba", 3d, new Date());

        when(productoRepository.findById(id)).thenReturn(Optional.of(producto));
        when(productoRepository.save(producto)).thenReturn(producto);

        RespuestaServicioDTO respuesta = productoService.updateProduct(id, producto);

        assertEquals(HttpStatus.ACCEPTED.value(), respuesta.getStatus());
        assertEquals(producto, respuesta.getData().get(0));
    }

    @Test
    public void testUpdateProductFailure() {
        Long id = Long.valueOf(1L);
        Producto producto = new Producto(id, "Producto de prueba", 3d, new Date());
        when(productoRepository.findById(id)).thenReturn(Optional.empty());

        RespuestaServicioDTO respuesta = productoService.updateProduct(id, producto);

        assertEquals(HttpStatus.NOT_FOUND.value(), respuesta.getStatus());
        assertTrue(respuesta.getData().isEmpty());

    }
}