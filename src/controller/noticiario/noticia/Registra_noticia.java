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
 * Clase controladora - Clase que controla el registro de noticias por parte del Noticiario.
 */
@WebServlet("/Registra_noticia")
public class Registra_noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private MNoticias modelo_noticias;
	private HttpSession hs;
       
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
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_not = (Object []) hs.getAttribute("identificacion");
        
        // Comprobamos que la session no sea null y además, que el tipo de usuario sea sólo sea acceso a Noticiario.
        if(hs.getAttribute("identificacion") == null  || !datos_not[1].equals("N")){  
			response.sendRedirect("error.jsp");
		}else{
			
			String idnot, titular, contenido, rutaImg;
			
			titular = request.getParameter("titnoticia");
			contenido = request.getParameter("contenido");
			rutaImg = request.getParameter("imagen");
						
			int rowsInsert = 0;
			idnot = datos_not[0].toString();
			
			// Vamos a recoger el tiempo transcurrido desde 1970 en milisegundos.
			long time = new Date().getTime();
			// Como ese dígito será tan largo, vamos a quedarnos con los 7 primeros.
			String time_str = String.valueOf(time).substring(0, 7);
			
			// Vamos a aplicarle esos segundos al nombre de la imagen.
			rutaImg =  time_str+"_"+rutaImg;
			
			// Realizamos el insert de la noticia y nos devolverá el número de filas que se registraron.
			rowsInsert = modelo_noticias.registraNoticia(idnot, titular, contenido, rutaImg);
			
			// Envío de los resultados por Gson.
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
