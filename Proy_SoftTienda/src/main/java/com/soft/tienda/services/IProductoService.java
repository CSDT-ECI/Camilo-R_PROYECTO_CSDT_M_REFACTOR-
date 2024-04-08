package com.soft.tienda.services;


import com.soft.tienda.dto.response.RespuestaServicioDTO;
import com.soft.tienda.entities.Producto;

public interface IProductoService {

    RespuestaServicioDTO findAll();

    RespuestaServicioDTO findById(Long id);

    RespuestaServicioDTO addProduct(Producto producto);

    RespuestaServicioDTO deleteById(Long id);

    RespuestaServicioDTO updateProduct(Long id, Producto producto);
}
