<%-- 
    Document   : empresa
    Created on : 2/03/2015, 09:15:10 PM
    Author     : sergio
--%>
<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
    <%
        registro ddd = new registro(); 
        session.setAttribute("nombreorg",request.getParameter("nombreorg"));
        session.setAttribute("idnodo",Integer.parseInt(request.getParameter("idnodo")));
        session.setAttribute("nodopadre",Integer.parseInt(request.getParameter("nodopadre")));
        session.setAttribute("cargo",request.getParameter("cargo"));
        session.setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
        session.setAttribute("idorbita",Integer.parseInt(request.getParameter("idorbita")));
        session.setAttribute("nombredep",request.getParameter("nombredep"));
        session.setAttribute("mision",request.getParameter("mision"));
        session.setAttribute("vision",request.getParameter("vision"));
        session.setAttribute("posicion",Integer.parseInt(request.getParameter("posicion")));
        int variable=0;
        %>
    <head>
        <t:genericpage>
    <jsp:attribute name="header">
        
        
    </jsp:attribute>
    
</t:genericpage>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=request.getParameter("nombreorg")%></title>
    </head>
    <body> 
        <h1><%=request.getParameter("nombreorg")%></h1>
        
        <table class="table table-hover">
            <thead>
            <th>Departamento</th>
            <th>Mision</th>
            <th>Vision</th>
            </thead>
            <tr>
                <th class="well"><%=request.getParameter("nombredep")%></th>
                <th class="well"><%=request.getParameter("mision")%></th>
                <th class="well"><%=request.getParameter("vision")%></th>           
            </tr>
        </table>
            <a href="modificarorbita.jsp?idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a>
        
            <table class="table table-striped">
                <thead>
                    <th>Id objetivo</th>
                    <th>Nombre objetivo</th>
                    <th>Indicador</th>
                    <th>Tipo de Objetivo</th>
                </thead>
                <tr>
                    <%     
          Vector<registro> regis = registro.buscarobjetivos(Integer.parseInt(request.getParameter("idorbita")));
          for(int i=0;i<regis.size();i++)
            {%>
                    <th><%=regis.get(i).getIdObjetivos()%></th>
                    <th><%=regis.get(i).getNombre_objetivo()%></th>
                    <th><%=regis.get(i).getIndicadores()%></th> 
                    <th><%=regis.get(i).getTipobj()%></th>
                    <th><a href="modificarobjetivo.jsp?tipoobj=<%=regis.get(i).getTipobj()%>&&indicador=<%=regis.get(i).getIndicadores()%>&&nombreobjetivo=<%=regis.get(i).getNombre_objetivo()%>&&idobjetivo=<%=regis.get(i).getIdObjetivos()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                    <th><a href="BorrarObjetivo?idobjetivo=<%=regis.get(i).getIdObjetivos()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Borrar</a></th>
                    </tr>
             <%}%>
                
            </table>
                <a href="crearobjetivo.jsp?idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Objetivo</a>
        <br>
        
        <table class="table table-striped">
            <thead>
            <th>ID nodo</th>
            <th>NOdo Padre</th>
            <th>Puesto</th>
            <th>Id Usuario</th>
            <th>Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Usuario</th>
            <th>Contraseña</th>
           
            </thead>
            
                <%
                Vector<registro> regi = registro.buscarnodousu2();
                variable=0;
                for(int x=0;x<regi.size();x++)
                {
                if(Integer.parseInt(request.getParameter("idnodo"))==regi.get(x).getNodo_nodo2())
                {
                    variable=1;                  
                }
                }
                if(variable==1)
                {
                %>
                <tr>
                    <%
                    registro myr = new registro();
                    myr.usuario1(Integer.parseInt(request.getParameter("idnodo")));
                    %>
                <th><%=Integer.parseInt(request.getParameter("idnodo"))%></th>
                <th><%=request.getParameter("nodopadre")%></th>
                <th><%=request.getParameter("cargo")%></th>
                <th><%=myr.getIdusuario()%></th>
                <th><%=myr.getNombre()%></th>
                <th><%=myr.getApellidopaterno()%></th>
                <th><%=myr.getApellidomaterno()%></th>
                <th><%=myr.getUsu()%></th>
                <th><%=myr.getCon()%></th>

                <th> <a href="CrearNodo?idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                <th> <a href="CrearNodoCuenta?idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                <th><a href="modificarnodo.jsp?variable=<%=variable=0%>&&nuevopuesto=<%=request.getParameter("cargo")%>&&idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                <th> <a href="DesasignarNodo2?idusuario=<%=myr.getIdusuario()%>&&idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Desasignar</a></th>
                <th> <a href="verperfil.jsp?idusuario=<%=myr.getIdusuario()%>">Perfil</a></th>
            </tr>
                <%
                }
                else
                {%>
                <tr>
                <th><%=Integer.parseInt(request.getParameter("idnodo"))%></th>
                <th><%=request.getParameter("nodopadre")%></th>
                <th><%=request.getParameter("cargo")%></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th> <a href="CrearNodo?idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                <th> <a href="CrearNodoCuenta?idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                <th> <a href="modificarnodo.jsp?variable=<%=variable=0%>&&nuevopuesto=<%=request.getParameter("cargo")%>&&idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                <th> <a href="usuarioslibres.jsp?idnuevo=<%=request.getParameter("idnodo")%>&&idpadrenuevo=<%=request.getParameter("nodopadre")%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Asignar</a></th>
                <th></th>
                </tr>              
                <%}%>
            
                
            <%     
          Vector<registro> reg = registro.buscarespecificarnodo(Integer.parseInt(request.getParameter("idorganizacion")),Integer.parseInt(request.getParameter("idnodo")));
          String a=request.getParameter("NombreEmpresa");
          int aaa=0;
          for(int i=0;i<reg.size();i++)
            {%>             
              
                    <%aaa=reg.get(i).getIdNodo();
                    ddd.hypervinculonodo(Integer.parseInt(request.getParameter("idorganizacion")),aaa);%>
                    <%
                    if(ddd.getVariable()==1)
                    {%>
                     <%
                variable=0;
                for(int x=0;x<regi.size();x++)
                {
                if(reg.get(i).getIdNodo()==regi.get(x).getNodo_nodo2())
                {
                    variable=1;                  
                }
                }
                if(variable==1)
                {
                %>
                <%
                    registro myr = new registro();
                    myr.usuario1(reg.get(i).getIdNodo());
                    %>
                    <tr> 
                    <th> <a href="controlanodos2?idnodo=<%=reg.get(i).getIdNodo()%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>"</a><%=reg.get(i).getIdNodo()%></th>
                    <th><%=reg.get(i).getIdPadre()%></th>
                    <th><%=reg.get(i).getPuesto()%></th>
                    <th><%=myr.getIdusuario()%></th>
                    <th><%=myr.getNombre()%></th>
                    <th><%=myr.getApellidopaterno()%></th>
                    <th><%=myr.getApellidomaterno()%></th>
                    <th><%=myr.getUsu()%></th>
                    <th><%=myr.getCon()%></th>
                    
                <th> <a href="CrearNodo?idnuevo=<%=reg.get(i).getIdNodo()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                    <th> <a href="CrearNodoCuenta?idnuevo=<%=reg.get(i).getIdNodo()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                    <th> <a href="modificarnodo.jsp?variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                    <th> <a href="DesasignarNodo2?idusuario=<%=myr.getIdusuario()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Desasignar</a></th>
                    <th> <a href="verperfil.jsp?idusuario=<%=myr.getIdusuario()%>">Perfil</a></th>
                    <th> <a href="BorrarNodo?x=1&&variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Borrar</a></th>
                    </tr>               
                <%
                }
                else
                {%>
                <tr> 
                <th> <a href="controlanodos2?idnodo=<%=reg.get(i).getIdNodo()%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>"</a><%=reg.get(i).getIdNodo()%></th>
                    <th><%=reg.get(i).getIdPadre()%></th>
                    <th><%=reg.get(i).getPuesto()%></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th> <a href="CrearNodo?idnuevo=<%=reg.get(i).getIdNodo()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                    <th> <a href="CrearNodoCuenta?idnuevo=<%=reg.get(i).getIdNodo()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                    <th> <a href="modificarnodo.jsp?variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                    <th> <a href="usuarioslibres.jsp?idnuevo=<%=reg.get(i).getIdNodo()%>&&dpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Asignar</a></th>
                    <th></th>
                    <th> <a href="BorrarNodo?x=1&&variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Borrar</a></th>
                <tr> 
                <%}
                    }
                    else
                    {%>
                <%
               variable=0;
                for(int x=0;x<regi.size();x++)
                {
                if(reg.get(i).getIdNodo()==regi.get(x).getNodo_nodo2())
                {
                    variable=1;                  
                }
                }
                if(variable==1)
                {
                %>
                <%
                    registro myr = new registro();
                    myr.usuario1(reg.get(i).getIdNodo());
                    %>
                <tr>
                    <th><%=reg.get(i).getIdNodo()%></th>
                    <th><%=reg.get(i).getIdPadre()%></th>
                    <th><%=reg.get(i).getPuesto()%></th>
                    <th><%=myr.getIdusuario()%></th>
                    <th><%=myr.getNombre()%></th>
                    <th><%=myr.getApellidopaterno()%></th>
                    <th><%=myr.getApellidomaterno()%></th>
                    <th><%=myr.getUsu()%></th>
                    <th><%=myr.getCon()%></th>
                    <th> <a href="CrearNodo?idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                    <th> <a href="CrearNodoCuenta?idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                    <th> <a href="modificarnodo.jsp?variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                    <th> <a href="DesasignarNodo2?idusuario=<%=myr.getIdusuario()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Desasignar</a></th>
                    <th> <a href="verperfil.jsp?idusuario=<%=myr.getIdusuario()%>">Perfil</a></th>
                    <th> <a href="BorrarNodo?x=2&&idusuario=<%=myr.getIdusuario()%>&&variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Borrar</a></th>
                </tr>    
                <%}
                else
                {%>
                <tr>
                    <th><%=reg.get(i).getIdNodo()%></th>
                    <th><%=reg.get(i).getIdPadre()%></th>
                    <th><%=reg.get(i).getPuesto()%></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th> <a href="CrearNodo?idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo</a></th>
                    <th> <a href="CrearNodoCuenta?idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Crear Nodo y Cuenta</a></th>
                    <th> <a href="modificarnodo.jsp?variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Modificar</a></th>
                    <th> <a href="usuarioslibres.jsp?idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Asignar</a></th>
                    <th></th>
                    <th> <a href="BorrarNodo?x=1&&variable=<%=variable=1%>&&nuevopuesto=<%=reg.get(i).getPuesto()%>&&idnuevo=<%=reg.get(i).getIdNodo()%>&&idpadrenuevo=<%=reg.get(i).getIdPadre()%>&&idnodo=<%=request.getParameter("idnodo")%>&&nodopadre=<%=request.getParameter("nodopadre")%>&&cargo=<%=request.getParameter("cargo")%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&idorbita=<%=request.getParameter("idorbita")%>&&nombredep=<%=request.getParameter("nombredep")%>&&mision=<%=request.getParameter("mision")%>&&vision=<%=request.getParameter("vision")%>&&posicion=<%=request.getParameter("posicion")%>">Borrar</a></th>
                </tr>
                <%  }
                    }
                    %>
                      
        <%  
          }
          %>
          
        </table>
        <a href="admininicio.jsp"><input type="button" value="Regresar" name=""></a>
    </body>
</html>







