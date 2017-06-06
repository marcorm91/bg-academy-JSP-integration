package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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


	
	public Object[][] dameNoticias() {
		
		int cantidad = totalRegistrosNoticias();
		String total = "SELECT bgacademy.noticias.idnoticia AS idnoticia, bgacademy.noticias.titular AS titular, bgacademy.noticias.imagen AS rutaImg,"
					 + " bgacademy.noticias.contenido AS contenido, bgacademy.noticiario.nombre AS autor, bgacademy.noticias.fpubl AS fechapublicacion "
					 + " FROM bgacademy.noticias INNER JOIN bgacademy.noticiario ON bgacademy.noticias.iduser = bgacademy.noticiario.iduser;";
		Object datos[][] = new Object[cantidad][6];
		int i = 0;
		
		try{
			
			 PreparedStatement sentencia = conexion.prepareStatement(total);	 
			 ResultSet rs = sentencia.executeQuery();

			 while(rs.next()){
				 datos[i][0] = rs.getInt("idnoticia");
				 datos[i][1] = rs.getString("titular");
				 datos[i][2] = rs.getString("rutaImg");
				 datos[i][3] = rs.getString("contenido");
				 datos[i][4] = rs.getString("autor");
				 datos[i][5] = rs.getString("fechapublicacion");
				 i++;
			 }
			 	

		}catch(Exception e){
			System.out.println(e);
		}
		
		
		return datos;
	}
	
	/**
	 * Devuelve el total de noticias existente en la BD.
	 * @return
	 */
	private int totalRegistrosNoticias() {

		String total = "SELECT COUNT(*) AS contador FROM bgacademy.noticias;";
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
	
	
}
