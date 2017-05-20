package controller.gestor.regelemento;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
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
 * Servlet implementation class Regprofesor
 */
@WebServlet("/Regprofesor")
public class Regprofesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private MProfesor modelo_profesor;
	private MGestor modelo_gestor;
	private MNoticiero modelo_noticiario;
	private Conexion conexionBD;
	private String nombre, apellido1, apellido2, nif, nacimiento, nacionalidad, calle, cp, poblacion, provincia, email, tlf, anioprom;
	private String fecna, fecalta;
	private String cursoimp;
	private boolean existeAlumno, existeProfesor, existeGestor, existeNoticiario;
	
       
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
			
		hs = request.getSession();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{

			try{
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
													
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecna_date = null;
				Date fecalta_date = null;
				
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
				
					File dir = new File("WebContent/recursos/profesores/"+nif+"/fotopersonal");
					dir.mkdirs();
					
					dir = new File("WebContent/recursos/profesores/"+nif+"/dirpersonal");
					dir.mkdirs();
					
			
					modelo_profesor.registraProfesor(	nombre, 
														apellido1, 
														apellido2, 
														nif, 
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
														cursoimp);
				
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

}
