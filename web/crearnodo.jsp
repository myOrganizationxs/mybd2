<%-- 
    Document   : crearnodo
    Created on : 3/03/2015, 12:07:54 PM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

      <%     
        session.setAttribute("NombreEmpresa",(request.getParameter("NombreEmpresa")));
        session.setAttribute("idorganizacion",(request.getParameter("Idorganizacion")));
    %>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("NombreEmpresa")%></title>

    </head>

    <body>
        <h1><%=request.getParameter("NombreEmpresa")%></h1>
        <h1><%=request.getParameter("idorganizacion")%></h1>
        <form>
            <table>
              <tr>
                    <td>Nodo hijo</td>
                    <td><%=request.getParameter("idorganizacion")%></td>
                </tr>  
            </table>
            
            
        </form>
    </body>

