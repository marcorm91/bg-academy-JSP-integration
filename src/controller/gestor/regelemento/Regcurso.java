package controller.gestor.regelemento;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Conexion;
import model.MAlumno;
import model.MCurso;

/**
 * Servlet implementation class Regcurso
 */
@WebServlet("/Regcurso")
public class Regcurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MCurso modelo_curso;
	private Conexion conexionBD;
	private String curso, anioinicio, aniofin;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regcurso() {
        super();        
        conexionBD = new Conexion();
        modelo_curso = new MCurso(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		hs = request.getSession();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			try{
				curso = request.getParameter("curso");
				anioinicio = request.getParameter("anioinicio");
				aniofin = request.getParameter("aniofin");
				
		
				modelo_curso.registraCurso(			curso, 
													anioinicio, 
													aniofin);
				
				response.sendRedirect("acceso/principal-gestor.jsp");

			}catch(Exception e){
				response.sendRedirect("acceso/principal-gestor.jsp");
				System.out.println(e);
			}
			
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
