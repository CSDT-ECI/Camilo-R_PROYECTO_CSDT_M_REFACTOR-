package com.soft.tienda.DAO;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.soft.tienda.DTO.ProductoDTO;

public class ProductosDAO {
	PreparedStatement preparedStatement;
	
	
	// Método Listar 
	public ArrayList<ProductoDTO> listaDeProductos(){
		ArrayList<ProductoDTO> miProducto = new ArrayList<ProductoDTO>();
		Conexion conexion = new Conexion();
		
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM productos");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ProductoDTO productoDto = new ProductoDTO();
				productoDto.setCodigoProducto(Long.parseLong(res.getString("codigo_producto")));
				productoDto.setNombreProducto(res.getString("nombre_producto"));
				productoDto.setNitProveedor(Long.parseLong(res.getString("nit_proveedor")));
				productoDto.setPrecioCompra(Double.parseDouble(res.getString("precio_compra")));
				productoDto.setIvaCompra(Double.parseDouble(res.getString("iva_compra")));
				productoDto.setPrecioVenta(Double.parseDouble(res.getString("precio_venta")));
				
				miProducto.add(productoDto);
				
				System.out.print(miProducto);
				}
				res.close();
				consulta.close();
				conexion.desconectar();
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se puedo consultar a la persona\n"+e);
			}
			return miProducto;
			}


	// Método Registrar Producto
	public void registrarProducto(ProductoDTO productoDto) {
		Conexion conexion = new Conexion();
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("INSERT INTO productos VALUES ('"+productoDto.getCodigoProducto()
															+"','"+productoDto.getNombreProducto()
															+"','"+productoDto.getNitProveedor()
															+"','"+productoDto.getPrecioCompra()
															+"','"+productoDto.getIvaCompra()
															+"','"+productoDto.getPrecioVenta()+"')");
			JOptionPane.showMessageDialog(null, "Se ha registrado Exitosamenteb el producto\n"+productoDto.getCodigoProducto(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			JOptionPane.showMessageDialog(null, "No se pudo registrar el producto\n" + productoDto.getCodigoProducto());
		}
	}

	// Método Consultar Producto
	public ArrayList<ProductoDTO> consultarProducto(long codigo){
		ArrayList<ProductoDTO> miProducto = new ArrayList<ProductoDTO>();
		Conexion conexion = new Conexion();
		try {
			PreparedStatement consulta = conexion.getConnection().prepareStatement("SELECT * FROM productos WHERE codigo_producto = ?");
			consulta.setLong(1, codigo);
			ResultSet rs =  consulta.executeQuery();
			
			if (rs.next()) {
				ProductoDTO productoDto = new ProductoDTO();
				productoDto.setCodigoProducto(Long.parseLong(rs.getString("codigo_producto")));
				productoDto.setNombreProducto(rs.getString("nombre_producto"));
				productoDto.setNitProveedor(Long.parseLong(rs.getString("nit_proveedor")));
				productoDto.setPrecioCompra(Double.parseDouble(rs.getString("precio_compra")));
				productoDto.setIvaCompra(Double.parseDouble(rs.getString("iva_compra")));
				productoDto.setPrecioVenta(Double.parseDouble(rs.getString("precio_venta")));
				
				miProducto.add(productoDto);
			}
			rs.close();
			consulta.close();
			conexion.desconectar();
		}catch(Exception e) {
		JOptionPane.showMessageDialog(null, "No se pudo encontrar el producto\n"+e);
		}
		return miProducto;
	}
	
	
	// Método Eliminar Producto
	public void eliminarProducto(long codigo) {
		Conexion conexion = new Conexion();
		try {
			String query = "DELETE FROM productos WHERE codigo_producto = ?";
			preparedStatement = conexion.getConnection().prepareStatement(query);
			preparedStatement.setLong(1, codigo);///revisar
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// Método Editar Producto
	public void editarProducto(ProductoDTO productoDto){
		Conexion conexion = new Conexion();
		
		try {
			Statement st = conexion.getConnection().createStatement();
			st.executeUpdate("UPDATE productos SET nombre_producto = '"+productoDto.getNombreProducto()
											+"', nit_proveedor ='"+productoDto.getNitProveedor()
											+"', precio_compra = '"+productoDto.getPrecioCompra()
											+"', iva_compra ='"+productoDto.getIvaCompra()
											+"', precio_venta = '"+productoDto.getPrecioVenta()
											+"' WHERE codigo_producto ="+productoDto.getCodigoProducto());
		
			JOptionPane.showMessageDialog(null, "Se ha editado Exitosamenteb el producto\n"+productoDto.getNombreProducto(), "Informacion", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conexion.desconectar();
			
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null, "No se pudo editar el producto\n"+e);
			}
	}
}
