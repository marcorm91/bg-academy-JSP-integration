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

    
    /**
     * Recoge todos los datos del usuario que se loguea.
     * @param user Nombre de usuario.
     * @return Devuelve un array de 22 elementos el cual contiene todos los datos del usuario.
     */
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
				 datos[20] = rs.getString("imagen");
			     datos[21] = rs.getString("idcursos");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		
		return datos;
    }

    /**
     * Registro de un profesor en la base de datos.
     * @param nombre Nombre del profesor.
     * @param apellido1 Apellido 1 del profesor.
     * @param apellido2 Apellido 2 del profesor.
     * @param nif NIF del profesor.
     * @param fecna_date Fecha de nacimiento del profesor.
     * @param nacimiento Lugar de nacimiento del profesor.
     * @param nacionalidad Nacionalidad del profesor.
     * @param calle Calle del profesor.
     * @param cp Código postal del profesor.
     * @param poblacion Población del profesor.
     * @param provincia Provincia del profesor.
     * @param fecalta_date Fecha de alta del profesor.
     * @param email Email del profesor.
     * @param tlf Teléfono del profesor.
     * @param anioprom Año de promoción del profesor.
     * @param cursoimp Cursos impartidos.
     * @throws IOException
     */
    public void registraProfesor(	String nombre, String apellido1, String apellido2, String nif, String pass, Date fecna_date,
									String nacimiento, String nacionalidad, String calle, String cp, String poblacion, String provincia,
									Date fecalta_date, String email, String tlf, String anioprom, String cursoimp, String idcursos) throws IOException {
    		
    	String insertProf = "INSERT INTO bgacademy.profesor (nombre, apellido1, apellido2, usuario, pass, fnac, nif, nacimiento, nacionalidad, tipouser, calle, cp, provincia, poblacion, fecalta, email, tlf, anioprom, asignimp, activo, idcursos) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		  
    	ArrayList<String> lista = new ArrayList<String>();
    	String [] splitcursos = cursoimp.split(",");
    	for(int i = 0; i < splitcursos.length; i++) lista.add(splitcursos[i]);
    	
    	ArrayList<String> lista_ids = new ArrayList<String>();
    	String [] splitids = idcursos.split(",");
    	for(int i = 0; i < splitids.length; i++) lista_ids.add(splitids[i]);
    	
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(insertProf);
			 
			 java.sql.Date sqlDate1 = new java.sql.Date(fecna_date.getTime());
			 java.sql.Date sqlDate2 = new java.sql.Date(fecalta_date.getTime());		 
			 
			 	 sentencia.setString(1, nombre);
				 sentencia.setString(2, apellido1);
				 sentencia.setString(3, apellido2);
				 sentencia.setString(4, nif);
				 sentencia.setString(5, pass);
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
				 sentencia.setString(21, lista_ids.toString());

				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		 
		
    }

    /**
     * Comprueba existencia de profesor con ese NIF.
     * @param nif NIF del profesor.
	 * @return Devuelve true si existe, de lo contrario devolverá false.
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
	 * @param id ID del profesor.
	 * @param nombre Nombre del profesor.
	 * @param apellido1 Apellido 1 del profesor.
	 * @param apellido2 Apellido 2 del profesor.
	 * @param email Email del profesor.
	 * @param tlf Teléfono del profesor.
	 * @param poblacion Población del profesor.
	 * @param calle Calle del profesor.
	 * @param cp Código postal del profesor.
	 * @param nacido Nacimiento del profesor.
	 * @param nacionalidad Nacionalidad del profesor.
	 * @param fecna_date Fecha de nacimiento del profesor.
	 * @param pass Contraseña del profesor.
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
     * Recoge todos los datos del usuario que se loguea.
     * @param id ID de usuario.
     * @return Devuelve un array de 22 elementos el cual contiene todos los datos del usuario.
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
				 datos[20] = rs.getString("imagen");
				 datos[21] = rs.getString("idcursos");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}

	
	/**
	 * Devuelve un listado de alumnos registrados en la academia.
	 * @return Devuelve en una matriz los profesores registrados en la academia.
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
	 * @return Retorna el total de profesores registrados en la tabla profesor.
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
	 * @param id ID del profesor.
	 * @return Devuelve el número de registros que se eliminaron de la tabla profesor.
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
	 * @param id ID del profesor.
	 * @param nombre Nombre del profesor.
	 * @param apellido1 Apellido 1 del profesor.
	 * @param apellido2 Apellido 2 del profesor.
	 * @param usuario Nombre de usuario.
	 * @param fecna Fecha de nacimiento del profesor.
	 * @param nif NIF del profesor.
	 * @param nacimiento Nacimiento del profesor.
	 * @param nacionalidad Nacionalidad del profesor.
	 * @param calle Calle del profesor.
	 * @param cp Código postal del profesor.
	 * @param provincia Provincia del profesor.
	 * @param poblacion Población del profesor.
	 * @param email Email del profesor.
	 * @return Retorna la cantidad de registros que fueron modificados en la tabla profesor.
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
	 * @param id ID del profesor.
	 * @return Retorna en una cadena el NIF del profesor.
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
	 * @param id ID del profesor.
	 * @return Recoge en una cadena si el usuario está activado o no.
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
	 * Modifica el valor de la columna activo.
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
	 * @param id ID del profesor.
	 * @param nombre Nombre del profesor.
	 * @param apellido1 Apellido 1 del profesor.
	 * @param apellido2 Apellido 2 del profesor.
	 * @param email Email del profesor.
	 * @param tlf Teléfono del profesor.
	 * @param poblacion Población del profesor.
	 * @param calle Calle del profesor.
	 * @param cp Código postal del profesor.
	 * @param nacido Nacimiento del profesor.
	 * @param nacionalidad Nacionalidad del profesor.
	 * @param fecna_date Fecha de nacimiento del profesor.
	 * @param pass Contraseña del profesor.
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

	
	/**
	 * Devuelve el año de promoción al que está asignado el profesor.
	 * @param id ID del profesor.
	 * @return Retorna en una cadena el año de promoción al que está asignado el profesor.
	 */
	public String devuelveFechas(String id) {
		
		String selectAnio = "SELECT anioprom FROM bgacademy.profesor where iduser = ?;";
		String anio = null;
		
		 try{
	        	
	          PreparedStatement sentencia = conexion.prepareStatement(selectAnio);
	          sentencia.setInt(1, Integer.valueOf(id));
	          
	          ResultSet rs = sentencia.executeQuery();
	          
	          while(rs.next()){
	        	  anio = rs.getString("anioprom");
	          }
	            
	      }catch(SQLException e){
	          System.out.println(e);
	      }
		 
	   return anio;
	
	}

	
	/**
	 * Devuelve los cursos al que está asignado el profesor.
	 * @param id ID del profesor.
	 * @return Retorna en una cadena los cursos a los que está asignado el profesor.
	 */
	public String devuelveCursos(String id) {
	
		String selectCursos = "SELECT asignimp FROM bgacademy.profesor where iduser = ?;";
		String cursos = null;
		
		 try{
	        	
	          PreparedStatement sentencia = conexion.prepareStatement(selectCursos);
	          sentencia.setInt(1, Integer.valueOf(id));
	          
	          ResultSet rs = sentencia.executeQuery();
	          
	          while(rs.next()){
	        	  cursos = rs.getString("asignimp");
	          }
	            
	      }catch(SQLException e){
	          System.out.println(e);
	      }
		 
	   return cursos;
		
	}

}

