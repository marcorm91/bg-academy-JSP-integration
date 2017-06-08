package controller.gestor.eliminaelemento;

import java.io.File;
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
import model.MProfesor;

/**
 * Servlet implementation class Delprofesor
 */
@WebServlet("/Delprofesor")
public class Delprofesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;
	private String id, nif;
	private int resultado;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delprofesor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
        
        hs = request.getSession();
        
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
							
			id = request.getParameter("id");
			
			// Recoge el NIF del profesor.
			nif = modelo_profesor.dameNif(id);

			File directorio = new File("WebContent/recursos/profesores/"+nif);
			
			//Método que elimina el directorio completo del profesor.
			eliminaDirectorio(directorio);
			
			resultado = modelo_profesor.eliminaProfesor(id);
			
			String sendDelProf = new Gson().toJson(resultado);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendDelProf);
			
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
	
	
	/**
	 * Función que elimina el directorio personal del usuario.
	 * @param directorio
	 */
	private void eliminaDirectorio(File directorio){

		// Si dir es un directorio procedemos con la eliminación.
		if(directorio.isDirectory()){
			
			// Si este mismo directorio no tiene nada dentro, ejecutamos método delete.
			if(directorio.list().length == 0){
				
				directorio.delete();
			
			// De no ser así, necesitamos un borrado recursivo.
			}else{
				
				//Aquí emplearemos la recursividad, donde iremos recorriendo desde el último hasta primer
				//elemento del directorio en árbol.  Para ello, llamaremos de nuevo al método hasta que 
				//lleguemos al último.
				for(String temp : directorio.list()){
					File fileDelete = new File(directorio, temp);
					eliminaDirectorio(fileDelete);
				}
				
				//Si en el directorio en el que nos encontramos contiene 0 elementos, procedemos al borrado del
				//propio directorio.
				if(directorio.list().length == 0){
					directorio.delete();
				}
				
			}
		
		}else{
			directorio.delete();
		}
		
	}

}
