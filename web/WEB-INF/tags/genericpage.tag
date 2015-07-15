<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<script src="js/sweetalert.min.js"></script>

<link rel="stylesheet" href="js/sweetalert.css">
<link rel="stylesheet" href="css/bootstrap.min.css">


<!DOCTYPE html>
<html>

    <body>
        <div id="pageheader">

            <jsp:invoke fragment="header"/>
            

            <nav class="navbar navbar-inverse" style="float:top; background: black !important; box-shadow: 0 0 10px 2px rgba(0, 0, 0, .5);" role="navigation">
                <div class="navbar-header-inverse">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Desplegar navegación</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <%

                        String a = request.getParameter("usuario2");
                        if (request.getParameter("idorganizacion") == null) {
                    %>

                    <%
                    } else {
                        if (request.getParameter("nombreorg") == null) {

                        } else {
                    %>
                    <!--<img src="images/A-button.png" style="max-width: 35px; float: left;">-->
                    <p class="navbar-text">ELIPSO</p>  
                    <%}
                        }
                    if(request.getParameter("ap2")!=null && request.getParameter("am2")!=null && request.getParameter("usuario2")!=null){
                    
                    //"controlarnodousu?alerta=1&&idorganizacion="+myr.getIdOrganizacion()+"&&primero=0&&nombreorg="+myr.getNombreEmpresa()+"&&usuario2="+myr.getNombre()+"&&ap2="+myr.getAp()+"&&am2="+myr.getAm()+"&&idusuario2="+myr.getIdusuario()+"&&nodousu="+myr.getNodousu()
                    %>
                    <p class="navbar-text">Hola <%=a%> <%=request.getParameter("ap2")%> <%=request.getParameter("am2")%></p>  
                   <a class="navbar-brand" href="controlarnodousu?nodousu=<%=request.getParameter("nodousu")%>&&alerta=0&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&primero=0&&nombreorg=<%=request.getParameter("nombreorg")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>">Inicio</a>
                   <a class="navbar-brand" href="controlarnodousu3?nodousu=<%=request.getParameter("nodousu")%>&&idnodo=<%=request.getParameter("nodousu")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>">Mi Orbita</a>
                   
                   <a class="navbar-brand" style="float:right" href="index.jsp">Cerrar Sesión</a>
                   <%//alerta="+request.getParameter("alerta")+"&&idnodo="+rgt.getIdnodo2()+"&&nodopadre="+rgt.getIdpadre2()+"&&cargo="+rgt.getCargo2()+"&&idorganizacion="+rgt.getIdorganizacion2()+"&&nombreorg="+rgt.getNombreorganizacion2()+"&&idorbita="+rgt.getIdorbita2()+"&&nombredep="+rgt.getNombredep2()+"&&mision="+rgt.getMision2()+"&&vision="+rgt.getVision2()+"&&posicion="+rgt.getPosicion2()+"&&usuario2="+request.getParameter("usuario2")+"&&am2="+request.getParameter("am2")+"&&ap2="+request.getParameter("ap2")+"&&idusuario2="+request.getParameter("idusuario2")%>
                   <a class="navbar-brand" style="float:right"href="perfil3.jsp?nodousu=<%=request.getParameter("nodousu")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbota=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>&&idusuario2=<%=request.getParameter("idusuario2")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>">Mi Perfil</a>
                   
                   
                    <%}
                   else
                  {%>
                   <a class="navbar-brand" href="index.jsp">Iniciar Sesión</a>
                   <%}%>
                   
                   <a class="navbar-brand "href="#"style="float:right;">Mensajes<span class="badge ">33</span></a>
                </div>
            </nav>
        </div>
       
        
    </body>

</html>