package controller.noticiario.noticia;

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
import model.MNoticias;

/**
 * Clase controladora - Elimina la noticia desde el panel del Noticiario.
 */
@WebServlet("Elimina_noticia")
public class Elimina_noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private MNoticias modelo_noticias;
	private HttpSession hs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Elimina_noticia() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_noticias = new MNoticias(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_not = (Object []) hs.getAttribute("identificacion");
        
        // Comprobamos que la session no sea null y adem�s, que el tipo de usuario sea s�lo sea acceso a Noticiario.
        if(hs.getAttribute("identificacion") == null  || !datos_not[1].equals("N")){  
			response.sendRedirect("error.jsp");
		}else{
			
			String id;
			id = request.getParameter("id");
			int rowDelete;
			
			// La variable nos devolver� el n�mero de noticias eliminadas cuando llamamos al m�todo.
			rowDelete = modelo_noticias.eliminaNoticia(id);
			
			// Env�o de los resultados por Gson.
			String sendRegs = new Gson().toJson(rowDelete);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendRegs);
						
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
