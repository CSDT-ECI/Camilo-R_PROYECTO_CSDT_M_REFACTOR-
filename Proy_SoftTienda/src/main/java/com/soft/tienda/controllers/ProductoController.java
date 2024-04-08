package com.soft.tienda.controllers;


import com.soft.tienda.dto.response.RespuestaServicioDTO;
import com.soft.tienda.entities.Producto;
import com.soft.tienda.services.IProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProductoController {
    @Autowired
    private IProductoService productoService;

    @PostMapping("/crear")
    public ResponseEntity<RespuestaServicioDTO> agregarProducto(@RequestBody Producto producto) {
        RespuestaServicioDTO dto = productoService.addProduct(producto);

        return ResponseEntity.status(dto.getStatus())
                .contentType(MediaType.APPLICATION_JSON)
                .body(dto);
    }


    @GetMapping("/listar/{id}")
    public ResponseEntity<RespuestaServicioDTO> obtenerProductos(@PathVariable("id") Long id) {
        RespuestaServicioDTO dto = productoService.findById(id);

        return ResponseEntity.status(dto.getStatus())
                .contentType(MediaType.APPLICATION_JSON)
                .body(dto);
    }

    @GetMapping("/listar")
    public ResponseEntity<RespuestaServicioDTO> obtenerProductos() {
        RespuestaServicioDTO dto = productoService.findAll();

        return ResponseEntity.status(dto.getStatus())
                .contentType(MediaType.APPLICATION_JSON)
                .body(dto);
    }

    @PostMapping("/editar/{id}")
    public ResponseEntity<RespuestaServicioDTO> editarProducto(@RequestBody Producto producto, @PathVariable("id") Long id) {
        RespuestaServicioDTO dto = productoService.addProduct(producto);

        return ResponseEntity.status(dto.getStatus())
                .contentType(MediaType.APPLICATION_JSON)
                .body(dto);
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<RespuestaServicioDTO> eliminarProducto(@PathVariable("id") Long id) {
        RespuestaServicioDTO dto = productoService.deleteById(id);

        return ResponseEntity.status(dto.getStatus())
                .contentType(MediaType.APPLICATION_JSON)
                .body(dto);
    }
}