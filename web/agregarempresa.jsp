<%-- 
    Document   : agregarempresa
    Created on : 2/03/2015, 01:34:33 PM
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
        <title>Nueva empresa</title>
    </head>
    <body>
        <h1>Nueva empresa</h1>
        <form action="AgregarEmpresa" method="post">
        <table>
                <tr>
                    <td>Nombre de la empresa</td>
                    <td><input type="text" value="" name="Nombre"></td>
                </tr>
                <tr>
                    <td>Imagen de la empresa</td>
                    <td><input type="file" value="" name="imgorg"></td>
                </tr>
                    <td>Agregar empresa</td>
                    <td><input type="submit" value="Agregar Empresa" name="Agregar Empresa"></a></td>
            </table>
        </form>
    </body>
</html>
