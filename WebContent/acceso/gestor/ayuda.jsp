<%@ page contentType="text/html; charset=UTF-8" %>

<%
// 	DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 	datos[0] = "iduser";
// 	datos[1] = "tipouser";
// 	datos[2] = "nombre";
// 	datos[3] = "apellido1";
// 	datos[4] = "apellido2";
// 	datos[5] = "usuario";
// 	datos[6] = "pass";
// 	datos[7] = "fecalta";
// 	datos[8] = "email";
// 	datos[9] = "nif";
// 	datos[10] = "tlf";
%>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es gestor...
	if(session.getAttribute("log") == null || !datos_gest[1].equals("G")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ayuda - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-ayuda">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-gestor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./aniadir-elemento.jsp" title="Ir a Añadir Elemento">
                                <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Elemento </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./eliminar-elemento.jsp" title="Ir a Eliminar Elemento">
                                <i class="fa fa-minus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./modificar-elemento.jsp" title="Ir a Editar Elemento">
                                <i class="fa fa-edit fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Editar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./buscar-elemento.jsp" title="Ir a Buscar - Listar Elementos">
                                <i class="fa fa-eye fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Buscar - Listar Elementos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias de Profesores y Alumnos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./ayuda.jsp" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span>
                                <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                            </span>
                        </li>
                    </ul>
            </div>
        </nav>
    </header>
        
    <div class="container">
            <div class="text-xs-center conectadoMobile">
                <span class="nav-link hidden-lg-up">
                    Conectado como 
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-noticiario.jsp">Panel Principal</a> / Ayuda</h1>
                <hr/>
                
                <div class="row text-xs-left form-publicacion-art">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                             <h2 class="title"> Ayuda </h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                            
                            <div id="accordion" role="tablist" aria-multiselectable="true">
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#faq1" aria-expanded="true">
                                          ¿Cómo añadir un nuevo elemento?
                                        </a>
                                      </h5>
                                    </div>

                                    <div id="faq1" class="collapse show" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> Muy fácil, en el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-plus btn-select" aria-hidden="true"> (Añadir elemento) </i> para crear el nuevo elemento. <br/>
                                        Una vez dentro, podemos añadir el elemento que deseemos.  Tenemos las siguientes opciones,
                                        <ul>
                                            <li><i class="fa fa-briefcase btn-select" aria-hidden="true"> (Registrar profesor) </i></li>
                                            <li><i class="fa fa-graduation-cap btn-select" aria-hidden="true"> (Registrar alumno) </i></li>
                                            <li><i class="fa fa-newspaper-o btn-select" aria-hidden="true"> (Registrar noticiario) </i></li>
                                            <li><i class="fa fa-user-o btn-select" aria-hidden="true"> (Registrar gestor) </i></li>
                                            <li><i class="fa fa-book btn-select" aria-hidden="true"> (Registrar curso) </i></li>
                                        </ul>
                                        </p>
                                        <p> Tras pulsar sobre cualquier opción, nos saldrá un modal donde rellenaremos una serie de datos acorde al elemento que queramos registrar.  Tras terminar de rellenar dichos datos, pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm">Registrar</button>.</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq2" aria-expanded="false">
                                          ¿Cómo eliminar un elemento?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq2" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-minus btn-select" aria-hidden="true"> (Eliminar elemento) </i> para eliminar el elemento que deseemos. <br/>
                                        Una vez dentro, tenemos las siguientes opciones,
                                        <ul>
                                            <li><i class="fa fa-briefcase btn-select" aria-hidden="true"> (Eliminar profesor) </i></li>
                                            <li><i class="fa fa-graduation-cap btn-select" aria-hidden="true"> (Eliminar alumno) </i></li>
                                            <li><i class="fa fa-newspaper-o btn-select" aria-hidden="true"> (Eliminar noticiario) </i></li>
                                            <li><i class="fa fa-user-o btn-select" aria-hidden="true"> (Eliminar gestor) </i></li>
                                            <li><i class="fa fa-book btn-select" aria-hidden="true"> (Eliminar curso) </i></li>
                                        </ul>
                                        </p>
                                        <p> Tras pulsar cualquiera de las opciones, nos saldrá una tabla donde nos aparecerán todos los elementos relacionado con la opción que hayamos elegido previamente.  Para eliminar dicho elemento debemos clicar sobre el icono <i class="fa fa-trash text-danger" aria-hidden="true"></i>. <br/>
                                        Debemos asegurarnos de que queremos eliminar dicho elemento con seguridad. </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq3" aria-expanded="false">
                                          ¿Cómo editar un elemento?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq3" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-edit btn-select" aria-hidden="true"> (Modificar elemento) </i> para modificar el elemento que deseemos. <br/>
                                        Una vez dentro, tenemos las siguientes opciones,
                                        <ul>
                                            <li><i class="fa fa-briefcase btn-select" aria-hidden="true"> (Modificar profesor) </i></li>
                                            <li><i class="fa fa-graduation-cap btn-select" aria-hidden="true"> (Modificar alumno) </i></li>
                                            <li><i class="fa fa-newspaper-o btn-select" aria-hidden="true"> (Modificar noticiario) </i></li>
                                            <li><i class="fa fa-user-o btn-select" aria-hidden="true"> (Modificar gestor) </i></li>
                                            <li><i class="fa fa-book btn-select" aria-hidden="true"> (Modificar curso) </i></li>
                                        </ul>
                                        </p>
                                        <p> Tras pulsar cualquiera de las opciones, nos saldrá una tabla donde nos aparecerán todos los elementos relacionado con la opción que hayamos elegido previamente.  Para modificar dicho elemento debemos clicar sobre el icono <i class="fa fa-pencil btn-select" aria-hidden="true"></i> y a continuación editar
                                        los campos que deseemos.</p>
                                        <p> Tras finalizar, pulsamos sobre el botón  
                                        <button type="button" class="btn btn-primary btn-sm">Modificar</button>.</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq4" aria-expanded="false">
                                          ¿Cómo buscar o listar elementos?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq4" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-eye btn-select" aria-hidden="true"> (Buscar / Listar elementos) </i> para hacer la búsqueda del elemento que deseemos. <br/>
                                        Una vez dentro, tenemos las siguientes opciones,
                                        <ul>
                                            <li><i class="fa fa-briefcase btn-select" aria-hidden="true"> (Búsqueda de profesor) </i></li>
                                            <li><i class="fa fa-graduation-cap btn-select" aria-hidden="true"> (Búsqueda de alumno) </i></li>
                                            <li><i class="fa fa-newspaper-o btn-select" aria-hidden="true"> (Búsqueda de noticiario) </i></li>
                                            <li><i class="fa fa-user-o btn-select" aria-hidden="true"> (Búsqueda de gestor) </i></li>
                                            <li><i class="fa fa-book btn-select" aria-hidden="true"> (Búsqueda de curso) </i></li>
                                        </ul>
                                        </p>
                                        <p>Tras elegir la opción deseada, nos aparecerá una tabla respectiva sobre la opción.  Podremos hacer un filtrado de la búsqueda con una palabra clave ó seleccionando un curso al que pertenezca dicho elemento.  Para ver más información acerca del elemento tendremos que hacer clic sobre el botón <i class="fa fa-info-circle btn-select" aria-hidden="true"></i>.</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq5" aria-expanded="false">
                                          ¿Cómo mostrar incidencias de profesores y alumnos?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq5" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-commenting btn-select" aria-hidden="true"> (Incidencias de Profesores y Alumnos) </i> para ver las incidencias de los profesores y los alumnos de la academia. <br/>
                                        Una vez dentro, tenemos las siguientes opciones,
                                        <ul>
                                            <li><i class="fa fa-briefcase btn-select" aria-hidden="true"> (Incidencias de profesor) </i></li>
                                            <li><i class="fa fa-graduation-cap btn-select" aria-hidden="true"> (Incidencias de alumno) </i></li>
                                        </ul>
                                        </p>
                                        <p>Tras elegir la opción deseada, nos aparecerá una tabla respectiva sobre la opción.  Podremos hacer un filtrado de la búsqueda con una palabra clave.</p>
                                        <p>
                                        Para ver la incidencia con todo detalle pulsamos sobre el icono <i class="fa fa-bolt text-warning" aria-hidden="true"> </i> y cuando esta sea resuelta se le enviará una notificación al alumno o profesor para que éste la cierre.  
                                        </p>
                                        <p>
                                        ¿Cómo sabemos si está resuelta o no?
                                        La incidencia estará resuelta si aparece en la última columna respectiva al elemento el icono <i class="fa fa-thumbs-up text-success" aria-hidden="true"></i> y si no lo está nos aparecerá el icono <i class="fa fa-thumbs-down text-danger" aria-hidden="true"></i>.
                                        </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq6" aria-expanded="false">
                                          Mi Perfil
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq6" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-user-circle btn-select" aria-hidden="true"> (Mi perfil) </i> para ver los datos de nuestro perfil. <br/>
                                            Podremos modificar los datos de nuestra cuenta tales como la foto de nuestro perfil, el nombre, nuestros apellidos, nuestro correo electrónico y el télefono de contacto.
                                        </p>
                                        <p> Cuando terminemos de modificar (o no) nuestro perfil pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm">Modificar perfil</button>. </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq7" aria-expanded="false">
                                          Salir
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq7" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> Por tu seguridad, cierra la sesión cuando no vayas a hacer uso de la plataforma.
                                        Para salir puedes hacerlo pulsando sobre el icono <i class="fa fa-sign-out btn-select" aria-hidden="true"> (Salir) </i> en el panel principal, o bien, desde la barra principal en la parte superior derecha sobre <span class="btn-select">(Desconectar)</span>.<br/>
                                        </p>
                                      </div>
                                    </div>
                                  </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="form-group row text-xs-center">
                        <div class="col-xs-12">
                            <a href="../principal-gestor.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
                        </div>
                    </div>
                </div>

            </div>
    </div>
        
    <footer>
        <div class="row">
            <div class="col-xs-12 text-xs-center">
                <span> © <span id="fechaActual"> </span> - Todos los derechos reservados | Marco Romero  </span>
            </div>
        </div>
    </footer>
        
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    
</body>
</html>

<% } %>