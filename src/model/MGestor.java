package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MGestor {
	
	private Connection conexion;
	
	public MGestor(Connection conexion){
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
    	    	
		String consultaUserPass = "SELECT COUNT(*) AS contador FROM bgacademy.gestor WHERE usuario = ? AND pass = ?;";
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

    
    /**
     * Recoge todos los datos del usuario tras iniciar la sesión por primera vez.
     * @param user
     * @return
     */
    public Object[] dameDatos(String user) {
		
		Object datos[] = new Object[22];
		String selectDatosGest = "SELECT * FROM bgacademy.gestor WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosGest);
			 
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
				 datos[9] = rs.getString("nif");
				 datos[10] = rs.getString("tlf");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
				
		return datos;
	}
    
    
    /**
     * Recoge todos los datos del usuario tras iniciar la sesión por primera vez.
     * @param user
     * @return
     */
    public Object[] dameDatosPorID(String id) {
		
		Object datos[] = new Object[22];
		String selectDatosGest = "SELECT * FROM bgacademy.gestor WHERE iduser = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosGest);
			 
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
				 datos[9] = rs.getString("nif");
				 datos[10] = rs.getString("tlf");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
	}


	/**
	 * Registra gestor en la base de datos.
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param nif
	 * @param fecna_date
	 * @param fecalta_date
	 * @param email
	 * @param tlf
	 */
	public void registraGestor(	String nombre, String apellido1, String apellido2, String nif,
								Date fecalta_date, String email, String tlf) {
		
		String insertGestor = "INSERT INTO bgacademy.gestor (nombre, apellido1, apellido2, usuario, pass, nif, tipouser, fecalta, email, tlf) VALUES (?,?,?,?,?,?,?,?,?,?);";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertGestor);
			 
			 java.sql.Date sqlDate1 = new java.sql.Date(fecalta_date.getTime());		 
			 
			 	 sentencia.setString(1, nombre);
				 sentencia.setString(2, apellido1);
				 sentencia.setString(3, apellido2);
				 sentencia.setString(4, nif);
				 sentencia.setString(5, nif);
				 sentencia.setString(6, nif);
				 sentencia.setString(7, "G");
				 sentencia.setDate(8, (java.sql.Date) sqlDate1);		
				 sentencia.setString(9, email);
				 sentencia.setString(10, tlf);
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
				
	}

	
	/**
	 * Comprueba existencia de gestor en la academia con ese NIF.
	 * @param nif
	 * @return
	 */
	public boolean compruebaExistencia(String nif) {
		
		String selectNIF = "SELECT COUNT(*) as contador FROM bgacademy.gestor WHERE nif = ?";
		
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
	 * Actualización del usuario profesor.
	 * @param id
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param email
	 * @param tlf
	 */
	public void updateGestor(	String id, String nombre, String apellido1, String apellido2, String email,
								String tlf, String pass) {
		
		String updateUser = "UPDATE bgacademy.gestor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?, pass = ? where iduser = ?;";
		
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

}

