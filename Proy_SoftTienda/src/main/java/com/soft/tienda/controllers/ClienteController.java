package com.soft.tienda.controllers;

import com.soft.tienda.dto.ClienteDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;


@RestController
public class ClienteController {


    @RequestMapping("/registrarCliente")
    public void registrarCliente(ClienteDTO clienteDto) {
//		ClienteDAO clientDao = new ClienteDAO();
//		clientDao.registrarCliente(clienteDto);
    }

    @RequestMapping("/consultarCliente")
    public ArrayList<ClienteDTO> consultarCliente(long documento) {
//		ClienteDAO clientDao = new ClienteDAO();
        return new ArrayList<>();
    }

    @RequestMapping("/listarClientes")
    public ArrayList<ClienteDTO> listaDeClientes() {
        return new ArrayList<>();
    }

    @RequestMapping("/eliminarCliente")
    public void eliminarCliente(long cedula) {
//		clientDao.eliminarCliente(cedula);
    }


    @RequestMapping("/editarCliente")
    public void editarCliente(ClienteDTO clienteDto) {
//		ClienteDAO clientDao = new ClienteDAO();
//		clientDao.editarCliente(clienteDto);
    }


}
