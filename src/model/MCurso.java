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
		
		String selectAnios = "SELECT COUNT(*) AS contador FROM bgacademy.curso WHERE anioinicio = ? AND aniofinal = ? AND curso = ?";
		
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

	
	/**
	 * Recoge todas las fechas existentes en la BD.
	 * @return
	 */
	public String[][] devuelveFechas() {
		
		int cantidad = totalRegistros();
		String datos[][] = new String[cantidad][2];
		int i = 0;
		
		String selectFechas = "SELECT DISTINCT anioinicio, aniofinal FROM bgacademy.curso ORDER BY anioinicio;";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectFechas);
			 ResultSet rs = sentencia.executeQuery();
			 	            
	            while(rs.next()){
	                datos[i][0] = rs.getString("anioinicio");
	                datos[i][1] = rs.getString("aniofinal");  
	                i++;
	            }
	            	            
		 }catch(Exception e){
	    	 System.out.println(e);
	     }
       
		return datos;
		
	}
	
	
	/**
	 * Total de registros en BD.
	 * @return
	 */
	private int totalRegistros() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.curso;";
		int filas = 0;
		
		try{
			 PreparedStatement sentencia = conexion.prepareStatement(total);
			 ResultSet rs = sentencia.executeQuery();
			 
			 while(rs.next()){
				filas = rs.getInt("contador");
			 }

		}catch(Exception e){
			System.out.println(e);
		}
					 
		return filas;
		
	}

	
	/**
	 * Devuelve los cursos en los años correspondientes.
	 * @param anio1
	 * @param anio2
	 * @return
	 */
	public String[][] devuelveCursos(String anio1, String anio2) {
		
		int cantidad = totalRegistros();
		String datos[][] = new String[cantidad][3];
		int i = 0;
		
		String selectCurso = "SELECT curso, anioinicio, aniofinal FROM bgacademy.curso WHERE anioinicio = ? AND aniofinal = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectCurso);
			 sentencia.setString(1, anio1);
		     sentencia.setString(2, anio2);
			 
		     ResultSet rs = sentencia.executeQuery();
			 	            
	            while(rs.next()){
	                datos[i][0] = rs.getString("curso");
	                datos[i][1] = rs.getString("anioinicio");
	                datos[i][2] = rs.getString("aniofinal");
	                i++;
	            }
	            	            
		 }catch(Exception e){
	    	 System.out.println(e);
	     }
		
		return datos;
	}

	

}
