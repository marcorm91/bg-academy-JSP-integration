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
 * Clase controladora - Recogerá todas las incidencias del alumno pasándole como parámetro el ID del mismo.
 */
@WebServlet("Verincidenciasalumn")
public class Verincidenciasalumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencia;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verincidenciasalumn() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_incidencia = new MIncidencias(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_alumn = (Object []) hs.getAttribute("identificacion");
        
        // Comprobamos que la session no sea null o que el tipo de usuario sea de tipo Alumno...
        if(hs.getAttribute("log") == null || !datos_alumn[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
			
			Object incidencias[][];
			String id;
						
			id = datos_alumn[0].toString();
				
			// Recoge todas las incidencias del alumno pasándole previamente el ID como parámetro.
			incidencias = modelo_incidencia.devuelveIncidenciasAlumn(id);
		
			// Envío de los resultados por Gson.
			String sendIncidencias = new Gson().toJson(incidencias);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendIncidencias);
			
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
