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
	 * Registra un curso en base de datos.
	 * @param curso Nombre del curso.
	 * @param anioinicio Año de inicio.
	 * @param aniofin Año de fin.
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
	 * @param anioinicio Año de inicio.
	 * @param aniofin Año de fin.
	 * @return Retorna un booleano el cual devuelve true si existe, y si no devolverá false.
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
	 * @return Devuelve en una matriz todas las fechas existentes en la tabla.
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
	 * @return Retorna un entero, el cual nos dice el número de registros que hay en la tabla curso.
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
	 * @param anio1 Año de inicio.
	 * @param anio2 Año de fin.
	 * @return Devuelve una matriz con todos los cursos pertenecientes a ese año de promoción.
	 */
	public String[][] devuelveCursos(String anio1, String anio2) {
		
		int cantidad = totalRegistros();
		String datos[][] = new String[cantidad][4];
		int i = 0;
		
		String selectCurso = "SELECT curso, anioinicio, aniofinal, idcurso FROM bgacademy.curso WHERE anioinicio = ? AND aniofinal = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectCurso);
			 sentencia.setString(1, anio1);
		     sentencia.setString(2, anio2);
			 
		     ResultSet rs = sentencia.executeQuery();
			 	            
	            while(rs.next()){
	                datos[i][0] = rs.getString("curso");
	                datos[i][1] = rs.getString("anioinicio");
	                datos[i][2] = rs.getString("aniofinal");
	                datos[i][3] = rs.getString("idcurso");
	                i++;
	            }
	            	            
		 }catch(Exception e){
	    	 System.out.println(e);
	     }
		
		return datos;
	}

	
	/**
	 * Devuelve un listado de cursos registrados en la academia.
	 * @return Devuelve una matriz con todos los cursos registrados en la academia.
	 */
	public Object[][] devuelveCursos() {
		
		int cantidad = totalCursos();
		Object datos[][] = new Object[cantidad][5];
		int i = 0;
		
		String selectCursos = "SELECT idcurso, curso, anioinicio, aniofinal, (SELECT COUNT(idcurso) FROM bgacademy.alumno WHERE bgacademy.curso.idcurso = bgacademy.alumno.idcurso) AS cont FROM bgacademy.curso;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectCursos);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("idcurso");
			 datos[i][1] = rs.getString("curso");
			 datos[i][2] = rs.getString("anioinicio");
			 datos[i][3] = rs.getString("aniofinal");
			 datos[i][4] = rs.getString("cont");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
		
	}
	
	
	/***
	 * Devuelve el total de cursos registrados en la BD.
	 * @return Retorna un entero con el total de cursos registrados en la tabla.
	 */
	private int totalCursos() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.curso";
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
	 * Elimina el curso seleccionado de la base de datos.
	 * @param id ID del curso.
	 * @return Retorna el número de registros que fueron eliminado de la tabla curso.
	 */
	public int eliminaCurso(String id) {
		
		String delCurso = "DELETE FROM bgacademy.curso WHERE idcurso = ?";
		int delrows = 0;
		
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(delCurso);	
			 sentencia.setInt(1, Integer.valueOf(id));
				 
			 delrows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return delrows;
		
	}

}
