package controller.gestor.regelemento;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class Regnoticiario
 */
@WebServlet("/Regnoticiario")
public class Regnoticiario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private MProfesor modelo_profesor;
	private MGestor modelo_gestor;
	private MNoticiero modelo_noticiario;
	private Conexion conexionBD;
	private String nombre, apellido1, apellido2, nif, email, tlf;
	private String fecalta;
	private boolean existeAlumno, existeProfesor, existeGestor, existeNoticiario;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regnoticiario() {
        super();
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        modelo_gestor = new MGestor(conexionBD.getConexion());
        modelo_noticiario = new MNoticiero(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		hs = request.getSession();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			try{
				
				nif = request.getParameter("nif");
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				fecalta = request.getParameter("fecalta");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
									
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecalta_date = null;
				
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
					return;
				}else{
				
					File dir = new File("WebContent/recursos/noticiario/"+nif+"/fotopersonal");
					dir.mkdirs();
					
					dir = new File("WebContent/recursos/noticiario/"+nif+"/dirpersonal");
					dir.mkdirs();
					
			
					modelo_noticiario.registraNoticiario(		nombre, 
																apellido1, 
																apellido2, 
																nif, 
																fecalta_date,
																email,
																tlf );
					
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
