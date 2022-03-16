package com.soft.tienda.DAO;

import java.sql.*;

public class Conexion {
	
	
	static String bd = "tienda";
	static String login = "root";
	static String password = "";
	static String url = "jdbc:mysql://localhost:3306/"+bd;
	
	Connection connection = null;
	
	public Conexion(){
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//obtenemos la conexión
			connection = DriverManager.getConnection(url, login, password);
			
			if(connection!=null) {
				System.out.println("Conexión Exitosa a la Base de Datos "+bd+"\n");;
			}else {
				System.out.println("No se puedo conectar a la base de datos "+bd+"\n");
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch(ClassNotFoundException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
	}
}
	
	
	// Permite retornar la conexion.
	public Connection getConnection() {
		return connection;
	}

	public void desconectar() {
		connection = null;
	}
}