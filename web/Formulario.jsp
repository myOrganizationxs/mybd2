<%-- 
    Document   : VerPerfil
    Created on : 26/03/2015, 06:39:37 PM
    Author     : sergio
--%>

<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <%
            registro myr = new registro();
            myr.consultausuario(Integer.parseInt(request.getParameter("idusuario")));
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pefil</title>
        
    </head>
    <body>
        <h1>Perfil</h1>
        <form action="AltaCliente" method="post">
            <input type="hidden" value="<%=myr.getId()%>" name="idusuario">
            <input type="hidden" value="<%=myr.getIdOrganizacion()%>" name="idorganizacion">
            <input type="hidden" value="<%=myr.getNombreEmpresa()%>" name="NombreEmpresa">
            <input type="hidden" value="<%=request.getParameter("nodousu")%>" name="nodousu">
            
        <table class="table table-striped">
            <tr>
                <th>id Usuario</th>
                <th><%=myr.getId()%></th>
            </tr>
            <tr>
                <th>Nombre</th>
                <td><input type="Text" value="<%=myr.getNo()%>" name="nombre"></td>
            </tr>
            <tr>
                <th>Apellido Paterno</th>
                <td><input type="Text" value="<%=myr.getAp()%>" name="app"></td>
            </tr>
            <tr>
                <th>Apellido Materno</th>
                <td><input type="Text" value="<%=myr.getAm()%>" name="apm"></td>
            </tr>
            <tr>
                <th>Fecha de nacimiento</th>
                <td><input type="Text" value="<%=myr.getFen()%>" name="fechadenacimiento"></td>
            </tr>
            <tr>
                <th>Foto</th>
                <td><input type="Text" value="<%=myr.getFo()%>" name="foto"></td>
            </tr>
            <tr>
                <th>Correo Electronico</th>
                <td><input type="Text" value="<%=myr.getCo()%>" name="correo"></td>
            </tr>
            <tr>
                <th>Telefono</th>
                <td><input type="Text" value="<%=myr.getTel()%>" name="numero"></td>
            </tr>           
            <tr>
                <th>Usuario</th>
                <td><input type="Text" value="<%=myr.getUs()%>" name="usuario"></td>
            </tr>
            <tr>
                <th>Contraseña</th>
                <td><input type="Text" value="<%=myr.getCont()%>" name="contra"></td>
            </tr>
            <tr>
            
        </table>
            <input type="submit" value="Guardar cambios" name="">
        </form>
            
    </body>
</html>

