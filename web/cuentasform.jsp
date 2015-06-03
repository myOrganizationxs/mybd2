<%-- 
    Document   : cuentas
    Created on : 18/03/2015, 05:46:11 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ModificarNodo" method="post">             
            <table border="1">
                <tr>
                    <td></td>
                    <td><%=request.getParameter("idnuevo")%></td>
                </tr>
                 <tr>
                    <td>Nodo Padre</td>
                    <td><input type="Text" value="<%=request.getParameter("idpadrenuevo")%>" name="idpadrenuevo"></td>
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
