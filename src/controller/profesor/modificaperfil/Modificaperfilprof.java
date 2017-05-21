package controller.profesor.modificaperfil;

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
 * Servlet implementation class Modificaperfilprof
 */
@WebServlet("/Modificaperfilprof")
public class Modificaperfilprof extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private String id, nombre, apellido1, apellido2, email, poblacion, calle, cp, nacido, nacionalidad, fecna, tlf, pass;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilprof() {
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
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			Object[] datos_prof = (Object []) hs.getAttribute("identificacion");
			
			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				poblacion = request.getParameter("poblacion");
				calle = request.getParameter("calle");
				cp = request.getParameter("cp");
				nacido = request.getParameter("nacido");
				nacionalidad = request.getParameter("nacionalidad");
				fecna = request.getParameter("fecna");
				pass = request.getParameter("pass");
				id = datos_prof[0].toString();
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecna_date = null;
				
				try {
					fecna_date =  sdf.parse(fecna);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				//Llamamos al modelo para actualizar los datos del usuario con los datos.
				modelo_profesor.updateProfesor(id, nombre, apellido1, apellido2, email, tlf, poblacion, calle, cp, nacido, nacionalidad, fecna_date, pass);
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados.
				datos_prof = modelo_profesor.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_prof);
			
				String modOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(modOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso/profesor/mi-perfil.jsp");
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
