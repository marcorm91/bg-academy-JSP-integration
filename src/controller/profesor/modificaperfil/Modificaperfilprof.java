package controller.profesor.modificaperfil;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.Conexion;
import model.MProfesor;

/**
 * Clase controladora - Control de modificación de datos de usuario, en este caso Profesor.
 */
@WebServlet("Modificaperfilprof")
public class Modificaperfilprof extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private HttpSession hs;
	private MProfesor modelo_profesor;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilprof() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_prof = (Object []) hs.getAttribute("identificacion");
		
		// Comprobamos que la session no sea null y además, que el tipo de usuario sea sólo sea acceso a Profesor.
		if(hs.getAttribute("log") == null || !datos_prof[1].equals("P")){
			response.sendRedirect("error.jsp");
		}else{
			
			String id, nombre, apellido1, apellido2, email, poblacion, calle, cp, nacido, nacionalidad, fecna, tlf, pass, img;

			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				poblacion = request.getParameter("poblacion");
				calle = request.getParameter("calle");
				cp = request.getParameter("cp");
				nacido = request.getParameter("nacido");
				nacionalidad = request.getParameter("nacionalidad");
				fecna = request.getParameter("fecna");
				pass = request.getParameter("pass");
				img = request.getParameter("imagen");
				id = datos_prof[0].toString();
				
				// Parseo de la fecha de nacimiento.
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecna_date = null;
				
				try {
					fecna_date =  sdf.parse(fecna);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
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
				// De lo contrario llamamos al update de alumno pasándole como parámetro añadido la imagen.
				if(img != null){
					modelo_profesor.updateProfesor(id, nombre, apellido1, apellido2, email, tlf, poblacion, calle, cp, nacido, nacionalidad, fecna_date, pass, img);
				}else{
					modelo_profesor.updateProfesor(id, nombre, apellido1, apellido2, email, tlf, poblacion, calle, cp, nacido, nacionalidad, fecna_date, pass);
				}
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados.
				datos_prof = modelo_profesor.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_prof);
			
				// Envío de los resultados por Gson.
				String modOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(modOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso/profesor/mi-perfil.jsp");
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
