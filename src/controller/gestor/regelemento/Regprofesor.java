package controller.gestor.regelemento;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Conexion;
import model.MAlumno;
import model.MGestor;
import model.MNoticiero;
import model.MProfesor;

/**
 * Clase controladora - Clase que se encargará de procesar el registro del profesor.
 */
@WebServlet("Regprofesor")
public class Regprofesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private MProfesor modelo_profesor;
	private MGestor modelo_gestor;
	private MNoticiero modelo_noticiario;
	private Conexion conexionBD;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regprofesor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        modelo_gestor = new MGestor(conexionBD.getConexion());
        modelo_noticiario = new MNoticiero(conexionBD.getConexion());
			
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
     		
         // Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Gestor...  
 		if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{

			try{
				
				String nombre, apellido1, apellido2, nif, nacimiento, nacionalidad, calle, cp, poblacion, provincia, email, tlf, anioprom;
				String fecna, fecalta;
				String cursoimp;
				String idcursos;
				String pass;
				boolean existeAlumno, existeProfesor, existeGestor, existeNoticiario;
				
				nif = request.getParameter("nif");
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				fecna = request.getParameter("fecna");
				nacimiento = request.getParameter("nacimiento");
				nacionalidad = request.getParameter("nacionalidad");
				calle = request.getParameter("calle");
				cp = request.getParameter("cp");
				poblacion = request.getParameter("poblacion");
				provincia = request.getParameter("provincia");
				fecalta = request.getParameter("fecalta");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				anioprom = request.getParameter("aniocurso");
				cursoimp = request.getParameter("cursos");
				idcursos = request.getParameter("idcursos");
				
				// Instanciamos el tipo de formato para posteriormente parsear la fecha que nos envíe el usuario.									
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecna_date = null;
				Date fecalta_date = null;
				
				// Parseo de la fecha recibida para hacer el insert en la Base de Datos del profesor.
				try {
					fecna_date =  sdf.parse(fecna);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				try {
					fecalta_date = sdf.parse(fecalta);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				// Haremos una consulta previa sobre los distintos modelos de usuario.
				// Desde el alumno hasta el noticiario comprobamos si el NIF con el que se registra el usuario
				// ya existe en la Base de Datos.
				// Esa existencia devolverá true en el caso de su existencia o false si no es así.
				existeAlumno = modelo_alumno.compruebaExistencia(nif);
				existeProfesor = modelo_profesor.compruebaExistencia(nif);
				existeGestor = modelo_gestor.compruebaExistencia(nif);
				existeNoticiario = modelo_noticiario.compruebaExistencia(nif);
				
				String existe = "";
				
				// En el caso de que se cumpla uno de los booleanos no se realizará el registro en la BD.
				if(existeAlumno || existeProfesor || existeGestor || existeNoticiario){
					existe = new Gson().toJson("1");
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(existe);
				}else{
				
					// De no ser así, y ese usuario no exista, vamos a proceder con la creación.
					
					// En primer lugar vamos a crear su directorio personal del cual colgarán dos subdirectorios.
					// Este subdirectorio nos servirá para localizar posteriormente su foto personal y así imprimiarla
					// por pantalla.
					File dir = new File("WebContent/recursos/profesores/"+nif+"/fotopersonal");
					dir.mkdirs();
					
					// Y este subdirectorio servirá para otro tipo de recursos en relación al usuario.		
					dir = new File("WebContent/recursos/profesores/"+nif+"/dirpersonal");
					dir.mkdirs();
					
					// Generación de contraseña aleatoria al profesor.
					pass = getCadenaAlfanumAleatoria(6);
					
					// Realiza el registro del profesor.
					modelo_profesor.registraProfesor(	nombre, 
														apellido1, 
														apellido2, 
														nif, 
														pass,
														fecna_date, 
														nacimiento, 
														nacionalidad, 
														calle, 
														cp, 
														poblacion, 
														provincia,
														fecalta_date,
														email,
														tlf,
														anioprom,
														cursoimp,
														idcursos);
				
					// Envío de los resultados por Gson.
					existe = new Gson().toJson("0");
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(existe);
				}

			}catch(Exception e){
				response.sendRedirect("acceso/principal-gestor.jsp");
				System.out.println(e);
			}
		}
		
		//¡IMPORTANTE! Cerrar la conexión.
		try {
			conexionBD.getConexion().close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	/**
	 * Genera una cadena alfanumérica aleatoria con una longitud pasada por parámetro.
	 * @param longitud Número de caracteres que tendrá la contraseña.
	 * @return Devuelve la cadena alfanumérica random.
	 */
	private String getCadenaAlfanumAleatoria (int longitud){
		String cadenaAleatoria = "";
		long milis = new java.util.GregorianCalendar().getTimeInMillis();
		Random r = new Random(milis);
		int i = 0;
		
		while ( i < longitud){
			char c = (char)r.nextInt(255);
			
			if ( (c >= '0' && c <='9') || (c >='A' && c <='Z') ){
				cadenaAleatoria += c;
				i++;
			}
		}
		
		return cadenaAleatoria;
	}

}
