package com.soft.tienda.DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.soft.tienda.DTO.ProveedorDTO;

public class ProveedorDAO {
	PreparedStatement preparedStatement;
	
	
	// Método Listar Proveedor
	public ArrayList<ProveedorDTO> listaDeProveedores(){
		ArrayList<ProveedorDTO> miProveedor = new ArrayList<ProveedorDTO>();
		Conexion conexion = new Conexion();
		
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM proveedores");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ProveedorDTO proveedorDto = new ProveedorDTO();
				proveedorDto.setNitProveedor(Long.parseLong(res.getString("nit_proveedor")));
				proveedorDto.setCiudadProveedor(res.getString("ciudad_proveedor"));
				proveedorDto.setDireccionProvedor(res.getString("direccion_proveedor"));
				proveedorDto.setNombreProveedor(res.getString("nombre_proveedor"));
				proveedorDto.setTelefonoProveedor(res.getString("telefono_proveedor"));
				
				miProveedor.add(proveedorDto);
				}
				res.close();
				consulta.close();
				conexion.desconectar();
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se puedo consultar el Proveedor\n"+e);
			}
			return miProveedor;
			}


	// Método Registrar Proveedor
	public void registrarProveedor(ProveedorDTO proveedorDto) {
		Conexion conexion = new Conexion();
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("INSERT INTO proveedores VALUES ('"+proveedorDto.getNitProveedor()+"', '"+proveedorDto.getCiudadProveedor()+"', '"+proveedorDto.getDireccionProvedor()+"','"+proveedorDto.getNombreProveedor()+"', '"+proveedorDto.getTelefonoProveedor()+"')");
			JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamenteb el Proveedor\n"+proveedorDto.getNombreProveedor(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null, "No se pudo registrar el Proveedor\n" + proveedorDto.getNitProveedor());
		}
	}

	// Método Consultar Proveedor
	public ArrayList<ProveedorDTO> consultarProveedor(long nit){
		ArrayList<ProveedorDTO> miUsuario = new ArrayList<ProveedorDTO>();
		Conexion conexion = new Conexion();
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM proveedores WHERE nit_proveedor = ?");
			consulta.setLong(1, nit);
			ResultSet rs =  consulta.executeQuery();
			
			if (rs.next()) {
				ProveedorDTO proveedorDto = new ProveedorDTO();
				proveedorDto.setNitProveedor(Long.parseLong(rs.getString("nit_proveedor")));
				proveedorDto.setCiudadProveedor(rs.getString("ciudad_proveedor"));
				proveedorDto.setDireccionProvedor(rs.getString("direccion_proveedor"));
				proveedorDto.setNombreProveedor(rs.getString("nombre_proveedor"));
				proveedorDto.setTelefonoProveedor(rs.getString("telefono_proveedor"));
				
				miUsuario.add(proveedorDto);
			}
			rs.close();
			consulta.close();
			conexion.desconectar();
		}catch(Exception e) {
		JOptionPane.showMessageDialog(null, "No se pudo encontrar el Proveedor\n"+e);
		}
		return miUsuario;
	}
	
	
	// Método Eliminar Proveedor
	public void eliminarProveedor(long nit) {
		Conexion conexion = new Conexion();
		try {
			String query = "DELETE FROM proveedores WHERE nit_proveedor = ?";
			preparedStatement = conexion.getConnection().prepareStatement(query);
			preparedStatement.setLong(1, nit);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// Método Editar Proveedor
		public void editarProveedor(ProveedorDTO proveedorDto){
			Conexion conexion = new Conexion();
			
			try {
				Statement st = conexion.getConnection().createStatement();
				st.executeUpdate("UPDATE proveedores SET ciudad_proveedor ='"+proveedorDto.getCiudadProveedor()
												+"', direccion_proveedor ='"+proveedorDto.getDireccionProvedor()
												+"', nombre_proveedor = '"+proveedorDto.getNombreProveedor()
												+"', telefono_proveedor = '"+proveedorDto.getTelefonoProveedor()
												+"' WHERE nit_proveedor ="+proveedorDto.getNitProveedor());
				
				JOptionPane.showMessageDialog(null, "Se ha editado Exitosamenteb el Proveedor\n"+proveedorDto.getNombreProveedor(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
				st.close();
				conexion.desconectar();
				
				}catch(Exception e) {
					JOptionPane.showMessageDialog(null, "No se pudo editar el Proveedor\n"+e);
				}
		}

}
