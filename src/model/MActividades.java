package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;


public class MActividades {

	private final Connection conexion;
	
	public MActividades(Connection conexion){
		this.conexion = conexion;
	}
	
	/**
	 * Realiza el registro de una actividad (Tarea).
	 * @param tipo
	 * @param titulo
	 * @param detalles
	 * @param feclimite
	 * @param idcurso
	 */
	public void registraTarea(String tipo, String titulo, String detalles, Date feclimite, String idcurso) {
		
		String insertInci = "INSERT INTO bgacademy.actividades (tipo, titulo, detalles, feclimite, idcurso) VALUES (?,?,?,?,?);";
		
		java.sql.Date sqlDate = new java.sql.Date(feclimite.getTime());
		        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertInci);
			 
			 	 sentencia.setString(1, "T");
				 sentencia.setString(2, titulo);
				 sentencia.setString(3, detalles);
				 sentencia.setDate(4, sqlDate);
				 sentencia.setInt(5, Integer.valueOf(idcurso));
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }				
		
	}
	
}
