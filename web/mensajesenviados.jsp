<%-- 
    Document   : mensajesenviados
    Created on : 26/05/2015, 06:01:32 PM
    Author     : sergio
--%>

<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-striped">
                <thead>
   
                    <th>Receptor</th>
                    <th>Petición</th>
                    <th>Promesa</th>
                    <th>Numero de revocaciones</th>
                    <th>Fecha y Hora de Envio</th>
                    <th>Fecha y Hora a cumplir</th>
                    <th>Tiempo restante</th>
                    <th>Dias añadidos</th>
                </thead>
                <tr>
                    <%     
          Vector<registro> regis = registro.listamensajes(Integer.parseInt(request.getParameter("idnodo")));
          for(int i=0;i<regis.size();i++)
            {%>
                   
                    <th><%=regis.get(i).getReceptor()%></th>
                    <th><%=regis.get(i).getPeticion()%></th>
                    <%if(regis.get(i).getPromesa()==0)
                    {%>
                        <th>No ha respondido</th>
                    <%}
                    
                    else
                    {
                        if(regis.get(i).getPromesa()==1)
                        {%>
                        <th>Si acepto</th>  
                        <%
                        }  
                        else
                        {
                            if(regis.get(i).getPromesa()==2)
                            {%>
                            <th>No acepto</th>    
                            <%}
                        }
                    }
                    %>
                    <th><%=regis.get(i).getRevocaciones()%></th>
                    <th><%=regis.get(i).getHoraenvio()%></th>
                    <th><%=regis.get(i).getHoraentrega()%></th>
                    <th><%=regis.get(i).getTiemporest()%></th>
                    <th><%=regis.get(i).getDiasrevocacion()%></th>
                    </tr>
             <%}%>
                
            </table>
    </body>
</html>
