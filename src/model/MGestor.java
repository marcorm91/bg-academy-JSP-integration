package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MGestor {
	
	private final Connection conexion;
	
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

    
public Object[] dameDatos(String user) {
		
		Object datos[] = new Object[22];
		String selectDatosGest = "SELECT * FROM bgacademy.gestor WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosGest);
			 
			 sentencia.setString(1, user);

			 ResultSet rs = sentencia.executeQuery();
	         
			 while(rs.next()){
				 datos[0] = rs.getInt("iduser");
				 datos[1] = rs.getString("nombre");
				 datos[2] = rs.getString("apellido1");
				 datos[3] = rs.getString("apellido2");
				 datos[4] = rs.getString("usuario");
				 datos[5] = rs.getString("pass");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
	}


	/**
	 * Regista gestor en la base de datos.
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

}

