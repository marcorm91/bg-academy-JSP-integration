package controller.pdfgenerator.gestor;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;

import model.Conexion;
import model.MProfesor;

/**
 * Clase controladora - Controla la impresión por pantalla en PDF los datos del profesor.
 */
@WebServlet("/PDF_prof_gest.pdf")
public class PDF_prof_gest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
	private String id;
    private Conexion conexionBD;
	private MProfesor modelo_profesor;  
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDF_prof_gest() {
        super(); 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Reopen temporal de la BD.
        conexionBD = new Conexion();
        modelo_profesor = new MProfesor(conexionBD.getConexion());
		
		OutputStream out = response.getOutputStream();
		
		// Recogemos la session y los datos del usuario que entra a la plataforma.
		hs = request.getSession();
		Object[] datos_gestor = (Object []) hs.getAttribute("identificacion");
		
		// Comprobamos que la session no sea null y además, que el tipo de usuario sea sólo sea acceso a Gestor.
		if(hs.getAttribute("identificacion") == null || !datos_gestor[1].equals("G")){  
			response.sendRedirect("error.jsp");
		}else{
							
			try{
								
				id = request.getParameter("id");
				
				Object[] datos_prof;
				
				// Vamos a recoger todos los datos del profesor para su posterior impresión por PDF.
				datos_prof = modelo_profesor.dameDatosPorID(id);
								
				try{
					
					Document documento = new Document();
					PdfWriter.getInstance(documento, out);
					
					documento.open();
					
					//Imagen de cabecera
					String rutaImagen = "assets/imagenes/logo.png";
					String absoluteDiskPath = getServletContext().getRealPath(rutaImagen);
					Image imagenCabecera = Image.getInstance(absoluteDiskPath);
					imagenCabecera.scalePercent(30f);
					imagenCabecera.setAlignment(Image.MIDDLE);
					documento.add(imagenCabecera);
					
					// TÍTULO
					Paragraph par = new Paragraph();
					par.add(new Phrase(Chunk.NEWLINE));
					Font titulo = new Font(Font.FontFamily.UNDEFINED, 11, Font.BOLD | Font.NORMAL, BaseColor.BLACK);
					par.setAlignment(Element.ALIGN_CENTER);
					par.add(new Phrase("DATOS DE MATRÍCULA", titulo));
					
					par.add(new Phrase(Chunk.NEWLINE));
					par.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par);
					
					// DATOS PERSONALES
					Paragraph par2 = new Paragraph();
					par2.setAlignment(Element.ALIGN_JUSTIFIED);
					
					Font s1 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, new BaseColor(28, 35, 124));
					par2.add(new Phrase("DATOS PERSONALES", s1));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
									
					Font datos = new Font(Font.FontFamily.UNDEFINED, 9, Font.NORMAL, BaseColor.BLACK);
					par2.add(new Phrase("Nombre: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_prof[2].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Apellidos: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_prof[3].toString() +" "+ datos_prof[4].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Fecha de nacimiento: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					
					String fechaoriginal_fecna = datos_prof[14].toString(); 
					String[] fecha_split_fecna = fechaoriginal_fecna.split("-");
					par2.add(new Phrase(fecha_split_fecna[2] + "/" + fecha_split_fecna[1] + "/" + fecha_split_fecna[0], datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("NIF/NIE: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_prof[8].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Nacido en: ", datos));
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_prof[9].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Nacionalidad: ", datos));
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_prof[19].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par2);
					
					// DATOS DE DIRECCIÓN
					Paragraph par3 = new Paragraph();
					par2.setAlignment(Element.ALIGN_JUSTIFIED);
					
					Font s2 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, new BaseColor(28, 35, 124));
					par3.add(new Phrase("DATOS DE DIRECCIÓN", s2));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Calle / Vía / Avda.: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_prof[10].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Código Postal: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_prof[11].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Población: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_prof[13].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Provincia: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_prof[12].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					par3.add(new Phrase(Chunk.NEWLINE));
					par3.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par3);
					
					// DATOS ACADÉMICOS
					Paragraph par4 = new Paragraph();
					par4.setAlignment(Element.ALIGN_JUSTIFIED);
					
					Font s3 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, new BaseColor(28, 35, 124));
					par4.add(new Phrase("DATOS ACADÉMICOS", s3));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("ID: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_prof[0].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Fecha de alta: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					
					String fechaoriginal_alta = datos_prof[14].toString(); 
					String[] fecha_split_alta = fechaoriginal_alta.split("-");
					
					par4.add(new Phrase(fecha_split_alta[2] + "/" + fecha_split_alta[1] + "/" + fecha_split_alta[0], datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("E-Mail: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_prof[15].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Tlf. de contacto: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_prof[16].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Año promoción: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_prof[17].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Curso/s asignado/s: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_prof[18].toString().substring(1, datos_prof[18].toString().length()-1), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par4);
					
					// DATOS DE ACCESO
					Paragraph par5 = new Paragraph();
					par5.setAlignment(Element.ALIGN_JUSTIFIED);
					
					Font s4 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, new BaseColor(28, 35, 124));
					par5.add(new Phrase("DATOS DE ACCESO", s4));
					
					par5.add(new Phrase(Chunk.NEWLINE));
					par5.add(new Phrase(Chunk.NEWLINE));
					
					par5.add(new Phrase("Usuario: ", datos));
					par5.add(Chunk.TABBING);
					par5.add(Chunk.TABBING);
					par5.add(new Phrase(datos_prof[5].toString(), datos));
					par5.add(new Phrase(Chunk.NEWLINE));
					
					par5.add(new Phrase("Contraseña: ", datos));
					par5.add(Chunk.TABBING);
					par5.add(Chunk.TABBING);
					par5.add(new Phrase(datos_prof[6].toString(), datos));
										
					Font s5 = new Font(Font.FontFamily.UNDEFINED, 7, Font.BOLD | Font.ITALIC, new BaseColor(255, 0, 0));
					par5.add(new Phrase("   (Si es tu primer acceso recuerda cambiar la contraseña por tu seguridad. "
									  + "Puedes cambiarla en 'Mi Perfil')", s5));
					
					// ------ FIN DATOS ------ //
					
					par5.add(new Phrase(Chunk.NEWLINE));
					par5.add(new Phrase(Chunk.NEWLINE));
					par5.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par5);
					
					// DESPEDIDA
					Paragraph par6 = new Paragraph();
					par6.setAlignment(Element.ALIGN_CENTER);
					
					String fecha = ZonedDateTime.now ( ZoneId.of ( "Europe/Madrid" ) ).format ( DateTimeFormatter.ofLocalizedDate ( FormatStyle.FULL ).withLocale ( new Locale ( "es" , "ES" ) ) );
					Font s6 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, BaseColor.BLACK);
					par6.add(new Phrase("El Puerto de Santa María a "+fecha, s6));
					
					par6.add(new Phrase(Chunk.NEWLINE));
					par6.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par6);
					
					// LOGOTIPO FINAL
					String rutaImagen2 = "assets/imagenes/icono.png";
					String absoluteDiskPath2 = getServletContext().getRealPath(rutaImagen2);
					Image imagenDesp = Image.getInstance(absoluteDiskPath2);
					imagenDesp.scalePercent(25f);
					imagenDesp.setAlignment(Image.MIDDLE);
					
					documento.add(imagenDesp);
					
					documento.close();
					
				}catch(Exception e){
					System.out.println(e);
				}
				
				
			}finally{
				out.close();
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

}
