package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class MNoticias {
	
	private final Connection conexion;
	
	public MNoticias(Connection conexion){
		this.conexion = conexion;
	}

	
	/**
	 * Registra noticia en la BD.
	 * @param idnot
	 * @param contenido 
	 * @param titular 
	 * @param rutaImg 
	 * @return
	 */
	public int registraNoticia(String idnot, String titular, String contenido, String rutaImg) {
		
		String insertNot = "INSERT INTO bgacademy.noticias (fpubl, titular, imagen, contenido, iduser) VALUES (?,?,?,?,?);";
		
		int insertRows = 0;
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	    String strDate = sdf.format(cal.getTime());
	        
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertNot);
			 
			 	 sentencia.setString(1, strDate);
			 	 sentencia.setString(2, titular);
			 	 sentencia.setString(3, rutaImg);
			 	 sentencia.setString(4, contenido);
			 	 sentencia.setInt(5, Integer.valueOf(idnot));
				  
				 insertRows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }			
		
		return insertRows;
		
	}
	
	
	
	
	
	
}
