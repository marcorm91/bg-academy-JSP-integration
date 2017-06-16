package controller.gestor.resolucionincidencias;

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
 * Clase controladora - Clase que se encargar� de proceder con la aceptaci�n de una incidencia.
 */
@WebServlet("Resolucion_s")
public class Resolucion_s extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencia;
	private Conexion conexionBD;
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Resolucion_s() {
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
			
			String id;
			String updateDate;
							
			id = request.getParameter("id");
			
			// Tras recoger el ID de la incidencia vamos a proceder a actualizarla siendo �sta aceptada por parte
			// del gestor.
			updateDate = modelo_incidencia.updateInci_s(id);
			
			// Env�o de los resultados por Gson.
			String sendInci = new Gson().toJson(updateDate);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendInci);
			
		}
					        
        //�IMPORTANTE! Cerrar la conexi�n.
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
