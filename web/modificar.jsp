<%-- 
    Document   : modificar
    Created on : 2/03/2015, 05:40:24 PM
    Author     : sergio
--%>
<%@page import="javax.swing.JOptionPane"%>
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
        <title>Modificar</title>
    </head>
    <body>
        <%
        session.setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
        session.setAttribute("NombreEmpresa",(request.getParameter("NombreEmpresa")));
        
 
        
    %>
    <h1><%=request.getParameter("NombreEmpresa")%></h1>
    <form action="ModificarEmpresa" method="post">
        <table>
                                 
                    <input type="hidden" value="<%=request.getParameter("idorganizacion")%>" name="idorganizacion">
                
                <tr>
                    <td>Nombre de la empresa</td>
                    <td><input type="text" value="<%=request.getParameter("NombreEmpresa")%>" name="Nombre"></td>
                </tr>                         
                    <td>Agregar empresa</td>
                    <td><input type="submit" value="Modificar" name="Modificar"></a></td>
                    <td><a href="admininicio.jsp"><input type="button" value="Regresar" name=""></a></td>
            </table>
     </form>
    </body>
</html>
