package controller.alumno.verincidencia;

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
 * Servlet implementation class Verincidencia
 */
@WebServlet("/Verincidencia_a")
public class Verincidencia_a extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencias;
	private Conexion conexionBD;
	private String id, incidencia;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verincidencia_a() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_incidencias = new MIncidencias(conexionBD.getConexion());
        
        hs = request.getSession();
        
        if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
		
			try{
				
				id = request.getParameter("id");
				
				incidencia = modelo_incidencias.dameIncidencia(id);
				
				String sendInci = new Gson().toJson(incidencia);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendInci);
				
			}catch(Exception e){
				response.sendRedirect("acceso/principal-alumno.jsp");
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
