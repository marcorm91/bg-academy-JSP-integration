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
 * Clase controladora - Clase que se encargar� de eliminar el profesor de la BD, y adem�s, borrar� su directorio personal.
 */
@WebServlet("/Delprofesor")
public class Delprofesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MProfesor modelo_profesor;
	private Conexion conexionBD;

       
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
        
        // Recogemos la session y los datos del usuario que entra a la plataforma.
        hs = request.getSession();
        Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
        
        // Si la session log viene como nula (sin identificaci�n previa) � el usuario que viene no es de tipo Gestor...
        if(hs.getAttribute("log") == null || !datos_gestor[1].equals("G")){
			response.sendRedirect("error.jsp");
		}else{
			
			String id, nif;
			int resultado;
							
			id = request.getParameter("id");
			
			// Recoge el NIF del profesor que viene de la request.
			nif = modelo_profesor.dameNif(id);

			// Instancia el directorio previamente con el nif del profesor.
			File directorio = new File("WebContent/recursos/profesores/"+nif);
			
			// M�todo que elimina el directorio personal completo del profesor.
			eliminaDirectorio(directorio);
			
			// Devolver� un entero (n�mero de registros que se elimin�) pas�ndole por par�metro la ID.
			resultado = modelo_profesor.eliminaProfesor(id);
			
			// Env�o de los resultados por Gson.
			String sendDelProf = new Gson().toJson(resultado);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sendDelProf);
			
		}
					        
        //�IMPORTANTE! Cerrar la conexi�n.
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
	 * Funci�n que elimina el directorio personal del usuario de forma recursiva.
	 * @param directorio Le pasamos como par�metro el directorio a eliminar.
	 */
	private void eliminaDirectorio(File directorio){

		// Si dir es un directorio procedemos con la eliminaci�n.
		if(directorio.isDirectory()){
			
			// Si este mismo directorio no tiene nada dentro, ejecutamos m�todo delete.
			if(directorio.list().length == 0){
				
				directorio.delete();
			
			// De no ser as�, necesitamos un borrado recursivo.
			}else{
				
				//Aqu� emplearemos la recursividad, donde iremos recorriendo desde el �ltimo hasta primer
				//elemento del directorio en �rbol.  Para ello, llamaremos de nuevo al m�todo hasta que 
				//lleguemos al �ltimo.
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
