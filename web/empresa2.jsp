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
<script src="js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
 
<!DOCTYPE html>
<html>
    <%
        registro ddd = new registro();
        session.setAttribute("nombreorg", request.getParameter("nombreorg"));
        session.setAttribute("idnodo", Integer.parseInt(request.getParameter("idnodo")));
        session.setAttribute("nodopadre", Integer.parseInt(request.getParameter("nodopadre")));
        session.setAttribute("cargo", request.getParameter("cargo"));
        session.setAttribute("idorganizacion", Integer.parseInt(request.getParameter("idorganizacion")));
        session.setAttribute("idorbita", Integer.parseInt(request.getParameter("idorbita")));
        session.setAttribute("nombredep", request.getParameter("nombredep"));
        session.setAttribute("mision", request.getParameter("mision"));
        session.setAttribute("vision", request.getParameter("vision"));
        session.setAttribute("posicion", Integer.parseInt(request.getParameter("posicion")));
        int variable = 0;

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
        
<style>
@keyframes mapfront_spin {
  0% {
    background-position: 400px 0%;
  }
  
  100% {
    background-position: 0 0%;
  }
}

@keyframes mapback_spin {
  0% {
    background-position: 0 0%;
  }
  
  100% {
    background-position: 400px 0%;
  }
}

@-webkit-keyframes mapfront_spin {
  0% {
    background-position: 400px 0%;
  }
  
  100% {
    background-position: 0 0%;
  }
}

@-webkit-keyframes mapback_spin {
  0% {
    background-position: 0 0%;
  }
  
  100% {
    background-position: 400px 0%;
  }
}
.globo {
  width: 100px;
  height: 100px;
  position: static;
  margin-left: 65em;
}
.frontal {
  width: 100px;
  height: 100px;
  background: url(http://1.bp.blogspot.com/-R7NM2HBq--Q/UesCwsosv3I/AAAAAAAAKrs/ZZm2CMlqVWs/s1600/1.png);
  background-size: 100px 100px;
  z-index: 5;
  position: static;
  top: 0;
  left: 0;
}
.back {
  width: 100px;
  height: 100px;
  background: url(http://1.bp.blogspot.com/-Hke9nBhL3Gc/UesDBMdQypI/AAAAAAAAKr0/4d9J8v5i58o/s1600/2.png);
  background-size: 100px 100px;
  z-index: 2;
  position: relative;
  top: -219;
  left: 0;
}
.mapfront {
  border-radius: 300px;
  width: 83px;
  height: 59px;
  position: relative;
  top: -79px;
  left: -1px;
  z-index: 4;
}

.mapback {
  border-radius: 300px;
  width: 60px;
  height: 60px;
  position: static;
  top: -79px;
  left: -1px;
  z-index: 4;
}
.mapfront {
  background: url(http://1.bp.blogspot.com/-M5AZ_16w8b4/UesDQ6r3miI/AAAAAAAAKr8/Sj0Tu25SgWA/s1600/3.png) repeat-x;
  -webkit-animation: mapfront_spin 15s linear infinite;
  animation: mapfront_spin 35s linear infinite;
  background-size: 100px 100px;
}
.mapback {
  background: url(http://2.bp.blogspot.com/-PEUhx5zxLcg/UesDeRIwkmI/AAAAAAAAKsE/XvusGF7_Omc/s1600/4.png) repeat-x;
  position: static;
  -webkit-animation: mapback_spin 15s linear infinite;
  animation: mapback_spin 35s linear infinite;
  background-size: 100px 100px;
}
</style>
        
        <%
            //alerta si es 1 saldra una
            if (Integer.parseInt(request.getParameter("alerta")) == 1) {%>
        <script>
                swal({title: "Bienvenido a <%=request.getParameter("nombreorg")%>", text: "", timer: 2000, showConfirmButton: false});
        </script>
        <%}
        %>
        <div align="center">
        <!--<img src="images/B-button.png" style="max-width: 75px; float: left;">-->
        <h1 id="trigger" style="display: inline-block; vertical-align: top;"><%=request.getParameter("nombreorg")%></h1>

        <div class="globo" style="display: inline-block;  margin: 0; width:275px; background:black; box-shadow: 0 0 10px 2px rgba(0, 0, 0, .5); border-radius: 10px; float: right; margin-right: 2.6em; position:static;"><div class="frontal"></div><div class="mapfront"></div><div class="mapback"></div><div class="back"></div></div>
        </div>
        <nav class="navbar navbar-inverse" style="display:inline-block; margin:0; width:68%; height:0%; background: black; box-shadow:0 0 10px 2px rgba(0, 0, 0, .5); border-radius: 10px 10px 0px 0px; position:static; margin-left:1.4em; ">
            <div class="navbar-header-inverse" style="position:static;">
            <ul class=navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse" style="position:static" >       
        <%
                //ruta del nodo en el que se esta consultando
            ddd.setNodo5(Integer.parseInt(request.getParameter("idnodo")));

            while (ddd.getNodo5() != 0) {
                ddd.buscarnodos(ddd.getNodo5(), Integer.parseInt(request.getParameter("idorganizacion")));
                if (ddd.getNodo5() != 0) {
        %>
        
        <%--Empieza la direccion del nodo--%> 
        <%
                //ruta del nodo en el que se esta consultando
                int conteo=0;
                int guardaco=0;
            ddd.setNodo5(Integer.parseInt(request.getParameter("idnodo")));

            while (ddd.getNodo5() != 0) {
                ddd.buscarnodos(ddd.getNodo5(), Integer.parseInt(request.getParameter("idorganizacion")));
                if (ddd.getNodo5() != 0) {
                conteo++;                
        %>
 
<%  
                }
            }
            guardaco=conteo-1;
            int Nodo5[]= new int[conteo];
            String Nombredep[] = new String[conteo];
        %>
        <%
                //ruta del nodo en el que se esta consultando
            conteo=0;
            ddd.setNodo5(Integer.parseInt(request.getParameter("idnodo")));
            
            while (ddd.getNodo5() != 0) {
                ddd.buscarnodos(ddd.getNodo5(), Integer.parseInt(request.getParameter("idorganizacion")));
                if (ddd.getNodo5() != 0) {
                    
                    Nodo5[conteo]=ddd.getNodo5();
                    Nombredep[conteo]=ddd.getNombredep5();
                    
        %>
<%
    
                }
                conteo++;
            }
        %>
    <ol class="breadcrumb navbar-header-inverse" style=" position:static; margin-left: 0em; background:black; border-radius:50px;" >
        <%
                //ruta del nodo en el que se esta consultando           
            while (guardaco >= 0) {
                                        
        %>
  <li><a href="controlarnodousu2?nodousu=<%=request.getParameter("nodousu")%>&&idnodo=<%=Nodo5[guardaco]%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>"><%=Nombredep[guardaco]%> </a></li>
<%
    
                
                guardaco--;
            }
        %>
</ol>
 <%--Termina la direccion del nodo--%>

        <%
                }
            }
        %>
    </ul>
            </div>  
    </nav>
    <section>
<style> 
    
        canvas {
	background: black;
	/*margin-top: 15% !important;*/
	width: 68% !important;
        height: 65% !important; 
        position:static !important;
	margin-left: 20px;
        border-radius: 0px 0px 10px 10px;
        
        box-shadow: 0 0 10px 2px rgba(0, 0, 0, .5);
        
        
}
    
    </style>
    </section>    
<script src="srcs/js/Three.js"></script>
<script src="srcs/js/Detector.js"></script>
<script src="srcs/js/Stats.js"></script>
<script src="srcs/js/OrbitControls.js"></script>
<script src="srcs/js/THREEx.KeyboardState.js"></script>
<script src="srcs/js/THREEx.FullScreen.js"></script>
<script src="srcs/js/THREEx.WindowResize.js"></script>
<script src="srcs/js/threex.domevents.js"></script>

<!-- jQuery code to display an information button and box when clicked. -->
<script src="srcs/js/jquery-1.11.2.min.js"></script>
<script src="srcs/js/jquery-ui.js"></script>
<script src="srcs/js/info.js"></script>

<link rel=stylesheet href="srcs/css/jquery-ui.css" />
<link rel=stylesheet href="srcs/css/info.css"/>


    
<script>
        <%int var=10;%>
	// standard global variables
	var container, scene, camera, renderer, controls;
	var keyboard = new THREEx.KeyboardState();
	var clock = new THREE.Clock();
            var sphereGeometry = new Array(<%=var%>) ;
        var sphereMaterial = new Array(<%=var%>) ;
	// custom global variables
	var sphere = new Array(<%=var%>) ;
	var sub6;
	var t=10;
        var tarre= new Array(<%=var%>) ;
	var t6=31;
        var t7=50;
	var flag = true;

	// initialization
	init();

	// animation loop / game loop
	animate();

	///////////////
	// FUNCTIONS //
	///////////////
		
function init() {
	///////////
	// SCENE //
	///////////
	scene = new THREE.Scene();

	////////////
	// CAMERA //
	////////////

	var SCREEN_WIDTH = window.innerWidth, SCREEN_HEIGHT = window.innerHeight;	
	// camera attributes
	var VIEW_ANGLE = 45, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 0.1, FAR = 20000;
	// set up camera
		camera = new THREE.PerspectiveCamera( VIEW_ANGLE, ASPECT, NEAR, FAR);
	// add the camera to the scene
		scene.add(camera);
		camera.position.set(20,50,100);
		camera.lookAt(scene.position);	
	
	//////////////
	// RENDERER //
	//////////////

	// create and start the renderer; choose antialias setting.
	if ( Detector.webgl )
		renderer = new THREE.WebGLRenderer( {antialias:true} );
	else
		renderer = new THREE.CanvasRenderer(); 

	renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
	
	// attach div element to variable to contain the renderer
	// container = document.getElementById( 'ThreeJS' );
	// alternatively: to create the div at runtime, use:
	//   container = document.createElement( 'div' );
	//    document.body.appendChild( container );
	
	// attach renderer to the container div
	document.body.appendChild( renderer.domElement );
	
	////////////
	// EVENTS //
	////////////

	// automatically resize renderer
	THREEx.WindowResize(renderer, camera);
	
	//////////////
	// CONTROLS //
	//////////////

	controls = new THREE.OrbitControls( camera, renderer.domElement );
	
	///////////
	// LIGHT //
	///////////
	
	// create a light
	var light = new THREE.PointLight(0xffffff);
		light.position.set(0,0,100);
	scene.add(light);
	var ambientLight = new THREE.AmbientLight(0x111111);
	// scene.add(ambientLight);
	
	//////////////
	// GEOMETRY //
	//////////////
			
	var material = new THREE.LineBasicMaterial({color:0x2F4F4F, opacity:1});
	var ellipse = new THREE.EllipseCurve(0, 0, 30, 20, 0, 2 * Math.PI, false);
	var ellipsePath = new THREE.CurvePath();
		ellipsePath.add(ellipse);

	var ellipseGeometry = ellipsePath.createPointsGeometry(100);
		ellipseGeometry.computeTangents();
	var line = new THREE.Line(ellipseGeometry, material);
		line.rotation.set( Math.PI/2, 0, 0 )
	scene.add( line );
        <%
        //se empieza a ver si se junta el jsp con el script
        //busca si el primer nodo tiene un usuario
        Vector<registro> regi = registro.buscarnodousu2();
        variable = 0;
        for (int x = 0; x < regi.size(); x++) 
        {
            if (Integer.parseInt(request.getParameter("idnodo")) == regi.get(x).getNodo_nodo2()) 
            {
                variable = 1;
                
            }
        }
        if (variable == 1) 
        {
            //si primer nodo tiene usuario imprime este
            registro myr = new registro();
            myr.usuario1(Integer.parseInt(request.getParameter("idnodo")));
            myr.getNombre();
        %>
                    var central_geometry = new THREE.SphereGeometry( 2, 32, 32 );
                    var central_material = new THREE.MeshPhongMaterial( { color: 0x87CEEB  } );
                    var central = new THREE.Mesh( central_geometry, central_material );
                    scene.add( central );
                    
                    //var number = document.createElement('div'); 
                    

            <%
            //if(Integer.parseInt(request.getParameter("idusuario2"))== myr.getIdusuario()){
            //JOptionPane.showMessageDialog(null,request.getParameter("idusuario2")+"es igual a"+myr.getIdusuario());
            //}
        } 
        //si no tiene imprime este
        else 
        {
            %>
                    var central_geometry = new THREE.SphereGeometry( 2, 32, 32 );
                    var central_material = new THREE.MeshPhongMaterial( { color: 0x87CEEB  } );
                    var central = new THREE.Mesh( central_geometry, central_material );
                    scene.add( central );
            <%
        }
        //se inicilaizan los contadores dependiendo los nodos que alla
        ddd.totaldenodos(Integer.parseInt(request.getParameter("idorganizacion")), Integer.parseInt(request.getParameter("idnodo")));
        //este es el valor de cuantos nodos hay
        ddd.getWww(); 
        ddd.getContador();
        //JOptionPane.showMessageDialog(null,ddd.getWww()+""+ddd.getContador());
        double dist1=64/ddd.getWww();
        double dist2=0;
        int vari=0;
        //se crea la tabla de la lista
        Vector<registro> reg = registro.buscarespecificarnodo(Integer.parseInt(request.getParameter("idorganizacion")), Integer.parseInt(request.getParameter("idnodo")));
        String a = request.getParameter("NombreEmpresa");
        int aaa = 0;
        //revisa el arreglo y mi while
        for (int i = 0; i < reg.size(); i++) 
        {
            %>
            <%
            aaa = reg.get(i).getIdNodo();
            //verifica si l nodo tiene hyper
            ddd.hypervinculonodo(Integer.parseInt(request.getParameter("idorganizacion")), aaa);
            //ddd.hyper verifica si tiene orbita si tiene
            if (ddd.getVariable() == 1) 
            {
                variable = 0;
                //verifica sy el nodo tiene usuario o no
                for (int x = 0; x < regi.size(); x++) 
                {
                    if (reg.get(i).getIdNodo() == regi.get(x).getNodo_nodo2()) 
                    {
                        variable = 1;
                    }
                }
                //si tiene cuenta imprime con todo y usuario 
                if (variable == 1) 
                {
                    registro myr = new registro();
                    myr.usuario1(reg.get(i).getIdNodo());
                   
       
        //JOptionPane.showMessageDialog(null,vari);
        %>        
       t=t+10;
        sphereGeometry[<%=vari%>] = new THREE.SphereGeometry( 2, 32, 32 ); 
        sphereMaterial[<%=vari%>] = new THREE.MeshPhongMaterial( { color: 0x87CEEB } );
		sphere[<%=vari%>] = new THREE.Mesh(sphereGeometry[<%=vari%>], sphereMaterial[<%=vari%>]);
		sphere[<%=vari%>].position.x = 30;
	scene.add(sphere[<%=vari%>]);
	tarre[<%=vari%>]=[<%=dist2%>];
        

        // var t;
	//var sub7_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	//var sub7_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
	//	sub7 = new THREE.Mesh( sub7_geometry, sub7_material );
	//	sub7.position.x = 30;
	//scene.add(sub7);

	// var t6;
	// fog must be added to scene before first render
	// scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );

	var domEvents	= new THREEx.DomEvents(camera, renderer.domElement)
	
	domEvents.addEventListener(sphere[<%=vari%>], 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(sphere[<%=vari%>], 'mouseout', function(event){
		// animate(id);
		flag = true;
		sphere[<%=vari%>].scale.x = 1;
		sphere[<%=vari%>].scale.y = 1;
		sphere[<%=vari%>].scale.z = 1;
	}, false)
        
	domEvents.addEventListener(sphere[<%=vari%>], 'click', function(event){
		sphere[<%=vari%>].position.x = 0;
		sphere[<%=vari%>].position.y = 0;
		sphere[<%=vari%>].position.z = 0;
		sphere[<%=vari%>].scale.x = 16;
		sphere[<%=vari%>].scale.y = 16;
		sphere[<%=vari%>].scale.z = 16;
		$("#infoBox").dialog("open");
                window.location = 'controlarnodousu2?nodousu=<%=request.getParameter("nodousu")%>&&idnodo=<%=reg.get(i).getIdNodo()%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>';
                
	}, false)
        <%
        //JOptionPane.showMessageDialog(null,"si pasa");
        dist2=dist2+dist1;
        vari++;
        
        %><%
                    //if(Integer.parseInt(request.getParameter("idusuario2"))== myr.getIdusuario()){
                    //JOptionPane.showMessageDialog(null,request.getParameter("idusuario2")+"es igual a"+myr.getIdusuario());
                    //}
                } 
                //si no solo imprime el nodo
                else 
                {
                    %>        
       t=t+10;
        sphereGeometry[<%=vari%>] = new THREE.SphereGeometry( 2, 32, 32 ); 
        sphereMaterial[<%=vari%>] = new THREE.MeshPhongMaterial( { color: 0x87CEEB } );
		sphere[<%=vari%>] = new THREE.Mesh(sphereGeometry[<%=vari%>], sphereMaterial[<%=vari%>]);
		sphere[<%=vari%>].position.x = 30;
	scene.add(sphere[<%=vari%>]);
	tarre[<%=vari%>]=[<%=dist2%>];
        

        // var t;
	//var sub7_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	//var sub7_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
	//	sub7 = new THREE.Mesh( sub7_geometry, sub7_material );
	//	sub7.position.x = 30;
	//scene.add(sub7);

	// var t6;
	// fog must be added to scene before first render
	// scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );

	var domEvents	= new THREEx.DomEvents(camera, renderer.domElement)
	
	domEvents.addEventListener(sphere[<%=vari%>], 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(sphere[<%=vari%>], 'mouseout', function(event){
		// animate(id);
		flag = true;
		sphere[<%=vari%>].scale.x = 1;
		sphere[<%=vari%>].scale.y = 1;
		sphere[<%=vari%>].scale.z = 1;
	}, false)
        
	domEvents.addEventListener(sphere[<%=vari%>], 'click', function(event){
		sphere[<%=vari%>].position.x = 0;
		sphere[<%=vari%>].position.y = 0;
		sphere[<%=vari%>].position.z = 0;
		sphere[<%=vari%>].scale.x = 16;
		sphere[<%=vari%>].scale.y = 16;
		sphere[<%=vari%>].scale.z = 16;
		$("#infoBox").dialog("open");
                window.location = 'controlarnodousu2?nodousu=<%=request.getParameter("nodousu")%>&&idnodo=<%=reg.get(i).getIdNodo()%>&&idorganizacion=<%=request.getParameter("idorganizacion")%>&&nombreorg=<%=request.getParameter("nombreorg")%>&&usuario2=<%=request.getParameter("usuario2")%>&&am2=<%=request.getParameter("am2")%>&&ap2=<%=request.getParameter("ap2")%>&&idusuario2=<%=request.getParameter("idusuario2")%>';
	}, false)
        <%
        //JOptionPane.showMessageDialog(null,"si pasa");
        dist2=dist2+dist1;
        vari++;
        
        %><%
                }
            } 
            //si no tiene orbita    
            else 
            {
                variable = 0;
                //llama al nodo sin orbita
                for (int x = 0; x < regi.size(); x++) 
                {
                    //compara si tiene usuario
                    if (reg.get(i).getIdNodo() == regi.get(x).getNodo_nodo2()) 
                    {
                        variable = 1;
                    }
                }
                //si si tiene usuario lo muestra
                if (variable == 1) 
                {
                    registro myr = new registro();
                    myr.usuario1(reg.get(i).getIdNodo());
                    %>        
       t=t+10;
        sphereGeometry[<%=vari%>] = new THREE.SphereGeometry( 2, 32, 32 ); 
        sphereMaterial[<%=vari%>] = new THREE.MeshPhongMaterial( { color: 0x87CEEB } );
		sphere[<%=vari%>] = new THREE.Mesh(sphereGeometry[<%=vari%>], sphereMaterial[<%=vari%>]);
		sphere[<%=vari%>].position.x = 30;
	scene.add(sphere[<%=vari%>]);
	tarre[<%=vari%>]=[<%=dist2%>];
        

        // var t;
	//var sub7_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	//var sub7_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
	//	sub7 = new THREE.Mesh( sub7_geometry, sub7_material );
	//	sub7.position.x = 30;
	//scene.add(sub7);

	// var t6;
	// fog must be added to scene before first render
	// scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );

	var domEvents	= new THREEx.DomEvents(camera, renderer.domElement)
	
	domEvents.addEventListener(sphere[<%=vari%>], 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(sphere[<%=vari%>], 'mouseout', function(event){
		// animate(id);
		flag = true;
		sphere[<%=vari%>].scale.x = 1;
		sphere[<%=vari%>].scale.y = 1;
		sphere[<%=vari%>].scale.z = 1;
	}, false)
        
	domEvents.addEventListener(sphere[<%=vari%>], 'click', function(event){
		sphere[<%=vari%>].position.x = 0;
		sphere[<%=vari%>].position.y = 0;
		sphere[<%=vari%>].position.z = 0;
		sphere[<%=vari%>].scale.x = 16;
		sphere[<%=vari%>].scale.y = 16;
		sphere[<%=vari%>].scale.z = 16;
		$("#infoBox").dialog("open");
	}, false)
        <%
        //JOptionPane.showMessageDialog(null,"si pasa");
        dist2=dist2+dist1;
        vari++;
        
        %><%
                    // if(Integer.parseInt(request.getParameter("idusuario2"))== myr.getIdusuario()){
                    //JOptionPane.showMessageDialog(null,request.getParameter("idusuario2")+"es igual a"+myr.getIdusuario());
                    //}
                } 
                //si no muestra solo el nodo
                else 
                {
                    %>        
       t=t+10;
        sphereGeometry[<%=vari%>] = new THREE.SphereGeometry( 2, 32, 32 ); 
        sphereMaterial[<%=vari%>] = new THREE.MeshPhongMaterial( { color: 0x87CEEB } );
		sphere[<%=vari%>] = new THREE.Mesh(sphereGeometry[<%=vari%>], sphereMaterial[<%=vari%>]);
		sphere[<%=vari%>].position.x = 30;
	scene.add(sphere[<%=vari%>]);
	tarre[<%=vari%>]=[<%=dist2%>];
        

        // var t;
	//var sub7_geometry = new THREE.SphereGeometry( 2, 20, 20 )
	//var sub7_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
	//	sub7 = new THREE.Mesh( sub7_geometry, sub7_material );
	//	sub7.position.x = 30;
	//scene.add(sub7);

	// var t6;
	// fog must be added to scene before first render
	// scene.fog = new THREE.FogExp2( 0x9999ff, 0.00025 );

	var domEvents	= new THREEx.DomEvents(camera, renderer.domElement)
	
	domEvents.addEventListener(sphere[<%=vari%>], 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(sphere[<%=vari%>], 'mouseout', function(event){
		// animate(id);
		flag = true;
		sphere[<%=vari%>].scale.x = 1;
		sphere[<%=vari%>].scale.y = 1;
		sphere[<%=vari%>].scale.z = 1;
	}, false)
        
	domEvents.addEventListener(sphere[<%=vari%>], 'click', function(event){
		sphere[<%=vari%>].position.x = 0;
		sphere[<%=vari%>].position.y = 0;
		sphere[<%=vari%>].position.z = 0;
		sphere[<%=vari%>].scale.x = 16;
		sphere[<%=vari%>].scale.y = 16;
		sphere[<%=vari%>].scale.z = 16;
		$("#infoBox").dialog("open");
	}, false)
        <%
        //JOptionPane.showMessageDialog(null,"si pasa");
        dist2=dist2+dist1;
        vari++;
        
        %><%
                }
            }
        }
%>
	// Sphere parameters: radius, segments along width, segments along height
	
        
        // DOM event para la central
	domEvents.addEventListener(central, 'mouseover', function(event){
		flag = false;
	}, false)

	domEvents.addEventListener(central, 'mouseout', function(event){
		// animate(id);
		flag = true;
		central.scale.x = 1;
		central.scale.y = 1;
		central.scale.z = 1;
	}, false)

	domEvents.addEventListener(central, 'click', function(event){
		central.position.x = 0;
		central.position.y = 0;
		central.position.z = 0;
		central.scale.x = 16;
		central.scale.y = 16;
		central.scale.z = 16;
                 $("#infoBox").dialog("open");
		// window.location = 'https://www.facebook.com';
	}, false)
	// fin de DOM para cental
}

function animate() {

	if (flag==true) {

       <%
        vari=0;
        ddd.setContador(ddd.getContador()-1);
        //JOptionPane.showMessageDialog(null,ddd.getContador());
        while(vari<=ddd.getContador())
        {
        //JOptionPane.showMessageDialog(null,vari);
        %>
		sphere[<%=vari%>].position.x = Math.sin(tarre[<%=vari%>]*0.1)*30;
		sphere[<%=vari%>].position.z = Math.cos(tarre[<%=vari%>]*0.1)*20;
		tarre[<%=vari%>]-=Math.PI/180*2;
        <%
        vari++;
        }
        %>
               // sub7.position.x = Math.sin(t7*0.1)*30;
            //	sub7.position.z = Math.cos(t7*0.1)*20;
		//t7-=Math.PI/180*2;
    };

    requestAnimationFrame( animate );
	render();
	rotar();		
	update();
}

function update() {
	// delta = change in time since last call (in seconds)
	var delta = clock.getDelta(); 
		controls.update();
}

function render() {	
	renderer.render( scene, camera );
}

function rotar() {
// code here
}
</script>
    

               <aside style="margin-left: 7rem; position:static; display: inline-block; vertical-align: top;">
                      
                   <div class="col-md-3" style="border:5px  black; background:black; position:static; border-radius: 10px; height: 453px;width: 275px;  box-shadow: 0 0 10px 2px rgba(0, 0, 0, .5); overflow: auto !important;">

                      <%--                 


<li style="white-space:nowrap;"><a href="#">Buzzcocks</a>
<ul>
<li style="white-space:nowrap;"><a href="#">Time's Up</a></li>
<li style="white-space:nowrap;"><a href="#">Another Music in A Different Kitchen</a></li>
<li style="white-space:nowrap;"><a href="#">Love Bites</a></li>
<li style="white-space:nowrap;"><a href="#">A Different Kind Of Tension</a></li>
</ul>
</li>
<li style="white-space:nowrap;"><a href="#">Joy Division</a>
<ul>
<li style="white-space:nowrap;"><a href="#">Unknown Pleasures</a></li>
<li style="white-space:nowrap;"><a href="#">Closer</a></li>
<li style="white-space:nowrap;"><a href="#">Still</a></li>
</ul>
</li>
</ul>
</li>
<li style="white-space:nowrap;"><a href="#">Liverpool</a>
<ul>
<li style="white-space:nowrap;"><a href="#">OMD</a>
<ul>
<li style="white-space:nowrap;"><a href="#">OMD</a></li>
<li style="white-space:nowrap;"><a href="#">Organisation</a></li>
</ul>
</li>
<li style="white-space:nowrap;"><a href="#">Echo & the Bunnymen</a>
<ul>
<li style="white-space:nowrap;"><a href="#">Echo & the Bunnymen</a>
<ul>
<li style="white-space:nowrap;"><a href="#">Echo & the Bunnymen</a>
<ul>
</li>
</ul>
</li>
</li>
</ul>
</li>
</li>
</ul>
</li>
</ul>
</li>
</div>                      
                   --%>
<li style="white-space:nowrap; color:gray;"><a href="#"><%=request.getParameter("nombredep")%></a>
<ul style="color:gray;">
<%
int  abb=5;
while(abb>=0)
{
%>
<li style="white-space:nowrap; color:gray;"><a style="color:gray;"href="#"><%=request.getParameter("nombredep")%></a></li>
<%
    abb--;
    }
%>
</ul>
</li>             
      
               </aside> 
<script type="text/javascript">
function abrir() { 
    window.open('mensajes.jsp?idnodo=<%=request.getParameter("nodousu")%>','',' toolbar=1, scrollbars=1, location=1, statusbar=1, menubar=1, resizable=0, width=400, height=300, left = 312, top = 234 ') ; 
} 
</script> 
    </script>

         <form>
            <input type="button" value="Enviar mensaje" onclick="abrir()"/>
        </form>
    <script type="text/javascript">
function abrirmen() { 
    window.open('mensajesenviados.jsp?idnodo=<%=request.getParameter("nodousu")%>','',' toolbar=1, scrollbars=1, location=1, statusbar=1, menubar=1, resizable=0, width=400, height=300, left = 312, top = 234 ') ; 
} 
</script> 
    </script>

         <form>
            <input type="button" value="Mis mensajes" onclick="abrirmen()"/>
        </form>
<script type="text/javascript">
function abrirvande() { 
    window.open('mensajesrecibidos.jsp?idnodo=<%=request.getParameter("nodousu")%>','',' toolbar=1, scrollbars=1, location=1, statusbar=1, menubar=1, resizable=0, width=400, height=300, left = 312, top = 234 ') ; 
} 
</script> 
    </script>

         <form>
            <input type="button" value="Mensajes recibidos" onclick="abrirvande()"/>
        </form>


        <footer>
            
        </footer>
</body>

</html>