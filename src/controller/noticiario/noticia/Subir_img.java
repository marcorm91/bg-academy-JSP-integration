package controller.noticiario.noticia;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Clase controladora - Clase que se encargará del proceso de subida de la imagen.
 */
@WebServlet("/Subir_img")
public class Subir_img extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subir_img() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
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
				   	
				  // Identificamos la ruta completa del usuario para hacer la subida, y cuando la tengamos
				  // insertamos en la BD, en la tabla ficheros, un registro con el nombre de usuario, el tipo
				  // de fichero que es (público o privado) y la ruta absoluta del mismo.
			      File fichero = new File("WebContent/recursos/imgnoticias", fich);
			      			      
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

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
