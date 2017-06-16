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
     * @param user Nombre de usuario.
     * @return Devuelve un array de 22 elementos el cual contiene todos los datos del usuario.
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
				 datos[21] = rs.getString("imagen");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
	}

	/**
	 * Registrar un alumno en base de datos.
	 * @param nombre Nombre del alumno.
	 * @param apellido1 Apellido 1 del alumno.
	 * @param apellido2 Apellido 2 del alumno.
	 * @param nif NIF del alumno.
	 * @param fecna_date Fecha de nacimiento del alumno.
	 * @param nacimiento Lugar de nacimiento del alumno.
	 * @param nacionalidad Nacionalidad del alumno.
	 * @param calle Calle del alumno.
	 * @param cp Código postal del alumno.
	 * @param poblacion Población del alumno.
	 * @param provincia Provincia del alumno.
	 * @param fecalta_date Fecha de alta del usuario.
	 * @param email Email del alumno.
	 * @param tlf Teléfono del alumno.
	 * @param anioprom Año de promoción del alumno.
	 * @param cursoimp Curso asignado al alumno.
	 * @param comentarios Comentarios, detalles sobre el alumno.
	 */
	public void registraAlumno(	String nombre, String apellido1, String apellido2, String nif, String pass, Date fecna_date,
								String nacimiento, String nacionalidad, String calle, String cp, String poblacion, String provincia,
								Date fecalta_date, String email, String tlf, String anioprom, String cursoasign, String comentarios, String idcurso) {
		
		String insertAlumn = "INSERT INTO bgacademy.alumno (nombre, apellido1, apellido2, usuario, pass, fnac, nif, nacimiento, nacionalidad, tipouser, calle, cp, provincia, poblacion, fecalta, email, tlf, anioprom, cursoasign, comentarios, idcurso, activo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
	
		try{
						 
			 PreparedStatement sentencia = conexion.prepareStatement(insertAlumn);
			 
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
				 sentencia.setInt(21, Integer.valueOf(idcurso));
				 sentencia.setString(22, "N");

				 sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }

	}

	
	/**
	 * Comprueba la existencia de usuario para realizar el registro.
	 * @param nif NIF del alumno.
	 * @return Devuelve true si existe, de lo contrario devolverá false.
	 */
	public boolean compruebaExistencia(String nif) {
		
		String selectNIF = "SELECT COUNT(*) AS contador FROM bgacademy.alumno WHERE nif = ?";
		
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
	 * @param id ID del alumno.
	 * @param nombre Nombre del alumno.
	 * @param apellido1 Apellido 1 del alumno.
	 * @param apellido2 Apellido 2 del alumno.
	 * @param email Email del alumno.
	 * @param tlf Teléfono del alumno.
	 * @param poblacion Población del alumno.
	 * @param calle Calle del alumno.
	 * @param cp Código postal del alumno.
	 * @param nacido Lugar de nacimiento del alumno.
	 * @param nacionalidad Nacionalidad del alumno.
	 * @param fecna Fecha de nacimiento del alumno.
	 * @param pass Contraseña del alumno.
	 */
	public void updateAlumno(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
								String poblacion, String calle, String cp, String nacimiento, String nacionalidad, Date fnac, String pass, String imagen) {
		
		String updateUser = "UPDATE bgacademy.alumno SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ?, imagen = ? where iduser = ?;";
		
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
            sentencia.setString(13, imagen);
            sentencia.setInt(14, Integer.valueOf(id));
            sentencia.executeUpdate();
		 }catch(Exception e){
			 System.out.println(e);
		 }
		 
	}

	
	/**
	 * Recoge todos los datos del alumno por ID.
	 * @param id ID del alumno.
	 * @return Devuelve en un array todos los datos del alumno por ID.
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
				 datos[21] = rs.getString("imagen");
			 }
	            
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return datos;
		
	}

	
	/**
	 * Devuelve un listado de alumnos registrados en la academia.
	 * @return Devuelve en una matriz los alumnos registrados en la academia.
	 */
	public Object[][] devuelveAlumnos() {
		
		int cantidad = totalAlumnos();
		Object datos[][] = new Object[cantidad][7];
		int i = 0;
		
		String selectAlumnos = "SELECT iduser, nombre, apellido1, nif, email, anioprom, cursoasign FROM bgacademy.alumno;";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectAlumnos);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("iduser");
			 datos[i][1] = rs.getString("nombre");
			 datos[i][2] = rs.getString("apellido1");
			 datos[i][3] = rs.getString("nif");
			 datos[i][4] = rs.getString("email");
			 datos[i][5] = rs.getString("anioprom");
			 datos[i][6] = rs.getString("cursoasign");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;

	}
	
	
	/***
	 * Devuelve el total de alumnos registrados en la BD.
	 * @return Devuelve con un entero el total de alumnos registrados en la academia.
	 */
	private int totalAlumnos() {
		
		String total = "SELECT COUNT(*) AS contador FROM bgacademy.alumno";
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
	 * Elimina un alumno de la base de datos.
	 * @param id ID del alumno.
	 * @return Devuelve un entero el cual nos dice el número de registros que fueron eliminados.
	 */
	public int eliminaAlumno(String id) {
		
		
		String delAlumn = "DELETE FROM bgacademy.alumno WHERE iduser = ?";
		int delrows = 0;
		
		 try{
			 
			 PreparedStatement sentencia = conexion.prepareStatement(delAlumn);	
			 sentencia.setInt(1, Integer.valueOf(id));
				 
			 delrows = sentencia.executeUpdate();
				 
		 }catch(Exception e){
	    	 System.out.println(e);
		 }
		
		return delrows;
	}

	
	/**
	 * Modifica el perfil del alumno desde el usuario GESTOR.
	 * @param id ID del alumno.
	 * @param nombre Nombre del alumno.
	 * @param apellido1 Apellido 1 del alumno.
	 * @param apellido2 Apellido 2 del alumno.
	 * @param usuario Nombre de usuario del alumno.
	 * @param tlf Teléfono del alumno.
	 * @param nif NIF del alumno.
	 * @param nacimiento Lugar de nacimiento del alumno.
	 * @param fecna_date Fecha de nacimiento del alumno.
	 * @param nacionalidad Nacionalidad del alumno.
	 * @param calle Calle del alumno.
	 * @param cp Código postal del alumno.
	 * @param provincia Provincia del alumno.
	 * @param poblacion Población del alumno.
	 * @param email Email del alumno.
	 * @return Devuelve el número de registros modificados.
	 */
	public int updateAlumno(String id, String nombre, String apellido1, String apellido2, String usuario, String tlf,
							String nif, String nacimiento, Date fecna_date, String nacionalidad, String calle, String cp,
							String provincia, String poblacion, String email) {
		
		String updateUser = "UPDATE bgacademy.alumno SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, nif = ?, provincia = ? where iduser = ?;";
		int rowsAfectadas = 0;
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
	 * Recoge el NIF del alumno.
	 * @param id ID del alumno.
	 * @return Devuelve en una cadena el NIF del alumno pasado previamente su ID.
	 */
	public String dameNif(String id) {
		
		 String selectNIF = "SELECT nif FROM bgacademy.alumno where iduser = ?;";
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
	 * @param id ID del alumno.
	 * @return Recoge en una cadena si el usuario está activado o no.
	 */
	public String compruebaActivo(String id) {
		
		 String selectActivo = "SELECT activo FROM bgacademy.alumno where iduser = ?;";
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
		
		String updateUser = "UPDATE bgacademy.alumno SET activo = ? WHERE iduser = ?;";
		
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
	 * Actualización del alumno sin pasar por parámetro la imagen.
	 * @param id ID del alumno.
	 * @param nombre Nombre del alumno.
	 * @param apellido1 Apellido 1 del alumno.
	 * @param apellido2 Apellido 2 del alumno.
	 * @param email Email del alumno.
	 * @param tlf Teléfono del alumno.
	 * @param poblacion Población del alumno.
	 * @param calle Calle del alumno.
	 * @param cp Código postal del alumno.
	 * @param nacido Lugar de nacimiento del alumno.
	 * @param nacionalidad Nacionalidad del alumno.
	 * @param fecna_date Fecha de nacimiento del alumno.
	 * @param pass Contraseña del alumno.
	 */
	public void updateAlumno(	String id, String nombre, String apellido1, String apellido2, String email, String tlf,
								String poblacion, String calle, String cp, String nacido, String nacionalidad, Date fecna_date,
								String pass) {
		
		String updateUser = "UPDATE bgacademy.alumno SET nombre = ?, apellido1 = ?, apellido2 = ?, email = ?, tlf = ?,  poblacion = ?, calle = ?, cp = ?, nacimiento = ?, nacionalidad = ?, fnac = ?, pass = ? where iduser = ?;";
		
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
	 * Devuelve los alumnos pertenecientes al año de promoción y curso impartido por el profesor.
	 * @param anioprom_prof Año de promoción del profesor.
	 * @param cursosasign_prof Cursos asignados del profesor.
	 * @return Retorna en una matriz los alumnos que pertenecen al mismo año de promoción y curso que el profesor.
	 */
	public Object[][] alumnosPorCurso(String anioprom_prof, String cursosasign_prof) {
				
		int cantidad = totalAlumnosPorCurso(anioprom_prof, cursosasign_prof);
		Object datos[][] = new Object[cantidad][8];
		int i = 0;
		
		String selectAlumnos = "SELECT iduser, nombre, apellido1, apellido2, nif, email, anioprom, cursoasign FROM bgacademy.alumno "
							 + "WHERE anioprom = ? AND idcurso IN ("+cursosasign_prof+");";
		
		try{
		
			PreparedStatement sentencia = conexion.prepareStatement(selectAlumnos);
			sentencia.setString(1, anioprom_prof);
			ResultSet rs = sentencia.executeQuery();
		
		while(rs.next()){
			 datos[i][0] = rs.getInt("iduser");
			 datos[i][1] = rs.getString("nombre");
			 datos[i][2] = rs.getString("apellido1");
			 datos[i][3] = rs.getString("apellido2");
			 datos[i][4] = rs.getString("nif");
			 datos[i][5] = rs.getString("email");
			 datos[i][6] = rs.getString("anioprom");
			 datos[i][7] = rs.getString("cursoasign");
			 i++;
		 }
				
		}catch(SQLException e){
			System.out.println(e);
		}
		
		return datos;
		
	}

	
	/**
	 * Devuelve el total de alumnos pertenecientes a un curso y año de promoción determinado.
	 * @param cursosasign_prof Cursos asignados al profesor.
	 * @param anioprom_prof Año de promoción del profesor.
	 * @return Retorna un entero el cual nos dice el número de alumnos en relación al año de promoción y curso del profesor.
	 */
	private int totalAlumnosPorCurso(String anioprom_prof, String cursosasign_prof) {
	
		String totalAlumnos = "SELECT COUNT(*) AS contador FROM bgacademy.alumno "
				 			 + "WHERE anioprom = ? AND idcurso IN ("+cursosasign_prof+");";
		
		int filas = 0;
		
		try{
			
			 PreparedStatement sentencia = conexion.prepareStatement(totalAlumnos);	 
			 sentencia.setString(1, anioprom_prof);
			 ResultSet rs = sentencia.executeQuery();

			 while(rs.next()){
				filas = rs.getInt("contador");
			 }

		}catch(Exception e){
			System.out.println(e);
		}
					 
		return filas;

	}

}