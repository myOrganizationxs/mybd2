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
    myr.perfil(Integer.parseInt(request.getParameter("idcuenta")));
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
        
        <form action="ModificarUsuario" method="post">
        <input type="hidden" value="<%=myr.getIdusuario()%>" name="idusuario">
            <table class="table table-striped">
                <tr>
                    
                    <td>Id usuario</td>
                    <td><%=myr.getIdusuario()%></td>
                </tr>                         
                <tr>
                    <td>Nombres</td>
                    <td><input type="text" value="<%=myr.getNombre()%>" name="nombre"></td>
                </tr>
                <tr>
                    <td>Apellido Paterno</td>
                    <td><input type="text" value="<%=myr.getApellidopaterno()%>" name="app"></td>
                </tr>
                <tr>
                    <td>Apellido Materno</td>
                    <td><input type="text" value="<%=myr.getApellidomaterno()%>" name="apm"></td>
                    
                </tr>
                <tr>
                    <td>Fecha de Nacimiento</td>
                    <td><input type="text" value="<%=myr.getFechadenacimiento()%>" name="fechadenacimiento"></td>
                </tr>
                <tr>
                    <td>Foto</td>
                    <td><%=myr.getFoto()%></td>
                    <td><input type="file" value="<%=myr.getFoto()%>" name="Foto"></td>
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
                <input type="submit" value="Modificar Cliente" name="ModificarCliente">
                
        </form>
                <a href="javascript:window.history.back();"><button value="Regresar">Regresar</button></a>
    </body>
</html>
