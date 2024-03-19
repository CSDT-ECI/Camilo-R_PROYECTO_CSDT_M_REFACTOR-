package com.soft.tienda.deprecated;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.soft.tienda.dto.UsuarioDTO;

@Deprecated
public class UsuarioDAO {
	PreparedStatement preparedStatement;
	
	
	// Método Listar Usuario
	public ArrayList<UsuarioDTO> listaDeUsuarios(){
		ArrayList<UsuarioDTO> miUsuario = new ArrayList<UsuarioDTO>();
		Conexion conexion = new Conexion();
		
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM usuarios");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				UsuarioDTO usuarioDto = new UsuarioDTO();
				usuarioDto.setCedulaUsuario(Long.parseLong(res.getString("cedula_usuario")));
				usuarioDto.setEmailUsuario(res.getString("email_usuario"));
				usuarioDto.setNombreUsuario(res.getString("nombre_usuario"));
				usuarioDto.setPassword(res.getString("password"));
				usuarioDto.setUsuario(res.getString("usuario"));
				
				miUsuario.add(usuarioDto);
				}
				res.close();
				consulta.close();
				conexion.desconectar();
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se puedo consultar a la persona\n"+e);
			}
			return miUsuario;
			}


	// Método Registrar Usuario
	public void registrarUsuario(UsuarioDTO usuarioDto) {
		Conexion conexion = new Conexion();
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("INSERT INTO usuarios VALUES ('"+usuarioDto.getCedulaUsuario()
															+"', '"+usuarioDto.getEmailUsuario()
															+"', '"+usuarioDto.getNombreUsuario()
															+"','"+usuarioDto.getPassword()
															+"', '"+usuarioDto.getUsuario()
															+"')");
			JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamenteb el usuario\n"+usuarioDto.getNombreUsuario(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null, "No se pudo registrar el usuario\n" + usuarioDto.getNombreUsuario());
		}
	}

	// Método Consultar Usuario
	public ArrayList<UsuarioDTO> consultarUsuario(long documento){
		ArrayList<UsuarioDTO> miUsuario = new ArrayList<UsuarioDTO>();
		Conexion conexion = new Conexion();
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = ?");
			consulta.setLong(1, documento);
			ResultSet rs =  consulta.executeQuery();
			
			if (rs.next()) {
				UsuarioDTO usuarioDto = new UsuarioDTO();
				usuarioDto.setCedulaUsuario(Long.parseLong(rs.getString("cedula_usuario")));
				usuarioDto.setEmailUsuario(rs.getString("email_usuario"));
				usuarioDto.setNombreUsuario(rs.getString("nombre_usuario"));
				usuarioDto.setPassword(rs.getString("password"));
				usuarioDto.setUsuario(rs.getString("usuario"));
				
				miUsuario.add(usuarioDto);
			}
			rs.close();
			consulta.close();
			conexion.desconectar();
		}catch(Exception e) {
		JOptionPane.showMessageDialog(null, "No se pudo encontrar el usuario\n"+e);
		}
		return miUsuario;
	}
	
	
	// Método Eliminar Usuario
	public void eliminarUsuario(long cedula) {
		Conexion conexion = new Conexion();
		try {
			String query = "DELETE FROM usuarios WHERE cedula_usuario = ?";
			preparedStatement = conexion.getConnection().prepareStatement(query);
			preparedStatement.setLong(1, cedula);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// Método Editar Usuario
	public void editarUsuario(UsuarioDTO usuarioDto){
		Conexion conexion = new Conexion();
		
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("UPDATE usuarios SET email_usuario ='"+usuarioDto.getEmailUsuario()
											+"', nombre_usuario ='"+usuarioDto.getNombreUsuario()
											+"', password = '"+usuarioDto.getPassword()
											+"', usuario = '"+usuarioDto.getUsuario()
											+"' WHERE cedula_usuario ="+usuarioDto.getCedulaUsuario());
			
			JOptionPane.showMessageDialog(null, "Se ha editado Exitosamenteb el usuario\n"+usuarioDto.getNombreUsuario(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
			
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se pudo editar el usuario\n"+e);
			}
	}
}
