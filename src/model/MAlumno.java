package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MAlumno {
	
	private final Connection conexion;
	
	public MAlumno(Connection conexion){
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

	/**
	 * Registrar un alumno en base de datos.
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param nif
	 * @param fecna_date
	 * @param nacimiento
	 * @param nacionalidad
	 * @param calle
	 * @param cp
	 * @param poblacion
	 * @param provincia
	 * @param fecalta_date
	 * @param email
	 * @param tlf
	 * @param anioprom
	 * @param cursoimp
	 * @param comentarios
	 */
	public void registraAlumno(	String nombre, String apellido1, String apellido2, String nif, Date fecna_date,
								String nacimiento, String nacionalidad, String calle, String cp, String poblacion, String provincia,
								Date fecalta_date, String email, String tlf, String anioprom, String cursoasign, String comentarios) {
		
		String insertAlumn = "INSERT INTO bgacademy.alumno (nombre, apellido1, apellido2, usuario, pass, fnac, nif, nacimiento, nacionalidad, tipouser, calle, cp, provincia, poblacion, fecalta, email, tlf, anioprom, cursoasign, comentarios) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
	
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertAlumn);
			 
			 java.sql.Date sqlDate1 = new java.sql.Date(fecna_date.getTime());
			 java.sql.Date sqlDate2 = new java.sql.Date(fecalta_date.getTime());		 
			 
			 	 sentencia.setString(1, nombre);
				 sentencia.setString(2, apellido1);
				 sentencia.setString(3, apellido2);
				 sentencia.setString(4, nif);
				 sentencia.setString(5, nif);
				 sentencia.setDate(6, (java.sql.Date) sqlDate1);
				 sentencia.setString(7, nif);
				 sentencia.setString(8, nacimiento);
				 sentencia.setString(9, nacionalidad);
				 sentencia.setString(10, "A");
				 sentencia.setString(11, calle);
				 sentencia.setString(12, cp);
				 sentencia.setString(13, poblacion);
				 sentencia.setString(14, provincia);
				 sentencia.setDate(15, (java.sql.Date) sqlDate2);
				 sentencia.setString(16, email);
				 sentencia.setString(17, tlf);
				 sentencia.setString(18, anioprom);
				 sentencia.setString(19, cursoasign);
				 sentencia.setString(20, comentarios);

				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
	
	}

}

	
