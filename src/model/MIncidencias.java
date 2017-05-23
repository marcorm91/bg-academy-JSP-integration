package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	 * Devuelve las incidencias registradas por el usuario (Alumno / Profesor).
	 * @param id
	 * @return
	 */
	public String[][] devuelveIncidencias(String id) {
		
		
		return null;
	}
	
}
