package controller.noticiario.noticia;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

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
 * Servlet implementation class Registra_noticia
 */
@WebServlet("/Registra_noticia")
public class Registra_noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private MNoticias modelo_noticias;
	private HttpSession hs;
	private String idnot, titular, contenido, rutaImg;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registra_noticia() {
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
        
        Object[] datos_not = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("identificacion") == null  || !datos_not[1].equals("N")){  
			response.sendRedirect("error.jsp");
		}else{
			
			titular = request.getParameter("titnoticia");
			contenido = request.getParameter("contenido");
			rutaImg = request.getParameter("imagen");
						
			int rowsInsert = 0;
			idnot = datos_not[0].toString();
			
			long time = new Date().getTime();
			String time_str = String.valueOf(time).substring(0, 7);
			
			rutaImg =  time_str+"_"+rutaImg;
			
			rowsInsert = modelo_noticias.registraNoticia(idnot, titular, contenido, rutaImg);
			
			String sendRegs = new Gson().toJson(rowsInsert);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendRegs);			
						
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
