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

    /**
     * Recoge todos los datos del usuario que se loguea.
     * @param user
     * @return
     */
    public Object[] dameDatos(String user) {
		
		Object datos[] = new Object[22];
		String selectDatosAlumn = "SELECT * FROM bgacademy.alumno WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosAlumn);
			 
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
				 datos[7] = rs.getString("nif");
				 datos[8] = rs.getDate("fnac");
				 datos[9] = rs.getString("nacimiento");
				 datos[10] = rs.getString("nacionalidad");
				 datos[11] = rs.getString("calle");
				 datos[12] = rs.getString("cp");
				 datos[13] = rs.getString("poblacion");
				 datos[14] = rs.getString("provincia");
				 datos[15] = rs.getDate("fecalta");
				 datos[16] = rs.getString("anioprom");
				 datos[17] = rs.getString("cursoasign");
				 datos[18] = rs.getString("comentarios");
				 datos[19] = rs.getString("tlf");
				 datos[20] = rs.getString("email");
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

	
	/**
	 * Comprueba la existencia de usuario para realizar el registro.
	 * @param nif
	 * @return
	 */
	public boolean compruebaExistencia(String nif) {
		
		String selectNIF = "SELECT COUNT(*) as contador FROM bgacademy.alumno WHERE nif = ?";
		
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
	 * Actualización de datos de alumno.
	 * @param id
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param email
	 * @param tlf
	 * @param poblacion
	 * @param calle
	 * @param cp
	 * @param nacido
	 * @param nacionalidad
	 * @param fecna
	 * @param pass
	 */
	public void updateAlumno(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
								String poblacion, String calle, String cp, String nacimiento, String nacionalidad, Date fnac, String pass) {
		
		String updateUser = "UPDATE bgacademy.alumno SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ? where iduser = ?;";
		
		java.sql.Date sqlDate1 = new java.sql.Date(fnac.getTime());
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido1);
            sentencia.setString(3, apellido2);
            sentencia.setString(4, email);
            sentencia.setString(5, tlf);
            sentencia.setString(6, poblacion);
            sentencia.setString(7, calle);
            sentencia.setString(8, cp);
            sentencia.setString(9, nacimiento);
            sentencia.setString(10, nacionalidad);
            sentencia.setDate(11, (java.sql.Date) sqlDate1);
            sentencia.setString(12, pass);
            sentencia.setInt(13, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		 
	}

	
	/**
	 * Devuelve todos los datos del alumno por ID.
	 * @param id
	 * @return
	 */
	public Object[] dameDatosPorID(String id) {
		
		Object datos[] = new Object[22];
		String selectDatosAlumn = "SELECT * FROM bgacademy.alumno WHERE iduser = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosAlumn);
			 
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
				 datos[7] = rs.getString("nif");
				 datos[8] = rs.getDate("fnac");
				 datos[9] = rs.getString("nacimiento");
				 datos[10] = rs.getString("nacionalidad");
				 datos[11] = rs.getString("calle");
				 datos[12] = rs.getString("cp");
				 datos[13] = rs.getString("poblacion");
				 datos[14] = rs.getString("provincia");
				 datos[15] = rs.getDate("fecalta");
				 datos[16] = rs.getString("anioprom");
				 datos[17] = rs.getString("cursoasign");
				 datos[18] = rs.getString("comentarios");
				 datos[19] = rs.getString("tlf");
				 datos[20] = rs.getString("email");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}

}

	

