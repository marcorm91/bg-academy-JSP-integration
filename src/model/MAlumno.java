package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MAlumno {
	
	private final Connection conexion;
	
	public MAlumno(Connection conexion){
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

		String consultaUserPass = "SELECT COUNT(*) AS contador FROM bgacademy.alumno WHERE usuario = ? AND pass = ?;";
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
		String selectDatosAlumn = "SELECT * FROM bgacademy.alumno WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosAlumn);
			 
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

}

	

