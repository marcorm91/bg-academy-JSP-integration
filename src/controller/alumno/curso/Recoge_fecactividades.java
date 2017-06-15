package controller.alumno.curso;

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
import model.MActividades;

/**
 * Servlet implementation class Recoge_fecactividades
 */
@WebServlet("/Recoge_fecactividades")
public class Recoge_fecactividades extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MActividades modelo_actividades;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recoge_fecactividades() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_actividades = new MActividades(conexionBD.getConexion());
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_alumno = (Object []) hs.getAttribute("identificacion");
        
        // Si la session log viene como nula (sin identificación previa) ó el alumno que viene no es de tipo Alumno...
        if(hs.getAttribute("log") == null || !datos_alumno[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
						
			try{
				
				String anioprom, cursoasign;
				Object fecactividades[][];
								
				anioprom = datos_alumno[16].toString();
				cursoasign = datos_alumno[17].toString();
								
				// Llamamos al modelo para realizar la consulta sobre las fechas en la BD pasándole
				// como parámetros el año de promoción y el curso asignado del alumno.
				fecactividades = modelo_actividades.devuelveFechas(anioprom, cursoasign);
			
				// Envío de los resultados por Gson.
				String sendFechas = new Gson().toJson(fecactividades);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendFechas);
								
			}catch(Exception e){
				response.sendRedirect("acceso/principal-alumno.jsp");
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
