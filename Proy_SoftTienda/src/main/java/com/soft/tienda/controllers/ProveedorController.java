package com.soft.tienda.controllers;

import com.soft.tienda.dto.ProveedorDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class ProveedorController {

    @RequestMapping("/registrarProveedor")
    public void registrarProveedor(ProveedorDTO proveedorDto) {

    }

    @RequestMapping("/consultarProveedor")
    public ArrayList<ProveedorDTO> consultarProveedor(long nit) {
        return new ArrayList<>();
    }

    @RequestMapping("/listarProveedor")
    public ArrayList<ProveedorDTO> listaDeProveedores() {
        return new ArrayList<>();
    }

    @RequestMapping("/eliminarProveedor")
    public void eliminarProveedor(long nit) {
    }


    @RequestMapping("/editarProveedor")
    public void editarProveedor(ProveedorDTO proveedorDto) {
    }
}

