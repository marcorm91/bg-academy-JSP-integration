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
	 * @param titulo T�tulo de la actividad.
	 * @param detalles Contenido de la actividad.
	 * @param feclimite Fecha l�mite de la actividad.
	 * @param anioprom A�o de promoci�n.
	 * @param cursoasign Curso de asignaci�n de actividad.
	 * @return Retorna el n�mero de filas insertadas en la tabla.
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
	 * Registra el registro de una actividad (Examen).
	 * @param titexamen T�tulo de la actividad.
	 * @param detalleexamen Contenido de la actividad.
	 * @param feclimite_parse Fecha l�mite de la actividad.
	 * @param anioprom A�o de promoci�n de la actividad.
	 * @param cursoasign Curso de asignaci�n de actividad.
	 * @return Retorna en n�mero de filas insertadas en la tabla.
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
	 * Recoge todas las actividades (Tareas) para el a�o de promoci�n y curso asignado indicados.
	 * @param anioprom A�o de promoci�n.
	 * @param cursoasign Curso asignado.
	 * @return Retorna una matriz con todas las tareas recogidas seg�n condiciones establecidas.
	 */
	public Object[][] dameActividades(String anioprom, String cursoasign, String tipo) {
		
		int cantidad = totalRegistrosActividades(anioprom, cursoasign, tipo);
		Object datos[][] = new Object[cantidad][4];
		int i = 0;
		
		String selectIncidencias = "SELECT idactividad, titulo, detalles, feclimite FROM bgacademy.actividades WHERE anioprom = ? AND "
								 + "cursoasign = ? AND tipo = ? ORDER BY feclimite desc;";
		
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
	 * Total de registros de actividades en la tabla.
	 * @param anioprom A�o de promoci�n.
	 * @param cursoasign Curso asignado.
	 * @param tipo Tipo de actividad a recoger (Examen o Tarea).
	 * @return Devuelve el n�mero de registros de la tabla actividades con el a�o de promoci�n y curso asignado establecido.
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
	 * Total de registros de actividades seg�n par�metros.
	 * @param anioprom A�o de promoci�n.
	 * @param cursoasign Curso asignado.
	 * @return Devuelve el n�mero de registros de la tabla actividades con el a�o de promoci�n y curso asignado establecido.
	 */
	private int totalRegistrosActividades(String anioprom, String cursoasign) {
		
		String totalActividades = "SELECT COUNT(*) AS contador FROM bgacademy.actividades "
	 			 				+ "WHERE anioprom = ? AND cursoasign = ?;";

		int filas = 0;
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(totalActividades);	 
			sentencia.setString(1, anioprom);
			sentencia.setString(2, cursoasign);
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
	 * Recoge los datos de una actividad en concreto.
	 * @param idactividad ID de una actividad
	 * @return Retorna una actividad con los campos a imprimir.
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

	
	/**
	 * Recoge una serie de fechas l�mites sobre las actividades seg�n las condiciones establecidas.
	 * @param anioprom A�o de promoci�n.
	 * @param cursoasign Curso asignado.
	 * @return Devuelve la fecha, el t�tulo y el tipo de actividad (E � T).
	 */
	public Object[][] devuelveFechas(String anioprom, String cursoasign) {
		
		int cantidad = totalRegistrosActividades(anioprom, cursoasign);
		Object datos[][] = new Object[cantidad][3];
		int i = 0;
		
		String selectActividades = "SELECT feclimite, tipo, titulo FROM bgacademy.actividades WHERE anioprom = ? AND "
								 + "cursoasign = ? order by feclimite asc;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectActividades);
			sentencia.setString(1, anioprom);
			sentencia.setString(2, cursoasign);
			ResultSet rs = sentencia.executeQuery();
		
			while(rs.next()){
				 datos[i][0] = rs.getString("feclimite");
				 datos[i][1] = rs.getString("tipo");
				 datos[i][2] = rs.getString("titulo");
				 i++;
			 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
		
	}
	
}
