package controller.alumno.regincidencia;

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
 * Clase controladora - Se encargar� de registrar una incidencia por parte del usuario Alumno.
 */
@WebServlet("Regincidenciaalumn")
public class Regincidenciaalumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MIncidencias modelo_incidencias;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regincidenciaalumn() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Reopen temporal de la BD.
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
				
				String incidencia, id;
				
				// Recogemos el texto que nos env�a el usuario (alumno) de la incidencia y su ID.
				incidencia = request.getParameter("alumnincidencia");
				id = datos_alumn[0].toString();
				
				// Vamos a registrar en el modelo de incidencias la incidencia en s� y el ID del usuario
				// que deja la incidencia.
				modelo_incidencias.registraIncidenciaAlumn(id, incidencia);
				
				// Env�o de los resultados por Gson.
				String inciOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(inciOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso/principal-alumno.jsp");
				System.out.println(e);
			}
			
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
