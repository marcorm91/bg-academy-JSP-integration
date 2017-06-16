package controller.gestor.listaelementos;

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
 * Clase controladora - Clase que tratará el listado completo de los gestores.
 */
@WebServlet("Gestlist")
public class Gestlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MGestor modelo_gestor;
	private Conexion conexionBD;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Gestlist() {
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
			
			Object gestores[][];
			
			// Recogeremos en una matriz todos los gestores que se encuentren matriculados en la Base de Datos.
			gestores = modelo_gestor.devuelveGestores();
		
			// Envío de los resultados por Gson.
			String sendGestores = new Gson().toJson(gestores);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendGestores);
			
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
