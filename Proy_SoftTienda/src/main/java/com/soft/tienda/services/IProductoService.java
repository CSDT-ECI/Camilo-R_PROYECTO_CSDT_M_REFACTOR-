package com.soft.tienda.services;


import com.soft.tienda.dto.response.RespuestaServicioDTO;
import com.soft.tienda.entities.Producto;

public interface IProductoService {
    /**
     * Método para obtener todos los productos.
     * <p>
     * Este método se encarga de recuperar todos los productos disponibles en la base de datos
     * utilizando el repositorio de productos. Luego, construye y devuelve una respuesta de servicio
     * que contiene el estado HTTP OK, la descripción correspondiente y la lista de productos.
     *
     * @return RespuestaServicioDTO que contiene el estado HTTP, la descripción y la lista de productos.
     */
    RespuestaServicioDTO findAll();


    /**
     * Método para obtener un producto por su ID.
     * <p>
     * Este método intenta recuperar un producto de la base de datos utilizando su ID.
     * Si el producto se encuentra, se construye y devuelve una respuesta de servicio con el estado HTTP OK y el producto.
     * Si el producto no se encuentra, se construye y devuelve una respuesta de servicio con el estado HTTP NOT FOUND y una lista vacía.
     *
     * @param id El ID del producto a buscar.
     * @return RespuestaServicioDTO que contiene el estado HTTP, la descripción y el producto o una lista vacía.
     */
    RespuestaServicioDTO findById(Long id);


    /**
     * Método para agregar un nuevo producto.
     * <p>
     * Este método intenta guardar un nuevo producto en la base de datos.
     * Si el producto se guarda correctamente, se construye y devuelve una respuesta de servicio con el estado HTTP CREATED y el producto guardado.
     *
     * @param producto El producto a guardar.
     * @return RespuestaServicioDTO que contiene el estado HTTP, la descripción y el producto guardado.
     */
    RespuestaServicioDTO addProduct(Producto producto);


    /**
     * Método para eliminar un producto por su ID.
     * <p>
     * Este método intenta eliminar un producto de la base de datos utilizando su ID.
     * Si el producto se elimina correctamente, se construye y devuelve una respuesta de servicio con el estado HTTP OK.
     * Si el producto no se encuentra, se construye y devuelve una respuesta de servicio con el estado HTTP NOT FOUND.
     *
     * @param id El ID del producto a eliminar.
     * @return RespuestaServicioDTO que contiene el estado HTTP y la descripción.
     */
    RespuestaServicioDTO deleteById(Long id);

    /**
     * Método para actualizar un producto existente.
     * <p>
     * Este método intenta actualizar un producto en la base de datos utilizando su ID y los nuevos datos del producto.
     * Si el producto se actualiza correctamente, se construye y devuelve una respuesta de servicio con el estado HTTP OK y el producto actualizado.
     * Si el producto no se encuentra, se construye y devuelve una respuesta de servicio con el estado HTTP NOT FOUND.
     *
     * @param id       El ID del producto a actualizar.
     * @param producto Los nuevos datos del producto.
     * @return RespuestaServicioDTO que contiene el estado HTTP, la descripción y el producto actualizado o una lista vacía.
     */
    RespuestaServicioDTO updateProduct(Long id, Producto producto);
}
