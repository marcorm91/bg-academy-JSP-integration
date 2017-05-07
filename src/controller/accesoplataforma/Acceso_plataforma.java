package controller.accesoplataforma;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Conexion;
import model.MAlumno;
import model.MGestor;
import model.MNoticiero;
import model.MProfesor;

/**
 * Servlet implementation class Acceso_plataforma
 */
@WebServlet("/Acceso_plataforma")
public class Acceso_plataforma extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MAlumno modelo_alumno;
	private MProfesor modelo_profesor;
	private MGestor modelo_gestor;
	private MNoticiero modelo_noticiero;
	private Conexion conexionBD;
	private String user;
	private String pass;
	private boolean checkLogin_al, checkLogin_prof, checkLogin_gest, checkLogin_not;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Acceso_plataforma() {
        super();
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        modelo_gestor = new MGestor(conexionBD.getConexion());
        modelo_noticiero = new MNoticiero(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user = request.getParameter("user");
		pass = request.getParameter("pass");			
		
		//Comprobaci�n de igualdad entre user y pass en tabla alumno.
		checkLogin_al = modelo_alumno.checkLogin(user, pass);
		if(checkLogin_al){
			response.sendRedirect("acceso/principal-alumno.jsp");
			return;
		}else
			//Comprobaci�n de igualdad entre user y pass en tabla profesor.
			checkLogin_prof = modelo_profesor.checkLogin(user, pass);
			if(checkLogin_prof){
				response.sendRedirect("acceso/principal-profesor.jsp");	
				return;
			}else
				//Comprobaci�n de igualdad entre user y pass en tabla gestor.
				checkLogin_gest = modelo_gestor.checkLogin(user, pass);
				if(checkLogin_gest){
					response.sendRedirect("acceso/principal-gestor.jsp");
					return;
				}else
					//Comprobaci�n de igualdad entre user y pass en tabla noticiero.
					checkLogin_not = modelo_noticiero.checkLogin(user, pass);
					if(checkLogin_not){
						response.sendRedirect("acceso/principal-noticiario.jsp");
						return;
					//Si tras una comprobaci�n previa entre las 4 tablas no se cumple la igualidad entre
					//user y pass, retornamos a la misma p�gina de acceso (acceso.jsp).
					}else{
						response.sendRedirect("acceso.jsp");
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
