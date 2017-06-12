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
 * Servlet implementation class Recoge_anio
 */
@WebServlet("/Recoge_anio")
public class Recoge_anio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;
	private String anio, id;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recoge_anio() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_profesor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_profesor[1].equals("P")){
			response.sendRedirect("error.jsp");
		}else{
						
			try{
				
				id = datos_profesor[0].toString();
				
				//Llamamos al modelo para realizar la consulta sobre las fechas en la BD.
				anio = modelo_profesor.devuelveFechas(id);
											
				String sendFechas = new Gson().toJson(anio);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendFechas);
								
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
