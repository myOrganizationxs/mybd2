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
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cuentas</title>
    </head>
    <body>
        <h1>Crear cuentas</h1>
        <a href="CrearCuenta">Crear cuenta</a>
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
          Vector<registro> reg = registro.buscarcuenta();
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
              if(reg.get(i).getTipo()==2)
              {%>
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
              <th> <a href="DesactivarCuenta?idcuenta=<%=reg.get(i).getIdcuenta()%>">Desactivar</a></th>
              <%if(reg.get(i).getNodo3()==0){%>
              <th><a href="asignarnodo.jsp?idusuario=<%=reg.get(i).getIdusuario()%>">Asignar Nodo</a></th>
              <%}
              else{%>
              <th><a href="DesasignarNodo?idusuario=<%=reg.get(i).getIdusuario()%>">Desasignar Nodo</a></th>
              <%}%>
              <th> <a href="perfil.jsp?idcuenta=<%=reg.get(i).getIdcuenta()%>">Ver Perfil</a></th>
          </tr>
           
          
          
        <%  
          }
          %>
        </table>
        <br>
        <br>
        <br>
        <h2>Cuentas Desactivadas</h2>
        <table class="table table-striped">
            <thead>
            <th>Id Cuenta</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <th>Fecha de Creación</th>
            <th>Ultima Conexión</th>
            <th>Tipo de Cuenta</th>
            <th>Estado de Cuenta</th>
            <th>Disposición</th>
           
            </thead>           
          <%     
          
          
          Vector<registro> re = registro.buscarcuentabaja();
          for(int i=0;i<re.size();i++)
          {%>
          <tr>
              <th><%=re.get(i).getIdcuenta()%></th>
              <th><%=re.get(i).getUsu()%></th>
              <th><%=re.get(i).getCon()%></th>
              <th><%=re.get(i).getFechacrea()%></th>
              <%if(re.get(i).getUtimacon()==null)
              {%>
              <th>No se ha conectado</th>
              <%}
              else
                {%>
              <th><%=re.get(i).getUtimacon()%></th>
              <%}%>
              <%if(re.get(i).getTipo()==1){%>
              <th>Cliente</th>
              <%}
              else
              {%>
              <thAdministrador</th>
              <%}%>
              <%if(re.get(i).getEstado()==1){%>
              <th>Activo</th>
              <%}
              else{%>
              <th>Desactivado</th>
              <%}%>
              <%if(re.get(i).getModo()==1){%>
              <th>Offline</th>
              <%}
              else
              {%>
              <th>Online</th>
              <%}%>
              <th> <a href="ActivarCuenta?idcuenta=<%=re.get(i).getIdcuenta()%>">Activar</a></th>
              <th> <a href="BorrarCuenta?idcuenta=<%=re.get(i).getIdcuenta()%>">Borrar</a></th>
              <th> <a href="perfil.jsp?idcuenta=<%=re.get(i).getIdcuenta()%>">Ver Perfil</a></th>
          </tr>
           
          
          
        <%  
          }
          %>
        </table>
        
    </body>
</html>
