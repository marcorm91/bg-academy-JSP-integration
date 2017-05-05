package controller.accesoplataforma;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Conexion;
import model.MLog;

/**
 * Servlet implementation class Acceso_plataforma
 */
@WebServlet("/Acceso_plataforma")
public class Acceso_plataforma extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MLog modeloLog;
	private Conexion conexionBD;
	private String user;
	private String pass;
	private boolean checkLogin;
	private String tipouser;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Acceso_plataforma() {
        super();
        conexionBD = new Conexion();
        modeloLog = new MLog(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user = request.getParameter("user");
		pass = request.getParameter("pass");
		
		checkLogin = modeloLog.checkLogin(user, pass);
		
		if(checkLogin){
			
			tipouser = modeloLog.checkTipo(user, pass);
			
			switch(tipouser){
			
				case "G": response.sendRedirect("acceso/principal-gestor.jsp"); break;
				case "N": response.sendRedirect("acceso/principal-noticiero.jsp"); break;
				case "A": response.sendRedirect("acceso/principal-alumno.jsp"); break;
				case "P": response.sendRedirect("acceso/principal-profesor.jsp"); break;
			
			}
			
		}else{
			System.out.println("incorrecto");
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
