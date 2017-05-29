package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class MProfesor {
	
	private final Connection conexion;
	
	public MProfesor(Connection conexion){
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
    	
		String consultaUserPass = "SELECT COUNT(*) AS contador FROM bgacademy.profesor WHERE usuario = ? AND pass = ?;";
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
		String selectDatosProf = "SELECT * FROM bgacademy.profesor WHERE usuario = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosProf);
			 
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
				 datos[7] = rs.getDate("fnac");
				 datos[8] = rs.getString("nif");
				 datos[9] = rs.getString("nacimiento");
				 datos[10] = rs.getString("calle");
				 datos[11] = rs.getString("cp");
				 datos[12] = rs.getString("provincia");
				 datos[13] = rs.getString("poblacion");
				 datos[14] = rs.getDate("fecalta");
				 datos[15] = rs.getString("email");
				 datos[16] = rs.getString("tlf");
				 datos[17] = rs.getString("anioprom");
				 datos[18] = rs.getString("asignimp");
				 datos[19] = rs.getString("nacionalidad");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		
		return datos;
    }

    /**
     * Realiza un INSERT en la tabla profesor.
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
     * @throws IOException
     */
    public void registraProfesor(	String nombre, String apellido1, String apellido2, String nif, Date fecna_date,
									String nacimiento, String nacionalidad, String calle, String cp, String poblacion, String provincia,
									Date fecalta_date, String email, String tlf, String anioprom, String cursoimp) throws IOException {
	
    	String insertProf = "INSERT INTO bgacademy.profesor (nombre, apellido1, apellido2, usuario, pass, fnac, nif, nacimiento, nacionalidad, tipouser, calle, cp, provincia, poblacion, fecalta, email, tlf, anioprom, asignimp) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		  
    	ArrayList<String> lista = new ArrayList<String>();
    	String [] splitcursos = cursoimp.split(",");
    	for(int i = 0; i < splitcursos.length; i++) lista.add(splitcursos[i]);
    	
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertProf);
			 
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
				 sentencia.setString(10, "P");
				 sentencia.setString(11, calle);
				 sentencia.setString(12, cp);
				 sentencia.setString(13, poblacion);
				 sentencia.setString(14, provincia);
				 sentencia.setDate(15, (java.sql.Date) sqlDate2);
				 sentencia.setString(16, email);
				 sentencia.setString(17, tlf);
				 sentencia.setString(18, anioprom);
				 sentencia.setString(19, lista.toString());

				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		 
		
    }

    /**
     * Comprueba existencia de profesor con ese NIF.
     * @param nif
     * @return
     */
	public boolean compruebaExistencia(String nif) {
		
		String selectNIF = "SELECT COUNT(*) AS contador FROM bgacademy.profesor WHERE nif = ?";
		
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
	 * Actualización de datos de profesor.
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
	 * @param fecna_date
	 * @param pass
	 */
	public void updateProfesor(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
								String poblacion, String calle, String cp, String nacido, String nacionalidad, Date fecna,
								String pass) {
		
		String updateUser = "UPDATE bgacademy.profesor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ? where iduser = ?;";
		
		java.sql.Date sqlDate1 = new java.sql.Date(fecna.getTime());
		
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
            sentencia.setString(9, nacido);
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
	 * Devuelve todos los datos del profesor por ID.
	 * @param id
	 * @return
	 */
	public Object[] dameDatosPorID(String id) {
		
		Object datos[] = new Object[22];
		String selectDatosProf = "SELECT * FROM bgacademy.profesor WHERE iduser = ?";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(selectDatosProf);
			 
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
				 datos[7] = rs.getDate("fnac");
				 datos[8] = rs.getString("nif");
				 datos[9] = rs.getString("nacimiento");
				 datos[10] = rs.getString("calle");
				 datos[11] = rs.getString("cp");
				 datos[12] = rs.getString("provincia");
				 datos[13] = rs.getString("poblacion");
				 datos[14] = rs.getDate("fecalta");
				 datos[15] = rs.getString("email");
				 datos[16] = rs.getString("tlf");
				 datos[17] = rs.getString("anioprom");
				 datos[18] = rs.getString("asignimp");
				 datos[19] = rs.getString("nacionalidad");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}

}

