package controller.profesor.verincidencia;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Conexion;
import model.MIncidencias;

/**
 * Servlet implementation class Verincidenciasalumn
 */
@WebServlet("/Verincidenciasprof")
public class Verincidenciasprof extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencia;
	private Conexion conexionBD;
	private Object incidencias[][];
	private String id;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verincidenciasprof() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_incidencia = new MIncidencias(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_prof = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_prof[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{

			id = datos_prof[0].toString();
						
			incidencias = modelo_incidencia.devuelveIncidenciasProf(id);
		
			String sendIncidencias = new Gson().toJson(incidencias);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendIncidencias);
			
		}
					        
        //ˇIMPORTANTE! Cerrar la conexión.
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
