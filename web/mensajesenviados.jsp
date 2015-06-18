<%-- 
    Document   : mensajesenviados
    Created on : 26/05/2015, 06:01:32 PM
    Author     : sergio
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>th.barra{ width: 300px; }</style>
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
                    <th>Dias totales</th>
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
                    <th><%=regis.get(i).getTp2()%></th>
                    <%if(Integer.parseInt(regis.get(i).getTiemporest())<=-1)
                    {%>
                        <th>Sin dias</th>
                    <%}
                    else{%>
                    <th><%=regis.get(i).getTiemporest()%></th>
                    <%}%>
                    <th><%=regis.get(i).getDiasrevocacion()%></th>
                 
                    <%
                    if(regis.get(i).getMsjestado()==1)
                    {%>
                     <th class="barra"><div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-info" role="progressbar"
                                aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                style="width:100%">
                                <span class="sr-only">80% completado (peligro / error)</span>
                                </div>
                        </div></th>   
                    <%}
                    else{
                    float c;
                    c=Float.parseFloat(regis.get(i).getDiastranscu())*100/Float.parseFloat(regis.get(i).getDiasrevocacion());
                    if(String.valueOf(c)=="NaN")
                    {
                        c=0;
                    }
                    if(c>=101)
                    {
                        c=100;
                    }
                    //JOptionPane.showMessageDialog(null,Float.parseFloat(regis.get(i).getDiastranscu())+"x 100 /"+Float.parseFloat(regis.get(i).getDiasrevocacion())+" "+c);
                    %>
                    <%if (c<=79)
                    {%>
                    <th class="barra"><div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-success" role="progressbar"
                                aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                style="width:<%=c%>%">
                                <span class="sr-only">80% completado (peligro / error)</span>
                                </div>
                        </div></th>
                        <%}%>
                    <%if (c>=80 && c<=99)
                    {%>
                    <th class="barra"><div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-warning" role="progressbar"
                                aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                style="width:<%=c%>%">
                                <span class="sr-only">80% completado (peligro / error)</span>
                                </div>
                        </div></th>
                        <%}%>
                    <%if (c==100)
                    {%>
                    <th class="barra"><div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-danger" role="progressbar"
                                aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                style="width:<%=c%>%">
                                <span class="sr-only">80% completado (peligro / error)</span>
                                </div>
                        </div></th>
                        <%}%>
                        <%if(regis.get(i).getPromesa()==1)
                        {%>
                         <th><form action="MensajeExitoso" method="post">
                            <input type="hidden" value="<%=regis.get(i).getMensaje()%>" name="idmsg">
                            <input type="submit" value="Finalizar" name="">
                        </form></th>  
                        <%
                        }}%>
                    </tr>
             <%}%>
                
            </table>
             
    </body>
</html>
