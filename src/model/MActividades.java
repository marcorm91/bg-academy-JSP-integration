package model;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


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
	public int registraTarea(String tittarea, String detalletarea, Date feclimite_parse, String anioprom, String cursoasign) {
		
		String insertInci = "INSERT INTO bgacademy.actividades (tipo, titulo, detalles, feclimite, anioprom, cursoasign) VALUES (?,?,?,?,?,?);";
		
		java.sql.Date sqlDate = new java.sql.Date(feclimite_parse.getTime());
		
		int rowsInsert = 0;
		        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertInci);
			 
			 	 sentencia.setString(1, "T");
				 sentencia.setString(2, tittarea);
				 sentencia.setString(3, detalletarea);
				 sentencia.setDate(4, sqlDate);
				 sentencia.setString(5, anioprom);
				 sentencia.setString(6, cursoasign);
				 
				 rowsInsert = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }		
		
		return rowsInsert;
		
	}

	
	/**
	 * Registra el registro de una actividad (Examen)
	 * @param titexamen
	 * @param detalleexamen
	 * @param feclimite_parse
	 * @param anioprom
	 * @param cursoasign
	 * @return
	 */
	public int registraExamen(	String titexamen, String detalleexamen, Date feclimite_parse, String anioprom, String cursoasign) {
		
		String insertInci = "INSERT INTO bgacademy.actividades (tipo, titulo, detalles, feclimite, anioprom, cursoasign) VALUES (?,?,?,?,?,?);";
		
		java.sql.Date sqlDate = new java.sql.Date(feclimite_parse.getTime());
		
		int rowsInsert = 0;
		        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertInci);
			 
			 	 sentencia.setString(1, "E");
				 sentencia.setString(2, titexamen);
				 sentencia.setString(3, detalleexamen);
				 sentencia.setDate(4, sqlDate);
				 sentencia.setString(5, anioprom);
				 sentencia.setString(6, cursoasign);
				 
				 rowsInsert = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }		
		
		return rowsInsert;
	}

	
	/**
	 * Recoge todas las actividades (Tareas) para el año de promoción y curso asignado indicados.
	 * @param anioprom
	 * @param cursoasign
	 * @return
	 */
	public Object[][] dameActividades(String anioprom, String cursoasign, String tipo) {
		
		int cantidad = totalRegistrosActividades(anioprom, cursoasign, tipo);
		Object datos[][] = new Object[cantidad][4];
		int i = 0;
		
		String selectIncidencias = "SELECT idactividad, titulo, detalles, feclimite FROM bgacademy.actividades WHERE anioprom = ? AND "
								 + "cursoasign = ? AND tipo = ?;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectIncidencias);
			sentencia.setString(1, anioprom);
			sentencia.setString(2, cursoasign);
			sentencia.setString(3, tipo);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("idactividad");
			 datos[i][1] = rs.getString("titulo");
			 datos[i][2] = rs.getString("detalles");
			 datos[i][3] = rs.getString("feclimite");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
		
	}

	/**
	 * Devuelve el número de registros de la tabla actividades con el año de promoción y curso asignado establecido.
	 * @param anioprom
	 * @param cursoasign
	 * @return
	 */
	private int totalRegistrosActividades(String anioprom, String cursoasign, String tipo) {
		
		String totalActividades = "SELECT COUNT(*) AS contador FROM bgacademy.actividades "
	 			 				+ "WHERE anioprom = ? AND cursoasign = ? AND tipo = ?;";

		int filas = 0;
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(totalActividades);	 
			sentencia.setString(1, anioprom);
			sentencia.setString(2, cursoasign);
			sentencia.setString(3, tipo);
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
	 * Devuelve una actividad (Tarea) por ID.
	 * @param idactividad
	 * @return
	 */
	public Object[] dameActividad(String idactividad) {
		
		Object datos[] = new Object[4];
		String selectActividad = " SELECT titulo, detalles, feclimite, tipo FROM bgacademy.actividades WHERE idactividad = ?";
			
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectActividad);
			 
		     sentencia.setInt(1, Integer.valueOf(idactividad));

			 ResultSet rs = sentencia.executeQuery();
	         
			 while(rs.next()){
				 datos[0] = rs.getString("titulo");
				 datos[1] = rs.getString("detalles");
				 datos[2] = rs.getString("feclimite");
				 datos[3] = rs.getString("tipo");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}
	
}
