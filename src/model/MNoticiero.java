package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MNoticiero {
	
	private final Connection conexion;
	
	public MNoticiero(Connection conexion){
		this.conexion = conexion;
	}
	
	/**
     * Verifica en la BD que existe igualdad entre contraseña y usuario para la identificación
     * del mismo.
     * @param password	Contraseña del usuario.
     * @param usuario	Nombre de usuario.
     * @return	Devuelve true si la identificación es correcta, de lo contrario devolverá false.
     */
    public boolean checkLogin(String usuario, String password){
    	
		String consultaUserPass = "SELECT COUNT(*) AS contador FROM bgacademy.noticiario WHERE usuario = ? AND pass = ?;";
		boolean correcto = false;
		int contador = 0;
    			        
        try{
        	
            PreparedStatement sentencia = conexion.prepareStatement(consultaUserPass);
            sentencia.setString(1, usuario);
            sentencia.setString(2, password);
            
            ResultSet rs = sentencia.executeQuery();
            
            while(rs.next()){
            	contador = rs.getInt("contador");
            }
            
        }catch(SQLException e){
            System.out.println(e);
        }
        
	        if(contador == 0){
	        	correcto = false;
	        }else{
	        	correcto = true;
	        }
         
        return correcto;
		         
    }

    
    public Object[] dameDatos(String user) {
		
		Object datos[] = new Object[11];
		String selectDatosNot = "SELECT * FROM bgacademy.noticiario WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosNot);
			 
			 sentencia.setString(1, user);

			 ResultSet rs = sentencia.executeQuery();
	         
			 while(rs.next()){
				 datos[0] = rs.getInt("iduser");
				 datos[1] = rs.getString("tipouser");
				 datos[2] = rs.getString("nombre");
				 datos[3] = rs.getString("apellido1");
				 datos[4] = rs.getString("apellido2");
				 datos[5] = rs.getString("usuario");
				 datos[6] = rs.getString("pass");
				 datos[7] = rs.getDate("fecalta");
				 datos[8] = rs.getString("email");
				 datos[9] = rs.getString("tlf");
				 datos[10] = rs.getString("nif");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
	}


	/**
	 * Registra noticiario en la base de datos.
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param nif
	 * @param fecalta_date
	 * @param email
	 * @param tlf
	 */
	public void registraNoticiario(	String nombre, String apellido1, String apellido2, String nif, Date fecalta_date,
									String email, String tlf) {
		
		String insertNot = "INSERT INTO bgacademy.noticiario (nombre, apellido1, apellido2, usuario, pass, nif, tipouser, fecalta, email, tlf) VALUES (?,?,?,?,?,?,?,?,?,?);";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertNot);
			 
			 java.sql.Date sqlDate1 = new java.sql.Date(fecalta_date.getTime());		 
			 
			 	 sentencia.setString(1, nombre);
				 sentencia.setString(2, apellido1);
				 sentencia.setString(3, apellido2);
				 sentencia.setString(4, nif);
				 sentencia.setString(5, nif);
				 sentencia.setString(6, nif);
				 sentencia.setString(7, "N");
				 sentencia.setDate(8, (java.sql.Date) sqlDate1);		
				 sentencia.setString(9, email);
				 sentencia.setString(10, tlf);
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
	}

	
	/**
	 * Comprueba existencia de noticiario con ese NIF.
	 * @param nif
	 * @return
	 */
	public boolean compruebaExistencia(String nif) {
		String selectNIF = "SELECT COUNT(*) as contador FROM bgacademy.noticiario WHERE nif = ?";
		
		boolean existe = false;
		int contador = 0;
		    			        
        try{
        	
            PreparedStatement sentencia = conexion.prepareStatement(selectNIF);
            sentencia.setString(1, nif);
            
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
	 * Realiza el update del usuario noticiario.
	 * @param id
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param email
	 * @param tlf
	 * @param pass
	 */
	public void updateNoticiario(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
									String pass) {
	
		String updateUser = "UPDATE bgacademy.noticiario SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?, pass = ? where iduser = ?;";
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido1);
            sentencia.setString(3, apellido2);
            sentencia.setString(4, email);
            sentencia.setString(5, tlf);
            sentencia.setString(6, pass);
            sentencia.setInt(7, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		 
	}

	
	/**
	 * Devuelve los datos del usuario con la ID del mismo.
	 * @param id
	 * @return
	 */
	public Object[] dameDatosPorID(String id) {
		
		Object datos[] = new Object[11];
		String selectDatosNot = "SELECT * FROM bgacademy.noticiario WHERE iduser = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosNot);
			 
			 sentencia.setInt(1, Integer.valueOf(id));

			 ResultSet rs = sentencia.executeQuery();
	         
			 while(rs.next()){
				 datos[0] = rs.getInt("iduser");
				 datos[1] = rs.getString("tipouser");
				 datos[2] = rs.getString("nombre");
				 datos[3] = rs.getString("apellido1");
				 datos[4] = rs.getString("apellido2");
				 datos[5] = rs.getString("usuario");
				 datos[6] = rs.getString("pass");
				 datos[7] = rs.getDate("fecalta");
				 datos[8] = rs.getString("email");
				 datos[9] = rs.getString("tlf");
				 datos[10] = rs.getString("nif");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		
		return datos;		
	}

}

