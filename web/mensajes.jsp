<%-- 
    Document   : mensajes
    Created on : 26/05/2015, 12:50:07 PM
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="popup">
       <form action="Mensajes" method="post">
           <input type="hidden" value="<%=request.getParameter("idnodo")%>" name="emisor">
    <div>
        <label for="emiso">De</label>
        <label for="name"><%=request.getParameter("idnodo")%></label>
    </div>
    <div>
        <label for="recepto">Para</label>
        <input type="text"  value="" name="receptor"/>
    </div>
    <div>
        <label for="msg">Petición</label>
        <textarea name="msg"></textarea>
    </div>
    <div>
        <label for="msg">Tiempo</label>
        <input type="date" name="fecha" />
    </div>
           <input type="submit" value="Enviar" name="">
</form>
        </div>
    </body>
</html>
