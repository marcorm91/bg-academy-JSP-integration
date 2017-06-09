package controller.gestor.modificaperfil;

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
import model.MGestor;

/**
 * Servlet implementation class Miperfil
 */
@WebServlet("/Modificarperfilgest")
public class Modificaperfilgest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MGestor modelo_gestor;
	private String nombre, apellido1, apellido2, email, tlf, id, pass, img;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilgest() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_gestor = new MGestor(conexionBD.getConexion());

		hs = request.getSession();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			Object[] datos_gest = (Object []) hs.getAttribute("identificacion");
			
			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				pass = request.getParameter("pass");
				img = request.getParameter("imagen");
				id = datos_gest[0].toString();
				
				long time = new Date().getTime();
				String time_str = String.valueOf(time).substring(0, 7);
				
				img =  time_str+"_"+img;
								
				//Llamamos al modelo para actualizar los datos del usuario con los datos.
				modelo_gestor.updateGestor(id, nombre, apellido1, apellido2, email, tlf, pass, img);
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados.
				datos_gest = modelo_gestor.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_gest);
							
				String modOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(modOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso/gestor/mi-perfil.jsp");
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
