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
 * Clase controladora - Llamamos al modelo de actividades para que �ste nos devuelva todos los ex�menes
 * de un curso y promoci�n determinados.
 */
@WebServlet("/Ver_examenes")
public class Ver_examenes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MActividades modelo_actividades;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ver_examenes() {
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
		
        // Si la session log viene como nula (sin identificaci�n previa) � el alumno que viene no es de tipo Alumno...
		if(hs.getAttribute("log") == null || !datos_alumn[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
			
			String anioprom, cursoasign;
			Object actividades[][];
			
			anioprom = datos_alumn[16].toString();
			cursoasign = datos_alumn[17].toString();
			
			// Llamamos al modelo para realizar la consulta sobre los ex�menes en la BD pas�ndole
			// como par�metros el a�o de promoci�n y el curso asignado del alumno y a qu� tipo de
			// actividad se referir�, en este caso Examen.
			actividades = modelo_actividades.dameActividades(anioprom, cursoasign, "E");
			
			// Env�o de los resultados por Gson.
			String sendActividades = new Gson().toJson(actividades);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendActividades);
			
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
