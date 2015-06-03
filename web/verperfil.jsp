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
        <table class="table table-striped">
            <tr>
                <th>id Usuario</th>
                <th><%=myr.getId()%></th>
            </tr>
            <tr>
                <th>Nombre</th>
                <th><%=myr.getNo()%></th>
            </tr>
            <tr>
                <th>Apellido Paterno</th>
                <th><%=myr.getAp()%></th>
            </tr>
            <tr>
                <th>Apellido Materno</th>
                <th><%=myr.getAm()%></th>
            </tr>
            <tr>
                <th>Fecha de nacimiento</th>
                <th><%=myr.getFen()%></th>
            </tr>
            <tr>
                <th>Foto</th>
                <th><%=myr.getFo()%></th>
            </tr>
            <tr>
                <th>Correo Electronico</th>
                <th><%=myr.getCo()%></th>
            </tr>
            <tr>
                <th>Telefono</th>
                <th><%=myr.getTel()%></th>
            </tr>
            <tr>
                <th>Ultima conexion</th>
                <th><%=myr.getUc()%></th>
            </tr>
            <tr>
                <th>Fecha de Creacion</th>
                <th><%=myr.getFc()%></th>
            </tr>
            <tr>
                <th>Usuario</th>
                <th><%=myr.getUs()%></th>
            </tr>
            <tr>
                <th>Contraseña</th>
                <th><%=myr.getCont()%></th>
            </tr>
            <tr>
                <th>Tipo</th>
                <%if(myr.getTi()==1){%>
                <th>Cliente</th>
              <%}%>
            </tr>
            <tr>
                <th>Estado</th>
                <%if(myr.getEs()==1){%>
              <th>Activo</th>
              <%}
              else{%>
              <th>Desactivado</th>
              <%}%>
            </tr>
            <tr>
                <th>Esatus</th>
                <%if(myr.getMo()==1){%>
              <th>Offline</th>
              <%}
              else
              {%>
              <th>Online</th>
              <%}%>
            </tr>
            
        </table>
            <a href="javascript:window.history.back();"><button value="Regresar">Regresar</button></a>
    </body>
</html>
