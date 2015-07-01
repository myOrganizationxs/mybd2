<%-- 
    Document   : mensajescompromiso
    Created on : 23/06/2015, 07:17:23 PM
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
        
         <style>.progress{ width: 250px; }</style>
    </head>
    <body>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead border="1">
                <tr>
                <th>se comprometio</th>
                <th>me comprometi</th>
                </tr>
            </thead>
            
            <tr>
                <td><table class="table table-striped">
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
          Vector<registro> regist = registro.listamensajes(Integer.parseInt(request.getParameter("idnodo")));
          for(int i=0;i<regist.size();i++)
            {%>
                   
                    <th><%=regist.get(i).getReceptor()%></th>
                    <th><%=regist.get(i).getPeticion()%></th>
                    <%if(regist.get(i).getPromesa()==0)
                    {%>
                        <th>No ha respondido</th>
                    <%}
                    
                    else
                    {
                        if(regist.get(i).getPromesa()==1)
                        {%>
                        <th>Si acepto</th>  
                        <%
                        }  
                        else
                        {
                            if(regist.get(i).getPromesa()==2)
                            {%>
                            <th>No acepto</th>    
                            <%}
                        }
                    }
                    %>
                    <th><%=regist.get(i).getRevocaciones()%></th>
                    <th><%=regist.get(i).getHoraenvio()%></th>
                    <th><%=regist.get(i).getTp2()%></th>
                    <%if(Integer.parseInt(regist.get(i).getTiemporest())<=-1)
                    {%>
                        <th>Sin dias</th>
                    <%}
                    else{%>
                    <th><%=regist.get(i).getTiemporest()%></th>
                    <%}%>
                    <th><%=regist.get(i).getDiasrevocacion()%></th>
                 
                    <%
                    if(regist.get(i).getMsjestado()==1)
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
                    c=Float.parseFloat(regist.get(i).getDiastranscu())*100/Float.parseFloat(regist.get(i).getDiasrevocacion());
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
                        <%if(regist.get(i).getPromesa()==1)
                        {%>
                         <th><form action="MensajeExitoso" method="post">
                            <input type="hidden" value="<%=regist.get(i).getMensaje()%>" name="idmsg">
                            <input type="submit" value="Finalizar" name="">
                        </form></th>  
                        <%
                        }}%>
                    </tr>
             <%}%>
                
            </table></td>
                <td> <table class="table table-striped">
                <thead>
   
                    <th>Emisor</th>
                    <th>Petición</th>
                    <th>Fecha y Hora de Envio</th>
                    <th>Fecha y Hora a cumplir</th>
                    <th>Fecha y Hora a despues de la revocacion</th>
                    <th>Numero de revocaciones</th>

                </thead>
                <tr>
                    <%     
          Vector<registro> regis = registro.listamensajesresi(Integer.parseInt(request.getParameter("idnodo")));
          for(int i=0;i<regis.size();i++)
            {%>
                   
                    <th><%=regis.get(i).getReceptor()%></th>
                    <th><%=regis.get(i).getPeticion()%></th> 
                    <th><%=regis.get(i).getHoraenvio()%></th>
                    <th><%=regis.get(i).getHoraentrega()%></th>
                    <th><%=regis.get(i).getTp2()%></th>
                    <%
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
                    //OptionPane.showMessageDialog(null,Float.parseFloat(regis.get(i).getDiastranscu())+"x 100 /"+Float.parseFloat(regis.get(i).getDiasrevocacion())+" "+c);
                    
                    
                    
                    %>
                    <%if(regis.get(i).getPromesa()==0){%>
                    <th><form action="Promesa" method="post">
                            <input type="hidden" value="<%=regis.get(i).getMensaje()%>" name="idmsg">
                            <input type="radio" name="Promesa" value="1">Si
                            <input type="radio" name="Promesa" value="2">No
                            <input type="radio" name="Promesa" value="3">Si condicional
                            <input type="submit" value="Aceptar" name="">

                
                            </form></th>
                    <%}%>
                    <%if(regis.get(i).getPromesa()==1){%>
                    <th><%=regis.get(i).getRevocaciones()%></th>                   
                    <%if(regis.get(i).getRevocaciones()<=2){%>
                    
                    
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
                    if (c<=79)
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
                        <%}}%>
                        
                        
                        
                    <th><form action="Posponer" method="post">
                            <input type="hidden" value="<%=regis.get(i).getMensaje()%>" name="idmsg">
                            <input type="hidden" value="<%=regis.get(i).getTp2()%>" name="tp2">
                        <select name="posponer">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                           
                        </select>
                            <input type="submit" value="Pedir mas tiempo" name="">
                        </form>
                    </th>
                    
                    
                    <%}
                    else
                    {%>
                    
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
                        if (c<=79)
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
                    <th>NO TIENES MAS REVOCACIONES</th>    
                    <%}}
                    }%>
                    
                    <%if(regis.get(i).getPromesa()==2){%>                     
                    <th>rechazaste esta solicitud</th>
                    <%}%>
                    
                    
                    </tr>
             <%}%>
                
            </table>
       
    </body>
</html>
