package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Conexion {
	
	private Connection conexion;
	
	public Conexion(){
		conectar();
	}
	
	/**
	 * Conexión con la base de datos.
	 */
	private void conectar(){
		try {
			Class.forName("org.postgresql.Driver");
			String url = "XXX server_url XXX";
			Properties props = new Properties();
			props.setProperty("user", "XXXX");
			props.setProperty("password", "XXXX");
			try {
				conexion = DriverManager.getConnection(url, props);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Devuelve un objeto de tipo Connection para realizar la conexión en el controller.
	 * @return
	 */
	public Connection getConexion(){
	    return conexion;
	}
	
}
