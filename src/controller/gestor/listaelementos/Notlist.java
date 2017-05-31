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
import model.MNoticiero;

/**
 * Servlet implementation class Notlist
 */
@WebServlet("/Notlist")
public class Notlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MNoticiero modelo_noticiero;
	private Conexion conexionBD;
	private Object noticiarios[][];
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notlist() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_noticiero = new MNoticiero(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{

			noticiarios = modelo_noticiero.devuelveNoticiarios();
		
			String sendNoticiarios = new Gson().toJson(noticiarios);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendNoticiarios);
			
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