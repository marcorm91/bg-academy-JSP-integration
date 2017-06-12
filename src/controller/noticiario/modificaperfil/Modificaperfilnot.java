package controller.noticiario.modificaperfil;

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
import model.MNoticiero;

/**
 * Servlet implementation class Modificaperfilnot
 */
@WebServlet("/Modificaperfilnot")
public class Modificaperfilnot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MNoticiero modelo_noticiario;
	private String nombre, apellido1, apellido2, email, tlf, id, pass, img;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilnot() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_noticiario = new MNoticiero(conexionBD.getConexion());
		
		hs = request.getSession();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			Object[] datos_not = (Object []) hs.getAttribute("identificacion");
			
			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				pass = request.getParameter("pass");
				img = request.getParameter("imagen");
				id = datos_not[0].toString();
				
				long time = new Date().getTime();
				String time_str = String.valueOf(time).substring(0, 7);
				
				// Si lo recibido no es nulo, le aplicamos la regla del time delante de img.
				if(img != null){
					img =  time_str+"_"+img;
				}
					
				if(img != null){
					//Llamamos al modelo para actualizar los datos del usuario con los datos.
					modelo_noticiario.updateNoticiario_img(id, nombre, apellido1, apellido2, email, tlf, pass, img);
				}else{
					modelo_noticiario.updateNoticiario(id, nombre, apellido1, apellido2, email, tlf, pass);
				}
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados.
				datos_not = modelo_noticiario.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_not);
								
				String modOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(modOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso/profesor/principal-profesor.jsp");
				System.out.println(e);
			}
						
		}
		
		// ¡IMPORTANTE! Cerrar la conexión BD.
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
