<%@ page contentType="text/html; charset=UTF-8" %>

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
    
<div id="bg-academy-principal-not-ayuda">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-noticiario.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./aniadir-articulo.jsp" title="Ir a Añadir Artículo">
                                <i class="fa fa-file-text fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./modificar-articulo.jsp" title="Ir a Modificar Artículo">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Modificar Artículo </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./eliminar-articulo.jsp" title="Ir a Eliminar Artículo">
                                <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../index.jsp" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> Marco </span>
                                <a href="../../index.jsp"> <span id="desconectar">(Desconectar)</span></a>
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
                    <span id="quien" title="Ir a Mi Perfil"> Marco </span>
                    <a href="../index.jsp"> <span id="desconectar">(Desconectar)</span></a>
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
                                          ¿Cómo crear una nueva noticia?
                                        </a>
                                      </h5>
                                    </div>

                                    <div id="faq1" class="collapse show" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> Muy fácil, en el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-file-text btn-select" aria-hidden="true"> (Añadir artículo) </i> para crear la nueva noticia. <br/>
                                        Cuando estemos dentro podremos ver la ID correspondiente a la noticia, la fecha de publicación (actual), y a continuación detallaremos el título de la misma, una imagen principal y el texto acorde a la noticia.
                                        </p>
                                        <p> Cuando terminemos de redactarla pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm">Registrar artículo</button> y lista para ser publicada en la Web.</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq2" aria-expanded="false">
                                          ¿Cómo modificar una noticia?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq2" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-pencil btn-select" aria-hidden="true"> (Modificar artículo) </i> para modificar la noticia que deseemos. <br/>
                                        Una vez dentro podremos ver una tabla con todas las noticias publicadas hasta el momento.  Podremos hacer una búsqueda para facilitar la identificación de la noticia. Una vez localizada, pulsamos sobre la misma y realizamos la modificación.
                                        </p>
                                        <p> Cuando terminemos de modificarla pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm">Modificar artículo</button>. </p>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="card">
                                    <div class="card-header" role="tab">
                                      <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#faq3" aria-expanded="false">
                                          ¿Cómo eliminar una noticia?
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq3" class="collapse" role="tabpanel">
                                      <div class="card-block text-justify">
                                        <p> En el menú principal tendremos que pulsar sobre el icono 
                                        <i class="fa fa-eraser btn-select" aria-hidden="true"> (Eliminar artículo) </i> para eliminar la noticia que deseemos. <br/>
                                            Una vez dentro podremos ver una tabla con todas las noticias publicadas hasta el momento.  Podremos hacer una búsqueda para facilitar la identificación de la noticia. Una vez localizada, pulsamos sobre <i class="fa fa-trash btn-select" aria-hidden="true"></i> acorde a la noticia y se procederá a la eliminación de la misma.
                                        </p>
                                        <p> Cuando terminemos de eliminar las noticias que deseemos pulsamos sobre el botón 
                                        <button type="button" class="btn btn-primary btn-sm">Volver</button> para volver al Menú principal. </p>
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
                                          Salir
                                        </a>
                                      </h5>
                                    </div>
                                    <div id="faq5" class="collapse" role="tabpanel">
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
                            <a href="../principal-noticiario.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
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