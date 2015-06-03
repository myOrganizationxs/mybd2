<%-- 
    Document   : crearobjetivo
    Created on : 11/03/2015, 12:15:17 PM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <%
        session.setAttribute("nombreorg",request.getParameter("nombreorg"));
        session.setAttribute("idnodo",Integer.parseInt(request.getParameter("idnodo")));
        session.setAttribute("nodopadre",Integer.parseInt(request.getParameter("nodopadre")));
        session.setAttribute("cargo",request.getParameter("cargo"));
        session.setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
        session.setAttribute("idorbita",Integer.parseInt(request.getParameter("idorbita")));
        session.setAttribute("nombredep",request.getParameter("nombredep"));
        session.setAttribute("mision",request.getParameter("mision"));
        session.setAttribute("vision",request.getParameter("vision"));
        session.setAttribute("posicion",Integer.parseInt(request.getParameter("posicion")));
        %>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="CrearObjetivo" method="post">  
            <input type="hidden" value="<%=request.getParameter("nombreorg")%>" name="nombreorg">
            <input type="hidden" value="<%=request.getParameter("idnodo")%>" name="idnodo">
            <input type="hidden" value="<%=request.getParameter("nodopadre")%>" name="nodopadre">
            <input type="hidden" value="<%=request.getParameter("cargo")%>" name="cargo">
            <input type="hidden" value="<%=request.getParameter("idorganizacion")%>" name="idorganizacion">
            <input type="hidden" value="<%=request.getParameter("idorbita")%>" name="idorbita">
            <input type="hidden" value="<%=request.getParameter("nombredep")%>" name="nombredep">
            <input type="hidden" value="<%=request.getParameter("mision")%>" name="mision">
            <input type="hidden" value="<%=request.getParameter("vision")%>" name="vision">
            <input type="hidden" value="<%=request.getParameter("posicion")%>" name="posicion">
            <input type="hidden" value="<%=request.getParameter("variable")%>" name="variable">
            <input type="hidden" value="<%=request.getParameter("idnuevo")%>" name="idnuevo">
            <table class=""table table-striped"">
                <tr>
                    <td>Nombre de Objetivo</td>
                    <td><input type="Text" class="form-control" value="" name="nombreobj"></td></td>
                </tr>
                 <tr>
                    <td>Indicador</td>
                    <td><input class="form-control" type="Text" value="" name="indicador"></td>
                </tr>
                 <tr>
                     <td>Tipo de Objetivo</td>
                    <td><input class="form-control" type="Text" value="" name="tipoobj"></td>
                </tr>
                <td><input type="submit" value="Crear Objetivo" name=""></td> 
                                 
            
            </table>
        </form>
    </body>
</html>
