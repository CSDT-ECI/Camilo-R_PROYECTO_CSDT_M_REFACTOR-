package com.soft.tienda.deprecated;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.soft.tienda.dto.ClienteDTO;

@Deprecated
public class ClienteDAO {
PreparedStatement preparedStatement;
	
	
	// Método Listar Clientes
	public ArrayList<ClienteDTO> listaDeClientes(){
		ArrayList<ClienteDTO> miCliente = new ArrayList<ClienteDTO>();
		Conexion conexion = new Conexion();
		
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM clientes");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ClienteDTO clienteDto = new ClienteDTO();
				clienteDto.setCedulaCliente(Long.parseLong(res.getString("cedula_cliente")));
				clienteDto.setDireccionCliente(res.getString("direccion_cliente"));
				clienteDto.setEmailCliente(res.getString("email_cliente"));
				clienteDto.setNombreCliente(res.getString("nombre_cliente"));
				clienteDto.setTelefonoCliente(res.getString("telefono_cliente"));
				
				miCliente.add(clienteDto);
				}
				res.close();
				consulta.close();
				conexion.desconectar();
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se puedo consultar al cliente\n"+e);
			}
			return miCliente;
			}


	// Método Registrar Cliente
	public void registrarCliente(ClienteDTO clienteDto) {
		Conexion conexion = new Conexion();
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("INSERT INTO clientes VALUES ('"+clienteDto.getCedulaCliente()+"', '"+clienteDto.getDireccionCliente()+"', '"+clienteDto.getEmailCliente()+"','"+clienteDto.getNombreCliente()+"', '"+clienteDto.getTelefonoCliente()+"')");
			JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamenteb el cliente\n"+clienteDto.getNombreCliente(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null, "No se pudo registrar el cliente\n" + clienteDto.getNombreCliente());
		}
	}

	// Método Consultar Cliente
	public ArrayList<ClienteDTO> consultarCliente(long documento){
		ArrayList<ClienteDTO> miCliente = new ArrayList<ClienteDTO>();
		Conexion conexion = new Conexion();
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM clientes WHERE cedula_cliente = ?");
			consulta.setLong(1, documento);
			ResultSet rs =  consulta.executeQuery();
			
			if (rs.next()) {
				ClienteDTO clienteDto = new ClienteDTO();
				clienteDto.setCedulaCliente(Long.parseLong(rs.getString("cedula_cliente")));
				clienteDto.setDireccionCliente(rs.getString("direccion_cliente"));
				clienteDto.setEmailCliente(rs.getString("email_cliente"));
				clienteDto.setNombreCliente(rs.getString("nombre_cliente"));
				clienteDto.setTelefonoCliente(rs.getString("telefono_cliente"));
				
				miCliente.add(clienteDto);
			}
			rs.close();
			consulta.close();
			conexion.desconectar();
		}catch(Exception e) {
		JOptionPane.showMessageDialog(null, "No se pudo encontrar el cliente\n"+e);
		}
		return miCliente;
	}
	
	
	// Método Eliminar Cliente
	public void eliminarCliente(long cedula) {
		Conexion conexion = new Conexion();
		try {
			String query = "DELETE FROM clientes WHERE cedula_cliente = ?";
			preparedStatement = conexion.getConnection().prepareStatement(query);
			preparedStatement.setLong(1, cedula);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// Método Editar Cliente
	public void editarCliente(ClienteDTO clienteDto){
		Conexion conexion = new Conexion();
		
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("UPDATE clientes SET direccion_cliente ='"+clienteDto.getDireccionCliente()
											+"', email_cliente ='"+clienteDto.getEmailCliente()
											+"', nombre_cliente = '"+clienteDto.getNombreCliente()
											+"', telefono_cliente = '"+clienteDto.getTelefonoCliente()
											+"' WHERE cedula_cliente ="+clienteDto.getCedulaCliente());
			
			JOptionPane.showMessageDialog(null, "Se ha editado Exitosamenteb el cliente\n"+clienteDto.getNombreCliente(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
			
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se pudo editar el usuario\n"+e);
			}
	}
	

}
