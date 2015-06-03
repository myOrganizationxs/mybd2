<%-- 
    Document   : asignarnodo
    Created on : 24/03/2015, 10:09:17 PM
    Author     : sergio
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
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
        <title>Asignar Nodo</title>
    </head>
    <body>
        <h1>Nodos disponibles</h1>
        <table class="table table-striped">
            <thead>
                <th>Id Organizacion</th>
                <th>Nombre de Organizacion</th>
                <th>Id Nodo</th>
                <th>Id Padre</th>
                <th>Cargo</th>
                
            </thead>
        <%     
          Vector<registro> reg = registro.buscarnodousu();
          for(int i=0;i<reg.size();i++)
          {
              int abc=0; 
     
              Vector<registro> regi = registro.buscarnodousu2();
              for(int x=0;x<regi.size();x++)
              {
                  //nodo                         usuario
                if(reg.get(i).getNodo_nodo()==regi.get(x).getNodo_nodo2() && abc==0)
                {
                    abc=1;
                    //JOptionPane.showMessageDialog(null,reg.get(i).getNodo_nodo()+" "+regi.get(x).getNodo_nodo2()+" NO");
                }
                else
                {
                    //JOptionPane.showMessageDialog(null,reg.get(i).getNodo_nodo()+" "+regi.get(x).getNodo_nodo2()+" SI");
                }
              }
              if(abc==0)
                {
                %>
                <tr>
                    <th><%=reg.get(i).getIdorganizacion2()%></th>
                    <th><%=reg.get(i).getNombreorg()%></th>
                    <th><%=reg.get(i).getNodo_nodo()%></th>
                    <th><%=reg.get(i).getNodoidpadre()%></th>
                    <th><%=reg.get(i).getCargos()%></th>
                    <th><a href="AsignarNodo?idusuario=<%=request.getParameter("idusuario")%>&&idnodo=<%=reg.get(i).getNodo_nodo()%>">Asignar</a></th>
                </tr>
               <%
                }
          }
          %>
          </table>
    </body>
</html>
