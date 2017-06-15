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
 * Clase controladora - Control de modificación de datos de usuario, en este caso Gestor.
 */
@WebServlet("/Modificarperfilgest")
public class Modificaperfilgest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MGestor modelo_gestor;
       
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

        // Recogemos la session y los datos del usuario que entra a la plataforma.
		hs = request.getSession();
		Object[] datos_gest = (Object []) hs.getAttribute("identificacion");
		
		// Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Gestor...      
		if(hs.getAttribute("log") == null || !datos_gest[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			String nombre, apellido1, apellido2, email, tlf, id, pass, img;
			
			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				pass = request.getParameter("pass");
				img = request.getParameter("imagen");
				id = datos_gest[0].toString();
					
				// Vamos a recoger el tiempo transcurrido desde 1970 en milisegundos.
				long time = new Date().getTime();
				// Como ese dígito será tan largo, vamos a quedarnos con los 7 primeros.
				String time_str = String.valueOf(time).substring(0, 7);
				
				// Si lo recibido no es nulo, le aplicamos la regla del time delante de img.
				// Con esto conseguimos que el usuario cuando suba su imagen, no se duplique en nombre
				// si sube otra con el mismo.  Por ejemplo, 5454123_mi-imagen.jpg && 5467653_mi-imagen.jpg
				// Imágenes diferentes (o no) con el mismo nombre (la original) pero a la vez diferente
				// por el dígito añadido delante.
				if(img != null){
					img =  time_str+"_"+img;
				}
				
				// Si el parámetro recibido de la imagen no es nulo quiere decir que el usuario subió una imagen.
				// De lo contrario llamamos al update de gestor pasándole como parámetro añadido la imagen.
				if(img != null){
					//Llamamos al modelo para actualizar los datos del usuario con los datos.
					modelo_gestor.updateGestor(id, nombre, apellido1, apellido2, email, tlf, pass, img);
				}else{
					modelo_gestor.updateGestor(id, nombre, apellido1, apellido2, email, tlf, pass);
				}
				
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados en otras pantallas.
				datos_gest = modelo_gestor.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_gest);
					
				// Envío de los resultados por Gson.
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
