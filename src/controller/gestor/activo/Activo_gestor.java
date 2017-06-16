package controller.gestor.activo;

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
 * Clase controladora - Comprueba el primer acceso de un usuario registrado en la plataforma.
 * Con esto conseguimos mostrarle un mensaje de bienvenida tras su primer acceso.
 */
@WebServlet("Activo_gestor")
public class Activo_gestor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MGestor modelo_gestor;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Activo_gestor() {
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
			String resultado;
        
			id = datos_gestor[0].toString();
			
			// Recogemos el String 'S' (Activo) ó 'N' (No activo) para hacer el update sobre su campo (si es necesario)
			// y mostrar o no la pantalla de bienvenida.
			resultado = modelo_gestor.compruebaActivo(id);
			
			// Si resultado == 'N' quiere decir que estamos ante un usuario nuevo, por lo que modificamos 
			// en su registro en el campo activo a 'S'.
			if(resultado.equalsIgnoreCase("N")){
				modelo_gestor.setActivo(id);
			}
			
			// Envío de los resultados por Gson.
			String sendAct = new Gson().toJson(resultado);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendAct);

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
