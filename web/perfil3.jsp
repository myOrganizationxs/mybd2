<%-- 
    Document   : perfil
    Created on : 23/03/2015, 09:41:45 PM
    Author     : sergio
--%>

<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <%registro myr = new registro();
    myr.perfil(Integer.parseInt(request.getParameter("idusuario2")));
    %>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pefil</title>
    </head>
    <body>
        
        <form action="ModificarUsuario2" method="post">
        
        <input type="hidden" value="<%=request.getParameter("nombreorg")%>" name="nombreorg">
            <input type="hidden" value="<%=request.getParameter("idnodo")%>" name="idnodo">
            <input type="hidden" value="<%=request.getParameter("nodopadre")%>" name="nodopadre">
            <input type="hidden" value="<%=request.getParameter("cargo")%>" name="cargo">
            <input type="hidden" value="<%=request.getParameter("idorganizacion")%>" name="idorganizacion">
            <input type="hidden" value="<%=request.getParameter("idorbota")%>" name="idorbota">
            <input type="hidden" value="<%=request.getParameter("nombredep")%>" name="nombredep">
            <input type="hidden" value="<%=request.getParameter("mision")%>" name="mision">
            <input type="hidden" value="<%=request.getParameter("vision")%>" name="vision">
            <input type="hidden" value="<%=request.getParameter("posicion")%>" name="posicion">
            <input type="hidden" value="<%=request.getParameter("nodousu")%>" name="nodousu">
          
             <input type="hidden" value="<%=request.getParameter("idusuario2")%>" name="idusuario2">
        <input type="hidden" value="<%=request.getParameter("usuario2")%>" name="usuario2">
        <input type="hidden" value="<%=request.getParameter("ap2")%>" name="ap2">
        <input type="hidden" value="<%=request.getParameter("am2")%>" name="am2">
            
        <input type="hidden" value="<%=myr.getIdusuario()%>" name="idusuario">
        <input type="hidden" value="<%=myr.getNombre()%>" name="nombre">
        <input type="hidden" value="<%=myr.getApellidopaterno()%>" name="app">
        <input type="hidden" value="<%=myr.getApellidomaterno()%>" name="apm">
        <input type="hidden" value="<%=myr.getFechadenacimiento()%>" name="fechadenacimiento">
        <table class="table table-striped">
                <tr>
                    
                    <td>Id usuario</td>
                    <td><%=myr.getIdusuario()%></td>
                </tr>                         
                <tr>
                    <td>Nombres</td>
                    <td><%=myr.getNombre()%></td>
                </tr>
                <tr>
                    <td>Apellido Paterno</td>
                    <td><%=myr.getApellidopaterno()%></td>
                </tr>
                <tr>
                    <td>Apellido Materno</td>
                    <td><%=myr.getApellidomaterno()%></td>
                    
                </tr>
                <tr>
                    <td>Fecha de Nacimiento</td>
                    <td><%=myr.getFechadenacimiento()%></td>
                </tr>
                <tr>
                    <td>Foto</td>
                    <td><input type="text" value="<%=myr.getFoto()%>" name="Foto"></td>
                </tr>
                <tr>
                    <td>Correo Electronico</td>
                    <td><input type="text" value="<%=myr.getCorreo()%>" name="correo"></td>
                </tr>
                <tr>
                    <td>Numero Telefonico</td>
                    <td><input type="text" value="<%=myr.getNumero()%>" name="numero"></td>
                </tr>
                <tr>
                    <td>Usuario</td>
                    <td><input type="text" value="<%=myr.getUsuario()%>" name="usuario"></td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td><input type="text" value="<%=myr.getContra()%>" name="contra"></td>
                </tr>
                
            </table>
                <input type="submit" value="Modificar" name="ModificarCliente">
                
        </form>
                <a href="javascript:window.history.back();"><button value="Regresar">Regresar</button></a>
    </body>
</html>
