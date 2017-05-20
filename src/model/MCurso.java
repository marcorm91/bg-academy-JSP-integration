package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	
	/**
	 * Comprueba la existencia de años registrados en la Base de Datos.
	 * @param anioinicio
	 * @param aniofin
	 * @return
	 */
	public boolean compruebaExistencia(String anioinicio, String aniofin, String curso) {
		
		String selectAnios = "SELECT COUNT(*) as contador FROM bgacademy.curso WHERE anioinicio = ? and aniofinal = ? and curso = ?";
		
		boolean existe = false;
		int contador = 0;
		    			        
        try{
        	
            PreparedStatement sentencia = conexion.prepareStatement(selectAnios);
            sentencia.setString(1, anioinicio);
            sentencia.setString(2, aniofin);
            sentencia.setString(3, curso);
            
            ResultSet rs = sentencia.executeQuery();
            
            while(rs.next()){
            	contador = rs.getInt("contador");
            }
            
            
        }catch(SQLException e){
            System.out.println(e);
        }
        
	        if(contador == 0){
	        	existe = false;
	        }else{
	        	existe = true;
	        }
	           
        return existe;
		
	}

}
