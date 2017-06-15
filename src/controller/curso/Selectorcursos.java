package controller.curso;

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
import model.MCurso;

/**
 * Clase controladora - Clase que se encargará de recoger todos los cursos existentes en la Base de Datos.
 */
@WebServlet("/Selectorcursos")
public class Selectorcursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Selectorcursos() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_curso = new MCurso(conexionBD.getConexion());
        
        hs = request.getSession();
        
        // Si la session log viene como nula...
        if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
						
			try{	
				
				String [][] cursos;
				String anios;
				
				anios = request.getParameter("anio");
				
				// Vamos a splitear el parámetro que venga por parte del usuario.  Con esto vamos a conseguir
				// dividir el año de promoción en 2 variables (año inicio - año fin).  
				// Este parámetro viene previamente como uno sólo.
				String split_anios[] = anios.split("-");
				String anio1 = split_anios[0].trim();
				String anio2 = split_anios[1].trim();
								
				//Llamamos al modelo para realizar la consulta sobre las fechas en la BD.
				cursos = modelo_curso.devuelveCursos(anio1, anio2);
					
				// Envío de los resultados por Gson.
				String sendCursos = new Gson().toJson(cursos);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendCursos);
								
			}catch(Exception e){
				response.sendRedirect("acceso.jsp");
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
