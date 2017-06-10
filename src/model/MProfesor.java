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
		
		Object datos[] = new Object[21];
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
				 datos[20] = rs.getString("imagen");
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
	
    	String insertProf = "INSERT INTO bgacademy.profesor (nombre, apellido1, apellido2, usuario, pass, fnac, nif, nacimiento, nacionalidad, tipouser, calle, cp, provincia, poblacion, fecalta, email, tlf, anioprom, asignimp, activo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		  
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
				 sentencia.setString(20, "N");

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
	 * Actualización de datos de profesor desde el perfil PROFESOR.
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
								String pass, String img) {
		
		String updateUser = "UPDATE bgacademy.profesor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ?, imagen = ? where iduser = ?;";
		
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
            sentencia.setString(13, img);
            sentencia.setInt(14, Integer.valueOf(id));
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
		
		Object datos[] = new Object[21];
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
				 datos[20] = rs.getString("imagen");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}

	
	/**
	 * Devuelve una lista completa de profesores registrados en la BD.
	 * @return
	 */
	public Object[][] devuelveProfesores() {

		int cantidad = totalProfesores();
		Object datos[][] = new Object[cantidad][7];
		int i = 0;
		
		String selectProfesores = "SELECT iduser, nombre, apellido1, nif, email, anioprom, asignimp FROM bgacademy.profesor;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectProfesores);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("iduser");
			 datos[i][1] = rs.getString("nombre");
			 datos[i][2] = rs.getString("apellido1");
			 datos[i][3] = rs.getString("nif");
			 datos[i][4] = rs.getString("email");
			 datos[i][5] = rs.getString("anioprom");
			 datos[i][6] = rs.getString("asignimp");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
	}

	
	/***
	 * Devuelve el total de profesores registrados en la BD.
	 * @return
	 */
	private int totalProfesores() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.profesor";
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
	 * Elimina el profesor seleccionado de la base de datos.
	 * @param id
	 * @return
	 */
	public int eliminaProfesor(String id) {
		
		String delProf = "DELETE FROM bgacademy.profesor WHERE iduser = ?";
		int delrows = 0;
		
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(delProf);	
			 sentencia.setInt(1, Integer.valueOf(id));
				 
			 delrows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return delrows;
	}

	 /**
	 * Modifica el perfil del profesor desde el usuario GESTOR.
	 * @param id
	 * @param nombre
	 * @param apellido1
	 * @param apellido2
	 * @param usuario
	 * @param fecna
	 * @param nif
	 * @param nacimiento
	 * @param nacionalidad
	 * @param calle
	 * @param cp
	 * @param provincia
	 * @param poblacion
	 * @param email
	 * @return
	 */
	public int updateProfesor(  String id, String nombre, String apellido1, String apellido2, String usuario,  String tlf,
								String nif, String nacimiento, Date fecna, String nacionalidad, String calle, String cp, String provincia,
								String poblacion, String email) {
				
		String updateUser = "UPDATE bgacademy.profesor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, nif = ?, provincia = ? where iduser = ?;";
		int rowsAfectadas = 0;
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
            sentencia.setString(9, nacimiento);
            sentencia.setString(10, nacionalidad);
            sentencia.setDate(11, (java.sql.Date) sqlDate1);
            sentencia.setString(12, nif);
            sentencia.setString(13, provincia);
            sentencia.setInt(14, Integer.valueOf(id));
            rowsAfectadas =  sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		
		return rowsAfectadas;
	}
	
	
	/**
	 * Recoge el NIF del profesor.
	 * @param id
	 * @return
	 */
	public String dameNif(String id) {
		
		 String selectNIF = "SELECT nif FROM bgacademy.profesor where iduser = ?;";
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
		
		 String selectActivo = "SELECT activo FROM bgacademy.profesor where iduser = ?;";
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
		
		String updateUser = "UPDATE bgacademy.profesor SET activo = ? WHERE iduser = ?;";
		
		 try{
            PreparedStatement sentencia = conexion.prepareStatement(updateUser);
            sentencia.setString(1,"S");
            sentencia.setInt(2, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		
	}

	
	/**
	 * Actualización del perfil de profesor sin pasar como parámetro la imagen.
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
	public void updateProfesor( String id, String nombre, String apellido1, String apellido2, String email, String tlf,
								String poblacion, String calle, String cp, String nacido, String nacionalidad, Date fecna_date,
								String pass) {
		
		String updateUser = "UPDATE bgacademy.profesor SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ? where iduser = ?;";
		
		java.sql.Date sqlDate1 = new java.sql.Date(fecna_date.getTime());
		
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

}

