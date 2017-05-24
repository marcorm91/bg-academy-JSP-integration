package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MIncidencias {

	private Connection conexion;
	
	public MIncidencias(Connection conexion){
		this.conexion = conexion;
	}

	/**
	 * Realiza el registro de una incidencia (Alumno).
	 * @param id
	 * @param incidencia
	 */
	public void registraIncidenciaAlumn(String id, String incidencia) {
		
		String insertInci = "INSERT INTO bgacademy.incidencias (idalumno, idprofesor, incidencia, resolucion, idgestor, fechaentrada, fechasalida, tipo) VALUES (?,?,?,?,?,?,?,?);";
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	    String strDate = sdf.format(cal.getTime());
	        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertInci);
			 
			 	 sentencia.setInt(1, Integer.valueOf(id));
				 sentencia.setNull(2, java.sql.Types.INTEGER);
				 sentencia.setString(3, incidencia);
				 sentencia.setString(4, "N");
				 sentencia.setNull(5, java.sql.Types.INTEGER);
				 sentencia.setString(6, strDate);
				 sentencia.setNull(7, java.sql.Types.DATE);
				 sentencia.setString(8, "A");
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }				
		
	}

	
	/**
	 * Realiza el registro de una incidencia (Profesor).
	 * @param id
	 * @param incidencia
	 */
	public void registraIncidenciaProf(String id, String incidencia) {
		
		String insertInci = "INSERT INTO bgacademy.incidencias (idalumno, idprofesor, incidencia, resolucion, idgestor, fechaentrada, fechasalida, tipo) VALUES (?,?,?,?,?,?,?,?);";
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	    String strDate = sdf.format(cal.getTime());
	        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertInci);
			 
			 	 sentencia.setNull(1, java.sql.Types.INTEGER);
				 sentencia.setInt(2, Integer.valueOf(id));
				 sentencia.setString(3, incidencia);
				 sentencia.setString(4, "N");
				 sentencia.setNull(5, java.sql.Types.INTEGER);
				 sentencia.setString(6, strDate);
				 sentencia.setNull(7, java.sql.Types.DATE);
				 sentencia.setString(8, "P");
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }		
		
	}

	/**
	 * Devuelve las incidencias registradas por el usuario Alumno.
	 * @param id
	 * @return
	 */
	public Object[][] devuelveIncidenciasAlumn(String id) {
		
		int cantidad = totalRegistrosIncidenciasAlumn(id);
		Object datos[][] = new Object[cantidad][4];
		int i = 0;
		
		String selectIncidencias = "SELECT idincidencia, incidencia, resolucion, fechaentrada FROM bgacademy.incidencias WHERE idalumno = ?;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectIncidencias);
			sentencia.setInt(1, Integer.parseInt(id));
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("idincidencia");
			 datos[i][1] = rs.getString("incidencia");
			 datos[i][2] = rs.getString("fechaentrada");
			 datos[i][3] = rs.getString("resolucion");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
	}

	
	/**
	 * Devuelve el total de incidencias por alumno.
	 * @param id
	 * @return
	 */
	private int totalRegistrosIncidenciasAlumn(String id) {
		
		String total = "select count(*) as contador from bgacademy.incidencias where idalumno = ?;";
		int filas = 0;
		
		try{
			
			 PreparedStatement sentencia = conexion.prepareStatement(total);	 
			 sentencia.setInt(1, Integer.parseInt(id));
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
	 * Devuelve el contenido de la incidencia.
	 * @param id
	 * @return
	 */
	public String dameIncidencia(String id) {
		
		String total = "SELECT incidencia FROM bgacademy.incidencias WHERE idincidencia = ?;";
		String result = null;
		
		try{
			
			 PreparedStatement sentencia = conexion.prepareStatement(total);	 
			 sentencia.setInt(1, Integer.parseInt(id));
			 ResultSet rs = sentencia.executeQuery();

			 while(rs.next()){
				 result = rs.getString(1);
			 }
			 	

		}catch(Exception e){
			System.out.println(e);
		}
					 
		return result;		
	}
	
}
