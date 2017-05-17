package controller.noticiario.modificaperfil;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Conexion;
import model.MNoticiero;

/**
 * Servlet implementation class Modificaperfilnot
 */
@WebServlet("/Modificaperfilnot")
public class Modificaperfilnot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private Conexion conexionBD;
	private MNoticiero modelo_noticiario;
	private String nombre, apellido1, apellido2, email, tlf, id, pass;
	private PrintWriter out;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modificaperfilnot() {
        super();
        conexionBD = new Conexion();
        modelo_noticiario = new MNoticiero(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		hs = request.getSession();
		out = response.getWriter();
		
		if(hs.getAttribute("log") == null){
			response.sendRedirect("error.jsp");
		}else{
			
			Object[] datos_not = (Object []) hs.getAttribute("identificacion");
			
			try{
				nombre = request.getParameter("nombre");
				apellido1 = request.getParameter("apellido1");
				apellido2 = request.getParameter("apellido2");
				email = request.getParameter("email");
				tlf = request.getParameter("tlf");
				pass = request.getParameter("pass");
				id = datos_not[0].toString();
								
				//Llamamos al modelo para actualizar los datos del usuario con los datos.
				modelo_noticiario.updateNoticiario(id, nombre, apellido1, apellido2, email, tlf, pass);
				
				// Reactualizamos la session para seguir manejando los datos del user actualizados.
				datos_not = modelo_noticiario.dameDatosPorID(id);
				hs.setAttribute("identificacion", datos_not);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('¡Usuario modificado con éxito!');");
				out.println("location='acceso/noticiario/mi-perfil.jsp';");
				out.println("</script>");
				
			}catch(Exception e){
				response.sendRedirect("acceso/noticiario/mi-perfil.jsp");
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
