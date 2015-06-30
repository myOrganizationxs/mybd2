    <%-- 
    Document   : modificarobjetivo
    Created on : 12/03/2015, 03:54:29 PM
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
        <title><%=request.getParameter("nombreorg")%></title>
    </head>
    <body>
        <form action="ModificarObjetivo" method="post">  
            <input type="hidden" value="<%=request.getParameter("nombreorg")%>" name="nombreorg">
            <input type="hidden" value="<%=request.getParameter("idnodo")%>" name="idnodo">
            <input type="hidden" value="<%=request.getParameter("nodopadre")%>" name="nodopadre">
            <input type="hidden" value="<%=request.getParameter("cargo")%>" name="cargo">
            <input type="hidden" value="<%=request.getParameter("idorganizacion")%>" name="idorganizacion">
            <input type="hidden" value="<%=request.getParameter("idorbita")%>" name="idorbita">
            <input type="hidden" value="<%=request.getParameter("posicion")%>" name="posicion">
            <input type="hidden" value="<%=request.getParameter("nombredep")%>" name="nombredep">
            <input type="hidden" value="<%=request.getParameter("mision")%>" name="mision">
            <input type="hidden" value="<%=request.getParameter("vision")%>" name="vision">
            <input type="hidden" value="<%=request.getParameter("idobjetivo")%>" name="idobjetivo">


            
    <table border="1">
                <tr>
                    <td>ID Objetivo</td>
                    <td><%=request.getParameter("idobjetivo")%></td>
                </tr>
                 <tr>
                    <td>Descripcion de Objetivo</td>
                    <td><input type="Text" value="<%=request.getParameter("nombreobjetivo")%>" name="nombreobjetivo"></td>
                </tr>
                 <tr>
                     <td>Indicador</td>
                    <td><input type="Text" value="<%=request.getParameter("indicador")%>" name="indicador"></td>
                </tr>
                <tr>
                     <td>Tipo</td>
                    <td><input type="Text" value="<%=request.getParameter("tipoobj")%>" name="tipoobj"></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><input type="submit" value="Guardar cambios" name=""></td> 
                </tr>                   
            </table>
        </form>
                    <a href="javascript:window.history.back();"><button value="Regresar">Regresar</button></a>
    
    </body>
</html>
