package controller.noticiario.noticia;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
 * Clase controladora - Modifica la noticia desde el panel del Noticiario.
 */
@WebServlet("/Modifica_noticia")
public class Modifica_noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MNoticias modelo_noticias;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifica_noticia() {
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
        Object[] datos_noticiario = (Object []) hs.getAttribute("identificacion");
        
        // Comprobamos que la session no sea null y además, que el tipo de usuario sea sólo sea acceso a Noticiario.
        if(hs.getAttribute("log") == null || !datos_noticiario[1].equals("N")){
			response.sendRedirect("error.jsp");
		}else{
			
			String id;
			String titular, contenido;
			String edicionautor;
			int envioArt;
								
			id = request.getParameter("id");
			titular = request.getParameter("titular");
			contenido = request.getParameter("contenido");
			edicionautor = datos_noticiario[2].toString();
			
			// Capturamos la fecha actual.
			Calendar cal = Calendar.getInstance();
		    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    String fechaedicion = sdf.format(cal.getTime());
		
			// Esta variable nos devolverá el número de artículos que se modificaron.
			envioArt = modelo_noticias.updateNoticia(  id,
													   titular,
													   contenido,
													   edicionautor,
													   fechaedicion);
			
			// Envío de los resultados por Gson.
			String sendProf = new Gson().toJson(envioArt);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendProf);
			
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
