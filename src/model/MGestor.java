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
		
		Object datos[] = new Object[12];
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
				 datos[11] = rs.getString("imagen");
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
		
		Object datos[] = new Object[12];
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
				 datos[11] = rs.getString("imagen");
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
		
		String insertGestor = "INSERT INTO bgacademy.gestor (nombre, apellido1, apellido2, usuario, pass, nif, tipouser, fecalta, email, tlf, activo) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
		
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
				 sentencia.setString(11, "N");
				 
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

	
	/**
	 * Devuelve un listado de gestores registrados en la academia.
	 * @return
	 */
	public Object[][] devuelveGestores() {
		
		int cantidad = totalGestores();
		Object datos[][] = new Object[cantidad][5];
		int i = 0;
		
		String selectGestores = "SELECT iduser, nombre, apellido1, apellido2, email FROM bgacademy.gestor;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectGestores);
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

	
	/**
	 * Devuelve el total de gestores registrados en la academia.
	 * @return
	 */
	private int totalGestores() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.gestor";
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
	 * Elimina el gestor seleccionado de la base de datos.
	 * @param id
	 * @return
	 */
	public int eliminarGestor(String id) {
		
		String delGest = "DELETE FROM bgacademy.gestor WHERE iduser = ?";
		int delrows = 0;
		
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(delGest);	
			 sentencia.setInt(1, Integer.valueOf(id));
				 
			 delrows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return delrows;
		
	}

	
	/**
	 * Modifica el perfil del gestor desde el usuario GESTOR.
	 * @param id
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param usuario
	 * @param tlf
	 * @param nif
	 * @param email
	 * @return
	 */
	public int updateGestor(String id, String nombre, String apellido1, String apellido2, String email, String tlf,
							String nif, String img) {
		
		String updateUser = "UPDATE bgacademy.gestor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  nif = ?, imagen = ? where iduser = ?;";
		int rowsAfectadas = 0;
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido1);
            sentencia.setString(3, apellido2);
            sentencia.setString(4, email);
            sentencia.setString(5, tlf);
            sentencia.setString(6, nif);
            sentencia.setString(7, img);
            sentencia.setInt(8, Integer.valueOf(id));
            rowsAfectadas =  sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		
		return rowsAfectadas;
		
	}

	
	/**
	 * Recoge el NIF del gestor.
	 * @param id
	 * @return
	 */
	public String dameNif(String id) {
		
		 String selectNIF = "SELECT nif FROM bgacademy.gestor where iduser = ?;";
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
	 * @param id
	 * @return
	 */
	public String compruebaActivo(String id) {
		
		 String selectActivo = "SELECT activo FROM bgacademy.gestor where iduser = ?;";
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
	 * Cambia el valor de la columna activo.
	 */
	public void setActivo(String id) {
		
		String updateUser = "UPDATE bgacademy.gestor SET activo = ? WHERE iduser = ?;";
		
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

