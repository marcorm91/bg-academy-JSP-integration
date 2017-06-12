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
 * Servlet implementation class Selectorcursos
 */
@WebServlet("/Selectorcursos")
public class Selectorcursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;
	private String [][] cursos;
	private String anios;
       
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
        
        if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
						
			try{		
				
				anios = request.getParameter("anio");
				
				String split_anios[] = anios.split("-");
				String anio1 = split_anios[0].trim();
				String anio2 = split_anios[1].trim();
								
				//Llamamos al modelo para realizar la consulta sobre las fechas en la BD.
				cursos = modelo_curso.devuelveCursos(anio1, anio2);
						
				String sendCursos = new Gson().toJson(cursos);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendCursos);
								
			}catch(Exception e){
				response.sendRedirect("error.jsp");
				System.out.println(e);
			}
			
		}
		
		//ˇIMPORTANTE! Cerrar la conexión.
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
