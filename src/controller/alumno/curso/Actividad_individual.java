package controller.alumno.curso;

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
import model.MActividades;

/**
 * Clase controladora - Recoge los detalles de una actividad para mostrar el resultado de lo devuelto
 * en un modal al usuario.
 */
@WebServlet("Actividad_individual")
public class Actividad_individual extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MActividades modelo_actividades;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Actividad_individual() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_actividades = new MActividades(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_alumn = (Object []) hs.getAttribute("identificacion");
		
        // Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Alumno...
		if(hs.getAttribute("log") == null || !datos_alumn[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
			
			Object actividad[];
			String idactividad;
			
			// Recogemos el ID de la actividad que nos pasa el usuario desde la vista a través de un data-id.
			idactividad = request.getParameter("idactividad");
			
			// Recogemos todos los datos de dicha actividad para ingresarlos en un array.  Éste será posteriormente
			// impreso por pantalla para la muestra de la misma al usuario.
			actividad = modelo_actividades.dameActividad(idactividad);
			
			// Envío de los resultados por Gson.
			String sendActividades = new Gson().toJson(actividad);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendActividades);
			
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
