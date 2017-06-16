package controller.alumno.modificaperfil;

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
import model.MAlumno;

/**
 * Clase controladora - Control de modificaci�n de datos de usuario, en este caso Alumno.
 */
@WebServlet("Modificaperfilalumn")
public class Modificaperfilalumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MAlumno modelo_alumno;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilalumn() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_alumno = new MAlumno(conexionBD.getConexion());
		
        // Recogemos la session y los datos del usuario que entra a la plataforma.
		hs = request.getSession();
		Object[] datos_usu = (Object []) hs.getAttribute("identificacion");
		
		// Comprobamos que la session no sea null y adem�s, que el tipo de usuario sea s�lo sea acceso a Gestor y Alumno.
		if(hs.getAttribute("log") == null || !datos_usu[1].equals("G") && !datos_usu[1].equals("A")){
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
				id = datos_usu[0].toString();
				
				// Vamos a preparar el formato de fecha que venga de fecna.
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date fecna_date = null;
				
				// Realizamos el parseo al formato anterior.
				try {
					fecna_date =  sdf.parse(fecna);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				// Vamos a recoger el tiempo transcurrido desde 1970 en milisegundos.
				long time = new Date().getTime();
				// Como ese d�gito ser� tan largo, vamos a quedarnos con los 7 primeros.
				String time_str = String.valueOf(time).substring(0, 7);
				
				// Si lo recibido no es nulo, le aplicamos la regla del time delante de img.
				// Con esto conseguimos que el usuario cuando suba su imagen, no se duplique en nombre
				// si sube otra con el mismo.  Por ejemplo, 5454123_mi-imagen.jpg && 5467653_mi-imagen.jpg
				// Im�genes diferentes (o no) con el mismo nombre (la original) pero a la vez diferente
				// por el d�gito a�adido delante.
				if(img != null){
					img =  time_str+"_"+img;
				}
				
				// Si el par�metro recibido de la imagen no es nulo quiere decir que el usuario subi� una imagen.
				// De lo contrario llamamos al update de alumno pas�ndole como par�metro a�adido la imagen.
				if(img != null){
					modelo_alumno.updateAlumno(id, nombre, apellido1, apellido2, email, tlf, poblacion, calle, cp, nacido, nacionalidad, fecna_date, pass, img);
				}else{
					modelo_alumno.updateAlumno(id, nombre, apellido1, apellido2, email, tlf, poblacion, calle, cp, nacido, nacionalidad, fecna_date, pass);
				}
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados en otras pantallas.
				datos_usu = modelo_alumno.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_usu);
			
				// Env�o de los resultados por Gson.
				String modOK = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(modOK);
				
			}catch(Exception e){
				response.sendRedirect("acceso.jsp");
				System.out.println(e);
			}
			
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
