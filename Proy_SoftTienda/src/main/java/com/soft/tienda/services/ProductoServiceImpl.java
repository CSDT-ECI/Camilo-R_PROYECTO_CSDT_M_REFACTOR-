package com.soft.tienda.services;

import com.soft.tienda.dto.response.RespuestaServicioDTO;
import com.soft.tienda.entities.Producto;
import com.soft.tienda.repositories.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

/**
 * @author Ivan Camilo Rincon Saavedra
 * @version 1.0
 * @since 4/7/2024
 */
@Service
public class ProductoServiceImpl implements IProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    @Override
    @Transactional(readOnly = true)
    public RespuestaServicioDTO findAll() {
        List<Producto> productos = productoRepository.findAll();
        return RespuestaServicioDTO.builder()
                .status(HttpStatus.OK.value())
                .descripcion(HttpStatus.OK.getReasonPhrase())
                .data(productos.stream().map(p -> (Object) p).collect(Collectors.toList()))
                .build();
    }



    @Override
    @Transactional(readOnly = true)
    public RespuestaServicioDTO findById(Long id) {
        RespuestaServicioDTO dto = RespuestaServicioDTO.builder()
                .status(HttpStatus.OK.value())
                .descripcion(HttpStatus.OK.getReasonPhrase())
                .build();
        try {
            Producto producto = productoRepository.findById(id)
                    .orElseThrow(() -> new NoSuchElementException("No se encontro el producto con id ".concat(id + "")));
            dto.setData(List.of(producto));
        } catch (NoSuchElementException e) {
            dto.setStatus(HttpStatus.NOT_FOUND.value());
            dto.setDescripcion(HttpStatus.NOT_FOUND.getReasonPhrase());
            dto.setData(Collections.emptyList());
        }
        return dto;
    }

    @Override
    @Transactional
    public RespuestaServicioDTO addProduct(Producto producto) {
        RespuestaServicioDTO dto = RespuestaServicioDTO.builder()
                .status(HttpStatus.CREATED.value())
                .descripcion(HttpStatus.CREATED.getReasonPhrase()).build();
        try {
            Producto response = productoRepository.save(producto);
            dto.setData(List.of(response));
        } catch (Exception e) {
            dto.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
            dto.setDescripcion(e.getMessage());
            dto.setData(Collections.emptyList());
        } finally {
            return dto;
        }

    }

    @Override
    @Transactional
    public RespuestaServicioDTO deleteById(Long id) {
        RespuestaServicioDTO dto = RespuestaServicioDTO.builder()
                .status(HttpStatus.ACCEPTED.value())
                .descripcion(HttpStatus.ACCEPTED.getReasonPhrase())
                .build();
        try {
            Producto producto = productoRepository.findById(id)
                    .orElseThrow(() -> new NoSuchElementException("Producto no encontrado"));
            productoRepository.deleteById(id);
            dto.setData(List.of(producto));
        } catch (NoSuchElementException e) {
            dto.setStatus(HttpStatus.NOT_FOUND.value());
            dto.setDescripcion(HttpStatus.NOT_FOUND.getReasonPhrase());
            dto.setData(Collections.emptyList());
        }
        return dto;
    }


    @Override
    public RespuestaServicioDTO updateProduct(Long id, Producto producto) {
        RespuestaServicioDTO dto = RespuestaServicioDTO.builder()
                .status(HttpStatus.ACCEPTED.value())
                .descripcion(HttpStatus.ACCEPTED.getReasonPhrase())
                .build();
        try {
            Producto productoExistente = productoRepository.findById(id)
                    .orElseThrow(() -> new NoSuchElementException("Producto no encontrado"));

            productoExistente.setNombre(producto.getNombre());
            productoExistente.setPrecio(producto.getPrecio());

            dto.setData(List.of(productoRepository.save(productoExistente)));
        } catch (NoSuchElementException e) {
            dto.setStatus(HttpStatus.NOT_FOUND.value());
            dto.setDescripcion(HttpStatus.NOT_FOUND.getReasonPhrase());
            dto.setData(Collections.emptyList());
        }
        return dto;
    }
}