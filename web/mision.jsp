<%-- 
    Document   : mision
    Created on : 30-jun-2015, 15:59:37
    Author     : jebus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("nombredep")%></title>
    </head>
    <body>
        
        <%=request.getParameter("mision")%>
        
        <a href="modificarorbita.jsp?idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a>
        
    </body>
    
</html>
