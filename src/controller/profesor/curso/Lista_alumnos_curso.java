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
import model.MAlumno;

/**
 * Clase controladora - Lista el número de alumnos en relación al año de promoción y curso del profesor.
 */
@WebServlet("/Lista_alumnos_curso")
public class Lista_alumnos_curso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Lista_alumnos_curso() {
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
        Object[] datos_profesor = (Object []) hs.getAttribute("identificacion");
        
        // Si la session log viene como nula (sin identificación previa) ó el alumno que viene no es de tipo Profesor...
        if(hs.getAttribute("log") == null || !datos_profesor[1].equals("P")){
			response.sendRedirect("error.jsp");
		}else{
			
			Object alumnos[][];
			String anioprom_prof, cursosasign_prof;
			
			anioprom_prof = datos_profesor[17].toString();
			cursosasign_prof = datos_profesor[21].toString();
			
			cursosasign_prof = cursosasign_prof.substring(1, cursosasign_prof.length()-1);
			
			// Nos devolverá un listado de alumnos en relación al año de promoción y los cursos asignados del profesor.
			alumnos = modelo_alumno.alumnosPorCurso(anioprom_prof, cursosasign_prof);
			
			// Envío de los resultados por Gson.
			String sendAlumnos = new Gson().toJson(alumnos);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendAlumnos);
			
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
