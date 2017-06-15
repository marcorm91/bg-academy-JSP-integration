package controller.gestor.regelemento;

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
import model.MCurso;

/**
 * Clase controladora - Clase que se encargará de procesar el registro del curso.
 */
@WebServlet("/Regcurso")
public class Regcurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regcurso() {
        super();        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_curso = new MCurso(conexionBD.getConexion());
		
        // Recogemos la session y los datos del usuario que entra a la plataforma.
		hs = request.getSession();
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
		
        // Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Gestor...  
		if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			try{
				
				String curso, anioinicio, aniofin;
				boolean existeCurso;
				
				curso = request.getParameter("curso");
				anioinicio = request.getParameter("anioinicio");
				aniofin = request.getParameter("aniofin");
				
				// Vamos a comprobar previamente la existencia del curso.
				// Para ello, no debe coincidir en año de inicio, fin y curso.
				existeCurso = modelo_curso.compruebaExistencia(anioinicio, aniofin, curso);
				
				String existe = "";
				
				// Si existeCurso devuelve true quiere decir que el Gestor intenta registrar un curso que ya existe.
				if(existeCurso){
					existe = new Gson().toJson("1");
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(existe);					
				}else{
					
					// De no existir, se procede al registro del mismo.
					modelo_curso.registraCurso(		curso, 
													anioinicio, 
													aniofin);
					
					// Envío de los resultados por Gson.
					existe = new Gson().toJson("0");
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(existe);	
				}
					

			}catch(Exception e){
				response.sendRedirect("acceso/principal-gestor.jsp");
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
