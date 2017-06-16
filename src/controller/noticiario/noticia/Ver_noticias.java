package controller.noticiario.noticia;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Conexion;
import model.MNoticias;

/**
 * Servlet implementation class Ver_noticias
 */
@WebServlet("Ver_noticias")
public class Ver_noticias extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private MNoticias modelo_noticias;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ver_noticias() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_noticias = new MNoticias(conexionBD.getConexion()); 
        
		Object noticias[][];
   
		// Obtenemos todas las noticias registradas en la Base de Datos.
		noticias = modelo_noticias.dameNoticias();
		
		// Envío de los resultados por Gson.
		String sendRegs = new Gson().toJson(noticias);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(sendRegs);
						
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
