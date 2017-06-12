package controller.profesor.curso;

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
import model.MActividades;

/**
 * Servlet implementation class Reg_tarea
 */
@WebServlet("/Reg_tarea")
public class Reg_tarea extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion conexionBD;
	private MActividades modelo_actividades;
	private HttpSession hs;
	private String anioprom, cursoasign, tittarea, detalletarea;
	private String feclimite;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reg_tarea() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_actividades = new MActividades(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_prof = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("identificacion") == null  || !datos_prof[1].equals("P")){  
			response.sendRedirect("error.jsp");
		}else{
			
			anioprom = request.getParameter("anioprom");
			cursoasign = request.getParameter("cursoasign");
			feclimite = request.getParameter("feclimite");
			tittarea = request.getParameter("tittarea");
			detalletarea = request.getParameter("detalletarea");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date feclimite_parse = null;
			
			try {
				feclimite_parse =  sdf.parse(feclimite);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			int rowsInsert = 0;
						
			rowsInsert = modelo_actividades.registraTarea(tittarea, detalletarea, feclimite_parse, anioprom, cursoasign);

			String sendRegs = new Gson().toJson(rowsInsert);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendRegs);	

		}
        
        //ˇIMPORTANTE! Cerrar la conexión.
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
