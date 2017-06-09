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
 * Servlet implementation class Modifica_noticia
 */
@WebServlet("/Modifica_noticia")
public class Modifica_noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MNoticias modelo_noticias;
	private Conexion conexionBD;
	private String id;
	private String titular, contenido;
	private String edicionautor;
	private int envioArt;
       
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
        
        hs = request.getSession();
        
        Object[] datos_noticiario = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_noticiario[1].equals("N")){
			response.sendRedirect("error.jsp");
		}else{
								
			id = request.getParameter("id");
			titular = request.getParameter("titular");
			contenido = request.getParameter("contenido");
			edicionautor = datos_noticiario[2].toString();
			
			Calendar cal = Calendar.getInstance();
		    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    String fechaedicion = sdf.format(cal.getTime());
		
			
			envioArt = modelo_noticias.updateNoticia(  id,
													   titular,
													   contenido,
													   edicionautor,
													   fechaedicion);
			
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
