package model;

import java.sql.Connection;
import java.util.Date;
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
	
}
