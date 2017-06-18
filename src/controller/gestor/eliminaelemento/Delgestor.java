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
import model.MGestor;

/**
 * Clase controladora - Clase que se encargará de eliminar el usuario Gestor de la Base de Datos.
 */
@WebServlet("Delgestor")
public class Delgestor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private MGestor modelo_gestor;
	private Conexion conexionBD;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delgestor() {
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
			
			String id, nif;
			int resultado;
							
			id = request.getParameter("id");
						
			// Antes de proceder con la eliminación del usuario vamos a comprobar que no se quiera eliminar así mismo.
			// Con esto conseguimos que siempre haya un usuario Gestor en la plataforma, es decir, alguien que se encargue
			// de dirigir la administración de la misma.
			if(id.equalsIgnoreCase(datos_gestor[0].toString())){
				// Envío de los resultados por Gson.
				// Con el código "0" le enviamos a Ajax que el usuario está tratándose de eliminarse así mismo.
				String sendDelGest = new Gson().toJson("0");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendDelGest);
			}else{
								
				// Recoge el NIF del gestor.
				nif = modelo_gestor.dameNif(id);

				// Instancia el directorio previamente con el nif del gestor. 
				File directorio = new File(getServletContext().getRealPath("recursos/gestor/"+nif));
				
				// Método que elimina el directorio personal completo del gestor.
				eliminaDirectorio(directorio);
				
				// Devolverá un entero (número de registros que se eliminó) pasándole por parámetro la ID.
				resultado = modelo_gestor.eliminarGestor(id);
				
				// Envío de los resultados por Gson.
				String sendDelGest = new Gson().toJson(resultado);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(sendDelGest);
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
	
	
	/**
	 * Función que elimina el directorio personal del usuario de forma recursiva.
	 * @param directorio Le pasamos como parámetro el directorio a eliminar.
	 */
	private void eliminaDirectorio(File directorio) {
		
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
