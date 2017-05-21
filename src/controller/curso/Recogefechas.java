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
 * Servlet implementation class Recogefechas
 */
@WebServlet("/Recogefechas")
public class Recogefechas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;
	private String [][] fechas;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recogefechas() {
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
				//Llamamos al modelo para realizar la consulta sobre las fechas en la BD.
				fechas = modelo_curso.devuelveFechas();
							
				String sendFechas = new Gson().toJson(fechas);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendFechas);
								
			}catch(Exception e){
				response.sendRedirect("acceso/noticiario/mi-perfil.jsp");
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
