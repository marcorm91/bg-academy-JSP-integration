<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Ofertas especiales - Big Ben Academy</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/sass/estilos.css">
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">
</head>
<body>

	<!-- Contenedor principal de index.html -->
	<div class="container">
		
		<!-- Contenedor de logo principal de la academia -->
		<div id="cabecera"></div>

		<!-- Cabecera que contiene menú principal para el acceso a las distintas secciones de la web -->
		<div id="menu"></div>

		<!-- Panel de navegación -->
		<div id="navegacion">
			<div class="col-xs-12 barra">
				<div class="col-xs-6 navIzquierda">
					<span> OFERTAS ESPECIALES </span>
				</div>
			</div>
		</div> <!-- Fin de 'Panel de navegación' -->

	</div> <!-- Fin de contenedor principal de index.html -->


	<!-- Contenedor que engloba a lo principal de la web -->
	<div class="container">

	<div class="row">

		<!-- Contenedor de bienvenida con datos varios de la web -->
		<div class="col-lg-8 col-xs-12 contenedorPrincipal">

			<div id="titulo_cont">
				<h1> ¡Ofertas Big Ben! </h1>
			</div>

			<div id="imgSuperior_cont" class="text-xs-center">
				<img src="assets/imagenes/precios.png" class="img-fluid">
			</div>

			<div id="contenido_cont" class="text-xs-center">
			
					<div class="contenido_cont_academia">
						<div id="tabla_precios">
						    <div class="contenidos">
						        <div class="columna1 titulo_tabla_precios">Nivel</div>
						        <div class="columna2 titulo_tabla_precios">Dificultad</div>
						        <div class="columna3 titulo_tabla_precios">Descripción y Precios</div>
						    </div>
						    <div class="contenidos">
						        <div class="columna1">A1</div>
						        <div class="columna2">
									<progress class="progress" value="17" max="100"></progress>
						        </div>	
						        <div class="columna3" id="info_a1" title="+ Info A1"> + info </div>
						    </div>
						    <div class="contenidos">
						        <div class="columna1">A2</div>
						        <div class="columna2">
									<progress class="progress" value="34" max="100"></progress>
						        </div>
						        <div class="columna3" id="info_a2" title="+ Info A2"> + info </div>	
						    </div>
						    <div class="contenidos">
						        <div class="columna1">B1</div>
						        <div class="columna2">
									<progress class="progress" value="51" max="100"></progress>
						        </div>	
						        <div class="columna3" id="info_b1" title="+ Info B1"> + info </div>
						    </div>
						    <div class="contenidos">
						        <div class="columna1">B2</div>
						        <div class="columna2">
									<progress class="progress" value="68" max="100"></progress>
						        </div>	
						        <div class="columna3" id="info_b2" title="+ Info B2"> + info </div>
						    </div>
						    <div class="contenidos">
						        <div class="columna1">C1</div>
						        <div class="columna2">
									<progress class="progress" value="85" max="100"></progress>
						        </div>	
						        <div class="columna3" id="info_c1" title="+ Info C1"> + info </div>
						    </div>
						    <div class="contenidos">
						        <div class="columna1">C2</div>
						        <div class="columna2">
									<progress class="progress" value="100" max="100"></progress>
						        </div>	
						        <div class="columna3" id="info_c2" title="+ Info C2"> + info </div>
						    </div>
						</div>
					</div>
			
			</div>

		</div> <!-- Fin contenedor principal -->

		<!-- Contenedor que contiene el acceso a la intranet de la academia -->
		<div class="col-lg-4 col-xs-12 menuLateral_acceso">
			<h5> Acceso a la Intranet de la academia </h5>
			<div>
				<a href="./acceso.jsp" title="Ir a la Intranet de la academia"> <img src="assets/imagenes/acceso.png"> </a>
			</div>
		</div> <!-- Fin contenedor acceso a la intranet -->

		<!-- Contenedor que contiene las últimas noticias insertadas en el apartado noticias -->
		<div class="col-lg-4 col-xs-12 menuLateral_ultimasNoticias">
			<h5> Últimas Noticias </h5>
				<div id="celdaMensajes">
					
					<div> 
						<a href="#" title="Ir a Noticia 1">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Aprender inglés gratis
						</a>
						<span> 14/02/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 2">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Aprender inglés con dibujos animados
						</a>
						<span> 08/02/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 3">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Nuevas ofertas, nuevas oportunidades
						</a>
						<span> 06/02/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 4">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Nunca es tarde para aprender inglés
						</a>
						<span> 30/01/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 5">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Actividades Infantiles Lúdicas
						</a>
						<span> 20/01/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 6">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Aprender inglés escuchando música
						</a>
						<span> 14/01/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 7">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Consejos para aprobar 'listening'
						</a>
						<span> 10/01/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 8">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Consejos para aprobar 'reading'
						</a>
						<span> 08/01/2017 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 9">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Importancia de aprender inglés
						</a>
						<span> 20/12/2016 </span>
					</div>

					<div> 
						<a href="#" title="Ir a Noticia 10">
							<i class="fa fa-bookmark fa-1px" aria-hidden="true"></i>
							Consigue un 10 en el 'writing'
						</a>
						<span> 17/12/2016 </span>
					</div>
	
				</div>
		</div> <!-- Fin contenedor últimas noticias -->

		<!-- Contenedor que contiene el menú lateral de acceso a conocer la docencia de la academia -->
		<div class="col-lg-4 col-xs-12 menuLateral_docente">
			<h5> Nuestro equipo docente </h5>
			<div>
				<p> 
					El equipo de profesores de nuestra academia está formado por profesionales activos
					y en constante renovación.
					Entra y échale un vistazo al perfil de cada uno.
				</p>
				<div class="text-xs-center">
					<a href="./docencia.jsp" title="Ir a Docencia">
						<i class="fa fa-id-card-o" aria-hidden="true"></i>
					</a>
				</div>
			</div>
		</div> <!-- Fin contenedor acceso a docencia de academia -->

	</div>
	</div>

	<!-- Pie de página -->
	<div id="pie_pag"></div>

	<!-- VENTANAS MODALES PARA INFO -->
	<div id="modal_a1" title="Información y precios A1">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de A1 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p>Reconozco palabras y expresiones muy básicas que se usan habitualmente, relativas a mí mismo, a mi familia y a mi entorno inmediato cuando se habla despacio y con claridad.</p>

					<h2>Comprensión de lectura</h2>
					<p>Comprendo palabras y nombres conocidos y frases muy sencillas, por ejemplo las que hay en letreros, carteles y catálogos. </p>

					<h2>Interacción oral</h2>
					<p>Puedo participar en una conversación de forma sencilla siempre que la otra persona esté dispuesta a repetir lo que ha dicho o a decirlo con otras palabras y a una velocidad más lenta y me ayude a formular lo que intento decir. Planteo y contesto preguntas sencillas sobre temas de necesidad inmediata o asuntos muy habituales.</p>

					<h2>Expresión oral</h2>
					<p>Utilizo expresiones y frases sencillas para describir el lugar donde vivo y las personas que conozco.</p>

					<h2>Expresión escrita</h2>
					<p>Soy capaz de escribir postales cortas y sencillas, por ejemplo para enviar felicitaciones. Sé rellenar formularios con datos personales, por ejemplo mi nombre, mi nacionalidad y mi dirección en el formulario del registro de un hotel.</p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>45 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_a2" title="Información y precios A2">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de A2 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p>Comprendo frases y el vocabulario más habitual sobre temas de interés personal (información personal y familiar muy básica, compras, lugar de residencia, empleo). Soy capaz de captar la idea principal de avisos y mensajes breves, claros y sencillos.</p>

					<h2>Comprensión de lectura</h2>
					<p>Soy capaz de leer textos muy breves y sencillos. Puedo encontrar información específica y predecible en escritos sencillos y cotidianos como anuncios publicitarios, prospectos, menús y horarios y comprendo cartas personales breves y sencillas. </p>

					<h2>Interacción oral</h2>
					<p> Sé comunicarme en tareas sencillas y habituales que requieren un intercambio simple y directo de información sobre actividades y asuntos cotidianos. Soy capaz de realizar intercambios sociales muy breves, aunque, por lo general, no puedo comprender lo suficiente como para mantener la conversación por mí mismo. </p>

					<h2>Expresión oral</h2>
					<p> Utilizo una serie de expresiones y frases para describir con términos sencillos a mi familia y otras personas, mis condiciones de vida, mi origen educativo y mi trabajo actual o el último que tuve. </p>

					<h2>Expresión escrita</h2>
					<p> Soy capaz de escribir notas y mensajes breves y sencillos relativos a mis necesidades inmediatas. Puedo escribir cartas personales muy sencillas, por ejemplo agradeciendo algo a alguien. </p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>55 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_b1" title="Información y precios B1">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de B1 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p>Comprendo las ideas principales cuando el discurso es claro y normal y se tratan asuntos cotidianos que tienen lugar en el trabajo, en la escuela, durante el tiempo de ocio, etc.
					Comprendo la idea principal de muchos programas de televisión o radio que tratan temas de actualidad o asuntos de interés personal o profesional, cuando la articulación es relativamente lenta y clara. </p>

					<h2>Comprensión de lectura</h2>
					<p> Comprendo textos redactados en una lengua de uso habitual y cotidiano o relacionada con el trabajo. Comprendo las descripciones de acontecimientos, sentimientos y deseos en cartas personales. 
					</p>

					<h2>Interacción oral</h2>
					<p>  Me desenvuelvo en casi todas las situaciones que se me presentan cuando viajo. Puedo participar espontáneamente en una conversación que trate temas cotidianos de interés personal o que sean pertinentes para la vida diaria (por ejemplo, familia, aficiones, trabajo, viajes y acontecimientos actuales). </p>

					<h2>Expresión oral</h2>
					<p>  Sé enlazar frases de forma sencilla con el fin de describir experiencias y hechos, mis sueños, esperanzas y ambiciones. Puedo explicar y justificar brevemente mis opiniones y proyectos. Sé narrar una historia o relato, la trama de un libro o película y puedo describir mis reacciones. </p>

					<h2>Expresión escrita</h2>
					<p>  Puedo escribir textos sencillos y bien enlazados sobre temas que me son conocidos o de interés personal. Puedo escribir cartas personales que describen experiencias e impresiones.  </p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>65 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_b2" title="Información y precios B2">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de B2 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p> Comprendo discursos y conferencias extensos e incluso sigo líneas argumentales complejas siempre que el tema sea relativamente conocido. Comprendo casi todas las noticias de la televisión y los programas sobre temas actuales. Comprendo la mayoría de las películas en las que se habla en un nivel de lengua estándar.  </p>

					<h2>Comprensión de lectura</h2>
					<p> Soy capaz de leer artículos e informes relativos a problemas contemporáneos en los que los autores adoptan posturas o puntos de vista concretos. Comprendo la prosa literaria contemporánea. 
					</p>

					<h2>Interacción oral</h2>
					<p> Puedo participar en una conversación con cierta fluidez y espontaneidad, lo que posibilita la comunicación normal con hablantes nativos. Puedo tomar parte activa en debates desarrollados en situaciones cotidianas explicando y defendiendo mis puntos de vista.  </p>

					<h2>Expresión oral</h2>
					<p> Presento descripciones claras y detalladas de una amplia serie de temas relacionados con mi especialidad. Sé explicar un punto de vista sobre un tema exponiendo las ventajas y los inconvenientes de varias opciones.  </p>

					<h2>Expresión escrita</h2>
					<p> Soy capaz de escribir textos claros y detallados sobre una amplia serie de temas relacionados con mis intereses. Puedo escribir redacciones o informes transmitiendo información o proponiendo motivos que apoyen o refuten un punto de vista concreto. Sé escribir cartas que destacan la importancia que le doy a determinados hechos y experiencias.  </p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>70 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_c1" title="Información y precios C1">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de C1 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p> Comprendo discursos extensos, incluso cuando no están estructurados con claridad y cuando las relaciones están sólo implícitas y no se señalan explícitamente.
					Comprendo sin mucho esfuerzo los programas de televisión y las películas.   </p>

					<h2>Comprensión de lectura</h2>
					<p> Comprendo textos largos y complejos de carácter literario o basados en hechos, apreciando distinciones de estilo.
					Comprendo artículos especializados e instrucciones técnicas largas, aunque estén relacionadas con mi especialidad. 
					</p>

					<h2>Interacción oral</h2>
					<p> Me expreso con fluidez y espontaneidad sin tener que buscar de forma muy evidente las expresiones adecuadas. Uso el lenguaje con flexibilidad y eficacia para fines sociales y profesionales. Formulo ideas y opiniones con precisión y relaciono mis intervenciones hábilmente con las de otros hablantes.  </p>

					<h2>Expresión oral</h2>
					<p>  Presento descripciones detalladas y claras sobre temas complejos los cuales incluyen otros temas, desarrollando ideas concretas y terminando con una conclusión apropiada.  </p>

					<h2>Expresión escrita</h2>
					<p>  Me expreso en textos claros y bien estructurados exponiendo puntos de vista con cierta extensión. Puedo escribir sobre temas complejos en redacciones, cartas o informes resaltando lo que considero que son aspectos importantes. Selecciono el estilo apropiado para los lectores a los que van dirigidos mis escritos. Incluso puedo estar en la capacidad de pedir un empleo.   </p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>75 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>

	<div id="modal_c2" title="Información y precios C2">
		<div class="container-fluid cont_modales"> 

			<div class="row">

				<div class="col-xs-12 col-lg-8">
					<h1> Información para la modalidad de C2 </h1>
					<hr/>
					<h2>Comprensión auditiva</h2>
					<p>  No tengo ninguna dificultad para comprender cualquier tipo de lengua hablada, tanto en conversaciones en vivo como en discursos retransmitidos, aunque se produzcan a velocidad de hablante nativo, siempre que tenga tiempo para familiarizarme con el acento.  </p>

					<h2>Comprensión de lectura</h2>
					<p>  Leo con facilidad prácticamente todas las formas de lengua escrita, incluyendo textos abstractos estructural o lingüísticamente complejos como, por ejemplo, manuales, artículos especializados y obras literarias. 
					</p>

					<h2>Interacción oral</h2>
					<p>  Puedo tomar parte sin esfuerzo en cualquier conversación o debate y conozco bien modismos, frases hechas y expresiones coloquiales. Soy capaz de expresarme con fluidez y transmito matices sutiles de sentido con precisión. Si tuviese un problema, sorteo la dificultad con tanta discreción que los demás apenas se dan cuenta.  </p>

					<h2>Expresión oral</h2>
					<p> Soy capaz de presentar descripciones o argumentos de forma clara y fluida y con un estilo que es adecuado al contexto y con una estructura lógica y eficaz que ayuda al oyente a fijarse en las ideas importantes y a recordarlas.   </p>

					<h2>Expresión escrita</h2>
					<p> Escribo textos claros y fluidos en un estilo apropiado. Escribo cartas, informes o artículos complejos que presentan argumentos con una estructura lógica y eficaz que ayuda al oyente a fijarse en las ideas importantes y a recordarlas. Soy capaz de escribir resúmenes y reseñas de obras profesionales o literarias.  </p>
				</div>

				<div class="col-xs-12 col-lg-4 colPrecios">
					<h1> Precios </h1>
					<hr/>
					<div class="filaPrecio">
						<h2>Precio</h2>
						<p>80 € (mes).</p>
					</div>
			
					<div class="filaPrecio">
						<h2>Nº de estudiantes</h2>
						<p> 10 máximo. </p>
					</div>

					<div class="filaPrecio">
						<h2>Duración del curso</h2>
						<p>Entre 6 y 8 meses, según alumnado.</p>
					</div>

					<div class="filaPrecio">
						<h2>Lecciones a la semana (presenciales)</h2>
						<p>Dos clases a la semana de hora y media cada una.</p>
					</div>

					<div class="filaPrecio">
						<h2>Acceso Big Ben</h2>
						<p>Disponibilidad de plataforma virtual durante todo el curso.</p>
					</div>
				</div>

				<div class="infoLlamada">
					<i class="fa fa-phone fa-2x" aria-hidden="true"></i>
					<p> Para más información puede llamarnos a <br/> 
					<b>680 357 062</b> ó <b>956 874 432</b> </p>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>
	<iframe src="youtube.com" hidden/>

</body>
</html>