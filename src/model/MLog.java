package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MLog {
	
	private final Connection conexion;
	
	public MLog(Connection conexion){
		this.conexion = conexion;
	}
	
	/**
     * Verifica en la BD que existe igualdad entre contrase�a y usuario para la identificaci�n
     * del mismo.
     * @param password	Contrase�a del usuario.
     * @param usuario	Nombre de usuario.
     * @return	Devuelve true si la identificaci�n es correcta, de lo contrario devolver� false.
     */
    public boolean checkLogin(String usuario, String password){
    	
		String consultaUserPass = "SELECT COUNT(*) AS contador FROM bgacademy.logs WHERE usuario = ? AND pass = ?;";
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

	public String checkTipo(String usuario, String password) {
		
		String consultaTipo = "SELECT tipouser FROM bgacademy.logs WHERE usuario = ? AND pass = ?;";
		String tipouser = null;
    			        
        try{
        	
            PreparedStatement sentencia = conexion.prepareStatement(consultaTipo);
            sentencia.setString(1, usuario);
            sentencia.setString(2, password);
            
            ResultSet rs = sentencia.executeQuery();
            
            while(rs.next()){
            	tipouser = rs.getString("tipouser");
            }
            
        }catch(SQLException e){
            System.out.println(e);
        }
               
        return tipouser;
	}

}
