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

import model.Conexion;
import model.MAlumno;


/**
 * Servlet implementation class Regalumno
 */
@WebServlet("/Regalumno")
public class Regalumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private Conexion conexionBD;
	private String nombre, apellido1, apellido2, nif, nacimiento, nacionalidad, calle, cp, poblacion, provincia, email, tlf, anioprom, cursoasign, comentarios;
	private String fecna, fecalta;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regalumno() {
        super();
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
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
				nombre = request.getParameter("nombre-alumno");
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
				anioprom = request.getParameter("anio-curso");
				cursoasign = request.getParameter("curso");
				comentarios = request.getParameter("comentarios");
									
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
				
				File dir = new File("WebContent/recursos/alumnos/"+nif+"/fotopersonal");
				dir.mkdirs();
				
				dir = new File("WebContent/recursos/alumnos/"+nif+"/dirpersonal");
				dir.mkdirs();
				
		
				modelo_alumno.registraAlumno(		nombre, 
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
													cursoasign,
													comentarios);
				
				response.sendRedirect("acceso/principal-gestor.jsp");

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
