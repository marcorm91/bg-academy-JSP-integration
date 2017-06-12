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
 * Servlet implementation class Lista_alumnos_curso
 */
@WebServlet("/Lista_alumnos_curso")
public class Lista_alumnos_curso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MAlumno modelo_alumno;
	private Conexion conexionBD;
	private Object alumnos[][];
	private String anioprom_prof, cursosasign_prof;
       
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
        
        hs = request.getSession();
        
        Object[] datos_profesor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_profesor[1].equals("P")){
			response.sendRedirect("error.jsp");
		}else{
			
			anioprom_prof = datos_profesor[17].toString();
			cursosasign_prof = datos_profesor[21].toString();
			
			cursosasign_prof = cursosasign_prof.substring(1, cursosasign_prof.length()-1);
			
			alumnos = modelo_alumno.alumnosPorCurso(anioprom_prof, cursosasign_prof);
			
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
