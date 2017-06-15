package controller.gestor.listaelementos;

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
import model.MAlumno;

/**
 * Clase controladora - Clase que se encargará de tratar el control de datos por parte del alumno.
 */
@WebServlet("/Alumn_individual")
public class Alumn_individual extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private Conexion conexionBD;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alumn_individual() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_usu = (Object []) hs.getAttribute("identificacion");
          
		// Comprobamos que la session no sea null y además, que el tipo de usuario sea sólo sea acceso a Gestor y Profesor.
        if(hs.getAttribute("log") == null || !datos_usu[1].equals("G") && !datos_usu[1].equals("P")){
			response.sendRedirect("error.jsp");
		}else{
			
			Object alumno[];
			String id;
							
			id = request.getParameter("id");
			
			// Vamos a recoger el alumno de la Base de Datos pasándole previamente por parámetro la ID del mismo.
			alumno = modelo_alumno.dameDatosPorID(id);
			
			// Envío de los resultados por Gson.
			String sendAlumn = new Gson().toJson(alumno);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendAlumn);
			
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
