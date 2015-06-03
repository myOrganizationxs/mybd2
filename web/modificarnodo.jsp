<%-- 
    Document   : modificarnodo
    Created on : 3/03/2015, 02:02:52 PM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("NombreEmpresa")%></title>
    </head>
    <body>
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
        session.setAttribute("idnuevo",Integer.parseInt(request.getParameter("idnuevo")));
        session.setAttribute("idpadrenuevo",Integer.parseInt(request.getParameter("idpadrenuevo")));
        session.setAttribute("nuevopuesto",request.getParameter("nuevopuesto"));
        session.setAttribute("variable",Integer.parseInt(request.getParameter("variable")));
        %>
        
 
        <h1><%=request.getParameter("nombreorg")%></h1>

        <form action="ModificarNodo" method="post">  
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
            <input type="hidden" value="<%=request.getParameter("idpadrenuevo")%>" name="idpadrenuevo">
            <table class="table table-striped">
                <tr>
                    <td>ID nodo</td>
                    <td><%=request.getParameter("idnuevo")%></td>
                </tr>
                 <tr>
                    <td>Nodo Padre</td>
                    <td><%=request.getParameter("idpadrenuevo")%></td>
                </tr>
                 <tr>
                     <td>Puesto</td>
                     
                    <td><input type="Text" value="<%=request.getParameter("nuevopuesto")%>" name="nuevopuesto"></td>
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
