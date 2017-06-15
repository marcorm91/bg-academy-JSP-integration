package controller.profesor.curso;

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
import model.MProfesor;

/**
 * Clase controladora - Recoge los cursos en relación a los alumnos y profesores.
 */
@WebServlet("/Recoge_cursos")
public class Recoge_cursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recoge_cursos() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_profesor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
						
			try{
				
				String id;
				String cursos;
				
				id = datos_profesor[0].toString();
												
				//Llamamos al modelo para realizar la consulta sobre las fechas en la BD.
				cursos = modelo_profesor.devuelveCursos(id);
				
				// Los cursos nos llegará en un array, por lo que tendremos que splitear por comas.
				cursos = cursos.substring(1, cursos.length()-1);
				
				String [] split = cursos.split(",");
								
				for(int i = 0; i < split.length; i++){
					split[i] = split[i].trim();
				}
				
				// Envío de los resultados por Gson.
				String sendCursos = new Gson().toJson(split);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendCursos);
								
			}catch(Exception e){
				response.sendRedirect("error.jsp");
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
