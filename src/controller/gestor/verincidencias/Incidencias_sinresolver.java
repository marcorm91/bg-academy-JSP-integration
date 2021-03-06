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
 * Clase controladora - Clase que se encargar� de mostrar el total de incidencias al gestor.
 */
@WebServlet("Incidencias_sinresolver")
public class Incidencias_sinresolver extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MIncidencias modelo_incidencia;
	private Conexion conexionBD;
	private int incidencias;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Incidencias_sinresolver() {
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
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        // Si la session log viene como nula (sin identificaci�n previa) � el usuario que viene no es de tipo Gestor...  
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			// Nos devuelve el n�mero de incidencias sin resolver por parte del profesor y el alumno.
			incidencias = modelo_incidencia.totalIncidencias();
			
			// Env�o de los resultados por Gson.
			String sendInci = new Gson().toJson(incidencias);
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
