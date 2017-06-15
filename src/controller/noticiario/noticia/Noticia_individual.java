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
 * Clase controladora - Captura todos los datos de la noticia seleccionada por parte del usuario.
 */
@WebServlet("/Noticia_individual")
public class Noticia_individual extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MNoticias modelo_noticias;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Noticia_individual() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_noticias = new MNoticias(conexionBD.getConexion());
                
    	Object noticia[];
    	String id;
        			
		id = request.getParameter("id");
		
		// Cogemos el ID de la noticia a través del request (por data-id) y lo enviamos al modelo
		// para capturar todos los datos necesarios en relación a la noticia.
		noticia = modelo_noticias.dameDatosPorID(id);
		
		// Envío de los resultados por Gson.
		String sendNot = new Gson().toJson(noticia);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(sendNot);
			
		        
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
