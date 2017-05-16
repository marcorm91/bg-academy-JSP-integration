package controller.pdfgenerator;

import java.io.IOException;
import java.io.OutputStream;
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

/**
 * Servlet implementation class PDFAlumn
 */
@WebServlet("/PDFAlumn")
public class PDFAlumn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDFAlumn() {
        super(); 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OutputStream out = response.getOutputStream();
		hs = request.getSession();
		
		if(hs.getAttribute("identificacion") == null){  
			response.sendRedirect("error.jsp");
		}else{
		
			try{
				
				Object[] datos_alumn = (Object []) request.getSession().getAttribute("identificacion");
				
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
					par.add(new Phrase("DATOS DE MI MATRÍCULA", titulo));
					
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
					par2.add(new Phrase(datos_alumn[2].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Apellidos: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_alumn[3].toString() +" "+ datos_alumn[4].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Fecha de nacimiento: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_alumn[8].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("NIF/NIE: ", datos));
					new Chunk();
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_alumn[7].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Nacido en: ", datos));
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_alumn[9].toString(), datos));
					
					par2.add(new Phrase(Chunk.NEWLINE));
					
					par2.add(new Phrase("Nacionalidad: ", datos));
					par2.add(Chunk.TABBING);
					par2.add(Chunk.TABBING);
					par2.add(new Phrase(datos_alumn[10].toString(), datos));
					
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
					par3.add(new Phrase(datos_alumn[11].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Código Postal: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_alumn[12].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Población: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_alumn[13].toString(), datos));
					
					par3.add(new Phrase(Chunk.NEWLINE));
					
					par3.add(new Phrase("Provincia: ", datos));
					par3.add(Chunk.TABBING);
					par3.add(Chunk.TABBING);
					par3.add(new Phrase(datos_alumn[14].toString(), datos));
					
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
					
					par4.add(new Phrase("Fecha de alta: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_alumn[15].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("E-Mail: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_alumn[20].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Tlf. de contacto: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_alumn[19].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Año promoción: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_alumn[16].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					
					par4.add(new Phrase("Curso: ", datos));
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(Chunk.TABBING);
					par4.add(new Phrase(datos_alumn[17].toString(), datos));
					
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					par4.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par4);
					
					// DESPEDIDA
					Paragraph par5 = new Paragraph();
					par5.setAlignment(Element.ALIGN_CENTER);
					
					String fecha = ZonedDateTime.now ( ZoneId.of ( "Europe/Madrid" ) ).format ( DateTimeFormatter.ofLocalizedDate ( FormatStyle.FULL ).withLocale ( new Locale ( "es" , "ES" ) ) );
					Font s4 = new Font(Font.FontFamily.UNDEFINED, 10, Font.BOLD | Font.NORMAL, BaseColor.BLACK);
					par5.add(new Phrase("El Puerto de Santa María a "+fecha, s4));
					
					par5.add(new Phrase(Chunk.NEWLINE));
					par5.add(new Phrase(Chunk.NEWLINE));
					
					documento.add(par5);
					
					// LOGOTIPO FINAL
					String rutaImagen2 = "assets/imagenes/icono.png";
					String absoluteDiskPath2 = getServletContext().getRealPath(rutaImagen2);
					Image imagenDesp = Image.getInstance(absoluteDiskPath2);
					imagenDesp.scalePercent(35f);
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
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
