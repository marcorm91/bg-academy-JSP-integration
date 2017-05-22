package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class MIncidencias {

	private Connection conexion;
	
	public MIncidencias(Connection conexion){
		this.conexion = conexion;
	}

	/**
	 * Realiza el registro de una incidencia.
	 * @param id
	 * @param incidencia
	 */
	public void registraIncidenciaAlumn(String id, String incidencia) {
		
		String insertInci = "INSERT INTO bgacademy.incidencias (idalumno, idprofesor, incidencia, resolucion, idgestor, fechaentrada, fechasalida) VALUES (?,?,?,?,?,?,?);";
		
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
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
				
		
	}
	
	
	
	
}
