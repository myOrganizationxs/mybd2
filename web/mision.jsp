<%-- 
    Document   : mision
    Created on : 30-jun-2015, 15:59:37
    Author     : jebus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        int variable=0;
        %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("nombredep")%></title>
    </head>
    <body>
        
        <%=request.getParameter("mision")%>
        
        <a href="modificarorbita.jsp?idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a>
        
    </body>
    
</html>
