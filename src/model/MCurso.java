package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MCurso {

	private final Connection conexion;
	
	public MCurso(Connection conexion){
		this.conexion = conexion;
	}

	/**
	 * Registra curso en base de datos.
	 * @param curso
	 * @param anioinicio
	 * @param aniofin
	 */
	public void registraCurso(String curso, String anioinicio, String aniofinal) {

		String insertCurso = "INSERT INTO bgacademy.curso (curso, anioinicio, aniofinal) VALUES (?,?,?);";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertCurso);
			 		 
			 	 sentencia.setString(1, curso);
				 sentencia.setString(2, anioinicio);
				 sentencia.setString(3, aniofinal);
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
	}

}
