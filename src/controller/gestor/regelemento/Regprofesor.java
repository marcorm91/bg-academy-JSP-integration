package controller.gestor.regelemento;

import java.io.IOException;
import java.sql.Array;
import java.sql.Timestamp;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Conexion;
import model.MAlumno;
import model.MProfesor;

/**
 * Servlet implementation class Regprofesor
 */
@WebServlet("/Regprofesor")
public class Regprofesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;
	private String nombre, apellido1, apellido2, nif, nacimiento, nacionalidad, calle, cp, poblacion, provincia, email, tlf, anioprom;
	private String fecna, fecalta;
	private String[] cursoimp;
	private byte foto;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regprofesor() {
        super();
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		nombre = request.getParameter("nombre-profesor");
		apellido1 = request.getParameter("apellido1");
		apellido2 = request.getParameter("apellido2");
		nif = request.getParameter("nif");
		fecna = request.getParameter("fecna");
		nacimiento = request.getParameter("nacimiento");
		nacionalidad = request.getParameter("nacionalidad");
		calle = request.getParameter("calle");
		cp = request.getParameter("cp");
		poblacion = request.getParameter("poblacion");
		provincia = request.getParameter("provincia");
		fecalta = request.getParameter("fecalta");
		email = request.getParameter("email");
		tlf = request.getParameter("tlf");
		anioprom = request.getParameter("anio-curso");
		cursoimp = request.getParameterValues("cursos");
		//foto = request.getParameter("foto");		
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		
		
		Date fecna_date = null;
		Date fecalta_date = null;
		
		try {
			fecna_date =  sdf.parse(fecna);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			fecalta_date = sdf.parse(fecalta);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		modelo_profesor.registraProfesor(	nombre, 
											apellido1, 
											apellido2, 
											nif, 
											fecna_date, 
											nacimiento, 
											nacionalidad, 
											calle, 
											cp, 
											poblacion, 
											provincia,
											fecalta_date,
											email,
											tlf,
											anioprom,
											cursoimp );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
