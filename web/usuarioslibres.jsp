<%-- 
    Document   : cuentas
    Created on : 23/03/2015, 04:39:33 PM
    Author     : sergio
--%>

<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
    <%
        request.getSession().setAttribute("nombreorg",request.getParameter("nombreorg"));
        request.getSession().setAttribute("idnodo",Integer.parseInt(request.getParameter("idnodo")));
        request.getSession().setAttribute("nodopadre",Integer.parseInt(request.getParameter("nodopadre")));
        request.getSession().setAttribute("cargo",request.getParameter("cargo"));
        request.getSession().setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
        request.getSession().setAttribute("idorbita",Integer.parseInt(request.getParameter("idorbita")));
        request.getSession().setAttribute("nombredep",request.getParameter("nombredep"));
        request.getSession().setAttribute("mision",request.getParameter("mision"));
        request.getSession().setAttribute("vision",request.getParameter("vision"));
        request.getSession().setAttribute("posicion",Integer.parseInt(request.getParameter("posicion")));
        
        // request.getSession().setAttribute("idnuevo",Integer.parseInt(request.getParameter("idnuevo")));
        //request.getSession().setAttribute("idpadrenuevo",Integer.parseInt(request.getParameter("idpadrenuevo")));
    %>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuentas</title>
    </head>
    <body>
        <h1>Perfil</h1>
        <a href="CrearCuenta2?idnuevo=<%=request.getParameter("idnuevo")%>&&idpadrenuevo=<%=request.getParameter("idpadrenuevo")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear cuenta</a>
                                        
        <h2>Cuentas activas</h2>
         <table class="table table-striped">
            <thead>
            <th>Id Cuenta</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Fecha de Creación</th>
            <th>Ultima Conexión</th>
            <th>Tipo de Cuenta</th>
            <th>Estado de Cuenta</th>
            <th>Estatus</th>
            <th>Id Usuario</th>
            <th>Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>id Nodo</th>
            
            </thead>           
          <%     
          int a=0;
          registro regs = new registro();
          Vector<registro> reg = registro.buscarcuenta2();
          for(int i=0;i<reg.size();i++)
          {%>
          <tr>
              <th><%=reg.get(i).getIdcuenta()%></th>
              <th><%=reg.get(i).getUsu()%></th>
              <th><%=reg.get(i).getCon()%></th>
              <th><%=reg.get(i).getFechacrea()%></th>
              <%if(reg.get(i).getUtimacon()==null)
              {%>
              <th>No se ha conectado</th>
              <%}
              else
                {%>
              <th><%=reg.get(i).getUtimacon()%></th>
              <%}%>
              <%if(reg.get(i).getTipo()==1){%>
              <th>Cliente</th>
              <%}
              if(reg.get(i).getTipo()==2){%>
                <th>Administrador</th>
                <%}%>
              <%if(reg.get(i).getEstado()==1){%>
              <th>Activo</th>
              <%}
              else{%>
              <th>Desactivado</th>
              <%}%>
              <%if(reg.get(i).getModo()==1){%>
              <th>Offline</th>
              <%}
              else
              {%>
              <th>Online</th>
              <%}%>
              <th><%=reg.get(i).getIdusuario()%></th>
              <th><%=reg.get(i).getNombre()%></th>
              <th><%=reg.get(i).getApellidopaterno()%></th>
              <th><%=reg.get(i).getApellidomaterno()%></th>
              <%if(reg.get(i).getNodo3()==0){%>
              <th>Sin Nodo</th>
              <%}
              else{%>
              <th><%=reg.get(i).getNodo3()%></th>
              <%}%>
              <%if(reg.get(i).getNodo3()==0){%>
              <th> <a href="AsignarNodo2?idnuevo=<%=request.getParameter("idnuevo")%>&&idusuario=<%=reg.get(i).getIdusuario()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Asignar</a></th>
              <%}
              //response.sendRedirect("empresa.jsp?idnodo="+request.getParameter("idnodo")+"&&nodopadre="+request.getParameter("nodopadre")+"&&cargo="+request.getParameter("cargo")+"&&idorganizacion="+request.getParameter("idorganizacion")+"&&nombreorg="+request.getParameter("nombreorg")+"&&idorbita="+request.getParameter("idorbita")+"&&nombredep="+request.getParameter("nombredep")+"&&mision="+request.getParameter("mision")+"&&vision="+request.getParameter("vision")+"&&posicion="+request.getParameter("posicion"));
              %>              
          </tr>
           
          
          
        <%  
          }
          %>
        </table>        
    </body>
</html>