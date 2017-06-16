package controller.gestor.modificarlemento;

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
import model.MGestor;

/**
 * Clase controladora - Clase que controlará la modificación del Gestor por parte del usuario Gestor.
 */
@WebServlet("Modificaperfilgest_gest")
public class Modificaperfilgest_gest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MGestor modelo_gestor;
	private Conexion conexionBD;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilgest_gest() {
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
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
		// Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Gestor... 
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			String id;
			String nombre, apellido1, apellido2, usuario, tlf, nif, email;
			int envioGest;
								
			id = request.getParameter("id");
			nombre = request.getParameter("nombre");
			apellido1 = request.getParameter("apellido1");
			apellido2 = request.getParameter("apellido2");
			usuario = request.getParameter("usuario");
			nif = request.getParameter("nif");
			tlf = request.getParameter("tlf");
			email = request.getParameter("email");

			// Nos devolverá el número de registros que se modificaron sobre el usuario Gestor,
			// siendo, anteriormente la modificación del mismo.
			envioGest = modelo_gestor.updateGestor(	id,
											   		nombre,
												    apellido1,
												    apellido2,
												    usuario,
												    tlf,
												    nif,
												    email);
		
			// Envío de los resultados por Gson.
			String sendProf = new Gson().toJson(envioGest);
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
