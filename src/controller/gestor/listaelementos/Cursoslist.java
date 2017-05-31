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
import model.MCurso;

/**
 * Servlet implementation class Cursoslist
 */
@WebServlet("/Cursoslist")
public class Cursoslist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;
	private Object cursos[][];
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cursoslist() {
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
        
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			cursos = modelo_curso.devuelveCursos();
		
			String sendCursos = new Gson().toJson(cursos);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendCursos);
			
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
