package controller.alumno.modificaperfil;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Clase controladora - Controlador que se encargará de subir la imagen al directorio que le toque por parte 
 * del usuario Alumno.
 */
@WebServlet("Subir_img_alumn")
public class Subir_img_alumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subir_img_alumn() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
        // Recogemos la session y los datos del usuario que entra a la plataforma.
		hs = request.getSession();
		Object[] datos_alumn = (Object []) hs.getAttribute("identificacion");
        
		// Si la session log viene como nula (sin identificación previa) ó el usuario que viene no es de tipo Alumno...
        if(hs.getAttribute("log") == null || !datos_alumn[1].equals("A")){
			response.sendRedirect("error.jsp");
		}else{
			
			String nif = datos_alumn[5].toString();
			
			try{
				
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> items = upload.parseRequest(request);
					
				for (Object item : items) {
				   FileItem uploaded = (FileItem) item;
				   		   
				   if (!uploaded.isFormField()) {
					   
					   long time = new Date().getTime();
					   String time_str = String.valueOf(time).substring(0, 7);
						
					   String fich = time_str+"_"+uploaded.getName();
					   
					  File dir = new File("WebContent/recursos/alumnos/"+nif+"/fotopersonal");
					  
					  File[] filelist = dir.listFiles();
					  
					  // Como el usuario sólo tendrá una imagen de perfil, borramos antes de subir la imagen
					  // todo el contenido del directorio.
					  if(filelist.length > 0){
						  for(int i = 0; i < filelist.length; i++){
							  filelist[i].delete();
						  }
					  }
					  
					   	
					  // Identificamos la ruta completa del usuario para hacer la subida.
					  // Para identificar el directorio personal debemos de tener el NIF de este usuario que ya se
					  // recogió previamente de la session.
				      File fichero = new File("WebContent/recursos/alumnos/"+nif+"/fotopersonal", fich);
				      	
				      // Realización de la subida del fichero al servidor.
				      if(!fichero.isDirectory()){
					      try {
							uploaded.write(fichero);
					      } catch (Exception e) {
						e.printStackTrace();
					      }
				      }
				      
				   }
				
				}
				
				}catch(FileUploadException e){
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
