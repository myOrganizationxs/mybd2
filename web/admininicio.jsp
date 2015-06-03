<%-- 
    Document   : admininicio
    Created on : 2/03/2015, 01:09:52 PM
    Author     : sergio
--%>

<%@page import="java.util.Vector"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <title>Mis Ogranizaciones</title>
      
    </head>
    <h1>Mis Organizaciones</h1>
    <body>
    <h3>Organizaciones Activas</h3>
        <table class="table table-striped">
            <thead>
            <th>Id Organización</th>
            <th>Nombre</th>
            <th>Estado</th>
           
            </thead>           
          <%     
          int a=0;
          registro regs = new registro();
          Vector<registro> reg = registro.buscarempresa();
          for(int i=0;i<reg.size();i++)
          {%>
          <tr>
              <th><%=reg.get(i).getIdOrganizacion()%></th>
              <th><a href="controlanodos?primero=<%=a%>&&idorganizacion=<%=reg.get(i).getIdOrganizacion()%>&&NombreEmpresa=<%=reg.get(i).getNombreEmpresa()%>"><%=reg.get(i).getNombreEmpresa()%></a></th>
              <th><%=reg.get(i).getEstOrganizacion()%></th>
              <th> <a href="modificar.jsp?idorganizacion=<%=reg.get(i).getIdOrganizacion()%>&&NombreEmpresa=<%=reg.get(i).getNombreEmpresa()%>">Modificar</a></th>
              <th> <a href="BajaEmpresa?idorganizacion=<%=reg.get(i).getIdOrganizacion()%> ">Desactivar</a></th>
          </tr>
           
          
        <%  
          }
          %>
        </table>
        <a href="agregarempresa.jsp"><input type="submit" value="Agregar Empresa" name=""></a>
        <h3>Organizaciones Desactivas</h3>
         <table class="table table-striped">
            <thead>
            <th>Id Organización</th>
            <th>Nombre</th>
            <th>Estado</th>
           
            </thead>           
          <%     
          Vector<registro> regi = registro.buscarempresabaja();
          for(int i=0;i<regi.size();i++)
          {%>
          <tr>
              <th><%=regi.get(i).getIdOrganizacion()%></th>
              <th><%=regi.get(i).getNombreEmpresa()%></th>
              <th><%=regi.get(i).getEstOrganizacion()%></th>
              <th> <a href="AltaEmpresa?idorganizacion=<%=regi.get(i).getIdOrganizacion()%> ">Activar</a></th>
              <th> <a href="BorrarEmpresa?borrar=<%=regi.get(i).getIdOrganizacion()%> ">Elminar</a></th>
          </tr>
           
          
        <%  
          }
          %>
        </table>
        <br>
        <br>
        <br>
        <a href="cuentas.jsp">Cuentas</a>
         
    </body>
</html>
