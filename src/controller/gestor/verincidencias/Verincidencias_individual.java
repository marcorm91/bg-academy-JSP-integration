package controller.gestor.verincidencias;

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
 * Servlet implementation class Verincidencias_aindividual
 */
@WebServlet("/Verincidencias_individual")
public class Verincidencias_individual extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencia;
	private Conexion conexionBD;
	private String incidencia;
	private String id;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verincidencias_individual() {
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
        
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
							
			id = request.getParameter("id");
			
			incidencia = modelo_incidencia.dameIncidencia(id);
			
			String sendInci = new Gson().toJson(incidencia);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendInci);
			
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
