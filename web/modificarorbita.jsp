<%-- 
    Document   : modificarorbita
    Created on : 9/03/2015, 08:03:44 PM
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
        <form action="ModificarOrbita" method="post">  
            <input type="hidden" value="<%=request.getParameter("nombreorg")%>" name="nombreorg">
            <input type="hidden" value="<%=request.getParameter("idnodo")%>" name="idnodo">
            <input type="hidden" value="<%=request.getParameter("nodopadre")%>" name="nodopadre">
            <input type="hidden" value="<%=request.getParameter("cargo")%>" name="cargo">
            <input type="hidden" value="<%=request.getParameter("idorganizacion")%>" name="idorganizacion">
            <input type="hidden" value="<%=request.getParameter("idorbita")%>" name="idorbita">
            <input type="hidden" value="<%=request.getParameter("posicion")%>" name="posicion">


            
    <table class="table table-striped">
                 <tr>
                    <td>Nombre de Departamento</td>
                    <td><input type="Text" class="form-control" value="<%=request.getParameter("nombredep")%>" name="nombredep"></td>
                </tr>
                 <tr>
                     <td>Mision</td>
                    <td><textarea class="form-control" rows="3" value="<%=request.getParameter("mision")%>" name="mision"></textarea></td>
                </tr>
                <tr>
                     <td>Vision</td>
                     <td><textarea class="form-control" rows="3" value="<%=request.getParameter("vision")%>" name="vision"></textarea></td>
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
