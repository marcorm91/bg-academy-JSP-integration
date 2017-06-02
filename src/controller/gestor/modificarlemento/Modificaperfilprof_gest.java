package controller.gestor.modificarlemento;

import java.io.IOException;
import java.sql.SQLException;
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
import model.MProfesor;

/**
 * Servlet implementation class Modificaperfilprof_gest
 */
@WebServlet("/Modificaperfilprof_gest")
public class Modificaperfilprof_gest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;
	private String id;
	private String nombre, apellido1, apellido2, usuario, fecna, tlf, nif, nacimiento, nacionalidad, calle, cp, provincia, poblacion, email;
	private int envioProf;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilprof_gest() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
								
			id = request.getParameter("id");
			nombre = request.getParameter("nombre");
			apellido1 = request.getParameter("apellido1");
			apellido2 = request.getParameter("apellido2");
			usuario = request.getParameter("usuario");
	     	fecna = request.getParameter("fnac");
			nif = request.getParameter("nif");
			nacimiento = request.getParameter("nacimiento");
			nacionalidad = request.getParameter("nacionalidad");
			calle = request.getParameter("calle");
			cp = request.getParameter("cp");
			tlf = request.getParameter("tlf");
			provincia = request.getParameter("provincia");
			poblacion = request.getParameter("poblacion");
			email = request.getParameter("email");
									
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date fecna_date = null;
			
			try {
				fecna_date =  sdf.parse(fecna);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
			envioProf = modelo_profesor.updateProfesor(id,
													   nombre,
													   apellido1,
													   apellido2,
													   usuario,
													   tlf,
													   nif,
													   nacimiento,
													   fecna_date,
													   nacionalidad,
													   calle,
													   cp,
													   provincia,
													   poblacion,
													   email);
			
			String sendProf = new Gson().toJson(envioProf);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendProf);
			
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
