<%-- 
    Document   : index
    Created on : 2/03/2015, 12:57:57 PM
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
        <title>Ingresar Usuario</title>
    </head>
    <body>
        
        <h1>Introduce tu usuario y contraseña</h1>
        <form action="ValidarCuenta" method="post">
        <table>
                <tr>
                    <td>Usuario</td>
                    <td><input type="text" value="" name="usuario"></td>
                </tr>
                 <tr>
                    <td>Contraseña</td>
                    <td><input type="password" value="" name="contra"></td>
                </tr>                         
                    <td>ingresar</td>
                    <td><input type="submit" value="Ingresar" name="Ingresar"></td>
            </table>
        </form>
    </body>
</html>
