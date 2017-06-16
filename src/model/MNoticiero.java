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

    
    /**
     * Recoge todos los datos del usuario tras iniciar la sesión por primera vez.
     * @param user Nombre de usuario.
     * @return Retorna en un array los 12 elementos asociados al usuario que se le pasa por parámetro.
     */
    public Object[] dameDatos(String user) {
		
		Object datos[] = new Object[12];
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
				 datos[11] = rs.getString("imagen");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
	}


	/**
	 * Registra noticiario en la base de datos.
	 * @param nombre Nombre del noticiario. 
	 * @param apellido1 Apellido 1 del noticiario.
	 * @param apellido2 Apellido 2 del noticiario.
	 * @param nif NIF del noticiario.
	 * @param fecna_date Fecha de nacimiento del noticiario.
	 * @param fecalta_date Fecha de alta del noticiario.
	 * @param email Email del noticiario.
	 * @param tlf Teléfono del noticiario.
	 */
	public void registraNoticiario(	String nombre, String apellido1, String apellido2, String nif, String pass, Date fecalta_date,
									String email, String tlf) {
		
		String insertNot = "INSERT INTO bgacademy.noticiario (nombre, apellido1, apellido2, usuario, pass, nif, tipouser, fecalta, email, tlf, activo) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
		
		try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertNot);
			 
			 java.sql.Date sqlDate1 = new java.sql.Date(fecalta_date.getTime());		 
			 
			 	 sentencia.setString(1, nombre);
				 sentencia.setString(2, apellido1);
				 sentencia.setString(3, apellido2);
				 sentencia.setString(4, nif);
				 sentencia.setString(5, pass);
				 sentencia.setString(6, nif);
				 sentencia.setString(7, "N");
				 sentencia.setDate(8, (java.sql.Date) sqlDate1);		
				 sentencia.setString(9, email);
				 sentencia.setString(10, tlf);
				 sentencia.setString(11, "N");
				 
				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
	}

	
	/**
	 * Comprueba existencia de noticiario en la academia con ese NIF.
	 * @param nif NIF del gestor.
	 * @return Devuelve true si ese usuario ya existe, de lo contrario devuelve false.
	 */
	public boolean compruebaExistencia(String nif) {
		String selectNIF = "SELECT COUNT(*) AS contador FROM bgacademy.noticiario WHERE nif = ?";
		
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
	 * Actualización del usuario gestor.
	 * @param id ID del gestor.
	 * @param nombre Nombre del gestor.
	 * @param apellido1 Apellido 1 del gestor.
	 * @param apellido2 Apellido 2 del gestor.
	 * @param email Email del gestor.
	 * @param tlf Teléfono del gestor.
	 * @param pass Contraseña del noticiario.
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
	 * Realiza el update del usuario noticiario.
	 * @param id ID del noticiario.
	 * @param nombre Nombre del noticiario.
	 * @param apellido1 Apellido 1 del noticiario.
	 * @param apellido2 Apellido 2 del noticiario.
	 * @param email Email del noticiario.
	 * @param tlf Teléfono del noticiario.
	 * @param pass Contraseña del noticiario.
	 */
	public void updateNoticiario_img(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
										String pass, String img) {
	
		String updateUser = "UPDATE bgacademy.noticiario SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?, pass = ?, imagen = ? where iduser = ?;";
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido1);
            sentencia.setString(3, apellido2);
            sentencia.setString(4, email);
            sentencia.setString(5, tlf);
            sentencia.setString(6, pass);
            sentencia.setString(7, img);
            sentencia.setInt(8, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		 
	}

	
	/**
	 * Devuelve los datos del usuario con la ID del mismo.
	 * @param id ID del usuario.
	 * @return Devuelve en un array los 12 campos asociados al usuario.
	 */
	public Object[] dameDatosPorID(String id) {
		
		Object datos[] = new Object[12];
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
				 datos[11] = rs.getString("imagen");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		
		return datos;		
	}

	
	/**
	 * Devuelve un listado de noticiarios registrados en la academia.
	 * @return Retorna en una matriz los noticiarios registrados en la academia.
	 */
	public Object[][] devuelveNoticiarios() {
		
		int cantidad = totalNoticiarios();
		Object datos[][] = new Object[cantidad][5];
		int i = 0;
		
		String selectNoticiarios = "SELECT iduser, nombre, apellido1, apellido2, email FROM bgacademy.noticiario;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectNoticiarios);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("iduser");
			 datos[i][1] = rs.getString("nombre");
			 datos[i][2] = rs.getString("apellido1");
			 datos[i][3] = rs.getString("apellido2");
			 datos[i][4] = rs.getString("email");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
		
	}
	
	
	/***
	 * Devuelve el total de alumnos registrados en la BD.
	 * @return Retorna un entero la cantidad de noticiarios registrados en la tabla.
	 */
	private int totalNoticiarios() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.noticiario";
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

	/**
	 * Elimina el noticiario seleccionado de la base de datos.
	 * @param id ID del noticiario.
	 * @return Retorna el número de registros que fueron eliminados de la tabla.
	 */
	public int eliminaNoticiario(String id) {
		
		String delNot = "DELETE FROM bgacademy.noticiario WHERE iduser = ?";
		int delrows = 0;
		
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(delNot);	
			 sentencia.setInt(1, Integer.valueOf(id));
				 
			 delrows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return delrows;
	
	}

	
	/**
	 * Modifica el perfil del noticiario desde el usuario GESTOR.
	 * @param id ID del noticiario.
	 * @param nombre Nombre del noticiario.
	 * @param apellido1 Apellido 1 del noticiario.
	 * @param apellido2 Apellido 2 del noticiario.
	 * @param usuario Nombre de usuario.
	 * @param tlf Teléfono del noticiario.
	 * @param nif NIF del noticiario.
	 * @param email Email del noticiario.
	 * @return Retorna la cantidad de registros que se modificaron en la tabla.
	 */
	public int updateNoticiario(String id, String nombre, String apellido1, String apellido2, String usuario,
								String tlf, String nif, String email) {
		
		String updateUser = "UPDATE bgacademy.noticiario SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  nif = ? where iduser = ?;";
		int rowsAfectadas = 0;
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido1);
            sentencia.setString(3, apellido2);
            sentencia.setString(4, email);
            sentencia.setString(5, tlf);
            sentencia.setString(6, nif);
            sentencia.setInt(7, Integer.valueOf(id));
            rowsAfectadas =  sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		
		return rowsAfectadas;
		
	}
	
	
	/**
	 * Recoge el NIF del noticiario.
	 * @param id ID del noticiario.
	 * @return Recoge en una cadena el NIF del noticiario.
	 */
	public String dameNif(String id) {
		
		String selectNIF = "SELECT nif FROM bgacademy.noticiario where iduser = ?;";
		 String nif = null;
		
		 try{
	        	
           PreparedStatement sentencia = conexion.prepareStatement(selectNIF);
           sentencia.setInt(1, Integer.valueOf(id));
           
           ResultSet rs = sentencia.executeQuery();
           
           while(rs.next()){
           	nif = rs.getString("nif");
           }
	            
       }catch(SQLException e){
           System.out.println(e);
       }
		 
		 return nif;
		 
	}
	
	
	/**
	 * Devuelve el valor de la columna activo.
	 * @param id ID del noticiario.
	 * @return Devuelve una cadena el cual nos dirá si este usuario entró a la plataforma o no por primera vez.
	 */
	public String compruebaActivo(String id) {
		
		 String selectActivo = "SELECT activo FROM bgacademy.noticiario where iduser = ?;";
		 String activo = null;
		
		 try{
	        	
           PreparedStatement sentencia = conexion.prepareStatement(selectActivo);
           sentencia.setInt(1, Integer.valueOf(id));
           
           ResultSet rs = sentencia.executeQuery();
           
           while(rs.next()){
        	  activo = rs.getString("activo");
           }
	            
       }catch(SQLException e){
           System.out.println(e);
       }
		 
		 return activo;
		
	}

	
	/**
	 * Modifica el valor de la columna activo.
	 */
	public void setActivo(String id) {
		
		String updateUser = "UPDATE bgacademy.noticiario SET activo = ? WHERE iduser = ?;";
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1,"S");
            sentencia.setInt(2, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		
	}
	

}

