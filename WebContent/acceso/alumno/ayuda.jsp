<%@ page contentType="text/html; charset=UTF-8" %>

<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

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
    
<div id="bg-academy-principal-alumn-ayuda">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-alumno.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./matricula.jsp" title="Ir a Mi Matrícula">
                                <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Matrícula </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mis-calificaciones.jsp" title="Ir a Mis Calificaciones">
                                <i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mis Calificaciones </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./curso.jsp" title="Ir a Mi Curso">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Curso </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-alumno.jsp">Panel Principal</a> / Ayuda</h1>
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
                                          Mi matrícula
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq1" class="collapse show" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> Para acceder a nuestra matrícula pulsaremos sobre el icono 
                                            <i class="fa fa-id-card-o btn-select" aria-hidden="true"> (Mi matrícula) </i>. <br/>
                                            Aquí podremos ver todos los datos asociados a nuestra matrícula.  Desde los datos personales,
                                            como de dirección y profesionales (academia).
                                            Si detectas cualquier errata en tus datos ponte en contacto con el gestor de la escuela enviandole
                                            un parte de incidencia.
                                            <br/>Además, podrás descargar tus datos en PDF clicando sobre el icono <i class="fa fa-file-pdf-o text-danger" aria-hidden="true"></i>.
                                        </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq2" aria-expanded="false">
                                          Mis calificaciones
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq2" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-file-text-o btn-select" aria-hidden="true"> (Mis calificaciones) </i> para ver las calificaciones del curso actual. <br/>
                                        Una vez dentro, tenemos las siguientes opciones,
                                        <ul>
                                            <li>Tareas</li>
                                            <li>Exámenes</li>
                                        </ul>
                                        </p>
                                        <p> Podremos ver el título de la tarea / examen, una pequeña descripción asociada a la misma, la fecha
                                        de realización y su nota.  Una nota superior o igual a 5 estará resaltada de color <span class="text-success"> verde</span>, de lo contrario, una nota inferior a 5 estará resaltada de color <span class="text-danger"> rojo</span>. 
                                        <br/>Además, podrás descargar tus notas en PDF clicando sobre el icono <i class="fa fa-file-pdf-o text-danger" aria-hidden="true"></i>.</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq3" aria-expanded="false">
                                          Mi curso
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq3" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-folder-open-o btn-select" aria-hidden="true"> (Mi curso) </i> para acceder a nuestro curso. <br/>
                                        Una vez dentro, tenemos las siguientes opciones básicas de usuario,
                                        <ul>
                                            <li><i class="fa fa-pencil-square btn-select" aria-hidden="true"> (Tareas) </i> donde podrás subir la tarea correspondiente establecida con una fecha límite.</li>
                                            <li><i class="fa fa-list-ol btn-select" aria-hidden="true"> (Exámenes) </i> donde podrás subir el examen correspondiente establecido con una fecha límite.</li>
                                            <li><i class="fa fa-book btn-select" aria-hidden="true"> (Apuntes) </i> donde podrás descargar los apuntes que vaya subiendo el profesor.</li>
                                            <li><i class="fa fa-calendar btn-select" aria-hidden="true"> (Calendario) </i> donde podrás observar todas las tareas y exámenes con su fecha límite para que éstas sean entregadas a tiempo.</li>
                                        </ul>
                                    </div>
                                  </div>
                                 </div>
                                 <div class="card">
                                     <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq4" aria-expanded="false">
                                          Mi Perfil
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq4" class="collapse" role="tabpanel">
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
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq5" aria-expanded="false">
                                          Registrar incidencia
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq5" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-pencil btn-select" aria-hidden="true"> (Registrar incidencia) </i> para hacer el registro de la incidencia. <br/>
                                        Una vez situados en la pantalla donde registraremos la incidencia tan sólo tendremos que rellenar el área de texto con nuestra incidencia.  El gestor de la academia la solventará tan pronto como sea posible.
                                        </p>
                                        <p> Cuando terminemos de rellenar la incidencia pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm"> Registrar incidencia </button> para enviarla. </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                  <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq6" aria-expanded="false">
                                          Ver incidencias
                                        </a>
                                      </h5>
                                  </div>
                                  <div id="faq6" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-wrench btn-select" aria-hidden="true"> (Ver incidencias) </i> para la visualización de nuestras incidencias registradas en una tabla. <br/>
                                        Cada incidencia está identificada con su ID, el detalle de la misma 
                                        (<i class="fa fa-bolt text-warning" aria-hidden="true"></i>), la fecha de registro y si fue o no solventada por el gestor.
                                        </p> 
                                        <p>Una vez que el gestor de la academia nos solvente la incidencia nos aparecerá en la columna de <strong>Resolución</strong> dos tipos de iconos, <br/>
                                        si nuestra incidencia previamente registrada ya fue solventada por el gestor nos aparecerá el icono 
                                        <i class="fa fa-thumbs-up text-success" aria-hidden="true"></i>.  De lo contrario, nos aparecerá 
                                        <i class="fa fa-thumbs-down text-danger" aria-hidden="true"></i>.
                                        </p>
                                          
                                        <p>Por favor, seamos paciente y comprendamos que el gestor de la academia es humano.  La incidencia será resuelta tan pronto como sea posible.</p>
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
                            <a href="../principal-alumno.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
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