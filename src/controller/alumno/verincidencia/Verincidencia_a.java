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
 * Clase controladora - Se encargará de recoger la incidencia del alumno pasándole previamente el ID como parámetro.
 */
@WebServlet("Verincidencia_a")
public class Verincidencia_a extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencias;
	private Conexion conexionBD;
       
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
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_alumn = (Object []) hs.getAttribute("identificacion");
        
        // Comprobamos que la session no sea null o que el tipo de usuario sea de tipo Alumno...
        if(hs.getAttribute("log") == null || !datos_alumn[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
		
			try{
				
				String id, incidencia;
				
				id = request.getParameter("id");
				
				// Recogemos la incidencia pasándole como parámetro el ID.
				incidencia = modelo_incidencias.dameIncidencia(id);
				
				// Envío de los resultados por Gson.
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
