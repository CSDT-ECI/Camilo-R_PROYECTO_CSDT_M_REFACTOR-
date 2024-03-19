package com.soft.tienda.deprecated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import javax.swing.JOptionPane;

import com.soft.tienda.dto.DetallesVentaDTO;
//import com.soft.tienda.DTO.UsuarioDTO;
import com.soft.tienda.entities.Ventas;

@Deprecated
public class VentasDAO {
	Connection connection;
	Conexion conexion = new Conexion();
	PreparedStatement ps;
	ResultSet rs;
	
	
	// Metodo para obtener el numero de factuta: codigo_venta
	public long consecutivoFactura() {
			long consecutivo = 0;
			String sql= "SELECT MAX(codigo_venta) FROM ventas";
			try {
				connection = conexion.getConnection();
				ps = connection.prepareStatement(sql);
	            rs = ps.executeQuery();
	            while (rs.next()) {
	                consecutivo = rs.getLong(1);
	                System.out.print(consecutivo);
			}} catch (SQLException e) {
				 System.out.print("No fue pósible traer el consecutivo de la factura");
			}
			return consecutivo;
		}
	

	
	// Método Registrar VENTA
		public void registrarVenta(Ventas venta) {
			Conexion conexion = new Conexion();
			try {
				Statement st = conexion.getConnection().createStatement();
				st.executeUpdate("INSERT INTO ventas VALUES ('"+venta.getCodigo_venta()
																+"', '"+venta.getCedula_cliente()
																+"', '"+venta.getCedula_usuario()
																+"','"+venta.getTotal_venta()
																+"','"+venta.getIva_venta()
																+"', '"+venta.getValor_venta()
																+"')");
				st.close();
				conexion.desconectar();
			}catch(Exception e) {
				System.out.println(e.getMessage());
				}
		}
		
		
		// Método Registrar Detalle Venta
		public void registrarDetalleVenta(DetallesVentaDTO detalle) {
			Conexion conexion = new Conexion();
			try {
				Statement st = conexion.getConnection().createStatement();
				st.executeUpdate("INSERT INTO detalle_ventas VALUES ('"+detalle.getCodigo_detalle_venta()
																+"', '"+detalle.getCantidad_producto()
																+"', '"+detalle.getCodigo_producto()
																+"','"+detalle.getCodigo_venta()
																+"','"+detalle.getValor_total()
																+"','"+detalle.getValor_iva()
																+"', '"+detalle.getValor_venta()
																+"')");
				st.close();
				conexion.desconectar();
			}catch(Exception e) {
				System.out.println(e.getMessage());
				}
		}


}
